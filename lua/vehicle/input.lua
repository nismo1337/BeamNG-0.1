-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.axisX = 0
M.axisY = 0
M.parkingbrake = 0
M.analogue = false

M.brake = 0 -- braking input : 0 to 1
M.throttle = 0 -- acceleration input: 0 to 1
M.throttleResetted = 0

M.keys = {}

local function toggleParkingbrake()
	if M.parkingbrake == 0 then
		M.parkingbrake = 1
	else
		M.parkingbrake = 0
	end
end

local function nonLinearDeadzone(val, deadzone)
	if math.abs(val) < deadzone then
		-- deadzone
		val = 0
	else
		-- non-deadzone case, scaling happens
		if val >= 0 then
			val = val - deadzone
		else
			val = val + deadzone
		end
		-- scale it to 100% again
		val = val / (1 - deadzone)

		-- non-linear: x ^ 1.5
		val = val * math.sqrt(math.abs(val))
	end
	return val
end

local function init()
end

local function update()
	-- now the deadzones
	local steering = nonLinearDeadzone(M.axisX, 0.15)
	hydros.hydroDirCmd = steering
	
	-- map the values
	local scaled = nonLinearDeadzone(M.axisY, 0.15)
	M.throttle =  scaled
	M.brake    = -scaled

	if v.data.engine ~= nil and v.data.engine.throttleSensitivity then
		M.throttle = (M.throttle^(1/v.data.engine.throttleSensitivity))
	end
	
	-- enforce limits
	if M.brake > 1 then M.brake = 1 end
	if M.brake < 0 then M.brake = 0 end
	if M.throttle > 1 then M.throttle   = 1 end
	if M.throttle < 0 then M.throttle   = 0 end
	
	
	-- little state engine if the user let loose of the throttle
	if M.throttleResetted == 0 and M.throttle > 0.001 or M.brake > 0.001 then M.throttleResetted = 1 end
	if M.throttleResetted == 1 and M.throttle < 0.001 or M.brake < 0.001 then M.throttleResetted = 2 end	
end

-- public interface
M.update = update
M.init = init
M.toggleParkingbrake = toggleParkingbrake

return M