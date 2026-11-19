class LightmassLevelSettings extends Object
    hidecategories(Object);

var(*) /*0x25EE0000-0x00000000*/ private int NumIndirectLightingBounces[65537];
var(*) /*0x25EE0000-0x00000000*/ private @NULL EnvironmentColor[65537];
var(*) /*0x25EE0000-0x00000000*/ private float EnvironmentIntensity[65537];
var(*) /*0x25EE0000-0x00000000*/ private float EmissiveBoost[65537];
var(*) /*0x25EE0000-0x00000000*/ private float DiffuseBoost[65537];
var(*) /*0x35EA0000-0x00000000*/ private float SpecularBoost;
var(*) /*0x37140000-0x00000000*/ private bool bUseAmbientOcclusion[65537];
var(*) /*0x37140000-0x00000000*/ private bool bVisualizeAmbientOcclusion[65537];
var(*) /*0x37140000-0x00000000*/ private float DirectIlluminationOcclusionFraction[65537];
var(*) /*0x37140000-0x00000000*/ private float IndirectIlluminationOcclusionFraction[65537];
var(*) /*0x37140000-0x00000000*/ private float OcclusionExponent[65537];
var(*) /*0x37140000-0x00000000*/ private float FullyOccludedSamplesFraction[65537];
var(*) /*0x37140000-0x00000000*/ private float MaxOcclusionDistance[65537];

defaultproperties
{
    NumIndirectLightingBounces=3
    EnvironmentIntensity=1.0000000
    EmissiveBoost=1.0000000
    DiffuseBoost=5.0000000
    SpecularBoost=1.0000000
    DirectIlluminationOcclusionFraction=0.5000000
    IndirectIlluminationOcclusionFraction=1.0000000
    OcclusionExponent=1.0000000
    FullyOccludedSamplesFraction=1.0000000
    MaxOcclusionDistance=200.0000000
}