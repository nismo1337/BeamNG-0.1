// Product Name: Logitech Dual Action
// GUID: {C216046D-0000-0000-0000-504944564944}
// axes: 4^V^Z^Y^X
 
//%device = "{C216046D-0000-0000-0000-504944564944}-" @ %joyNum;
%device = "gamepad" @ %joyNum;
 
// 0 deadzone
$gp_deadzone = "-0.15 0.15";

// 5% deadzone: 
// $gp_deadzone = "-0.05 0.05";

// camera
moveMap.bind(%device, xaxis, "DI", $gp_deadzone, gamepadYaw);
//moveMap.bind(%device, x-axle, "D", $gp_deadzone, gamePadMoveY); // using triggers instead
moveMap.bind(%device, zaxis, joy_steer);
moveMap.bind(%device, xaxis, brake);
moveMap.bind(%device, ryaxis, accelerate);