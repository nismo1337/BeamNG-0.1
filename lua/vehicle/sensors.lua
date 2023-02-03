-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.gx = 0
M.gy = 0

M.gxMax = 0
M.gxMin = 0

M.gyMax = 0
M.gyMin = 0

local gx_smooth = nil
local gy_smooth = nil
local invRefNodeWeight = 1

local resetTimer = 0
local resetTime  = 10 -- time when the min/max values are getting reset

local function resetMinMax()
	M.gxMax = 0
	M.gxMin = 0
	M.gyMax = 0
	M.gyMin = 0

	if v.data.refNodes ~= nil then
		invRefNodeWeight = 1.0 / v.data.nodes[v.data.refNodes[0].ref].nodeWeight
	end
end

local function reset()
	gx_smooth = newExponentialSmoothing(100)
	gy_smooth = newExponentialSmoothing(100)
	resetMinMax()
end

local function updateGFX(dt)
	resetTimer = resetTimer + dt
	if resetTimer > resetTime then
		resetMinMax()
		resetTimer = resetTimer - resetTime
	end
end

local function update()
	if not v.data.refNodes then return end

	-- collecting the data
	local gx_raw = obj:getNodeForce(v.data.refNodes[0].ref, v.data.refNodes[0].left) * invRefNodeWeight
	local gy_raw = obj:getNodeForce(v.data.refNodes[0].ref, v.data.refNodes[0].back) * invRefNodeWeight
	--local gz_raw = obj:getNodeForce(v.data.refNodes[0].ref, v.data.refNodes[0].up)

	M.gx = gx_smooth:get(gx_raw)
	M.gy = gy_smooth:get(gy_raw)

	if M.gx > M.gxMax then M.gxMax = M.gx end
	if M.gx < M.gxMin then M.gxMin = M.gx end

	if M.gy > M.gyMax then M.gyMax = M.gy end
	if M.gy < M.gyMin then M.gyMin = M.gy end
end

-- public interface
M.update = update
M.updateGFX = updateGFX
M.reset = reset

return M