-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local simulationSpeed = 100
local simulationSpeed_smooth = newExponentialSmoothing(20)
local bulletTime = 0
local bulletMode = 0 -- 1 = auto, with timer, 0 = disabled, 2 = manual
local logStep = 7

M.maxBulletTime = 10

local function update(dt)
	if bulletMode == 0 then return end
	
	local currentSpeedPercent = simulationSpeed_smooth:get(simulationSpeed)
	--print(">>" .. currentSpeedPercent)

	BeamEngine:setSimulationTimeScale(currentSpeedPercent * 0.01) -- 0-100 --> 0-1
	
	if bulletMode == 1 and bulletTime > 0 then
		bulletTime = bulletTime - dt
		if bulletTime <= 0 then
			simulationSpeed_smooth = newExponentialSmoothing(20, simulationSpeed)
			simulationSpeed = 100
		end
	end
end

local function set(val)
	if type(val) == "string" then
		if val == "log+" then
			logStep = logStep + 1
			if logStep > 7 then logStep = 7 end
		elseif val == "log-" then
			logStep = logStep - 1
			if logStep < -1 then logStep = -1 end
		else
			simulationSpeed = simulationSpeed + tonumber(val)
		end
		if logStep < 7 then
			simulationSpeed = math.pow(2,logStep)
		elseif logStep == 7 then
			simulationSpeed = 100
		end
	elseif type(val) == "number" then
		simulationSpeed = val
	end
	
	if simulationSpeed < 0 then
		simulationSpeed = 1
	elseif simulationSpeed > 100 then
		simulationSpeed = 100
	end
	print("set simulationSpeed = " .. simulationSpeed)
	bulletMode = 2
end

local function slowMotion(slowdownTime, slowDownPercent)
	bulletMode = 1
	-- slowDownPercent given from 0 to 100, convert from 0 to 1
	if bulletTime <= 0 then
		simulationSpeed = slowDownPercent
		simulationSpeed_smooth = newExponentialSmoothing(20, slowDownPercent)
		bulletTime = slowdownTime * slowDownPercent
	else
		bulletTime = bulletTime + slowdownTime
	end
	
	-- max bullettime
	if bulletTime > M.maxBulletTime then
		bulletTime = M.maxBulletTime
	end
end

local function reset()
	bulletTime = 0
	bulletMode = 0
	logStep = 7
	simulationSpeed = 100
	simulationSpeed_smooth = newExponentialSmoothing(20, simulationSpeed)
end

-- public interface
M.update = update
M.reset = reset
M.set = set
M.slowMotion = slowMotion

return M