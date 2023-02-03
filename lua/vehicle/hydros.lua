-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.hydroDirState = 0
M.hydroDirCmd = 0

local wheelSpeed = 0
local rate = 4
local hydroCount = 0

local function nop()
end

local function updateGFX(dt)
	local k = 0
	local wd = 0
	rate = 4
	k, wd = next(drivetrain.wheels)
	if k then
		local w = obj:getWheel(k)
		if w then
			rate = 40 / (8 + math.abs(w.speed * 0.21337))
		end
	end
	if rate < 1.2 then
		rate = 1.2
	elseif rate > 4 then
		rate = 4
	end
	
	-- if using a joystick, we need much faster response
	if input.analogue == true then
		rate = rate * 3
	end
end

local function update(dts)
	-- hydros
	if M.hydroDirState == 0 and M.hydroDirCmd == 0 then
		return
	end

	if M.hydroDirCmd ~= 0 then
		-- slowly approach the desired value
		if M.hydroDirState > M.hydroDirCmd then
			M.hydroDirState = M.hydroDirState - dts * rate
		else
			M.hydroDirState = M.hydroDirState + dts * rate
			-- limit value
			if M.hydroDirState > M.hydroDirCmd then
				M.hydroDirState = M.hydroDirCmd
			end
		end
	else
		-- auto centering
		if M.hydroDirState > dts then
			M.hydroDirState = M.hydroDirState - dts
		elseif M.hydroDirState < -dts then
			M.hydroDirState = M.hydroDirState + dts
		else
			M.hydroDirState = 0
		end
	end

	-- update length, hydroDirState between -1.0 and 1.0
	for i, hydro in pairs (v.data.hydros) do
		obj:setBeamLengthRatio(hydro.beam.cid, (1 - M.hydroDirState * hydro.factor))
	end
end

-- nop'ed functions
M.updateGFX = updateGFX
M.update = update

local function init()
	if v.data.hydros ~= nil then
		for i, hydro in pairs (v.data.hydros) do
			hydroCount = hydroCount + 1
		end
	end

	if hydroCount == 0 then
		M.updateGFX = nop
		M.update = nop
	end
end

-- public interface
M.init = init

return M