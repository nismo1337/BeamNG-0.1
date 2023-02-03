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