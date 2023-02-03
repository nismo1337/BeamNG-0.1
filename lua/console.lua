-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- this is an interactive lua shell inside lua, quite handy

local M = {}

local execTimer = HighPerfTimer()

local function exec(cmd)
  local func, err  = loadstring(cmd)
  if func then
    if type(debug.traceback) ~= "function" then
      print("*** LUA TRACEBACK BROKEN ***")
    end
    if execTimer then execTimer:reset() end
    local ok, result = xpcall(func, debug.traceback)
    if not ok then
      print("Error: "..result)
    else
      if result then
        print(tostring(result))
      end
    end
    if execTimer then
      print("Executed in "..execTimer:stop().." ms")
    end
  else
    print("Error: "..err)
  end
end

local function start()
	print("*** Entering BeamNG LUA Shell ***")
	while true
	do
		io.write("> ")
		local cmd = io.read()
		
		-- some shortcuts
		if cmd == "exit" or cmd == "quit" then
      break
		elseif(cmd == "help") then
			print("This is an interactive lua shell. Following shortcuts exists:")
			print("* notime - disables command timing")
			print("* luaut  - starts lua unit testing")
			print("* test   - executes the tests/test.lua script")
			print("* reload - forces reloading of the scripts")
			print("* quit / exit - closes the console")
			goto continue
		elseif(cmd == "notime") then
			execTimer=nil
			goto continue
		elseif(cmd == "luaut") then
			cmd = 'rerequire("nittests")'
		elseif(cmd == "reload") then
			cmd = 'rerequire("engine")'
		elseif(cmd == "test") then
			cmd = 'rerequire("beamng") ; rerequire("tests/test")'
		end
		print(cmd)
    exec(cmd)
    
		::continue::
	end
	print "*** Exiting BeamNG LUA Shell ***"
end

-- public interface
M.start = start
return M