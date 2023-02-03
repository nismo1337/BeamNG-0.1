-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

local function reset()
	if not v.data.props then return end
	for propKey, prop in pairs (v.data.props) do
		prop.disabled = nil
	end	
end

local function beamBroke(id)
	if not v.data.props then return end
	local brokenBeamName = v.data.beams[id].name
	if not brokenBeamName then
		return
	end

	for propKey, prop in pairs (v.data.props) do	
		if prop.disableBeams then
			for k,ab in pairs(prop.disableBeams) do
				if ab == brokenBeamName then
					print("prop beam broke:"..v)
					prop.disabled = 1
					break
				end
			end
		end
	end
end

local function update()
	if not v.data.props then return end
	
	for propKey, prop in pairs (v.data.props) do
		if not prop.slotID then goto continue end
    
		-- disabled?
		if prop.disabled then goto continue end
	
		p = obj:getProp(prop.slotID)
		if not p then goto continue end
		
		local val = 0
		if prop.func == "steering" then
		  val = hydros.hydroDirState
		elseif prop.func == "wheelspeed" then
		  if drivetrain.wheels[0] ~= nil then
			val = math.abs(obj:getWheel(0).angularVelocity) * v.data.wheels[0].radius
		  else
			val = 0
		  end
		elseif prop.func == "gear_A" then
			-- P R N D 2 1
			-- 0 1 2 3 4 5
			if drivetrain.gear == 0 then val = 2
			elseif drivetrain.gear > 0 then val = 3
			elseif drivetrain.gear == -1 then val = 1
			else val = 0 end
			if input.parkingbrake > 0 then val = 0 end
			val = val/5
		elseif prop.func == "rpm" and obj.wheel_count > 0 then
		  val = drivetrain.rpm
		elseif prop.func == "brake" then
		  val = drivetrain.brake
		elseif prop.func == "throttle" then
		  val = drivetrain.throttle
		elseif prop.func == "parkingbrake" then
		  val = input.parkingbrake
		elseif prop.func == "fuel" then
		  val = drivetrain.fuel / drivetrain.fuelCapacity
		elseif prop.func == "oiltemp" then
		  -- TODO: add this
		  val = 0.3
		elseif prop.func == "watertemp" then
		  -- TODO: add this
		  val = 0.4
		elseif prop.func == "turnsignal" then	
			if input.axisX < -0.3 then val = 1
			elseif input.axisX > 0.3 then val = -1
			else val = 0
			end
		elseif prop.func == "airspeed" then
			val = math.abs(obj:getVelocity():length())
		elseif prop.func == "altitude" then
			val = obj:getPosition().z
		end
		
		if val == nil then
		  logError("prop: got nil for function "..prop.func)
		  goto continue
		end
		
		-- respect the function multiplier, limits and offset
		val = val * prop.multiplier
		if val < prop.min then val = prop.min end
		if val > prop.max then val = prop.max end
		val = val + prop.offset
		prop.lastVal = val
		
		-- application of the value as rotation and translation
		p.rotation    = prop.rotation:scaleCopy(val)
		local lv = prop.translation:scaleCopy(val)
		p.translation = lv
		prop.lastTranslation = lv
		
		::continue::
	end
end

-- public interface
M.update = update
M.beamBroke = beamBroke
M.reset = reset

return M