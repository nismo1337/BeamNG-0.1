-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.torque = 0
M.gear = 0
M.rpm = 0
M.torqueTransmission = 0
M.brake = 0
M.throttle = 0
M.wheels = {}
M.wheelInfo = {}
M.engineDisabled = false
M.fuelLeakRate = 0 -- L/sec
M.fuel = 100
M.fuelCapacity = 100

M.wheelCount = 0

local invWheelCount = 0
local propWheelsCount = 0
local invPropWheelsCount = 0
local engInertia = 0.1
local invEngInertia = 10
local engAV = 0
local avgAV = 0
local axleAV = 0
local engFriction = 0
local axleFriction = 50
local clutchTimer = 0
local clutchDuration = 0.5
local invClutchDuration = 2
local locked = false
local viscousCoupling = 0
local diffViscousCoupling = 0
local engIdleAV = 0
local lockable = true
local engineWorkPerUpdate = 0
local invBurnEfficiencyFuelDensity = 0
local torsionCoef = 0
local twist = 0
local lockingTorqueLimit
local torqueLimit
local diffRatio = 2
local invDiffRatio = 0.5
local diffLimit = 0.75
local avgPropAV = 0
local ABSduration = 1/15
local ABShalfDuration = ABSduration * 0.5
local ABStimer = 0


local function nop()
end

local function updateEngineState(dt)
	local engine = v.data.engine
	local torquediff	
	local inertialTorque
	local engAcc
	local torque = 0
	local abswAV
	local n, wd
	local absGearRatio
	local minPropAV = math.huge
	local absAV
	
	avgAV = 0
	avgPropAV = 0	
	for n,wd in pairs(M.wheels) do
		local w = obj:getWheel(n)
		if wd.propulsed ~=0 and w then
			absAV = math.abs(w.angularVelocity)
			avgPropAV = avgPropAV + absAV
			if absAV < minPropAV then
				minPropAV = absAV
			end
		end
		avgAV = avgAV + w.angularVelocity * wd.wheelDir
	end
	
	avgAV = avgAV * invWheelCount
	avgPropAV = math.min(avgPropAV * invPropWheelsCount, minPropAV * 1.75)
	
	if clutchTimer > 0 then
		clutchTimer = math.max(0, clutchTimer - dt)
	end	

	--Calc wheel sided engine AV
	absGearRatio = math.abs(engine.gears[M.gear])
	local wheelBasedEngAV = avgPropAV * absGearRatio

	local clutchRatio = (clutchDuration - clutchTimer) * invClutchDuration
	
	--Calc torque from engine rpm 
	torque = engine.torqueCurve[math.floor(engAV * 9.5493)]
	if not torque then torque = engine.torqueCurve[engine.idleRPM] end

	torque = torque * M.throttle
	if M.gear ~= 1 then
		torque = torque * clutchRatio
	end
	
	--Idle torque
	if engAV < engIdleAV then
		torque = math.max(torque, engine.torqueCurve[engine.idleRPM])
	end

	-- lock engine with wheels
	if locked == false then
		if lockable and engAV ~=0 then
			engToWheelRatio = wheelBasedEngAV/engAV
			if engToWheelRatio > 0.92 and engToWheelRatio < 1.08 then
				locked = true
			end
		end
	else
		if clutchTimer ~= 0 then
			locked = false
		end
	end
	
	-- rpm limiter
	if engAV > engine.maxAV then torque = 0 end
	
	-- Calculate engine's work
	local dtT = dt * torque
	engineWorkPerUpdate = engineWorkPerUpdate + dtT * (0.5 * dtT * invEngInertia + engAV)
	
	-- Calculate new engAV and torque
	if locked then
		local tmptwist = twist
		local avdiff = engAV - wheelBasedEngAV
		twist = twist + avdiff * dt
		if sign(avdiff) == sign(twist) then
			torquediff = avdiff * viscousCoupling
		else
			torquediff = twist * torsionCoef
		end
		
		if math.abs(torquediff) > lockingTorqueLimit then
			torquediff = sign(torquediff) * lockingTorqueLimit
			twist = torquediff / torsionCoef
		end
	else
		twist = 0
		torquediff = (engAV - wheelBasedEngAV) * viscousCoupling * clutchRatio
		if math.abs(torquediff) > torqueLimit then
			torquediff = sign(torquediff) * torqueLimit
		end
	end
	
	if M.gear == 0 then
		torquediff = 0
		twist = 0
	end

	engAV = math.max(engAV + dt * (torque - torquediff - engFriction) * invEngInertia, 0)
	M.torque = torquediff
	M.torqueTransmission = math.abs(torquediff * engine.gears[M.gear] * invPropWheelsCount)
	axleAV = engAV / engine.gears[M.gear]
	return
end

local function updateWheels(dt)
	if v.data.engine then 
		updateEngineState(dt)
	end

	local n, wd
	local torque
	local diff
	local signAV
	local absAV
	local tmptorque
	local avDiff

	local ABSavgAV = math.abs(avgAV)
	ABStimer = ABStimer + dt
	if ABStimer > ABSduration then ABStimer = ABSduration - ABStimer end
	if ABStimer < ABShalfDuration then ABSavgAV = -1 end -- Disable ABS for half the ABS duration time

	-- Simple M.torqueTransmission distributor
	for n,wd in pairs(M.wheels) do
		local w = obj:getWheel(n)
		if w then
			-- propulsion
			if wd.propulsed ~= 0 and M.gear~=0 then
				absAV = math.abs(w.angularVelocity)
				diff = math.min( diffRatio, math.max(avgPropAV, invDiffRatio) / math.max(absAV, invDiffRatio))
				signAV = sign(w.angularVelocity)
				avDiff = axleAV * wd.wheelDir - w.angularVelocity
				torque = sign(avDiff) * math.min(math.abs(avDiff) * diffViscousCoupling, diff * M.torqueTransmission)		
				w.torque = torque - signAV * axleFriction
			else
				w.torque = 0
			end

			-- braking
			if M.brake > 0 then
				w.brakeState = 1
				wd.lastTorqueMode = 1
				w.brakingTorque = wd.brakeTorque * M.brake
				--anti-lock braking system (ABS)
				if wd.enableABS and math.abs(w.angularVelocity) < ABSavgAV - wd.ABSthreshold then
					w.brakeState = 0
					wd.lastTorqueMode = 0
					w.brakingTorque = 0
				end
			else
				w.brakeState = 0
				wd.lastTorqueMode = 0
				w.brakingTorque = 0
			end

			-- and the parking brake
			if input.parkingbrake ~= 0 and wd.parkingTorque ~= 0 then
				w.brakeState = 2
				wd.lastTorqueMode = 2
				w.brakingTorque = w.brakingTorque + wd.parkingTorque * input.parkingbrake
			end
		end
	end
end

local function updateEngine(dt)
	local engine = v.data.engine
	
	--Update GUI engine RPM
	M.rpm = engAV * 9.5493

	-- driving backwards?
	M.throttle = input.throttle
	M.brake = input.brake
	if M.gear <= 0 and avgAV < 0 then
		M.throttle = input.brake
		M.brake = input.throttle
	end
	
	-- Cannot brake and throttle at the same time
	-- why not? you have two pedals
	if M.brake > 0 then
		M.throttle = 0
	end
	
	-- Fuel consumption
	M.fuel = M.fuel - engineWorkPerUpdate * invBurnEfficiencyFuelDensity - M.fuelLeakRate * dt
	engineWorkPerUpdate = 0
	
	-- engine dies when fuel is up
	if M.fuel <= 0 then 
		M.fuel = 0
		M.engineDisabled = true
		engIdleAV = 0
	end

	if M.engineDisabled then
		M.throttle = 0
		M.gear = 0
		M.rpm = 0
		return
	end
	
	if clutchTimer > 0 then
		return
	end

	--transmission logic
	--interpolate based on throttle between high/low ranges
	local throttleCubed = M.throttle * M.throttle * M.throttle
	local shiftDown = engine.lowShiftDownAV + (engine.highShiftDownAV - engine.lowShiftDownAV) * throttleCubed
	local shiftUp   = engine.lowShiftUpAV + (engine.highShiftUpAV - engine.lowShiftUpAV) * throttleCubed

	local tmpCurGear = M.gear
	if M.gear > 0 then
		-- forward gears
		if engAV < shiftDown then
			if M.gear > -engine.revGearCount then
				M.gear = M.gear - 1
			end
		end
		if engAV > shiftUp then
			if M.gear < engine.fwdGearCount then
				M.gear = M.gear + 1
			end
		end
	elseif M.gear < 0 then
		-- reverse gears
		if engAV < shiftDown then
			if M.gear < engine.fwdGearCount then
				M.gear = M.gear + 1
			end
		end
		if engAV > shiftUp then
			if M.gear > -engine.revGearCount then
				M.gear = M.gear - 1
			end
		end	
	end
	
	-- neutral gear handling
	if M.gear == 0 then
		if input.throttle > 0 and avgAV > -10 and tmpCurGear >=0 then
			M.gear = 1
		end
		
		if input.brake > 0 and avgAV < 10 and tmpCurGear <=0 and engine.revGearCount > 0 then
			M.gear = -1
		end
	end
	
	if tmpCurGear ~= M.gear then
		--print("gear changed: "..M.gear)
		--sounds.playSoundOnceAtNode("ShiftTestSound", 0, 0.6)
		clutchTimer = clutchDuration
		locked = false
	end
	
	if M.gear == 0 then
		locked = false
	end
end

local function updateCounts()
	local n,wd
	
	propWheelsCount = 0
	M.wheelCount = 0
	for n,wd in pairs(M.wheels) do
		if wd.propulsed ~= 0 then
			propWheelsCount = propWheelsCount + 1
		end
		M.wheelCount = M.wheelCount + 1
	end

	if M.wheelCount ~= 0 then
		invWheelCount = 1 / M.wheelCount
	else
		invWheelCount = 0
	end
	
	if propWheelsCount ~= 0 then
		invPropWheelsCount = 1.0 / propWheelsCount
	else 
		invPropWheelsCount = 0
	end
end

local function beamBroke(id)
	if not v.data.beams[id].name then return end
	local k,ab,n,wd
	local doUpdate = false
	local brokenBeamName = v.data.beams[id].name
	
	for n,wd in pairs(M.wheels) do
		if wd.axleBeams then
			for k,ab in pairs(wd.axleBeams) do
				if ab == brokenBeamName then
					doUpdate = true
					local w = obj:getWheel(n)
					w.torque = 0
					w.brakingTorque = 0
					w.brakeState = 0
					M.wheels[n]=nil
					break
				end
			end
		end
	end
	
	if v.data.engine then
		if v.data.engine.onBeamBreakDisableEngine then
			for k,ab in pairs(v.data.engine.onBeamBreakDisableEngine) do
				if ab == brokenBeamName then
					M.engineDisabled = true
					lockable = false
					engIdleAV = 0
					break
				end
			end
		end	
		
		if v.data.engine.fuelTankBeams then
			for k,ab in pairs(v.data.engine.fuelTankBeams) do
				if ab == brokenBeamName then
					M.fuelLeakRate = M.fuelLeakRate + 1 / #v.data.engine.fuelTankBeams
					break
				end
			end
		end
	end
	
	if doUpdate then
		updateCounts()
	end
end

local function updateWheelSlip(p)
	local wheelID = v.data.nodes[p.id1].wheelID
	if wheelID then
		M.wheelInfo[wheelID].lastSlip = math.max(p.slipVel, M.wheelInfo[wheelID].lastSlip)
		-- Smoothed instant energy (E/dt)
		M.wheelInfo[wheelID].slipEnergy = 0.5 *(p.slipForce * p.slipVel + M.wheelInfo[wheelID].slipEnergy)
	end
end

local function wheelSlipGFXreset()
	for n,wd in pairs(M.wheelInfo) do
		if wd.lastSlip == 0 then
			wd.slipEnergy = 0
		end
		wd.lastSlip = 0

	end
end

M.updateEngine = updateEngine
M.updateWheels = updateWheels
M.updateWheelSlip = updateWheelSlip
M.wheelSlipGFXreset = wheelSlipGFXreset
M.beamBroke = beamBroke

local function init()
	engAV = 0
	axleAV = 0
	clutchTimer = 0
	M.engineDisabled = false
	locked = false
	M.gear = 0
	M.fuelLeakRate = 0
	M.torqueTransmission = 0
	avgPropAV = 0
	avgAV = 0
		
	M.wheels = {}
	M.wheelInfo = {}

	if v.data == nil then
		M.updateEngine = nop
		M.updateWheels = nop	
		M.updateWheelSlip = nop
		M.wheelSlipGFXreset = nop
		M.beamBroke = nop
	end
	
	if v.data.wheels then
		M.wheels = shallowcopy(v.data.wheels)
		M.wheelInfo = shallowcopy(v.data.wheels)		
	end

	for n,wd in pairs(M.wheelInfo) do
		wd.lastTorqueMode = 0
		M.wheelInfo[wd.wheelID].lastSlip = 0
		M.wheelInfo[wd.wheelID].slipEnergy = 0
		M.wheels[wd.wheelID].enableABS = M.wheels[wd.wheelID].enableABS or false
		M.wheels[wd.wheelID].ABSthreshold = M.wheels[wd.wheelID].ABSthreshold or 5
	end
	
	updateCounts()		
	
	if v.data.engine then
		clutchDuration = v.data.engine.clutchDuration or 0.5
		invClutchDuration = 1 / clutchDuration
		clutchTorque = v.data.engine.clutchTorque or 500
		engIdleAV = v.data.engine.idleAV or 0
		viscousCoupling = v.data.engine.viscousCoupling or 3
		diffViscousCoupling = v.data.engine.diffViscousCoupling or 1000
		torsionCoef = v.data.engine.torsionCoef or 40
		torqueLimit = v.data.engine.torqueLimit or math.huge
		lockingTorqueLimit = v.data.engine.lockingTorqueLimit or torqueLimit
		lockable = v.data.engine.enableLocking or false
		engInertia = v.data.engine.inertia or 0.1
		ABSduration = 1/(v.data.engine.ABSrate or 15)
		ABShalfDuration = ABSduration * 0.5	
		ABStimer = 0

		if engInertia ~= 0 then
			invEngInertia = 1 / engInertia
		else
			invEngInertia = 10
		end
		-- fuel
		M.fuelCapacity = v.data.engine.fuelCapacity or 100
		M.fuel = M.fuelCapacity
		local fuelEnergyDensity = (v.data.engine.fuelEnergyDensity or 32) * 1000000 -- MJ/liter
		local burnEfficiency = v.data.engine.burnEfficiency or 1
		if fuelEnergyDensity * burnEfficiency ~= 0 then
			invBurnEfficiencyFuelDensity = 1 / (fuelEnergyDensity * burnEfficiency)
		else
			invBurnEfficiencyFuelDensity = 1
		end
		diffRatio = v.data.engine.diffRatio or 2
		invDiffRatio = 1 / diffRatio		
		engFriction = v.data.engine.friction or v.data.engine.engineFriction or 1
		axleFriction = v.data.engine.axleFriction or v.data.engine.axelFriction or engFriction * math.max(invPropWheelsCount, 0.1)
	else
		M.updateEngine = nop
	end
end

local function reset()
	-- for now: call init again, as it does no harm
	init()
end

-- public interface
M.reset           = reset
M.init            = init
return M