-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.wheels = {}

local totalBreakEnergy = 0
local breakNode = -1
local maxEnergy = 0
local collTriState = {}

-- local helper function
local function luaBreakBeam(id)
	-- notify the rest
	drivetrain.beamBroke(id)
	props.beamBroke(id)
end

local function deflateTire(wheelid)
    local wheel = M.wheels[wheelid]
	local i, beam
	
	--if wheel.reinforcementBeams ~= nil then
	--	for i, beam in pairs (wheel.reinforcementBeams) do
	--		obj:setBeamSpringDamp(beam.cid, beam.beamSpring * 0.5, -1, beam.beamSpring * 0.02, -1)
	--	end
	--end
	
	if wheel.treadBeams ~= nil then
		for i, beam in pairs (wheel.treadBeams) do
			obj:setBeamSpringDamp(beam.cid, beam.beamSpring * 0.5, -1, beam.beamSpring * 0.005, -1)
		end
	end
	
	if wheel.sideBeams ~= nil then
		for i, beam in pairs (wheel.sideBeams) do
			obj:setBeamSpringDamp(beam.cid, beam.beamSpring * 0.00, -1, beam.beamSpring * 0.5, -1)
		end
	end	
end

local function updateGFX()
	-- crash sounds
	if totalBreakEnergy ~= 0 then
		if breakNode ~= -1 then
			sounds.playSoundOnceAtNode("CrashTestSound", breakNode, math.log10(totalBreakEnergy) * 0.2)
		end
		totalBreakEnergy = 0
		breakNode = -1
		maxEnergy = 0		
	end
end

local function beamBroken(id, energy)
	local beam
	
	if energy > maxEnergy then
		breakNode = id
		maxEnergy = energy
	end
	totalBreakEnergy = totalBreakEnergy + energy
	
	luaBreakBeam(id)
	if v.data.beams[id] ~= nil then
		beam = v.data.beams[id]
		
		if bdebug.mode == 1 then
			print("beam "..id.." just broke: "
				.. v.data.nodes[beam.id1].name .. " ["..beam.id1.."]"
				.."  ->  "
				.. v.data.nodes[beam.id2].name .. " ["..beam.id2.."]"
				)
		end
		
		-- Break coll tris
		if beam.collTris then
			for k,v in pairs(beam.collTris) do
				if collTriState[v] then
					collTriState[v] = collTriState[v] - 1
					if collTriState[v] <= 1 then
						obj:breakCollisionTriangle(v)
					end
				end
			end
		end
		
		-- Check for punctured tire
		if beam.wheelID ~= nil and beam.hubBeam == nil then
			M.wheels[beam.wheelID].punctured = true
			deflateTire(beam.wheelID)
		end
		
		-- breakgroup handling
		if beam.breakGroup and beam.breakGroup ~= "" then
			-- find all beams with that breakgroup
			if beam.breakGroupType == 0 or beam.breakGroupType == nil then
				-- break all beams in that group
				for k, b in pairs(v.data.beams) do
					if b.breakGroup == beam.breakGroup then
						--print("  breakgroups: also breaking beam "..k.. " as in breakgroup ".. b.breakGroup)
						obj:breakBeam(k)
						luaBreakBeam(k)
					end
				end

			elseif beam.breakGroupType == 1 then
				-- this type does not break the group but will be broken by the group
			end
		end
	else
		--print ("beam "..id.." just broke")
	end

	-- funky: disable engine once a beam breaks ;)
	--BeamEngine:setEnabled(false)

	-- funky2: break all hinges and latches (detaches doors and alike) :D
	--[[
	if hingesBroken == false then
		for k, b in pairs(v.data.beams) do
			if b.breakGroup ~= nil and b.breakGroup ~= "" then
				if string.find(b.breakGroup, "hinge") ~= nil or string.find(b.breakGroup, "latch") ~= nil then
					print("  breaking hinge beam "..k.. " as in breakgroup ".. b.breakGroup)
					obj:breakBeam(k)
				end
			end
		end
		hingesBroken = true
	end
	]]--

	-- funky3: break all breakgroups
	--[[
	if hingesBroken == false then
		for k, b in pairs(v.data.beams) do
			if b.breakGroup ~= nil and b.breakGroup ~= "" then
				obj:breakBeam(k)
			end
		end
		hingesBroken = true
	end
	]]--
end

local function init()
	totalBreakEnergy = 0
	breakNode = -1
	maxEnergy = 0	

	if v.data.wheels then
		M.wheels = deepcopy(v.data.wheels)
		for i, wheel in pairs(M.wheels) do
			wheel.punctured = false
			wheel.pressureCoef = 1
		end
	end	
	
	local i, beam
	for i, beam in pairs (v.data.beams) do
		obj:setBeamSpringDamp(beam.cid, beam.beamSpring or -1, beam.beamDamp or -1, beam.springExpansion or -1, beam.dampExpansion or -1)
	end
	
	-- Reset colltris
	if v.data.triangles then
		collTriState = {}
		for k, v in pairs(v.data.triangles) do
			if v.cid and v.beamCount then
				collTriState[v.cid] = v.beamCount
			end
		end
	end
end

local function reset()
	init()
end

-- public interface
M.beamBroken  = beamBroken
M.reset       = reset
M.init		  = init
M.deflateTire = deflateTire
M.updateGFX   = updateGFX

return M