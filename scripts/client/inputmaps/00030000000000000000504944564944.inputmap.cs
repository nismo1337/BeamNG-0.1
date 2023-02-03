// Product Name: Hitec Aurora 9 R/C (RC-Joystick)
// GUID: {00030000-0000-0000-0000-504944564944}
// axes: 7^S^S^R^Z^V^Y^X
 
//%device = "{00030000-0000-0000-0000-504944564944}-" @ %joyNum;  (<- Guid goes there too)
%device = "joystick" @ %joyNum;
 
// movement
moveMap.bind(%device, rzaxis, joy_steer);

moveMap.bind(%device, yaxis, joy_accelerate);

echo("Aurora9 mapping loaded");