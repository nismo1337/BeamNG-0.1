-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local loadedSounds = {}

local function playSoundOnceAtNode(soundName, nodeID, volume)
	local snd = gameEngine:playSFXOnce(soundName)
	snd:setVolume(volume)
	obj:attachSFXNode(snd, nodeID)
end

local wheelsSounds = nil

local function addWheelSound(wheelID, wd, soundName)
	if wheelsSounds == nil then wheelsSounds = {} end
	if wheelsSounds[wheelID] == nil then wheelsSounds[wheelID] = {} end
	
	local s = gameEngine:createSFXSource(soundName)
	s:setVolume(0)
	s:setPitch(1)
	s:play(-1)
	obj:attachSFXNode(s, wd.node1)
	wheelsSounds[wheelID][soundName] = s
	table.insert(loadedSounds, s)
end

local function update(dt)
	-- engine
	if v.data.engine ~= nil and v.data.engine.maxRPM ~= nil then
		if engineSound == nil then
			engineSound = gameEngine:createSFXSource("EngineTestSound")
			engineSound:setVolume(0)
			engineSound:play(-1)
			obj:attachSFXNode(engineSound, 0) -- tie to node 0 for now
			table.insert(loadedSounds, engineSound)
		else
			local acc = input.throttle
			if drivetrain.gear < 0 then
				acc = input.brake
			end
			enginePitch = (drivetrain.rpm / v.data.engine.maxRPM) * 2
			engineSound:setPitch(enginePitch)
			engineSound:setVolume((0.45 + (acc * 0.3)) + (enginePitch * 0.12))
		end
	end
	
	-- wind
	if windSound == nil then
		windSound = gameEngine:createSFXSource("WindTestSound")
		windSound:setVolume(0)
		windSound:play(-1)
		obj:attachSFXNode(windSound, 0) -- tie to node 0 for now
		table.insert(loadedSounds, windSound)
	else
		local speed = obj:getVelocity():length() -- speed
		local vol = (speed * speed * 0.001)
		local pitch = speed / 60
		if vol > 1 then vol = 1 end
		windSound:setVolume(vol)
		windSound:setPitch(pitch)
	end

	-- wheels
	if wheelsSounds == nil then
		for wi,wd in pairs(drivetrain.wheels) do
			addWheelSound(wi, wd, "RollingTestSound")
			addWheelSound(wi, wd, "SkidTestSound")
		end
	else
		for wi,wd in pairs(drivetrain.wheelInfo) do
			local w = obj:getWheel(wi)
			if w then
				local slip = wd.lastSlip
				-- TODO: per surface sound, only emit sound if touching a surface
				local slipEnergy = wd.slipEnergy
				--print(slipEnergy)
				if slipEnergy > 20 then
					local skidVol = (slipEnergy - 20) * 0.01
					local skidPitch = (slip * 0.03) + 0.9
					if skidVol > 1 then skidVol = 1 end
					wheelsSounds[wi]["RollingTestSound"]:setVolume(0)
					wheelsSounds[wi]["SkidTestSound"]:setVolume(skidVol)
					wheelsSounds[wi]["SkidTestSound"]:setPitch(skidPitch)
				else
					local wheelSpeed = math.abs(w.angularVelocity * wd.radius)
					local rollVol = math.sqrt(wheelSpeed * 0.018)
					local rollPitch = wheelSpeed * 0.125
					if rollVol > 1 then rollVol = 1 end
					wheelsSounds[wi]["RollingTestSound"]:setVolume(rollVol)
					wheelsSounds[wi]["RollingTestSound"]:setPitch(rollPitch)
					wheelsSounds[wi]["SkidTestSound"]:setVolume(0)
				end
			end
		end
	end
	
end

local function destroy()
	for k,v in pairs(loadedSounds) do
		if v and v:isValid() then
			v:destroy()
		end
	end
	loadedSounds = {}
	wheelsSounds = nil
end

-- public interface
M.update  = update
M.destroy = destroy
M.playSoundOnceAtNode = playSoundOnceAtNode
return M