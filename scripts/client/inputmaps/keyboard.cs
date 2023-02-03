////////////////////////////////////////////////
//// Keyboard mappings
// arrows
moveMap.bind(keyboard, up, accelerate);
moveMap.bind(keyboard, down, brake);
moveMap.bind(keyboard, left, steer_left);
moveMap.bind(keyboard, right, steer_right);

// AWSD
moveMap.bind( keyboard, a, steer_left );
moveMap.bind( keyboard, d, steer_right );
moveMap.bind( keyboard, w, accelerate );
moveMap.bind( keyboard, s, brake );

$np_movespeed = 0.1;
// camera/numpad
function np_x(%val)
{
   if(%val > 0)
   {
      $mvYawLeftSpeed = %val * $np_movespeed;
      $mvYawRightSpeed = 0;
   }
   else
   {
      $mvYawLeftSpeed = 0;
      $mvYawRightSpeed = -%val * $np_movespeed;
   }
}
function np_y(%val)
{
   if(%val > 0)
   {
      $mvPitchDownSpeed = %val * $np_movespeed;
      $mvPitchUpSpeed = 0;
   }
   else
   {
      $mvPitchDownSpeed = 0;
      $mvPitchUpSpeed = -%val * $np_movespeed;
   }
}
moveMap.bindCmd(keyboard, numpad4, "np_x(-1);", "np_x(0);");
moveMap.bindCmd(keyboard, numpad6, "np_x(1);", "np_x(0);");
moveMap.bindCmd(keyboard, numpad8, "np_y(1);", "np_y(0);");
moveMap.bindCmd(keyboard, numpad2, "np_y(-1);", "np_y(0);");
moveMap.bindCmd(keyboard, numpad9, "gamepadZoom(-0.1);", "gamepadZoom(0);");
moveMap.bindCmd(keyboard, numpad3, "gamepadZoom(0.1);", "gamepadZoom(0);");
moveMap.bindCmd(keyboard, numpad5, "beamNGResetCamera();", "");
moveMap.bindCmd(keyboard, numpad1, "beamNGCameraLookback();", "");
moveMap.bindCmd(keyboard, tab,     "beamNGSwitchVehicle(1);", "");
moveMap.bindCmd(keyboard, "shift tab", "beamNGSwitchVehicle(-1);", "");
moveMap.bindCmd(keyboard, c,       "beamNGCameraToggle();", "");

// assorted
moveMap.bindCmd(keyboard, i, "beamNGResetPhysics();", "");
moveMap.bindCmd(keyboard, r, "beamNGResetPhysics();", "");
moveMap.bindCmd(keyboard, j, "beamNGTogglePhysics();", "");
moveMap.bind(keyboard, p, parkingbrake_toggle);
moveMap.bindCmd(keyboard, "ctrl r", "beamNGReloadCurrentVehicle();", "");
moveMap.bindCmd(keyboard, "ctrl t", "beamNGReloadSystemLua();", "");


moveMap.bindCmd(keyboard, "ctrl escape", "quit();", "" );
moveMap.bindCmd(keyboard, "escape", "", "handleEscape();");

// some toolkit functions
moveMap.bindVLuaCmd(keyboard, "k", "bdebug.setMode('-1')", "");
moveMap.bindVLuaCmd(keyboard, "l", "bdebug.setMode('+1')", "");

moveMap.bindVLuaCmd(keyboard, "ctrl f1", "bdebug.setMode(0)", "");
moveMap.bindVLuaCmd(keyboard, "f1", "bdebug.setMode(1)", "");
moveMap.bindVLuaCmd(keyboard, "f2", "bdebug.setMode(2)", "");
moveMap.bindVLuaCmd(keyboard, "f3", "bdebug.setMode(3)", "");
moveMap.bindVLuaCmd(keyboard, "f4", "bdebug.setMode(4)", "");
moveMap.bindVLuaCmd(keyboard, "f5", "bdebug.setMode(5)", "");
moveMap.bindVLuaCmd(keyboard, "f6", "bdebug.setMode(6)", "");
moveMap.bindVLuaCmd(keyboard, "f7", "bdebug.setMode(7)", "");
moveMap.bindVLuaCmd(keyboard, "f8", "bdebug.setMode(8)", "");

moveMap.bindVLuaCmd(keyboard, "alt left", "bullettime.set('log-')", "");
moveMap.bindVLuaCmd(keyboard, "alt right", "bullettime.set('log+')", "");
moveMap.bindVLuaCmd(keyboard, "alt up", "bullettime.set(100)", "");
moveMap.bindVLuaCmd(keyboard, "alt down", "bullettime.set(0.5)", "");
