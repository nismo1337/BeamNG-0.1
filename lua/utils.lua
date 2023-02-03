-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- utility things, big chaos

local inspect = require("inspect")
function dump(...)
	logAlways(inspect(...))
end


local ExponentialSmoothing = {}
ExponentialSmoothing.__index = ExponentialSmoothing

-- creation method of the object, inits the member variables
function newExponentialSmoothing(window, startingValue)
	local data = {}
	setmetatable(data, ExponentialSmoothing)
	data.a = 2 / window
	data.samplePrev = 0
	data.stPrev = 0
	data.firstSample = true
	if startingValue then
		data:get(startingValue)
	end
	return data
end

function ExponentialSmoothing:get(sample)
	if self.firstSample then
		self.firstSample = false
		self.stPrev = sample
		self.samplePrev = sample
		return sample
	end

	self.stPrev = self.stPrev + self.a * (self.samplePrev - self.stPrev)
	self.samplePrev = sample

	return self.stPrev
end


-- little snippet that enforces reloading of files
function rerequire(module)
	package.loaded[module] = nil
	m = require(module)
	if not m then
		logError(">>> Module failed to load: " .. tostring(module).." <<<")
	end
	return m
end

function readDictJSONTable(filename)
	if not json then json = require("json") end
	local state, data = pcall(json.decode, readFile(filename))
	for k,v in pairs(data) do
		for k2,v2 in pairs(v) do
			if k2 > 1 then
				-- re-add headers
				for i=1,#v[1],1 do
					
					v[k2][v[1][i]] = v[k2][i]
					v[k2][i] = nil
				end
			end
		end
		v[1] = nil
	end
	--dump(data)
	return data
end

function toJSONString(d)
	if type(d) == "string" then
		return "\""..d.."\""
	elseif type(d) == "number" then
		return tostring(d)
	else
		return tostring(d)
	end
end

function saveCompiledJBeamRecursive(f, data, level)
	local indent = string.rep(" ", level*2)
	local columnSize = 20
	local nl = true
	if level > 2 then nl = false end
	if level > 3 then indent = "" end
	--f:write(level..indent
	f:write(indent)

	if type(data) == "table" and tableFirstKey(data) == "partOrigin" then
		f:write("\n"..indent.."/*"..string.rep("*", 50).."\n")
		f:write(indent .. " * part " .. tostring(data["partOrigin"]).."\n")
		f:write(indent .. " *"..string.rep("*", 50) .. "*/\n")
		f:write("\n"..indent)
	end
	
	if level > 2 then indent = "" end
	if type(data) == "table" then
		if tableIsDict(data) then
			f:write("{")
			if nl then f:write("\n") end
			local row = {}
			for k,v in pairs(data) do
				if type(v) == "table" then
					f:write(indent..toJSONString(k).." : ")
					--if nl then f:write("\n" end
					saveCompiledJBeamRecursive(f, v, level + 1)
					--if nl then f:write("\n" end
				else
					if level > 3 then columnSize = 0 end
					txt = indent..tostring(joinKVES(columnSize,toJSONString(k), toJSONString(v)))
					table.insert(row, txt)
				end
			end
			if tableSize(row) > 0 then
				if nl then
					f:write(joinES(columnSize, row, ", \n"))
				else
					f:write(joinES(columnSize, row, ", "))
				end
			end
			if nl then f:write("\n") end
			f:write(indent.."}, ")
			if level < 4 then f:write("\n") end
		else
			local nl = true
			if level > 2 then nl = false end
			f:write("[")
			if nl then f:write("\n") end
			local row = {}
			for i=1,#data,1 do
			--k,v in pairs(data) do
				v = data[i]
				if type(v) == "table" then
					saveCompiledJBeamRecursive(f, v, level + 1)
				else
					txt = toJSONString(v)
					table.insert(row, txt)
				end
			end
			if tableSize(row) > 0 then
				f:write(joinES(columnSize, row, ", "))
			end
			f:write(indent.."], ")
			if level < 4 then f:write("\n") end
		end
	end
end

function saveCompiledJBeam(data, filename)
	local f = io.open(filename, "w")
	if f == nil then
		logError("unable to open file "..filename.." for writing")
		return false
	end
	saveCompiledJBeamRecursive(f, data, 0)
	f:close()
	return true
end

function readFile(filename)
	local f = io.open(filename, "r")
	if f == nil then
		return nil
	end
	local content = f:read("*all")
	f:close()
	return content
end

function writeFile(filename, data)
	local file, err = io.open(filename,"w")
	if file == nil then
		logError("Error opening file for writing: "..filename..": "..err)
		return nil
	end
	local content = file:write(data)
	file:close()
end

function tableContains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function tableIsDict(tbl)
	if type(tbl) ~= "table" then
		return false
	end
	for k, v in pairs (tbl) do
		return (k ~= 1)
	end
end

function tableMerge(dst, src)
	for i,v in pairs(src) do
		if (type(v) ~= "function") then
			dst[i] = v;
		end
	end
	return dst;
end

-- http://stackoverflow.com/questions/1283388/lua-merge-tables
function tableMergeRecursive(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
                if type(t1[k] or false) == "table" then
                        tableMergeRecursive(t1[k] or {}, t2[k] or {})
                else
                        t1[k] = v
                end
        else
                t1[k] = v
        end
    end
    return t1
end

-- Compatibility: Lua-5.0
function split(str, delim, maxNb)
    -- Eliminate bad cases...
    if string.find(str, delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0    -- No limit
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then break end
    end
    -- Handle the last field
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result
end

function joinKVES(space, k, v)
  local diff = space - string.len(k)
  local str = k .. string.rep(" ", diff)
  str = str .. ": "
  diff = space - string.len(v)
  str = str .. v .. string.rep(" ", diff)
  return str
end

-- join equally spaced
function joinES(space, list, delimiter)
  local diff = space - string.len(list[1])
  local str = list[1] .. string.rep(" ", diff)
  for i = 2, #list do 
	diff = space - string.len(list[i])
    str = str .. delimiter .. list[i] .. string.rep(" ", diff)
  end
  return str
end

function join(list, delimiter)
  local str = list[1]
  for i = 2, #list do 
    str = str .. delimiter .. list[i] 
  end
  return str
end


function tableFirstKey(tbl)
	if type(tbl) ~= "table" then
		return ""
	end
	for k, v in pairs (tbl) do
		--logInfo("*** "..tostring(k).." = "..tostring(v).." ["..type(v).."]")
		return k
	end
end

function tableSize(tbl)
	if type(tbl) ~= "table" then
		return 0
	end
	res = 0
	for k, v in pairs (tbl) do
		res=res+1
	end
	return res
end

function _tableDepth(tbl, depth)
	if type(tbl) ~= "table" then
		return 0
	end
	for k, v in pairs (tbl) do
		if type(v) == "table" then
			return _tableDepth(v, depth + 1)
		end
	end
	return depth
end

function tableDepth(tbl)
	return _tableDepth(tbl, 0)
end

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

-- float3 conversion helpers
function tableToFloat3(v)
	if v == nil then
		return float3(0,0,0)
	end
	return float3(v.x, v.y, v.z)
end


function float3ToTable(f)
	return {x=f.x, y=f.y, z=f.z}
end

function sign(n)
	if n > 0 then return 1 end
	if n < 0 then return -1 end
	return 0
end

-- safe table iteration functions: it will iterate the tables via a copy: "adding" to the tables will not change the iteration
function ipairs_safe(t)
	local new_table = {}
	for index, value in pairs(t) do
		new_table[index] = value
	end
	local function ipairs_safe_it(t, i)
		i = i + 1
		local v = t[i]
		if v ~= nil then
			return i,v
		else
			return nil
		end
	end
	return ipairs_safe_it, new_table, 0
end

function pairs_safe(t)
	local new_table = {}
	for index, value in pairs(t) do
		new_table[index] = value
	end
	local function pairs_safe_it(t, i)
		local k, v = next(t, i)
		if k ~= nil then
			return k,v
		else
			return nil
		end
	end
	return pairs_safe_it, new_table, nil
end

function CatMullRomSpline(points)
	if #points < 3 then return nil end
	local res = {}
	local p0, p1, p2, p3, x, steps
	for i = 1, #points - 1 do
		p0, p1, p2, p3 = points[math.max(i - 1, 1)], points[i], points[i + 1], points[math.min(i + 2, #points)]
		steps = p2[1] - p1[1]
		x = math.floor(p1[1])
		for t = 0, 1, 1/steps do
			res[x] = 0.5 * (
				  (2 * p1[2])
				+ (    p2[2] -     p0[2]) * t
				+ (2 * p0[2] - 5 * p1[2] + 4 * p2[2] - p3[2]) * t * t
				+ (3 * p1[2] -     p0[2] - 3 * p2[2] + p3[2]) * t * t * t)
			x = x + 1
		end
		res[x] = p2[2]
	end
	return res
end

-- serialization functions, see testSerialization, be aware that you need to add custom datatypes in this in case you need them
function serialize(val, name)
    local tmp = ""

    if name then tmp = tmp .. name .. "=" end

    if type(val) == "table" then
        tmp = tmp .. "{"
        for k, v in pairs(val) do
            tmp =  tmp .. serialize(v, k) .. ","
        end
        tmp = tmp .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. tostring(val)
    elseif type(val) == type(float3(0,0,0)) then
    	-- float3 is special :)
        tmp = tmp .. string.format("float3%s", tostring(val))
    else
        tmp = tmp .. "--[[ inserializeable datatype:" .. type(val) .. " ]]--"
    end

    return tmp
end

function unserialize(s)
	return loadstring("return " .. s)()
end

function testSerialization()
	d = {a = "foo", b = {c = 123, d = "foo", p = float3(1,2,3)}}
	print("original data: " .. tostring(d))
	dump(d)
	
	s = serialize(d)
	print("serialized data: " .. tostring(s))
	
	da = unserialize(s)
	print("restored data: " .. tostring(da))	
	dump(da)
	
	sa = serialize(da)
	if sa == s then
		print "serialization seems to work"
	else
		print "serialization got problems, look above"
	end
end
--testSerialization()