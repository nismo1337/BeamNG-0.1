
singleton Material(hatch)
{
   mapTo = "hatch";
   diffuseMap[2] = "vehicles/hatch/hatch_c.dds";
   specularMap[2] = "vehicles/hatch/hatch_s.dds";
   normalMap[2] = "vehicles/hatch/hatch_n.dds";
   diffuseMap[1] = "vehicles/hatch/hatch_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_n.dds";
   //diffuseMap[3] = "vehicles/hatch/hatch_dirt.dds";
   //normalMap[3] = "vehicles/hatch/hatch_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularPower[1] = "16";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1 1 1 1";
   diffuseColor[1] = "1 1 1 1";
   diffuseColor[2] = "0.05 0.1 0.4 1";
   //diffuseColor[3] = "1.5 1.5 1.5 1";
   castShadows = "1";
   translucent = "1";
   translucentBlendOp = "None";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(hatch_interior)
{
   mapTo = "hatch_interior";
   diffuseMap[0] = "hatch_interior_d.dds";
   normalMap[0] = "hatch_interior_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   specularMap[0] = "hatch_interior_s.dds";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "0.8 0.8 0.8 1";
};

singleton Material(hatch_gauges)
{
   mapTo = "hatch_gauges";
   diffuseMap[1] = "hatch_gauges_g.dds";
   specularMap[1] = "hatch_gauges_s.dds";
   normalMap[1] = "hatch_gauges_n.dds";
   diffuseMap[0] = "hatch_gauges_d.dds";
   specularMap[0] = "hatch_gauges_s.dds";
   normalMap[0] = "hatch_gauges_n.dds";
   specularPower[0] = "16";
   pixelSpecular[0] = "1";
   glow[1] = "1";
   emissive[1] = "1";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
   diffuseColor[0] = "0.75 0.75 0.75 1";
   diffuseColor[1] = "1.5 1.5 1.5 0.2";
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

singleton Material(hatch_glass)
{
   mapTo = "hatch_glass";
   diffuseMap[0] = "vehicles/hatch/hatch_glass_d.dds";
   specularMap[0] = "vehicles/hatch/hatch_glass_s.dds";
   diffuseMap[1] = "vehicles/hatch/hatch_glass_da.dds";
   specularMap[1] = "vehicles/hatch/hatch_glass_s.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_glass_dirt.dds";
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

singleton Material(hatch_signal_L)
{
   mapTo = "hatch_signal_L";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_signal_R)
{
   mapTo = "hatch_signal_R";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_taillight)
{
   mapTo = "hatch_taillight";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_chmsl)
{
   mapTo = "hatch_chmsl";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_headlight)
{
   mapTo = "hatch_headlight";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_reverselight)
{
   mapTo = "hatch_reverselight";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_parkinglight)
{
   mapTo = "hatch_parkinglight";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_lights_on)
{
   mapTo = "hatch_lights_on";
   diffuseMap[2] = "vehicles/hatch/hatch_lights_g.dds";
   specularMap[2] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[3] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[3] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_glass_dmg)
{
   mapTo = "hatch_glass_dmg";
   diffuseMap[0] = "vehicles/hatch/hatch_glass_dmg_d.dds";
   specularMap[0] = "vehicles/hatch/hatch_glass_s.dds";
   diffuseMap[1] = "vehicles/hatch/hatch_glass_dmg_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_glass_s.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_glass_dirt.dds";
   specularPower[0] = "32";
   pixelSpecular[0] = "1";
   specularPower[1] = "32";
   pixelSpecular[1] = "1";
   diffuseColor[0] = "1.5 1.5 1.5 1";
   diffuseColor[1] = "1.5 1.5 1.5 1";
   //diffuseColor[2] = "1.5 1.5 1.5 1";
   castShadows = "0";
   translucent = "1";
   alphaTest = "1";
   alphaRef = "0";
   cubemap = "BNG_Sky_02_cubemap";
   materialTag0 = "beamng"; materialTag1 = "vehicle";
};

singleton Material(hatch_lights)
{
   mapTo = "hatch_lights";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_n.dds";
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

singleton Material(hatch_lights_dmg)
{
   mapTo = "hatch_lights_dmg";
   diffuseMap[1] = "vehicles/hatch/hatch_lights_dmg_d.dds";
   specularMap[1] = "vehicles/hatch/hatch_lights_dmg_s.dds";
   normalMap[1] = "vehicles/hatch/hatch_lights_dmg_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/hatch/hatch_lights_dmg_n.dds";
   //diffuseMap[2] = "vehicles/hatch/hatch_lights_dirt.dds";
   //normalMap[2] = "vehicles/hatch/hatch_lights_dmg_n.dds";
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

singleton Material(wheel_01a)
{
   mapTo = "wheel_01a";
   diffuseMap[1] = "vehicles/common/wheel_01a_d.dds";
   specularMap[1] = "vehicles/common/wheel_01a_s.dds";
   normalMap[1] = "vehicles/common/wheel_01a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/wheel_01a_n.dds";
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

singleton Material(ibishu_hubcap_02a)
{
   mapTo = "ibishu_hubcap_02a";
   diffuseMap[1] = "vehicles/common/ibishu_hubcap_02a_d.dds";
   specularMap[1] = "vehicles/common/ibishu_hubcap_02a_s.dds";
   normalMap[1] = "vehicles/common/ibishu_hubcap_02a_n.dds";
   diffuseMap[0] = "vehicles/common/null.dds";
   specularMap[0] = "vehicles/common/null.dds";
   normalMap[0] = "vehicles/common/ibishu_hubcap_02a_n.dds";
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