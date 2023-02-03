//*****************************************************************************
// Torque -- HLSL procedural shader
//*****************************************************************************

// Features:
// Vert Position
// Base Texture
// Detail
// Bumpmap [Deferred]
// NormalsOut
// Forward Shaded Material

struct ConnectData
{
   float2 texCoord        : TEXCOORD0;
   float2 detCoord        : TEXCOORD1;
   float3x3 worldToTangent  : TEXCOORD2;
};


struct Fragout
{
   float4 col : COLOR0;
};


//-----------------------------------------------------------------------------
// Main
//-----------------------------------------------------------------------------
Fragout main( ConnectData IN,
              uniform sampler2D diffuseMap      : register(S0),
              uniform sampler2D detailMap       : register(S1),
              uniform sampler2D bumpMap         : register(S2)
)
{
   Fragout OUT;

   // Vert Position
   
   // Base Texture
   OUT.col = tex2D(diffuseMap, IN.texCoord);
   
   // Detail
   OUT.col += ( tex2D(detailMap, IN.detCoord) * 2.0 ) - 1.0;
   
   // Bumpmap [Deferred]
   float4 bumpNormal = tex2D(bumpMap, IN.texCoord);
   bumpNormal.xyz = bumpNormal.xyz * 2.0 - 1.0;
   float3 wsNormal = normalize( mul( bumpNormal.xyz, IN.worldToTangent ) );
   
   // NormalsOut
   OUT.col = float4( ( -wsNormal + 1 ) * 0.5, OUT.col.a );
   
   // Forward Shaded Material
   

   return OUT;
}
