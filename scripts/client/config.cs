// Torque Input Map File
if (isObject(moveMap)) moveMap.delete();
new ActionMap(moveMap);
moveMap.bindCmd(keyboard, "q", "vlua(\"input.keys.Q = true\");", "vlua(\"input.keys.Q = false\");");
moveMap.bindCmd(keyboard, "e", "vlua(\"input.keys.E = true\");", "vlua(\"input.keys.E = false\");");
moveMap.bind(keyboard, "w", moveForward);
moveMap.bind(keyboard, "s", movebackward);
moveMap.bind(keyboard, "a", moveleft);
moveMap.bind(keyboard, "d", moveright);
moveMap.bindCmd(keyboard, "t", "vlua(\"input.keys.T = true\");", "vlua(\"input.keys.T = false\");");
moveMap.bindCmd(keyboard, "f", "vlua(\"input.keys.F = true\");", "vlua(\"input.keys.F = false\");");
moveMap.bindCmd(keyboard, "g", "vlua(\"input.keys.G = true\");", "vlua(\"input.keys.G = false\");");
moveMap.bindCmd(keyboard, "h", "vlua(\"input.keys.H = true\");", "vlua(\"input.keys.H = false\");");
moveMap.bindCmd(keyboard, "r", "beamNGResetPhysics();", "");
moveMap.bindCmd(keyboard, "y", "vlua(\"input.keys.Y = true\");", "vlua(\"input.keys.Y = false\");");
moveMap.bind(keyboard, "pageup", moveup);
moveMap.bind(keyboard, "pagedown", movedown);
moveMap.bind(keyboard, "z", toggleFreeLook);
moveMap.bind(keyboard, "shift c", toggleCamera);
moveMap.bindCmd(keyboard, "f3", "vlua(\"bdebug.setMode(3)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f4", "vlua(\"bdebug.setMode(4)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f8", "vlua(\"bdebug.setMode(8)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f7", "vlua(\"bdebug.setMode(7)\");", "vlua(\"\");");
moveMap.bind(keyboard, "up", moveForward);
moveMap.bind(keyboard, "down", movebackward);
moveMap.bind(keyboard, "left", moveleft);
moveMap.bind(keyboard, "right", moveright);
moveMap.bindCmd(keyboard, "numpad4", "np_x(-1);", "np_x(0);");
moveMap.bindCmd(keyboard, "numpad6", "np_x(1);", "np_x(0);");
moveMap.bindCmd(keyboard, "numpad8", "np_y(1);", "np_y(0);");
moveMap.bindCmd(keyboard, "numpad2", "np_y(-1);", "np_y(0);");
moveMap.bindCmd(keyboard, "numpad9", "gamepadZoom(-0.1);", "gamepadZoom(0);");
moveMap.bindCmd(keyboard, "numpad3", "gamepadZoom(0.1);", "gamepadZoom(0);");
moveMap.bindCmd(keyboard, "numpad5", "beamNGResetCamera();", "");
moveMap.bindCmd(keyboard, "numpad1", "beamNGCameraLookback();", "");
moveMap.bindCmd(keyboard, "tab", "beamNGSwitchVehicle(1);", "");
moveMap.bindCmd(keyboard, "shift tab", "beamNGSwitchVehicle(-1);", "");
moveMap.bindCmd(keyboard, "c", "beamNGCameraToggle();", "");
moveMap.bindCmd(keyboard, "i", "beamNGResetPhysics();", "");
moveMap.bindCmd(keyboard, "j", "beamNGTogglePhysics();", "");
moveMap.bindCmd(keyboard, "p", "beamNGToggleParkingBrake();", "");
moveMap.bindCmd(keyboard, "ctrl r", "beamNGReloadCurrentVehicle();", "");
moveMap.bindCmd(keyboard, "ctrl t", "beamNGReloadSystemLua();", "");
moveMap.bindCmd(keyboard, "ctrl escape", "quit();", "");
moveMap.bindCmd(keyboard, "escape", "", "handleEscape();");
moveMap.bindCmd(keyboard, "k", "vlua(\"bdebug.setMode(\'-1\')\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "l", "vlua(\"bdebug.setMode(\'+1\')\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "ctrl f1", "vlua(\"bdebug.setMode(0)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f1", "vlua(\"bdebug.setMode(1)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f2", "vlua(\"bdebug.setMode(2)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f5", "vlua(\"bdebug.setMode(5)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "f6", "vlua(\"bdebug.setMode(6)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "alt left", "vlua(\"bullettime.set(\'log-\')\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "alt right", "vlua(\"bullettime.set(\'log+\')\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "alt up", "vlua(\"bullettime.set(100)\");", "vlua(\"\");");
moveMap.bindCmd(keyboard, "alt down", "vlua(\"bullettime.set(0.5)\");", "vlua(\"\");");
moveMap.bind(mouse0, "xaxis", yaw);
moveMap.bind(mouse0, "yaxis", pitch);
moveMap.bind(mouse0, "button0", mouseFire);
moveMap.bindCmd(joystick0, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(joystick1, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(joystick2, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(joystick3, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(joystick4, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(gamepad0, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(gamepad1, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(gamepad2, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(gamepad3, "connect", "reloadInputMaps();", "");
moveMap.bindCmd(gamepad4, "connect", "reloadInputMaps();", "");
