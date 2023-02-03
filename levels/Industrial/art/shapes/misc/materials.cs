singleton Material(terrain_grass2)
{
   mapTo = "terrain_grass2";
   diffuseColor[0] = "0.87451 0.854902 0.639216 1";
   diffuseMap[0] = "levels/Industrial/art/terrains/Grass-02-D.dds";
   normalMap[0] = "levels/Industrial/art/terrains/Grass-02-N.dds";
   doubleSided = "1";
   translucentBlendOp = "None";
   materialTag1 = "Natural";
   materialTag0 = "beamng";
};

singleton Material(speedbump_01a)
{
   mapTo = "speedbump_01a";
   diffuseMap[0] = "speedbump_01a_d.dds";
   normalMap[0] = "speedbump_01a_n.dds";
   specularMap[0] = "speedbump_01a_s.dds";
   specularPower[0] = "3";
   pixelSpecular[0] = "1";
   useAnisotropic[0] = "1";
   materialTag0 = "beamng";
   materialTag1 = "Industrial";
};

singleton Material(container_01_b_Material)
{
   mapTo = "Material";
   diffuseColor[0] = "0.64 0.64 0.64 1";
   doubleSided = "1";
   translucentBlendOp = "None";
};

singleton Material(concrete_bridge_01a)
{
   mapTo = "concrete_bridge_01a";
   diffuseMap[0] = "concrete_bridge_01a_d.dds";
   normalMap[0] = "concrete_bridge_01a_n.dds";
   specularMap[0] = "concrete_bridge_01a_s.dds";
   specularPower[0] = "4";
   pixelSpecular[0] = "1";
   useAnisotropic[0] = "1";
   materialTag0 = "beamng";
   materialTag1 = "Industrial";
   specular[0] = "0.4 0.4 0.4 1";
   diffuseColor[0] = "0.8 0.8 0.8 1";
};

singleton Material(AsphaltRoad_laned_mesh)
{
   mapTo = "AsphaltRoad_laned_mesh";
   diffuseMap[0] = "levels/Industrial/art/road/AsphaltRoad_laned_d.dds";
   normalMap[0] = "levels/Industrial/art/road/AsphaltRoad_laned_n.dds";
   specular[0] = "0.996078 0.996078 0.996078 1";
   specularPower[0] = "1";
   pixelSpecular[0] = "0";
   specularMap[0] = "levels/Industrial/art/road/AsphaltRoad_laned_s.dds";
   useAnisotropic[0] = "1";
   materialTag1 = "RoadAndPath";
   materialTag2 = "RoadAndPath";
   materialTag0 = "beamng";
};


singleton Material(container_01_a_containers_01_a)
{
   mapTo = "containers_01_a";
   diffuseColor[0] = "0.996078 0.992157 0.992157 1";
   doubleSided = "0";
   translucentBlendOp = "None";
   diffuseMap[0] = "containers_01_a_d.dds";
   normalMap[0] = "containers_01_a_n.dds";
   specularMap[0] = "containers_01_a_s.dds";
};

singleton Material(parkinglot_01_a_terrain_rockydirt)
{
   mapTo = "terrain_rockydirt";
   diffuseColor[0] = "0.835294 0.807843 0.8 1";
   doubleSided = "1";
   translucentBlendOp = "None";
   diffuseMap[0] = "levels/Industrial/art/terrains/RockyDirt-01-D.dds";
   normalMap[0] = "levels/Industrial/art/terrains/RockyDirt-01-N.dds";
   specularMap[0] = "levels/Industrial/art/terrains/RockyDirt-01-S.dds";
};

singleton Material(a_asphalt_01_a)
{
   mapTo = "asphalt_01_a";
   diffuseColor[0] = "0.803922 0.803922 0.803922 1";
   diffuseMap[0] = "asphalt_01_a_d.dds";
   specularPower[0] = "1";
   specularMap[0] = "asphalt_01_a_s.dds";
   doubleSided = "1";
   translucentBlendOp = "None";
   materialTag1 = "RoadAndPath";
   materialTag0 = "beamng";
};

singleton Material(misc_markings_01)
{
   mapTo = "misc_markings_01";
   diffuseColor[0] = "0.996078 0.996078 0.996078 1";
   diffuseMap[0] = "misc_markings.dds";
   specular[0] = "0.5 0.5 0.5 1";
   specularPower[0] = "1";
   pixelSpecular[0] = "1";
   doubleSided = "1";
   castShadows = "0";
   translucentZWrite = "1";
   alphaTest = "1";
   alphaRef = "40";
   materialTag1 = "Industrial";
   materialTag0 = "beamng";
};

singleton Material(misc_billboard_title)
{
   mapTo = "misc_billboard_title";
   diffuseMap[0] = "levels/Industrial/art/shapes/misc/billboards_01b";
   specular[0] = "0.5 0.5 0.5 1";
   specularPower[0] = "1";
   doubleSided = "1";
   translucentBlendOp = "None";
   pixelSpecular[0] = "1";
   materialTag0 = "Industrial";
   materialTag1 = "beamng";
};
