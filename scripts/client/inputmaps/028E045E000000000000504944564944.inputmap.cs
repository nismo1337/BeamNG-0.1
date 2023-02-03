// Product Name: Controller (Xbox 360 Wired Controller for Windows)
// GUID: {028E045E-0000-0000-0000-504944564944}
// axes: 5^Y^X^U^R^Z
 
//%device = "{028E045E-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "gamepad" @ %joyNum;
 
// 0 deadzone
$gp_deadzone = "-0.15 0.15";

// 5% deadzone: 
// $gp_deadzone = "-0.05 0.05";

// camera
moveMap.bind(%device, thumbrx, "D", $gp_deadzone, gamepadYaw);
moveMap.bind(%device, thumbry, "D", $gp_deadzone, gamepadPitch);
// movement
moveMap.bind(%device, thumblx, joy_steer);
//moveMap.bind(%device, thumbly, "D", $gp_deadzone, gamePadMoveY); // using triggers instead

moveMap.bind(%device, triggerl, brake);
moveMap.bind(%device, triggerr, accelerate);

moveMap.bindCmd(%device, dpadd, "beamNGResetPhysics();", "");
moveMap.bindCmd(%device, dpadr, "beamNGTogglePhysics();", "");
moveMap.bind(%device, btn_r, parkingbrake_toggle);
moveMap.bindCmd(%device, btn_l, "beamNGSwitchVehicle();", "");
moveMap.bindCmd(%device, btn_y, "gamepadZoom(-0.1);", "gamepadZoom(0);");
moveMap.bindCmd(%device, btn_b, "gamepadZoom(0.1);", "gamepadZoom(0);");
moveMap.bindCmd(%device, btn_rt, "beamNGResetCamera();", "");

moveMap.bindCmd(%device, btn_back, "beamNGCameraToggle();", "");
//moveMap.bind(%device, btn_back, beamNGControl);
//moveMap.bind(%device, btn_x, toggleFirstPerson);
