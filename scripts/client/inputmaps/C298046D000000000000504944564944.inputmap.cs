// Product Name: Logitech Driving Force Pro USB
// GUID: {C298046D-0000-0000-0000-504944564944}
// axes: 4^X^S^Y^V

//%device = "{C298046D-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "joystick" @ %joyNum;

// movement
moveMap.bind(%device, xaxis, joy_steer);
moveMap.bind(%device, yaxis, brake);
moveMap.bind(%device, rzaxis, accelerate);

//moveMap.bindCmd(%device, button2, "beamNGResetPhysics();", "");
//moveMap.bindCmd(%device, button3, "beamNGTogglePhysics();", "");
//moveMap.bindCmd(%device, button1, "beamNGToggleParkingBrake();", "");
//moveMap.bindCmd(%device, button5, "beamNGSwitchVehicle();", "");
//moveMap.bindCmd(%device, button6, "beamNGZoom(-1);", "");
//moveMap.bindCmd(%device, button7, "beamNGZoom(1);", "");
//moveMap.bindCmd(%device, button8, "beamNGResetCamera();", "");

moveMap.bindCmd(%device, button9, "beamNGCameraToggle();", "");
//moveMap.bind(%device, btn_back, beamNGControl);
//moveMap.bind(%device, btn_x, toggleFirstPerson);

echo("MSwheel mapping loaded");
