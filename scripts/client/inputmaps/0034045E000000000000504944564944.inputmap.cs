// Product Name: SideWinder Force Feedback Wheel (USB)
// GUID: {C299046D-0000-0000-0000-504944564944}
// axes: 3^X^Y^V

//%device = "{C299046D-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "joystick" @ %joyNum;

// movement
moveMap.bind(%device, xaxis, joy_steer);
moveMap.bind(%device, yaxis, brake);
moveMap.bind(%device, rzaxis, accelerate);

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

echo("MSwheel mapping loaded");
