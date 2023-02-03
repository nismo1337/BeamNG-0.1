-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local paints = {}
local ct = nil
local c = nil

local function initCanvas()
	paints.border = SkPaint()
	paints.border:setAntiAlias(true)
	paints.border:setARGB(255,20,20,20)

	paints.red = SkPaint()
	paints.red:setAntiAlias(true)
	paints.red:setARGB(255,255,0,0)

	paints.fontLeft = SkPaint()
	paints.fontLeft:setAntiAlias(true)
	paints.fontLeft:setColor(SK_ColorBLACK)
	paints.fontLeft:setTextAlign(kLeft_Align)
	paints.fontLeft:setTextSize(12)
	paints.fontLeft:setTypeface(SkTypeface.CreateFromName("verdana", kNormal))
end

function drawRect(rect, paint)
	local c = c
	c:drawLine(rect.left, rect.top, rect.right, rect.top, paint)
	c:drawLine(rect.left, rect.bottom, rect.right, rect.bottom, paint)
	c:drawLine(rect.left, rect.top, rect.left, rect.bottom, paint)
	c:drawLine(rect.right, rect.top, rect.right, rect.bottom, paint)
end

function drawTestScreen(dt)
	local c = c
	local ct = ct
	ct:clear()

	if not debugCounter then
		debugCounter = 0
	end

	debugCounter = debugCounter + 1
	if debugCounter > 32000 then debugCounter = 0 end

	local txt = string.format("refresh %d", debugCounter)
	c:drawText(txt, string.len(txt), 5, 30, paints.fontLeft)


	txt = string.format("size: %dx%d@%d", ct.width, ct.height, ct.depth)
	c:drawText(txt, string.len(txt), 5, 70, paints.fontLeft)

	local border = 0
	drawRect(ct.rect, paints.border)
	-- diagonal
	c:drawLine(border, border, ct.width - 2*border, ct.height - 2*border, paints.border)
	c:drawLine(border, ct.height-2*border, ct.width - 2*border, border, paints.border)
end

-- the main update function
local function update(dt)
	if not ct then
		ct = BeamEngine.canvasTexture
		c = ct:getCanvas()
		initCanvas()
	end
	if not ct then return end

	drawTestScreen(dt, modeNumber)
end

function updateAgent(dir)
	local x = 100
	local y = 200
	local radius = 200
	
	local txt = string.format("direction %f", dir * 57.2957795)
	c:drawText(txt, string.len(txt), 5, 120, paints.fontLeft)
	
	--local rect = createSKRect(x-radius, y-radius, radius*2, radius*2)
	--print(dir * 57.2957795)
	--c:drawArc(rect, dir, 2, true, paints.red)
end

-- public interface
M.update = update
M.updateAgent = updateAgent

return M