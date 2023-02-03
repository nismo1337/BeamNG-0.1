-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- change default lookup path
package.path = "lua/vehicle/?.lua;lua/?.lua;?.lua"

local STP = require "StackTracePlus"
debug.traceback = STP.stacktrace

require("utils")
canvas     = require("canvas")
drivetrain = require("drivetrain")
sounds     = require("sounds")
bdebug     = require("bdebug")
input      = require("input")
props      = require("props")
beamng     = require("beamng")
particlefilter = require("particlefilter")
particles  = require("particles")
material   = require("material")
electrics  = require("electrics")
json       = require("json")
beamstate  = require("beamstate")
sensors    = require("sensors")
bullettime = require("bullettime")
thrusters  = require("thrusters")
hydros     = require("hydros")
--console    = require("console")

-- globals for this object
v = beamng.newVehicle()

function init(path)
	if not obj then logError("Error getting main object: unable to spawn") ; return end
  
	setLogLevel(LOG_ERROR)
	hp = HighPerfTimer()
	-- load jbeam file
	v:loadDirectory(path)
	
	-- you can change the data in here before it gets submitted to the physics
	-- submit to physics
	v:pushToPhysics(obj, float3(0,0,0))
		
	if v.data == nil then
		v.data = {}
	end
	
	material.init()
	drivetrain.init()
	sensors.reset()
	beamstate.init()
	thrusters.init()
	input.init()
	hydros.init()
	
	logInfo("vehicle loading took "..hp:stop()..' ms')
end

-- step functions
function physicsStep(dts)
	drivetrain.updateWheels(dts)
	
	sensors.update()
	thrusters.update()
	hydros.update(dts)
end


local colnum = 0

function graphicsStep(dt)
	input.update() -- must come first ;)

	props.update()
	drivetrain.updateEngine(dt)	
	sounds.update(dt)
	
	electrics.update(dt)
	sensors.updateGFX(dt)
	beamstate.updateGFX()
	hydros.updateGFX(dt)
	
	-- update the canvas
	if bdebug.mode ~= 0 then
		
		if not vehicleCanvas then vehicleCanvas = canvas.createDrawingCanvas() end
		vehicleCanvas:update(dt, bdebug.mode)
	end

	bullettime.update(dt)
	drivetrain.wheelSlipGFXreset()
	thrusters.updateGFX()
end

-- debug
function debugDraw()
	bdebug.draw()
end

-- various callbacks
function vehicleResetted()
	drivetrain.reset()
	props.reset()
	sensors.reset()
	bdebug.reset()
	bullettime.reset()
	beamstate.reset()
	thrusters.reset()
end

function beamBroken(id, energy)
	beamstate.beamBroken(id, energy)
	--bullettime.slowMotion(0.05, 20) -- 20% of realtime
end

function vehicleDestroy()
	-- when the vehicle gets unloaded, remove all sounds
	sounds.destroy()
end

function particleEmitted(p)
	drivetrain.updateWheelSlip(p)
	particlefilter.particleEmitted(p)
end

function activated(mode)
	--[[
	if mode == 1 then
		print("yay, we got active")
	else
		print("deactivated :(")
	end
	]]--
	bdebug.activated(mode)
end

function instabilityDetected()
	-- enable break debug, so we see what beams broke
	print("instability detected for vehicle " .. tostring(v.vehicleDirectory) .. ": enabling beam break debug, reseting the vehicle and disabling the physics.")
	BeamEngine:setEnabled(false)
	obj:resetPhysics()
	bdebug.mode = 1
end

function exportPersistentData()
	d = { debug_mode = bdebug.mode }
	s = serialize(d)
	print("exportPersistentData("..s..")")
	return s
end

function importPersistentData(s)
	print("importPersistentData("..s..")")
	data = unserialize(s)
	bdebug.setMode(data.debug_mode)
end