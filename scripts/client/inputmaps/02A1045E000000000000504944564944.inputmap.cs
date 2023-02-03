// Product Name: Controller (Xbox 360 Wireless Receiver for Windows)
// GUID: {02A1045E-0000-0000-0000-504944564944}
// axes: 5^Y^X^U^R^Z
 
//%device = "{C299046D-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "gamepad" @ %joyNum;
 
// 15% deadzone for the camera things
$gp_deadzone = "-0.15 0.15";

// camera
moveMap.bind(%device, thumbrx, "D", $gp_deadzone, gamepadYaw);
moveMap.bind(%device, thumbry, "D", $gp_deadzone, gamepadPitch);

// movement : deadzones and such are in lua for these
moveMap.bind(%device, thumblx, joy_steer);
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
