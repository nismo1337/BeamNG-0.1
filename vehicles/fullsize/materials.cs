
singleton Material(fullsize)
{
   mapTo = "fullsize";
   diffuseMap[2] = "vehicles/fullsize/fullsize_c.dds";
   specularMap[2] = "vehicles/fullsize/fullsize_s.dds";
   normalMap[2] = "vehicles/fullsize/fullsize_n.dds";
   diffuseMap[1] = "vehicles/fullsize/fullsize_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_n.dds";
   //diffuseMap[3] = "vehicles/fullsize/fullsize_dirt.dds";
   //normalMap[3] = "vehicles/fullsize/fullsize_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   diffuseColor[2] = "0.06 0.08 0.22 1";
   //diffuseColor[3] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_gauges)
{
   mapTo = "fullsize_gauges";
   diffuseMap[1] = "fullsize_gauges_g.dds";
   specularMap[1] = "fullsize_gauges_s.dds";
   normalMap[1] = "fullsize_gauges_n.dds";
   diffuseMap[0] = "fullsize_gauges_d.dds";
   specularMap[0] = "fullsize_gauges_s.dds";
   normalMap[0] = "fullsize_gauges_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   glow[1] = "1";
   emissive[1] = "1";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "0.75 0.75 0.75 1";
   diffuseColor[1] = "1.5 1.5 1.5 0.2";
};

singleton Material(fullsize_interior)
{
   mapTo = "fullsize_interior";
   diffuseMap[0] = "fullsize_interior_d.dds";
   normalMap[0] = "fullsize_interior_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularMap[0] = "fullsize_interior_s.dds";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "0.8 0.8 0.8 1";
};

singleton Material(fullsize_glass)
{
   mapTo = "fullsize_glass";
   diffuseMap[0] = "vehicles/fullsize/fullsize_glass_d.dds";
   specularMap[0] = "vehicles/fullsize/fullsize_glass_s.dds";
   diffuseMap[1] = "vehicles/fullsize/fullsize_glass_da.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_glass_s.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_glass_dirt.dds";
   specularPower[0] = "128";
   pixelSpecular[0] = "1";
   specularPower[1] = "128";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "0";
   translucent = "1";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_signal_L)
{
   mapTo = "fullsize_signal_L";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_signal_R)
{
   mapTo = "fullsize_signal_R";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_taillight)
{
   mapTo = "fullsize_taillight";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_chmsl)
{
   mapTo = "fullsize_chmsl";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_headlight)
{
   mapTo = "fullsize_headlight";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_reverselight)
{
   mapTo = "fullsize_reverselight";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_parkinglight)
{
   mapTo = "fullsize_parkinglight";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_lights_on)
{
   mapTo = "fullsize_lights_on";
   diffuseMap[2] = "vehicles/fullsize/fullsize_lights_g.dds";
   specularMap[2] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[3] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[3] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   diffuseColor[2] = "1.5 1.5 1.5 0.2";
   //diffuseColor[3] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   glow[2] = "1";
   emissive[2] = "1";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_glass_dmg)
{
   mapTo = "fullsize_glass_dmg";
   diffuseMap[0] = "vehicles/fullsize/fullsize_glass_dmg_d.dds";
   specularMap[0] = "vehicles/fullsize/fullsize_glass_s.dds";
   diffuseMap[1] = "vehicles/fullsize/fullsize_glass_dmg_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_glass_s.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_glass_dirt.dds";
   specularPower[0] = "32";
   pixelSpecular[0] = "1";
   specularPower[1] = "32";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "0";
   translucent = "1";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_lights)
{
   mapTo = "fullsize_lights";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(fullsize_lights_dmg)
{
   mapTo = "fullsize_lights_dmg";
   diffuseMap[1] = "vehicles/fullsize/fullsize_lights_d.dds";
   specularMap[1] = "vehicles/fullsize/fullsize_lights_s.dds";
   normalMap[1] = "vehicles/fullsize/fullsize_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/fullsize/fullsize_lights_n.dds";
   //diffuseMap[2] = "vehicles/fullsize/fullsize_lights_dirt.dds";
   //normalMap[2] = "vehicles/fullsize/fullsize_lights_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(steelwheel_01a)
{
   mapTo = "steelwheel_01a";
   diffuseMap[1] = "vehicles/common/steelwheel_01a_d.dds";
   specularMap[1] = "vehicles/common/steelwheel_01a_s.dds";
   normalMap[1] = "vehicles/common/steelwheel_01a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/steelwheel_01a_n.dds";
   //diffuseMap[2] = "vehicles/common/steelwheel_01a_dirt.dds";
   //normalMap[2] = "vehicles/common/steelwheel_01a_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(tire_01a)
{
   mapTo = "tire";
   diffuseMap[1] = "vehicles/common/tire_01a_d.dds";
   specularMap[1] = "vehicles/common/tire_01a_s.dds";
   normalMap[1] = "vehicles/common/tire_01a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/tire_01a_n.dds";
   //diffuseMap[2] = "vehicles/common/tire_01a_dirt.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(wheel_02a)
{
   mapTo = "wheel_02a";
   diffuseMap[1] = "vehicles/common/wheel_02a_d.dds";
   specularMap[1] = "vehicles/common/wheel_02a_s.dds";
   normalMap[1] = "vehicles/common/wheel_02a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/wheel_02a_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
};

singleton Material(wheel_03a)
{
   mapTo = "wheel_03a";
   diffuseMap[1] = "vehicles/common/wheel_03a_d.dds";
   specularMap[1] = "vehicles/common/wheel_03a_s.dds";
   normalMap[1] = "vehicles/common/wheel_03a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/wheel_03a_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   cubemap = "BNG_Sky_02_cubemap";
};

singleton Material(steer_01a)
{
   mapTo = "steer_01a";
   diffuseMap[0] = "vehicles/common/steer_01a_d.dds";
   normalMap[0] = "vehicles/common/steer_01a_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularMap[0] = "vehicles/common/steer_01a_s.dds";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "1.5 1.5 1.5 1";
};
