-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- this file is executed once on the engine lua startup

-- change default lookup path
package.path = "lua/system/?.lua;lua/?.lua;?.lua"

local STP = require "StackTracePlus"
debug.traceback = STP.stacktrace

-- only set ground model in engine mode
require("utils")
particles = require("particles")
require("groundmodel")
console   = require("console")
gamelogic = require("gamelogic")
scanvas   = require("scanvas")
simpleAI  = require("simpleAI")

local systemCanvas = nil

print("system reloaded")

-- set default gravity for anything: default is -9.81
-- Settings.gravity = 0

function graphicsStep(dt)
	--print("engine - graphicsStep " .. dt )
	gamelogic.update(dt)
	
	--scanvas.update(dt)
	
	simpleAI:update()
end

function onEnterCheckpoint(triggerID, triggerName, objPID, objID, objName)
	print(" object " .. tostring(objPID) .. " / " .. tostring(objName) .. " [" .. tostring(objID) .. "] just entered trigger " .. tostring(triggerName) .. " [" .. tostring(triggerID) .. "]")
	
	
	--[[ 
	--example: reset the vehicle
	local b = BeamEngine:getSlot(objPID)
	if b ~= nil then
		b:queueLuaCommand("obj:resetPhysics()")
	end
	]]--
end

function onLeaveCheckpoint(triggerID, triggerName, objPID, objID, objName)
	print(" object " .. tostring(objPID) .. " / " .. tostring(objName) .. " [" .. tostring(objID) .. "] just left trigger " .. tostring(triggerName) .. " [" .. tostring(triggerID) .. "]")
end

function onTickCheckpoint(triggerID, triggerName, objPID, objID, objName)
	print(" object " .. tostring(objPID) .. " / " .. tostring(objName) .. " [" .. tostring(objID) .. "] just ticked in trigger " .. tostring(triggerName) .. " [" .. tostring(triggerID) .. "]")
end


function onGasStationTick(triggerID, triggerName, objPID, objID, objName)
	local b = BeamEngine:getSlot(objPID)
	if b ~= nil then
		-- TODO
		--b:queueLuaCommand("obj:refill()")
	end
end