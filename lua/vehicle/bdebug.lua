-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.mode = 0
local modeCount = 9

local debugDrawer = nil

local function debugDrawNode(col, node, txt)
	if node.name == nil then
		debugDrawer:drawNodeText(node.cid, col, "["..tostring(node.cid).."] "..txt)
	else
		debugDrawer:drawNodeText(node.cid, col, tostring(node.name).." " ..txt)
	end
end

local function updateDebugString(s)
	local txt = ""
	if M.mode == 1 then
		txt = "Node/Beam Skeleton (without broken)"
	elseif M.mode == 2 then
		txt = "Node/Beam Skeleton (with broken)"
	elseif M.mode == 3 then
		txt = "Node Numbers"
	elseif M.mode == 4 then
		txt = "Node Names\n\n"
		txt = txt .. "<color:FFFFFF>white = no collision\n"
		txt = txt .. "<color:FF8000>orange = external collision and self collision\n"
		txt = txt .. "<color:FF0000>red = self collision only\n"
		txt = txt .. "<color:008000>green = external collision only"
	elseif M.mode == 5 then
		txt = "Collision Triangle Debug"
	elseif M.mode == 6 then
		txt = "Node Weights"
	elseif M.mode == 7 then
		txt = "Node Materials"
	elseif M.mode == 8 then
		txt = "Collision Triangles"
	elseif M.mode == 9 then
		txt = "Props"
	end
	obj:setDebugString("[Debug mode "..M.mode.."] " ..txt.."\n\n"..s)
end

local function activated(m)
	-- little workaround: only activate debug mode in here
	--[[
	if debugDrawer and m then
		debugDrawer:showDebug( (M.mode ~= 0) )
	end
	]]--
end

local function reset()
	obj:setHideAllMeshes(false)
end

local function setMode(mode)
	if not debugDrawer then debugDrawer = obj:getDebugDrawProxy() end

	if type(mode) == "string" then
		-- +1 or -1 or alike
		M.mode = M.mode + tonumber(mode)
	elseif type(mode) == "number" then
		M.mode = mode 
	end
	if M.mode > modeCount then
		M.mode = 0
	elseif M.mode < 0 then
		M.mode = modeCount
	end
	
	obj:setHideAllMeshes(M.mode == 3 or M.mode == 8 or false)
	
	updateDebugString("")
	debugDrawer:showDebug( (M.mode ~= 0) )
end

local function formatLegend(txt)
	return " <color:555500>"..txt.."<color:000000> "
end
local function formatKilo(kg)
	return " <color:005500>"..string.format("%0.2f kg / %0.2f lbs",kg, kg * 2.20462).."<color:000000>"
end

local function draw()
	if not debugDrawer then debugDrawer = obj:getDebugDrawProxy() end
	-- collision debug M.mode is special as its an attribute
	debugDrawer.drawCollisionTris = (M.mode == 5)

	-- all other modes
	if M.mode == 1 then
		debugDrawer:drawBeams(true)
		
		-- stats
		local stats = obj:calcBeamStats()
		local txt = ""
		txt = txt .. string.format("%d beams", stats.beam_count) .. "\n"
		txt = txt .. string.format(" - %d (%0.2f%%) broken", stats.beams_broken, (stats.beams_broken/stats.beam_count)*100) .. "\n"
		txt = txt .. string.format(" - %d (%0.2f%%) deformed", stats.beams_deformed, (stats.beams_deformed/stats.beam_count)*100) .. "\n"
		txt = txt .. string.format("%d nodes", stats.node_count) .. "\n"
		txt = txt .. string.format(" - %0.2f kg total weight", stats.total_weight) .. "\n"
		txt = txt .. string.format(" - %0.2f kg per wheel (%0.2f kg all %d wheels)", stats.wheel_weight/stats.wheel_count, stats.wheel_weight, stats.wheel_count) .. "\n"
		
		updateDebugString(txt)
	elseif M.mode == 2 then
		debugDrawer:drawBeams(true)
		updateDebugString(obj.beam_count.." beams")
	elseif M.mode == 3 then
		-- COG sphere
		local cog = obj:calcCenterOfGravity(true)
		debugDrawer:drawSphere(0.1, cog, color(255,0,0,255))
		--debugDrawer:drawText(cog, color(0,0,0,255), tostring(cog))'
		
		debugDrawer:drawBeams(true)
		debugDrawer:drawNodeNumbers(color(255,0,0,255))
		updateDebugString(obj.node_count.." nodes")
	elseif M.mode == 4 then
		debugDrawer:drawBeams(false)
		for k, node in pairs (v.data.nodes) do
			col = color(128,128,128,255)
			--dump(v.data.nodes)
			if node.debugDraw == nil or node.debugDraw == true then
				if node.collision ~= nil and node.collision then
					col = color(0,128,0,255)
				end
				if node.selfCollision ~= nil and node.selfCollision then
					col.r = 255
				end
				debugDrawNode(col, node, "")
			end
		end
	elseif M.mode == 6 then
		debugDrawer:drawBeams(false)
		local total = 0
		local totalWheels = 0
		local minNode = false
		local maxNode = false
		for k, node in pairs (v.data.nodes) do
			col = color(0,0,0,255)
			total = total + node.nodeWeight
			if minNode == false or node.nodeWeight < minNode.nodeWeight then minNode = node end
			if maxNode == false or node.nodeWeight > maxNode.nodeWeight then maxNode = node end
			if node.creator == "wheels" then
				totalWheels = totalWheels + node.nodeWeight
			end
			if node.debugDraw == nil or node.debugDraw == true then
				col.r = 255 - (node.nodeWeight * 5)
				col.g = col.r
				col.b = col.r
				debugDrawNode(col, node, tostring(node.nodeWeight).."kg")
			end
		end
		local txt = formatLegend("total weight: ")..formatKilo(total).."\n"
		txt = txt .. formatLegend("total wheel weight: ")..formatKilo(totalWheels).." / "..formatKilo(totalWheels/#v.data.wheels).." per wheel\n"
		txt = txt .. formatLegend("total chassis weight: ")..formatKilo(total-totalWheels).."\n"
		txt = txt .. formatLegend("average node weight: ")..formatKilo(total/#v.data.nodes).."\n"
		if not minNode.name then minNode.name = "" end
		txt = txt .. formatLegend("lightest node: ")..minNode.name.." ["..minNode.cid.."] / "..formatKilo(minNode.nodeWeight).."\n"
		if not maxNode.name then maxNode.name = "" end
		txt = txt .. formatLegend("heaviest node: ")..maxNode.name.." ["..maxNode.cid.."] / "..formatKilo(maxNode.nodeWeight).."\n"
		updateDebugString(txt)
	elseif M.mode == 7 then
		debugDrawer:drawBeams(false)
		local usedmats = {}
		for k, node in pairs (v.data.nodes) do
			if node.debugDraw == nil or node.debugDraw == true then
				mat = particles.getMaterialByID(v.materials, node.nodeMaterial)
				matname = "unknown"
				col = color(255,0,0,255) -- unknown material: red
				if mat ~= nil then
					col = color(mat.colorR, mat.colorG, mat.colorB, 255)
					matname = mat.name
					usedmats[tostring(mat.name)] = mat
				end
				debugDrawNode(col, node, "")
			end
		end
		-- now build the legend
		usedmats["UNKNOWN"] = {name="UNKNOWN", colorR=255, colorG=0, colorB=0}
		local legend = ""
		for k, mat in pairs(usedmats) do
			legend = legend .. "<color:"..Lua:colorToHex(color(mat.colorR, mat.colorG, mat.colorB, 255))..">".. mat.name.."\n"
		end
		updateDebugString(legend)
	elseif M.mode == 8 then
		debugDrawer:drawBeams(true)
		debugDrawer:drawColTris(0, color(255,255,0,255), color(255,0,0,255), color(160,0,0,255), color(200,0,0,255))
		for k, node in pairs (v.data.nodes) do
			col = color(128,128,255,255)
			--dump(v.data.nodes)
			if node.debugDraw == nil or node.debugDraw == true then
				if node.collision ~= nil and node.collision then
					col = color(0,0,0,255)
				end
				if node.selfCollision ~= nil and node.selfCollision then
					col.b = 255
				end
				debugDrawNode(col, node, "")
			end
		end
	elseif M.mode == 9 then
		if v.data.props then
			local i = 0
			for propKey, prop in pairs (v.data.props) do
				local ptxt = ""
				ptxt = ptxt .. prop.mesh .. " - "
				if prop.disabled then
					ptxt = ptxt .. "[disabled]"
				end
				ptxt = ptxt .. prop.func
				if lastVal then
					ptxt = ptxt .. " = " .. string.format("%0.2f", prop.lastVal)
				end
				debugDrawer:drawNodeTextWithOffset(prop.idRef, color(255,255,0,255), float3(0,0,i*0.06), ptxt)
				i = i + 1
			end
		end
	end
end

-- public interface
M.setMode = setMode
M.reset   = reset
M.draw    = draw
M.activated = activated

return M