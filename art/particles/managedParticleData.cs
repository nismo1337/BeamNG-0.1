//-----------------------------------------------------------------------------
// Copyright (c) 2012 GarageGames, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//-----------------------------------------------------------------------------

// This is the default save location for any Particle datablocks created in the
// Particle Editor (this script is executed from onServerCreated())

exec("./defaultParticle.cs");

datablock ParticleData(BNG_Leaf1 : DefaultParticle)
{
   textureName = "particle_oak_leaf_01.dds";
   animTexName = "particle_oak_leaf_01.dds";
   spinRandomMin = "-208";
   spinRandomMax = "417";
   colors[0] = "0.992126 0.992126 0.992126 1";
   colors[1] = "0.992126 0.992126 0.992126 1";
   colors[2] = "0.992126 0.992126 0.992126 1";
   colors[3] = "0.992126 0.992126 0.992126 1";
   sizes[0] = "0.497467";
   sizes[1] = "0.497467";
   sizes[2] = "0";
   sizes[3] = "0";
   gravityCoefficient = "2";
   lifetimeMS = "5438";
   lifetimeVarianceMS = "0";
   inheritedVelFactor = "1";
   constantAcceleration = "10";
   useInvAlpha = "0";
   times[1] = "0";
   dragCoefficient = 4.98534;
   times[0] = "0.0625";
   times[2] = "0";
   times[3] = "0";
};

datablock ParticleData(BNG_Leaf2 : DefaultParticle)
{
   textureName = "particle_oak_leaf_02.dds";
   animTexName = "particle_oak_leaf_02.dds";
   lifetimeMS = "15000";
   colors[0] = "0.996078 0.992157 0.992157 1";
   colors[1] = "0.996078 0.996078 0.992157 1";
   colors[2] = "0.996078 0.992157 0.992157 1";
   colors[3] = "0.996078 0.996078 0.992157 1";
   lifetimeVarianceMS = "0";
   constantAcceleration = "10";
   dragCoefficient = 5;
   inheritedVelFactor = "1";
   times[1] = "0.739167";
   times[2] = "0.75";
   sizes[0] = "0.5";
   sizes[1] = "0.5";
   sizes[2] = "0";
   sizes[3] = "0";
   useInvAlpha = "0";
};

datablock ParticleData(BNG_sparks : DefaultParticle)
{
   textureName = "Sparkparticle.png";
   animTexName = "Sparkparticle.png";
   colors[0] = "1 0.92 0.5 1";
   colors[1] = "1 0.92 0.5 1";
   colors[2] = "1 0.9 0.5 1";
   colors[3] = "1 0.8 0.4 1";
   dragCoefficient = 0.5;
   gravityCoefficient = "1";
   inheritedVelFactor = "0.9";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "2000";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.01";
   sizes[2] = "0.08";
   sizes[3] = "0.07";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.5";
};

datablock ParticleData(BNG_dust_light : DefaultParticle)
{
   textureName = "particle_smoke_soft_01.dds";
   animTexName = "particle_smoke_soft_01.dds";
   colors[0] = "1 0.97 0.94 0.5";
   colors[1] = "1 0.97 0.94 0.3";
   colors[2] = "1 0.97 0.94 0.15";
   colors[3] = "1 0.97 0.94 0";
   dragCoefficient = 5;
   gravityCoefficient = "0.0";
   inheritedVelFactor = "1";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3000";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.5";
   sizes[2] = "1.0";
   sizes[3] = "2.1";
   times[1] = "0.2";
   times[2] = "0.4";
   times[3] = "0.7";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_dust_dark : DefaultParticle)
{
   textureName = "particle_dust_soft_01.dds";
   animTexName = "particle_dust_soft_01.dds";
   colors[0] = "0.25 0.23 0.2 0.7";
   colors[1] = "0.25 0.23 0.2 0.3";
   colors[2] = "0.25 0.23 0.2 0.1";
   colors[3] = "0.25 0.23 0.2 0";
   dragCoefficient = 3.5;
   gravityCoefficient = "0.15";
   inheritedVelFactor = "0.7";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3000";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.7";
   sizes[2] = "1.1";
   sizes[3] = "2.0";
   times[1] = "0.1";
   times[2] = "0.3";
   times[3] = "0.7";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_dust_dirt : DefaultParticle)
{
   textureName = "particle_dust_soft_01.dds";
   animTexName = "particle_dust_soft_01.dds";
   colors[0] = "0.95 0.93 0.91 1";
   colors[1] = "1 0.95 0.92 0.9";
   colors[2] = "1 0.95 0.92 0.5";
   colors[3] = "1 0.99 0.97 0";
   dragCoefficient = 4;
   gravityCoefficient = "-0.04";
   inheritedVelFactor = "0.7";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3500";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.8";
   sizes[2] = "1.5";
   sizes[3] = "3.6";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_dirt : DefaultParticle)
{
   textureName = "Particle_dust_gravel_01.dds";
   animTexName = "Particle_dust_gravel_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 1";
   colors[2] = "1 1 1 1";
   colors[3] = "1 1 1 1";
   dragCoefficient = 0.5;
   gravityCoefficient = "0.6";
   inheritedVelFactor = "0.9";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3000";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.8";
   sizes[2] = "0.8";
   sizes[3] = "0.8";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_smoke_white : DefaultParticle)
{
   textureName = "particle_smoke_soft_01.dds";
   animTexName = "particle_smoke_soft_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 0.7";
   colors[2] = "1 1 1 0.2";
   colors[3] = "1 1 1 0";
   dragCoefficient = 4;
   gravityCoefficient = "-0.06";
   inheritedVelFactor = "0.7";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3500";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.8";
   sizes[2] = "1.9";
   sizes[3] = "4.5";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_smoke_black : DefaultParticle)
{
   textureName = "particle_smoke_black_01.dds";
   animTexName = "particle_smoke_black_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 0.9";
   colors[2] = "1 1 1 0.5";
   colors[3] = "1 1 1 0";
   dragCoefficient = 4;
   gravityCoefficient = "-0.06";
   inheritedVelFactor = "0.7";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3500";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.6";
   sizes[2] = "1.1";
   sizes[3] = "2.4";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_dust_sand : DefaultParticle)
{
   textureName = "particle_dust_soft_01.dds";
   animTexName = "particle_dust_soft_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 0.9";
   colors[2] = "1 1 1 0.7";
   colors[3] = "1 1 1 0";
   dragCoefficient = 3;
   gravityCoefficient = "0.04";
   inheritedVelFactor = "0.8";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   lifetimeMS = "3500";
   lifetimeVarianceMS = "375";
   sizes[0] = "0.5";
   sizes[2] = "1.1";
   sizes[3] = "2.4";
   times[1] = "0.0416667";
   times[2] = "0.125";
   times[3] = "0.791667";
   spinSpeed = "0.14";
};

datablock ParticleData(BNG_dust_small : DefaultParticle)
{
   textureName = "particle_dust_soft_01.dds";
   animTexName = "particle_dust_soft_01.dds";
   colors[0] = "0.992126 0.929134 0.889764 0";
   colors[1] = "0.992126 0.92126 0.866142 1";
   colors[2] = "0.992126 0.897638 0.834646 0.645669";
   colors[3] = "0.992126 0.897638 0.834646 0.00787402";
   times[1] = "0.0470588";
   times[2] = "0.0980392";
   dragCoefficient = 2.98143;
   gravityCoefficient = "0";
   inheritedVelFactor = "0.455969";
   lifetimeMS = "2200";
   lifetimeVarianceMS = "500";
   spinSpeed = "0.146";
   spinRandomMin = "-416";
   spinRandomMax = "541";
   sizes[2] = "0.93";
   sizes[3] = "2.0";
};

datablock ParticleData(BNG_gravel : DefaultParticle)
{
   dragCoefficient = 0.5;
   gravityCoefficient = "0.6";
   inheritedVelFactor = "0.9";
   lifetimeMS = "1501";
   spinSpeed = "0.042";
   textureName = "particle_dust_gravel_01.dds";
   animTexName = "particle_dust_gravel_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 1";
   colors[2] = "1 1 1 1";
   colors[3] = "1 1 1 0";
   sizes[0] = "0.8";
   sizes[1] = "0.8";
   sizes[2] = "0.8";
   sizes[3] = "0.8";
   times[1] = "0.101961";
   times[2] = "0.435294";
   times[3] = "0.956863";
   lifetimeVarianceMS = "0";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   times[0] = "0";
};

datablock ParticleData(BNG_chunk_small : DefaultParticle)
{
   dragCoefficient = 0.5;
   gravityCoefficient = "0.8";
   inheritedVelFactor = "0.3";
   lifetimeMS = "1501";
   spinSpeed = "2";
   textureName = "particle_chunk_01.dds";
   animTexName = "particle_chunk_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 1";
   colors[2] = "1 1 1 1";
   colors[3] = "1 1 1 1";
   sizes[0] = "0.03";
   sizes[1] = "0.03";
   sizes[2] = "0.03";
   sizes[3] = "0.03";
   times[1] = "0.101961";
   times[2] = "0.435294";
   times[3] = "0.956863";
   lifetimeVarianceMS = "200";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   times[0] = "0";
};

datablock ParticleData(BNG_chunk_med : DefaultParticle)
{
   dragCoefficient = 0.5;
   gravityCoefficient = "0.8";
   inheritedVelFactor = "0.3";
   lifetimeMS = "1501";
   spinSpeed = "2";
   textureName = "particle_chunk_01.dds";
   animTexName = "particle_chunk_01.dds";
   colors[0] = "1 1 1 1";
   colors[1] = "1 1 1 1";
   colors[2] = "1 1 1 1";
   colors[3] = "1 1 1 1";
   sizes[0] = "0.07";
   sizes[1] = "0.07";
   sizes[2] = "0.07";
   sizes[3] = "0.07";
   times[1] = "0.101961";
   times[2] = "0.435294";
   times[3] = "0.956863";
   lifetimeVarianceMS = "200";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   times[0] = "0";
};


datablock ParticleData(BNG_sand : DefaultParticle)
{
   dragCoefficient = 0.5;
   gravityCoefficient = "0.6";
   inheritedVelFactor = "0.9";
   lifetimeMS = "1501";
   spinSpeed = "0.042";
   textureName = "particle_dust_gravel_01.dds";
   animTexName = "particle_dust_gravel_01.dds";
   colors[0] = "1 1 1 0.3";
   colors[1] = "1 1 1 0.3";
   colors[2] = "1 1 1 0.3";
   colors[3] = "1 1 1 0";
   sizes[0] = "0.8";
   sizes[1] = "0.8";
   sizes[2] = "0.8";
   sizes[3] = "0.8";
   times[1] = "0.101961";
   times[2] = "0.435294";
   times[3] = "0.956863";
   lifetimeVarianceMS = "0";
   spinRandomMin = "-360";
   spinRandomMax = "360";
   times[0] = "0";
};