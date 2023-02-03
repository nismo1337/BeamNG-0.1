// Product Name: Logitech G25 Racing Wheel USB
// GUID: {C299046D-0000-0000-0000-504944564944}
// axes: 5^X^S^V^Y^S

//%device = "{C299046D-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "joystick" @ %joyNum;

// camera
moveMap.bind(%device, button0, joystickYaw);
moveMap.bind(%device, button1, joystickPitch);

// movement
moveMap.bind(%device, xaxis, joy_steer);
moveMap.bind(%device, yaxis, brake);
moveMap.bind(%device, ryaxis, accelerate);

moveMap.bindCmd(%device, button2, "beamNGResetPhysics();", "");
moveMap.bindCmd(%device, button3, "beamNGTogglePhysics();", "");
moveMap.bind(%device, button4, parkingbrake_toggle);
moveMap.bindCmd(%device, button5, "beamNGSwitchVehicle();", "");
moveMap.bindCmd(%device, button6, "beamNGZoom(-1);", "");
moveMap.bindCmd(%device, button7, "beamNGZoom(1);", "");
moveMap.bindCmd(%device, button8, "beamNGResetCamera();", "");

moveMap.bindCmd(%device, button9, "beamNGCameraToggle();", "");
//moveMap.bind(%device, btn_back, beamNGControl);
//moveMap.bind(%device, btn_x, toggleFirstPerson);

echo("G25 mapping loaded");
