singleton Material(oak_leaves_lod)
{
   mapTo = "oak_leaves_lod";
   diffuseMap[0] = "vegetation_oak_01_d.dds";
   normalMap[0] = "vegetation_oak_01_n.dds";
   specularMap[0] = "vegetation_oak_01_s.dds";
   doubleSided = "1";
   alphaTest = "1";
   alphaRef = "109";
   materialTag0 = "vegetation";
   materialTag1 = "beamng";
   pixelSpecular[0] = "0";
   specularPower[0] = "1";
   minnaertConstant[0] = "0";
    subSurfaceRolloff[0] = "1";
   materialTag3 = "vegetation";
   materialTag2 = "Natural";
};

singleton Material(oak_trunk)
{
   mapTo = "oak_trunk";
   diffuseMap[0] = "vegetation_bark_d.dds";
   normalMap[0] = "vegetation_bark_n.dds";
   doubleSided = "1";
   translucentBlendOp = "None";
   materialTag1 = "beamng";
   materialTag0 = "beamng";
   materialTag2 = "Natural";
   materialTag3 = "vegetation";
};




singleton Material(oak_leaves)
{
   mapTo = "oak_leaves";
   diffuseMap[0] = "vegetation_oak_01_d.dds";
   normalMap[0] = "vegetation_oak_01_n.dds";
   specular[0] = "0.992157 0.992157 0.992157 1";
   specularPower[0] = "1";
   pixelSpecular[0] = "0";
   specularMap[0] = "vegetation_oak_01_s.dds";
   useAnisotropic[0] = "1";
   minnaertConstant[0] = "0";
   subSurfaceColor[0] = "0.466667 1 0 1";
   subSurfaceRolloff[0] = "1";
   doubleSided = "1";
   alphaTest = "1";
   alphaRef = "60";
   materialTag1 = "beamng";
   materialTag3 = "vegetation";
   materialTag2 = "Natural";
   materialTag0 = "vegetation";
};
