-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local DrawingCanvas = {}
DrawingCanvas.__index = DrawingCanvas

local timer = 1
local previousFuel = 0
local fuelConsumptionRate = 0

-- creation method of the object, inits the member variables
local function createDrawingCanvas()
	local dc = {}
	setmetatable(dc, DrawingCanvas)
	dc.paints = {}
	return dc
end

-- the main update function
function DrawingCanvas:update(dt, modeNumber)
	self.ct = obj.canvasTexture
	if not self.ct then return end
	-- this will be only executed if debug mode is enabled
	self.c = self.ct:getCanvas()

	-- init, must happen dynamically here and not in createDrawingCanvas
	if not self.canvasInitialized then self:initCanvas() end

	-- choose a screen to diplay
	if modeNumber == 1 then
		self:drawWheelScreen(dt)
	elseif modeNumber == 2 then
		self:drawEngineGraphScreen()
	--elseif modeNumber == 3 then
	--	self:drawShockScreen()
	--elseif modeNumber == 6 then
	--	self:drawWeightScreen()
	else
		self.ct:clear()
		--self:drawTestScreen(dt, modeNumber)
	end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- screens below that are chosen from above entry point

-- test mode that displays the screen dimentions and the update rate
function DrawingCanvas:drawTestScreen(dt, modeNumber)
	local c = self.c
	local ct = self.ct
	ct:clear()

	if not self.debugCounter then
		self.debugCounter = 0
	end

	self.debugCounter = self.debugCounter + 1
	if self.debugCounter > 32000 then self.debugCounter = 0 end

	local txt = string.format("refresh %d", self.debugCounter)
	c:drawText(txt, string.len(txt), 5, 30, self.paints.fontLeft)


	txt = string.format("size: %dx%d@%d", ct.width, ct.height, ct.depth)
	c:drawText(txt, string.len(txt), 5, 70, self.paints.fontLeft)

	txt = string.format("debug mode: %d", bdebug.mode)
	c:drawText(txt, string.len(txt), 5, 90, self.paints.fontLeft)

	local border = 0
	self:drawRect(ct.rect, self.paints.border)
	-- diagonal
	c:drawLine(border, border, ct.width - 2*border, ct.height - 2*border, self.paints.border)
	c:drawLine(border, ct.height-2*border, ct.width - 2*border, border, self.paints.border)
end

-- the wheels / engine debug screen
local wheelTimer = 0
local wheelTimerState = 0
-- global
timerSpeedLimit = 60 -- in mph
local speedMargin = 0.5 -- fuzzy speed
local startPos = nil
local startVelo = nil
local stopVelo = nil
local lastResult = nil
local lastResultBrake = nil
function DrawingCanvas:drawTimersScreen(dt)
	local wd = drivetrain.wheels[0]
	local w  = obj:getWheel(0)
	local speed = obj:getVelocity():length() * 2.23694 -- using air speed instead of wheel speed
	local x = self.ct.width - 10
	local y = 90
	
	-- speed test
	if drivetrain.throttle > 0.5 and speed > speedMargin and speed < speedMargin * 3 and wheelTimerState == 0 then
		wheelTimerState = 1
		wheelTimer = 0
		startPos = obj:getPosition()
		startVelo = speed
	elseif wheelTimerState == 1 then
		wheelTimer = wheelTimer + dt
		if speed > timerSpeedLimit then
			--print "reached top speed"
			stopPos = obj:getPosition()
			stopVelo = speed
			local distance = (stopPos - startPos):length()
			lastResult = "last speed test result: "..math.floor(startVelo).." -> "..math.floor(stopVelo).." mph in " .. string.format("%0.02f", wheelTimer) .. " seconds in "..string.format("%0.02f", distance).." meters"
			wheelTimerState = 0
		end
		if drivetrain.throttle < 0.5 then
			--print("speed test aborted " .. drivetrain.throttle)
			wheelTimerState = 0
		end
	end
	if wheelTimerState == 1 then
		tmp = "speed test running: " .. math.floor(speed) .. " mph, " .. string.format("%0.02f", wheelTimer) .. " s"
		self.c:drawText(tmp, string.len(tmp), x, y, self.paints.fontRight)
		y  = y + 14
	end
	if lastResult then
		self.c:drawText(lastResult, string.len(lastResult), x, y, self.paints.fontRight)
		y  = y + 14
	end

	-- brake test
	if drivetrain.brake > 0.5 and speed > timerSpeedLimit - speedMargin and speed < timerSpeedLimit + speedMargin and wheelTimerState == 0 then
		--print "started brake test"
		wheelTimerState = 3
		wheelTimer = 0
		startPos = obj:getPosition()
		startVelo = speed
	elseif wheelTimerState == 3 then
		wheelTimer = wheelTimer + dt
		if speed < speedMargin then
			--print "reached 0 speed"
			stopPos = obj:getPosition()
			stopVelo = speed
			wheelTimerState = 0
			local distance = (stopPos - startPos):length()
			lastResultBrake = "last brake test results: " .. math.floor(startVelo) .. " -> "..math.floor(stopVelo).." mph in " .. string.format("%0.02f", wheelTimer) .. " seconds in "..string.format("%0.02f", distance).." meters"
		end
		if drivetrain.brake < 0.5 then
			--print "brake test aborted"
			wheelTimerState = 0
		end
	end
	
	if wheelTimerState == 3 then
		tmp = "brake test running: " .. math.floor(speed) .. " mph, " .. string.format("%0.02f", wheelTimer) .. " s"
		self.c:drawText(tmp, string.len(tmp), x, y, self.paints.fontRight)
		y  = y + 14
	end
	if lastResultBrake then		
		self.c:drawText(lastResultBrake, string.len(lastResultBrake), x, y, self.paints.fontRight)
		y  = y + 14
	end

	--tmp = " > " .. wheelTimerState
	--self.c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
	
end



function DrawingCanvas:drawWheelScreen(dt)
	local ct = self.ct
	local c = self.c
	ct:clear()

	-- draw time stats
	local ts = BeamEngine:getSimulationTimeScale()
	local tmp = string.format("%0.1f %% realtime", ts * 100)
	self.c:drawText(tmp, string.len(tmp), self.ct.width - 10, 50, self.paints.fontRight)
	local tmp = string.format("1 / %0.1f second", 1/ts)
	self.c:drawText(tmp, string.len(tmp), self.ct.width - 10, 70, self.paints.fontRight)

	local radius = 50
	local x = 5 + radius
	local y = 150 + radius
	local avgWheelSpeed = 0
	local wheelCount = 0
	if drivetrain.wheels then
		self:drawTimersScreen(dt)
		local rect = nil
		local rect2 = nil
		local rect3 = nil
		local i
		local wd
		for i,wd in pairs(drivetrain.wheels) do
			local wheelname = (wd and wd.name) or string.format("wheel %d", i)

			rect = createSKRect(x-radius, y-radius, radius*2, radius*2)
			rect2 = createSKRect(x-radius+10, y-radius+10, radius*2-20, radius*2-20)
			rect3 = createSKRect(x-radius+20, y-radius+20, radius*2-40, radius*2-40)
			if wd then
				local w = obj:getWheel(i)
				if w then
					
					c:drawCircle(x, y, radius, self.paints.wheel)
					c:drawText(wheelname, string.len(wheelname), x, y, self.paints.font)
					
					local wheelSpeed = w.angularVelocity * wd.radius * wd.wheelDir
					wheelCount = wheelCount + 1
					avgWheelSpeed = avgWheelSpeed + wheelSpeed

					tmp = math.floor(wheelSpeed * 3.6, 1) .. " km/h" -- m/s -> km/h => * 3.6
					c:drawText(tmp, string.len(tmp), x, y+14, self.paints.font)

					tmp = math.floor(wheelSpeed * 2.23694, 1) .. " mp/h"
					c:drawText(tmp, string.len(tmp), x, y+28, self.paints.font)

					-- clipping
					c:save(kClip_SaveFlag)
					local clipPath = SkPath()
					clipPath:addCircle(x, y, radius -10, kCW_Direction)
					--c:drawPath(clipPath, self.paints.border)
					c:clipPath(clipPath, kDifference_Op, false)

					
					local startAngle = -90
					local sweepAngle = wheelSpeed * 2
					c:drawArc(rect, startAngle, sweepAngle, true, self.paints.wheelAcc)
					startAngle = - 90

					c:restore() -- restore clipping
					
					c:save(kClip_SaveFlag)
					clipPath = SkPath()
					clipPath:addCircle(x, y, radius -20, kCW_Direction)
					c:clipPath(clipPath, kDifference_Op, false)
					
					sweepAngle = drivetrain.wheelInfo[wd.wheelID].lastSlip * 2
					c:drawArc(rect2, startAngle, sweepAngle, true, self.paints.wheelSlip)
					c:restore() -- restore clipping
					
					c:save(kClip_SaveFlag)
					clipPath = SkPath()
					clipPath:addCircle(x, y, radius -30, kCW_Direction)
					c:clipPath(clipPath, kDifference_Op, false)

					local torqueGui = w.lastTorque * wd.wheelDir
					local color = self.paints.barFG
					if     wd.lastTorqueMode == 0 then
						color = self.paints.wheelAcc
					elseif wd.lastTorqueMode == 1 then
						color = self.paints.wheelSlip
					elseif wd.lastTorqueMode == 2 then
						color = self.paints.wheelHeavyBrake
						torqueGui = torqueGui * 0.1
					end
					c:drawArc(rect3, startAngle, torqueGui, true, color)
					c:restore() -- restore clipping
										
					x = x + radius * 2 + 2
				end

			else
				c:drawCircle(x, y, radius, self.paints.wheelSlip)
				c:drawText(wheelname, string.len(wheelname), x, y, self.paints.font)
				tmp = "broken"
				c:drawText(tmp, string.len(tmp), x, y+14, self.paints.font)
				x = x + radius * 2 + 10
			end
			if i%2 ~= 0 then
				y = y + 2 * radius + 5
				x = 5 + radius
			end
		end
	end
	
	x = 10 + radius
	y = ct.height - 150
	
	avgWheelSpeed = math.abs(avgWheelSpeed / wheelCount)
	
	if v.data.engine ~= nil then
		-- rpm / gear display
		rect = createSKRect(x-radius, y-radius, radius*2, radius*2)
		local radius2 = radius + 5
		c:drawCircle(x, y, radius, self.paints.wheel)

		local arcSize = 250
		local arcStart = -250

		-- pie areas:
		-- 0 to idle rpm
		local val = (v.data.engine.idleRPM / v.data.engine.maxRPM) * arcSize
		c:drawArc(rect, arcStart, val, true, self.paints.yellow)

		-- idle to shift: green
		local val2 = (v.data.engine.shiftDownRPM / v.data.engine.maxRPM) * arcSize
		c:drawArc(rect, arcStart + val, val2-val, true, self.paints.wheelAcc)

		local val3 = (v.data.engine.shiftUpRPM / v.data.engine.maxRPM) * arcSize
		c:drawArc(rect, arcStart + val2, val3-val2, true, self.paints.yg)

		-- shift to max: red-ish
		c:drawArc(rect, arcStart + val3, arcSize-val3, true, self.paints.wheelSlip)

		-- and the 'needle'
		val = arcStart + (drivetrain.rpm / v.data.engine.maxRPM) * arcSize
		c:drawArc(rect, val, 2, true, self.paints.red)

		-- and draw the text
		x = x + radius + 10
		y = y - radius + 10
		-- rpm
		
		local tmp = "rpm: " .. math.floor(drivetrain.rpm)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14

		-- gear
		if drivetrain.gear > 0 then
			tmp = string.format("gear: F %d / %d", drivetrain.gear, v.data.engine.fwdGearCount)
		elseif drivetrain.gear == 0 then
			tmp = "gear: N"
		elseif drivetrain.gear < 0 then
			tmp = string.format("gear: R %d / %s", math.abs(drivetrain.gear), v.data.engine.revGearCount)
		end
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14

		-- torque
		tmp = string.format("engine torque: %0.0f N m / %0.0f lb ft", drivetrain.torque, drivetrain.torque * 0.737562149277)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14

		tmp = string.format("wheel torque: %0.0f N m / %0.0f lb ft", drivetrain.torqueTransmission, drivetrain.torqueTransmission * 0.737562149277)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14
		
		-- HP
		local hp = ((drivetrain.torque * 0.737562149277)  * drivetrain.rpm) / 5252
		tmp = string.format("HP: %0.0f",  hp)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14
		
		-- airspeed
		local airspeed = obj:getVelocity():length()
		tmp = "airspeed: " .. math.floor(airspeed * 3.6) .. " km/h, " .. math.floor(airspeed * 2.23694) .. " mp/h"
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14

		-- fuel
		local fuelPerc = ( drivetrain.fuel / drivetrain.fuelCapacity ) * 100
		tmp = "fuel: " .. string.format("%0.2f", drivetrain.fuel) .. " / " .. math.floor(drivetrain.fuelCapacity) .. " l, " .. string.format("%0.2f%% ", fuelPerc)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14
		
		-- fuel consumption
		timer = timer - dt
		if timer < 0 then
			if previousFuel > drivetrain.fuel then
				fuelConsumptionRate = (1 - timer) * avgWheelSpeed / (previousFuel - drivetrain.fuel) 
			else
				fuelConsumptionRate = 0
			end
			previousFuel = drivetrain.fuel
			timer = 1
		end
		tmp = "fuel consumption: " .. string.format("%0.2f", fuelConsumptionRate * 0.00235214583) .. " MPG(US), " .. string.format("%0.2f L/100km", 100000 / fuelConsumptionRate)
		c:drawText(tmp, string.len(tmp), x, y, self.paints.fontLeft)
		y = y + 14
		
	end

	x = 10
	y = ct.height - 350
	
	-- the input rect
	self:drawVbar(x, y, input.throttle, self.paints.wheelAcc)
	self:drawVbar(x+12, y, input.brake, self.paints.wheelSlip)
	self:drawVbar(x+24, y, input.parkingbrake, self.paints.wheelHeavyBrake)
	
	y = y + 82
	
	-- steering
	barSize = 100
	tmp = string.format("%0.2f",  input.axisX * 100)
	if input.analogue then tmp = tmp .. "[analogue]" end
	c:drawText(tmp, string.len(tmp), x+barSize/2, y+12, self.paints.font)

	local val = (-hydros.hydroDirState) * (barSize - 4) / 2
	local rect = createSKRect(x, y, barSize, 18)
	local rect2 = createSKRect(x+barSize/2, y+2, val, 6)
	c:drawRect(rect, self.paints.wheel)
	c:drawRect(rect2, self.paints.wheelSlip)
	y = y + 8
	val = (-input.axisX) * (barSize - 4) / 2
	rect2 = createSKRect(x+barSize/2, y+2, val, 6)
	c:drawRect(rect2, self.paints.wheelAcc)
	y = y + 8
	
	self:drawGForces(self.ct.width - radius * 2.5, y, radius)
end

-- types: 0:bottom=0,top=1 / 1:bottom=1,top=0
function DrawingCanvas:drawVbar(x, y, val, color, width, height, inset, btype)
	local width = width or 10
	local height = height or 80
	local inset = inset or 2
	local btype = btype or 0
	local color = color or self.paints.barFG
	if btype == 0 then
		-- top = 1, bottom = 0
		local val = math.min(math.max(val, 0), 1)
		local rect_bg = createSKRect(x, y, width, height)
		local bVal = val * (height - inset * 2)
		local rect_fg = createSKRect(x + inset, y + height - bVal - inset, width - inset * 2, bVal)
		self.c:drawRect(rect_bg, self.paints.barBG)
		self.c:drawRect(rect_fg, color)
	elseif btype == 1 then
		-- top = 0, bottom = 1
		local val = math.min(math.max(val, 0), 1)
		local rect_bg = createSKRect(x, y, width, height)
		local bVal = val * (height - inset * 2)
		local rect_fg = createSKRect(x + inset, y + inset, width - inset * 2, bVal)
		self.c:drawRect(rect_bg, self.paints.barBG)
		self.c:drawRect(rect_fg, color)
	elseif btype == 2 then
		-- top = 1, bottom = -1
		local val = math.min(math.max(val, -1), 1)
		local rect_bg = createSKRect(x, y, width, height)
		local rect_fg = 0
		local bVal = math.abs(val) * (height * 0.5 - inset)
		if val > 0 then
			rect_fg = createSKRect(x + inset, y + height * 0.5 - bVal, width - inset * 2, bVal)
		else
			rect_fg = createSKRect(x + inset, y + height * 0.5, width - inset * 2, bVal)
		end

		local rectMiddle = createSKRect(x - inset, y + height * 0.5, width+inset*2, 1)
		self.c:drawRect(rectMiddle, self.paints.border)

		self.c:drawRect(rect_bg, self.paints.barBG)
		self.c:drawRect(rect_fg, color)
	end
end

-- gforce graphs
function DrawingCanvas:drawGForces(x, y, radius)
	local maxGs = 1
	local inv_maxGs = 1 / (maxGs * 9.80665)

	self.c:drawCircle(x, y, radius, self.paints.wheel)
	self.c:drawCircle(x, y, radius*2, self.paints.wheel)

	local tmp = "2G"
	self.c:drawText(tmp, string.len(tmp), x + 45, y - radius * 1.4, self.paints.font)
	tmp = "1G"
	self.c:drawText(tmp, string.len(tmp), x + 20, y - radius * 0.4, self.paints.font)

	local gpx = x + radius * sensors.gx * inv_maxGs
	local gpy = y + radius * sensors.gy * inv_maxGs
	--self.c:drawLine(x, y, gpx, gpy, self.paints.red)
	self.c:drawCircle(gpx, gpy, 5, self.paints.red)

	self.c:drawLine(x, y + radius * sensors.gyMin * inv_maxGs, x, y + radius * sensors.gyMax * inv_maxGs, self.paints.blue)
	self.c:drawLine(x + radius * sensors.gxMin * inv_maxGs, y, x + radius * sensors.gxMax * inv_maxGs, y, self.paints.blue)

	y = y + radius + 65

	tmp = string.format("X: % 0.1f G, min: % 0.1f G, max: % 0.1f G", sensors.gx / 9.80665, sensors.gxMin / 9.80665, sensors.gxMax / 9.80665)
	self.c:drawText(tmp, string.len(tmp), x-radius*2, y, self.paints.fontLeft)
	y = y + 20

	tmp = string.format("Y: % 0.1f G, min: % 0.1f G, max: % 0.1f G",  sensors.gy / 9.80665, sensors.gyMin / 9.80665, sensors.gyMax / 9.80665)
	self.c:drawText(tmp, string.len(tmp), x-radius*2, y, self.paints.fontLeft)
end

-- torque and HP graphs
local torqueCurveTemp = {}
local hpCurveTemp = {}
local engineGraphInitialized = false
function DrawingCanvas:drawEngineGraphScreen()
	self.ct:clear()
	v.data.engine.torqueCurve.firstGroup = nil -- TODO: bit hacky

	local rect = self:shrinkRect(self.ct.rect, 100)
	rect.bottom = rect.bottom
	rect.right = math.min(rect.right, rect.left + 400)
	local h = rect:height() / 2
	rect.bottom = rect.top + h - 40
	
	
	local storeBackground = false
	if not engineGraphInitialized then
		storeBackground = true
		engineGraphInitialized = true
	else
		self.ct:restore()
	end
	
	self:drawGraph(rect, {"RPM", "Torque"}, v.data.engine.torqueCurve, torqueCurveTemp, 50, storeBackground, true, drivetrain.rpm)

	rect.top = rect.bottom + 60
	rect.bottom = rect.top + h - 40
	self:drawGraph(rect, {"RPM", "HP"}, v.data.engine.hpCurve, hpCurveTemp, 50, storeBackground, true, drivetrain.rpm)
	
	if storeBackground then
		self.ct:store()
	end
	
end

local shockCurveTemp = {}
local shockGraphInitialized = false
function DrawingCanvas:drawShockScreen()
	self.ct:clear()

	local rect = self:shrinkRect(self.ct.rect, 40)
	rect.bottom = rect.bottom
	rect.right = math.min(rect.right, rect.left + 400)
	local h = rect:height() / 2
	rect.bottom = rect.top + h - 40
	
	
	local storeBackground = false
	if not shockGraphInitialized then
	else
		self.ct:restore()
	end
	
	self:drawGraph(rect, {"Weight", "Nodes"}, weightDistribution, weightCurveTemp, 50, storeBackground, false, nil)

	if storeBackground then
		self.ct:store()
	end
end

local weightCurveTemp = {}
local weightDistribution = nil
local weightGraphInitialized = false
function DrawingCanvas:drawWeightScreen()
	self.ct:clear()

	local rect = self:shrinkRect(self.ct.rect, 40)
	rect.bottom = rect.bottom
	rect.right = math.min(rect.right, rect.left + 400)
	local h = rect:height() / 2
	rect.bottom = rect.top + h - 40
	
	
	local storeBackground = false
	if not weightGraphInitialized then
		-- build the data: TODO
		weightDistribution = {}
		weightDistribution[0] = 0
		weightDistribution[1] = 1
		weightDistribution[2] = 2
		weightDistribution[1.5] = 4
		storeBackground = true
		weightGraphInitialized = true
	else
		self.ct:restore()
	end
	
	self:drawGraph(rect, {"Weight", "Nodes"}, weightDistribution, weightCurveTemp, 50, storeBackground, false, nil)

	if storeBackground then
		self.ct:store()
	end
	
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- graph functions below
function DrawingCanvas:drawXAxis(rect, minVal, maxVal, steps, legend, grid, paint)
	local c = self.c
	local ct = self.ct
	local w = rect:width() / steps
	local wv = (maxVal - minVal) / steps
	local px, vx, txt
	for x=0, steps, 1 do
		px = rect.left + w * x
		vx = minVal +  wv * x
		c:drawLine(px, rect.bottom-4, px, rect.bottom+4, paint)
		if grid then
			c:drawLine(px, rect.top, px, rect.bottom, self.paints.grid)
		end
		txt = string.format("%0.0f", vx)
		c:drawText(txt, string.len(txt), px, rect.bottom+12, self.paints.legend_font)
	end
	c:drawText(legend, string.len(legend), px + 12, rect.bottom + 4, self.paints.legend_left_font)
end

function DrawingCanvas:drawYAxis(rect, minVal, maxVal, steps, legend, grid, paint)
	local c = self.c
	local ct = self.ct
	local w = rect:height() / steps
	local wv = (maxVal - minVal) / steps
	local py, vy, txt
	for y=0, steps, 1 do
		py = rect.bottom - w * y
		vy = minVal +  wv * y
		c:drawLine(rect.left-4, py, rect.left+4, py, paint)
		if grid then
			c:drawLine(rect.left, py, rect.right, py, self.paints.grid)
		end
		txt = string.format("%0.0f", vy)
		c:drawText(txt, string.len(txt), rect.left-8, py+3, self.paints.legend_right_font)
	end
	c:drawText(legend, string.len(legend), rect.left, rect.top - 6, self.paints.legend_font)
end

function DrawingCanvas:drawGraph(rect, legendText, data, cache, pointsNum, bgOnly, linkThrottle, curVal)
	if not self.canvasGraphInitialized then self:initGraphCanvas() end
	--self:drawRect(rect, self.paints.border)

	local c = self.c
	local ct = self.ct

	-- cache min / max
	if not cache.initalized then
		--print "caching"
		cache.minX=math.huge
		cache.maxX=-math.huge
		cache.minY=math.huge
		cache.maxY=-math.huge
		cache.dataSize = 0
		for k,v in pairs(data) do
			if type(k) ~= "number" then goto continue end
			cache.dataSize = cache.dataSize + 1
			if k < cache.minX then cache.minX = k end
			if k > cache.maxX then cache.maxX = k end
			if v < cache.minY then cache.minY = v end
			if v > cache.maxY then cache.maxY = v end
			::continue::
		end
	
		cache.sx = (cache.maxX - cache.minX)
		cache.sy = (cache.maxY - cache.minY)
		cache.skipSize = 0
		if cache.dataSize > pointsNum then
			cache.skipSize = cache.dataSize / pointsNum
		end
		cache.initalized = 1

		-- draw axis
		local axisPoints = math.min(math.min(pointsNum, 10), cache.dataSize)
		self:drawXAxis(rect, cache.minX, cache.maxX, axisPoints, legendText[1], true, self.paints.border)
		self:drawYAxis(rect, cache.minY, cache.maxY, axisPoints, legendText[2], true, self.paints.border)
	end

	if bgOnly then return end
	
	-- draw data
	local px, py
	local width = rect:width()
	local height = rect:height()
	local lp = nil
	
	local skip = 0
	for k,v in pairs(data) do
		skip = skip - 1
		
		if skip <= 0 and type(k) == "number" then
			skip = cache.skipSize
			px = rect.left + (k - cache.minX) / cache.sx * width
			if linkThrottle then
				py = rect.top  + (1-((v - cache.minY) / cache.sy * drivetrain.throttle)) * height
			else
				py = rect.top  + (1-((v - cache.minY) / cache.sy)) * height
			end
			if lp ~= nil then
				c:drawCircle(px, py, 2, self.paints.redgraph2)
				c:drawLine(lp[1], lp[2], px, py, self.paints.redgraph)
			end
			lp = {px, py}
		end
	end
	
	-- draw the current value
	if curVal then
		px = rect.left + (curVal - cache.minX) / cache.sx * width
		local yv = data[math.floor(curVal)]
		if yv then
			py = rect.top  + (1-((yv - cache.minY) / cache.sy * drivetrain.throttle)) * height
			c:drawCircle(px, py, 4, self.paints.redgraph2)
		end
	end
	c:drawLine(px, rect.top, px, rect.bottom, self.paints.redgraph2)
end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- canvas utils below
function DrawingCanvas:shrinkRect(rect, f)
	rect.left   = rect.left + f
	rect.top    = rect.top + f
	rect.right  = rect.right - f
	rect.bottom = rect.bottom -f
	return rect
end

function DrawingCanvas:drawRect(rect, paint)
	local c = self.c
	c:drawLine(rect.left, rect.top, rect.right, rect.top, paint)
	c:drawLine(rect.left, rect.bottom, rect.right, rect.bottom, paint)
	c:drawLine(rect.left, rect.top, rect.left, rect.bottom, paint)
	c:drawLine(rect.right, rect.top, rect.right, rect.bottom, paint)
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- init functions below
function DrawingCanvas:initCanvas()
	-- init paint
	self.paints.wheel = SkPaint()
	self.paints.wheel:setAntiAlias(true)
	self.paints.wheel:setARGB(50,50,50,50)

	self.paints.barBG = SkPaint()
	self.paints.barBG:setAntiAlias(true)
	self.paints.barBG:setARGB(50,50,50,50)

	self.paints.barFG = SkPaint()
	self.paints.barFG:setAntiAlias(true)
	self.paints.barFG:setARGB(128,0,128,0)
	
	self.paints.border = SkPaint()
	self.paints.border:setAntiAlias(true)
	self.paints.border:setARGB(255,20,20,20)

	self.paints.wheelAcc = SkPaint()
	self.paints.wheelAcc:setAntiAlias(true)
	self.paints.wheelAcc:setARGB(128,0,128,0)

	self.paints.wheelSlip = SkPaint()
	self.paints.wheelSlip:setAntiAlias(true)
	self.paints.wheelSlip:setARGB(128,128,0,0)

	self.paints.wheelHeavyBrake = SkPaint()
	self.paints.wheelHeavyBrake:setAntiAlias(true)
	self.paints.wheelHeavyBrake:setARGB(200,255,0,0)

	self.paints.yellow = SkPaint()
	self.paints.yellow:setAntiAlias(true)
	self.paints.yellow:setARGB(160,255,255,0)

	self.paints.yg = SkPaint()
	self.paints.yg:setAntiAlias(true)
	self.paints.yg:setARGB(128,30,255,0)

	self.paints.red = SkPaint()
	self.paints.red:setAntiAlias(true)
	self.paints.red:setARGB(255,255,0,0)

	self.paints.blue = SkPaint()
	self.paints.blue:setAntiAlias(true)
	self.paints.blue:setARGB(200,0,0,255)

	self.paints.font = SkPaint()
	self.paints.font:setAntiAlias(true)
	self.paints.font:setColor(SK_ColorBLACK)
	self.paints.font:setTextAlign(kCenter_Align)
	self.paints.font:setTextSize(12)
	self.paints.font:setTypeface(SkTypeface.CreateFromName("verdana", kNormal))

	self.paints.fontLeft = SkPaint()
	self.paints.fontLeft:setAntiAlias(true)
	self.paints.fontLeft:setColor(SK_ColorBLACK)
	self.paints.fontLeft:setTextAlign(kLeft_Align)
	self.paints.fontLeft:setTextSize(12)
	self.paints.fontLeft:setTypeface(SkTypeface.CreateFromName("verdana", kNormal))

	self.paints.fontRight = SkPaint()
	self.paints.fontRight:setAntiAlias(true)
	self.paints.fontRight:setColor(SK_ColorBLACK)
	self.paints.fontRight:setTextAlign(kRight_Align)
	self.paints.fontRight:setTextSize(12)
	self.paints.fontRight:setTypeface(SkTypeface.CreateFromName("verdana", kNormal))
	
	self.canvasInitialized = true
end

function DrawingCanvas:initGraphCanvas()
	self.paints.legend_font = SkPaint()
	self.paints.legend_font:setAntiAlias(true)
	self.paints.legend_font:setColor(SK_ColorBLACK)
	self.paints.legend_font:setTextAlign(kCenter_Align)
	self.paints.legend_font:setTextSize(10)
	self.paints.legend_font:setTypeface(SkTypeface.CreateFromName("monospace", kNormal))

	self.paints.legend_right_font = SkPaint()
	self.paints.legend_right_font:setAntiAlias(true)
	self.paints.legend_right_font:setColor(SK_ColorBLACK)
	self.paints.legend_right_font:setTextAlign(kRight_Align)
	self.paints.legend_right_font:setTextSize(10)
	self.paints.legend_right_font:setTypeface(SkTypeface.CreateFromName("monospace", kNormal))

	self.paints.legend_left_font = SkPaint()
	self.paints.legend_left_font:setAntiAlias(true)
	self.paints.legend_left_font:setColor(SK_ColorBLACK)
	self.paints.legend_left_font:setTextAlign(kLeft_Align)
	self.paints.legend_left_font:setTextSize(10)
	self.paints.legend_left_font:setTypeface(SkTypeface.CreateFromName("monospace", kNormal))

	self.paints.grid = SkPaint()
	self.paints.grid:setAntiAlias(true)
	self.paints.grid:setARGB(100,20,20,20)

	self.paints.redgraph = SkPaint()
	--self.paints.redgraph:setAntiAlias(true)
	self.paints.redgraph:setARGB(255,255,0,0)

	self.paints.redgraph2 = SkPaint()
	--self.paints.redgraph2:setAntiAlias(true)
	self.paints.redgraph2:setARGB(200,255,0,0)

	self.canvasGraphInitialized = true
end

-- public interface
M.createDrawingCanvas = createDrawingCanvas
return M