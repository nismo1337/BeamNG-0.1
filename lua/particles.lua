-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- module that deals with particles

local M = {}

local function getMaterialByID(materials, i)
	if i == nil then return nil end
	return materials[i]
end

local function getMaterialIDByName(materials, s)
	for k,v in pairs(materials) do
		--print(" "..s.." == "..v.name)
		if s == v.name then
			return k
		end
	end

	print("ERROR: unknown material: " .. tostring(s))
	return 0
end

local function particleLoadStr(str, name)
	local f, err = loadstring("return function (arg) " .. str .. " end", name or str)
	if f then return f() else return f, err end
end

local function getMaterialsParticlesTable()
	local mix = readDictJSONTable("lua/particles.json")
	
	--dump(mix)

	local particles = mix.particles
	local materials = mix.materials
	local materialsMap = {}
	
	-- 0 = simple equals, 1 = expression
	--comparefields = {materialID1=0, materialID2=0, perpendicularVel=1, slipVel=1} -- material ids by the dict
	local comparefields = {perpendicularVel=1, slipVel=1}
	
	-- fix the constants
	for k,v in pairs(particles) do
		v.materialID1 = getMaterialIDByName(materials, v.materialID1)
		v.materialID2 = getMaterialIDByName(materials, v.materialID2)
		
		-- exchange in a clever way
		if v.materialID2 > v.materialID1 then 
			local tmp = v.materialID1
			v.materialID1 = v.materialID2
			v.materialID2 = tmp
		end
		
		-- construct the comparison string
		local fields = {}
		for kc,vc in pairs(comparefields) do
			if v[kc] ~= "" then
				--print("kc: "..tostring(kc) .. " / " .. v[kc])
				local s = ""
				if vc == 0 then
					-- simple compare
					s = "arg."..kc.."=="..v[kc]
				elseif vc == 1 then
					-- expression
					s = v[kc]:gsub("X", "arg."..kc)
				end
				table.insert(fields, s)
			end
		end
		v.compareFuncStr = join(fields, " and ")
		if v.compareFuncStr == nil then
			-- always true if no filters
			v.compareFuncStr = "true"
		end

		-- parse it
		local err = nil
		v.compareFunc, err = particleLoadStr("return " .. v.compareFuncStr)
		if err then
			print("### Fatal Particle comparison parsing error:")
			print("### " .. compareFuncStr)
			print("### " .. tostring(err))
			return {}
		end
		
		
		local mKey = v.materialID1 .. "_" .. v.materialID2
		if materialsMap[mKey] == nil then
			materialsMap[mKey] = {}
		end
		
		table.insert(materialsMap[mKey], v)
		--[[
		-- example call:
		p = {}
		p.slipVel = 12
		p.perpendicularVel = 1
		
		print("###"..compareFuncStr.. " = " .. tostring(v.compareFunc(p)).."")
		]]--
	end
	--dump(materialsMap)

	return materials, materialsMap
end

-- public interface
M.getMaterialByID            = getMaterialByID
M.getMaterialIDByName        = getMaterialIDByName
M.getMaterialsParticlesTable = getMaterialsParticlesTable

return M