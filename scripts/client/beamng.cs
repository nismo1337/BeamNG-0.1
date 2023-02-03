// BeamNG specific scripts

exec("./inputmaps/keyboard.cs");
 
////////////////////////////////////////////////
//// Joystick or Gamepad Controller bindings

// no more deadzone, etc in here: the code moved to the Lua side
function steer_left( %val ) {
   vlua("input.analogue=false;input.axisX=" @ %val);
   $mvLeftAction = %val; // for the editor movements
}

function steer_right( %val ) {
   vlua("input.analogue=false;input.axisX=" @ -%val);
   $mvRightAction = %val; // for the editor movements
}

function joy_steer( %val ) {
   vlua("input.analogue=true;input.axisX=" @ -%val);
}

function accelerate( %val ) {
   vlua("input.axisY=" @ %val);
   $mvForwardAction = %val; // for the editor movements
}

function parkingbrake_toggle( %val ) {
   if(%val) vlua("input.toggleParkingbrake()");
}

function brake( %val ) {
   vlua("input.axisY=" @ -%val);  
   $mvBackwardAction = %val; // for the editor movements
}

function reloadInputMaps()
{
   echo("reloading input mappings...");
	// dynamically load joystick maps
	if( isJoystickDetected() )
	{
	   enableJoystick();
	   %joyCount = getJoystickCount();
	   for(%joyNum = 0; %joyNum < %joyCount; %joyNum = %joyNum + 1)
	   {
		  echo("Joystick or gamepad: " @ %joyNum);
		  echo(" - Product Name: " @ getJoystickProductName(%j));
		  echo(" - GUID: " @ getJoystickProductGUID(%j));
		  echo(" - axes: " @ getJoystickAxes(%j));
		  %joyMap = "./inputmaps/" @ getJoystickProductGUID(%j) @ ".inputmap.cs";
		  %joyMap = strreplace(%joyMap, "{", "");
		  %joyMap = strreplace(%joyMap, "}", "");
		  %joyMap = strreplace(%joyMap, "-", "");
		  if (isFile(%joyMap))
		  {
			 echo("trying to load joystick mapping " @ %joyMap);
			 exec("" @ %joyMap);
		  } else
		  {
			 echo("joystick specific mapping file not found: " @ %joyMap);
		  }
	   }
	} else
	{
	   echo("no joysticks or gamepads detected");
	}
}

reloadInputMaps();

// now bind the connect event to the above function
moveMap.bindCmd(joystick0, connect, "reloadInputMaps();", "");
moveMap.bindCmd(joystick1, connect, "reloadInputMaps();", "");
moveMap.bindCmd(joystick2, connect, "reloadInputMaps();", "");
moveMap.bindCmd(joystick3, connect, "reloadInputMaps();", "");
moveMap.bindCmd(joystick4, connect, "reloadInputMaps();", "");
moveMap.bindCmd(gamepad0, connect, "reloadInputMaps();", "");
moveMap.bindCmd(gamepad1, connect, "reloadInputMaps();", "");
moveMap.bindCmd(gamepad2, connect, "reloadInputMaps();", "");
moveMap.bindCmd(gamepad3, connect, "reloadInputMaps();", "");
moveMap.bindCmd(gamepad4, connect, "reloadInputMaps();", "");

echo("### beamng.cs loaded");
