-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

require("utils")
local M = {}

local triggers = {}
matValues = {}

local function materialLoadStr(str, name)
	local f, err = loadstring("return function () " .. str .. " end", name or str)
	if f then return f() else return f, err end
end

local function init()
	if v.data.glowMap ~= nil then
		for k, gm in pairs (v.data.glowMap) do
			local gmat = gm
			gmat.k = k
			gmat.mat = obj:getSwitchableMaterial(k)
			if gmat.mat then
				gmat.mat:setBase(gm.off)
				--dump(gmat)
				local fields = {}
				if gm.simpleFunction then
					for fk, fc in pairs(gm.simpleFunction) do
						matValues[fk] = 0
						local s = 'matValues["'..fk..'"] * '..fc
						table.insert(fields, s)
					end
					local cmd = join(fields, " + ")
					if gm.limit then
						cmd = 'math.min('..gm.limit..', ('..cmd..'))'
					end
					cmd = "return "..cmd
					gmat.evalFunction = materialLoadStr(cmd)

					for fk, fc in pairs(gm.simpleFunction) do
						if not triggers[fk] then triggers[fk] = {} end
						table.insert(triggers[fk], gmat)
					end
				elseif gm.advancedFunction and gm.advancedFunction.triggers and gm.advancedFunction.cmd then
					gmat.evalFunction = materialLoadStr(gm.advancedFunction.cmd)
					for fk, fc in pairs(gm.advancedFunction.triggers) do
						matValues[fc] = 0
						if not triggers[fc] then triggers[fc] = {} end
						table.insert(triggers[fc], gmat)
					end
				end
			end
		end
	end
end

local function switch(f, val)
	if not triggers[f] then return end
	if type(val) == "boolean" then val = val and 1 or 0 end
	-- only once
	if matValues[f] == val then return end
	matValues[f] = val
	-- switch the materials
	for f, vNotUsed in pairs(triggers) do
		for ka, va in pairs(triggers[f]) do
			--if not va.evalFunction then
			--	dump(va)
			--end
			local localVal = va.evalFunction()
			--print(localVal)
			if localVal and localVal > 0 then
				va.mat:switchTo(va.on)
				va.mat:setGlow(localVal) -- not working yet
			else
				va.mat:reset()
			end
		end
	end
end

-- public interface
M.switch = switch
M.init = init

return M