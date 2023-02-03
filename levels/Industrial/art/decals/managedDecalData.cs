// This is the default save location for any Decal datablocks created in the
// Decal Editor (this script is executed from onServerCreated())


datablock DecalData(NewDecalData)
{
   Material = "WarningMaterial";
};

datablock DecalData(Road_01_d)
{
   Material = "Road_01_decal";
   randomize = "1";
   texCols = "1";
   textureCoords[0] = "0 0 1 1";
   textureCoords[1] = "0 0.5 1 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   textureCoordCount = "0";
};

datablock DecalData(Asphalt_road_01)
{
   Material = "BNG_Asphalt_decal";
   texRows = "1";
   textureCoords[0] = "0 0 1 1";
   textureCoords[1] = "0.5 0.5 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   randomize = "1";
   textureCoordCount = "0";
   size = "5.5";
};

datablock DecalData(ind_stuff_01)
{
   Material = "ind_decal_stuff_01";
   textureCoordCount = "3";
   size = "1";
   randomize = "1";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   textureCoords[5] = "0 0 1 15";
   fadeStartPixelSize = "50";
   fadeEndPixelSize = "60";
};

datablock DecalData(Road_02_d)
{
   Material = "BNG_Road_02_decal";
   textureCoordCount = "0";
   size = "10";
};

datablock DecalData(Asphalt_road_02_Cracks)
{
   Material = "Asphalt_road_01_decal2";
   textureCoordCount = "0";
};

datablock DecalData(Road_01_damage01)
{
   Material = "road_01_damage_sml_decal_01";
   textureCoordCount = "3";
   size = "2.2";
   randomize = "1";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   frame = "1";
};

datablock DecalData(NewDecalData2)
{
   Material = "WarningMaterial";
   textureCoordCount = "0";
};

datablock DecalData(AsphaltRoad_damage_sml_decal_01d)
{
   Material = "AsphaltRoad_damage_sml_decal_01";
   textureCoordCount = "3";
   size = "2";
   randomize = "1";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
};

datablock DecalData(road_01_tracks_large_decal_01d)
{
   Material = "Road_01_tracks_large_decal_01";
   textureCoordCount = "3";
   randomize = "0";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   size = "15";
   frame = "0";
};

datablock DecalData(AsphaltRoad_damage_large_decal_01d)
{
   Material = "AsphaltRoad_damage_large_decal_01";
   textureCoordCount = "3";
   texRows = "2";
   texCols = "2";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   textureCoords[0] = "0 0 0.5 0.5";
   frame = "5";
   randomize = "1";
};

datablock DecalData(Road_03_coast_decal)
{
   Material = "Road_Dirt_Coastal_Decal";
   textureCoordCount = "0";
   renderPriority = "11";
};

datablock DecalData(AsphaltRoad_lanes_d)
{
   Material = "AsphaltRoad_lanes_decal";
   textureCoordCount = "0";
   size = "8.5";
};

datablock DecalData(AsphaltRoad_track_d)
{
   size = "12";
   Material = "AsphaltRoad_track_decal";
   textureCoordCount = "0";
};

datablock DecalData(AsphaltRoad_TireTracks_01d)
{
   Material = "AsphaltRoad_TireTracks_decal";
   textureCoordCount = "3";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   size = "20";
   frame = "2";
};

datablock DecalData(AsphaltRoad_damage_large_decal_02d)
{
   Material = "AsphaltRoad_damage_large_decal_02";
   textureCoordCount = "3";
   size = "5.5";
   randomize = "1";
   texRows = "2";
   texCols = "2";
   textureCoords[0] = "0 0 0.5 0.5";
   textureCoords[1] = "0.5 0 0.5 0.5";
   textureCoords[2] = "0 0.5 0.5 0.5";
   textureCoords[3] = "0.5 0.5 0.5 0.5";
   textureCoords[5] = "0 0 1 15";
};

datablock DecalData(ind_stuff_02)
{
   size = "10";
   Material = "ind_decal_stuff_02";
   textureCoordCount = "0";
   renderPriority = "5";
   fadeStartPixelSize = "50";
   fadeEndPixelSize = "60";
};

datablock DecalData(ind_stuff_02b)
{
   Material = "ind_decal_stuff_02b";
   textureCoordCount = "0";
   size = "11";
   textureCoords[1] = "0.5 0.5 0.5 0.5";
   textureCoords[2] = "0.666667 0.666667 0.333333 0.333333";
   textureCoords[3] = "0 0.5 0.333333 0.5";
   textureCoords[4] = "0.333333 0.5 0.333333 0.5";
   textureCoords[5] = "0.666667 0.5 0.333333 0.5";
   textureCoords[6] = "0 0.666667 0.333333 0.333333";
   textureCoords[7] = "0.333333 0.666667 0.333333 0.333333";
   textureCoords[8] = "0.666667 0.666667 0.333333 0.333333";
   textureCoords[13] = "0.333333 0.8 0.333333 0.2";
   textureCoords[14] = "0.666667 0.8 0.333333 0.2";
   fadeStartPixelSize = "50";
   fadeEndPixelSize = "60";
};

datablock DecalData(nat_decals_rocks_01_decal)
{
   size = "10";
   Material = "nat_decals_rocks_01";
   textureCoordCount = "0";
};
