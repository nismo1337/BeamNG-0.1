-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

-- defines the ground models

local M = {}

local materials = particles.getMaterialsParticlesTable()

-- set up the ground model to use
local asphalt = groundModel()
asphalt.adhesionVelocity            = 2.0
--[[
Adhesion velocity
Below this velocity, static friction rules, above it dynamic friction takes command. It should be something small, in the range of 0.1-0.4 . This velocity threshold is also used by the fluid physics, so you should always define it. NEVER have it at 0. 
Parameter range 0.1 -> 0.5 (Never put it at 0)
]]--

asphalt.staticFrictionCoefficient   = 1.2
--[[
Static friction coef
Static friction keeps you in the same place when you are stopped on a hill. In the real world this friction is always bigger than dynamic friction (sliding friction). Start with 0.5 and work from there. It is better to try to find some experimentally validated values for this and the rest of surface friction variables in the net, and then to fine tune via strength. 

Parameter range 0.1 -> 2
]]--

--http://www.mfes.com/friction.html
asphalt.slidingFrictionCoefficient  = 0.85
--[[
Dynamic friction coef
Or sliding friction coef. It should be smaller than static friction coef. This parameter defines how much friction you'll have when sliding. Try to find some values for it from the net. 
Parameter range 0.1 -> 1.5
]]--

asphalt.hydrodynamicFriction        = 0.01
--[[
Hydrodynamic friction coef
This friction defines the added friction that you'll feel from a surface that has a little film of fluid on it. It is kind of redundant with all the fluid physics below, but it is here so as for experimentally validated values from the net to be usable. If you decide that you'll simulate the film of fluid with the more complex fluid physics below, then just set this to 0. 

Parameter range 0 -> 1.5 (maybe more)
]]--

asphalt.stribeckVelocity            = 6.0
--[[
Stribeck velocity
You'll either find stribeck velocity in the net, or the inverse (1/stribeck velocity) of it described as "stribeck coef". It defines the shape of the dynamic friction curve. Lets leave it at that. Just find some nice values for it from the net. Do  not change
]]--

asphalt.alpha                       = 2
--[[
Alpha
Its usual value is 2. But you can try others.
]]--

asphalt.strength                    = 1
--[[
Strength
This parameter raises or diminishes surface friction in a generic way. It is here so as to be able to do quick calibrations of friction. Start with having this to 1.0 and after tuning the rest of the surface variables, come back and play with this. 

Parameter range 0 -> 2
]]--
	
-- set the collision type to emit
asphalt.collisiontype = particles.getMaterialIDByName(materials, "ASPHALT")

BeamEngine:setGroundModel(asphalt)

-- public interface

-- currently empty

return M