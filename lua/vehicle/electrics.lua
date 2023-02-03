-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local signalTimerThreshold = 0.7
local signalTimer = 0
local signalState = false

local function update(dt)

	signalTimer = signalTimer + dt
	if signalTimer > signalTimerThreshold then
		signalState = not signalState
		signalTimer = signalTimer - signalTimerThreshold
	end

	material.switch("brake",    drivetrain.brake > 0)
	material.switch("parking",  input.parkingbrake)
	
	material.switch("reverse",  drivetrain.gear < 0)
	
	-- TODO
	--material.switch("running",  drivetrain.gear > 0)

	-- signals
	material.switch("signal_R", signalState and input.axisX < -0.3)
	material.switch("signal_L", signalState and input.axisX >  0.3)	
end

-- public interface
M.update = update

return M