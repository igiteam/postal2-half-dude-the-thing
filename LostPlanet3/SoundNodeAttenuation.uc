class SoundNodeAttenuation extends SoundNode
    editinlinenew
    dontsortcategories(Attenuation,LowPassFilter)
    hidecategories(Object,Object);

enum SoundDistanceModel
{
    ATTENUATION_Linear,             // 0
    ATTENUATION_Logarithmic,        // 1
    ATTENUATION_Inverse,            // 2
    ATTENUATION_LogReverse,         // 3
    ATTENUATION_NaturalSound,       // 4
    ATTENUATION_MAX                 // 5
};

enum ESoundDistanceCalc
{
    SOUNDDISTANCE_Normal,           // 0
    SOUNDDISTANCE_InfiniteXYPlane,  // 1
    SOUNDDISTANCE_InfiniteXZPlane,  // 2
    SOUNDDISTANCE_InfiniteYZPlane,  // 3
    SOUNDDISTANCE_MAX               // 4
};

var(*) /*0x03B60000-0x00000000*/ private bool bAttenuate[65537];
var(*) /*0x03B60000-0x00000000*/ private bool bSpatialize[65537];
var(*) /*0x30090000-0x00000000*/ private bool bAttenuateWithLPF[65537];
var(*) /*0x03B60000-0x00000000*/ private float dBAttenuationAtMax[65537];
var(*) /*0x03B60000-0x00000000*/ private float OmniRadius[65537];
var(*) /*0x03B60000-0x00000000*/ private byte DistanceAlgorithm[65537];
var(*) /*0x03B60000-0x00000000*/ private byte DistanceType[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMin[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMax[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMin[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMax[65537];

defaultproperties
{
    bAttenuate=true
    bSpatialize=true
    dBAttenuationAtMax=-60.0000000
    RadiusMin=400.0000000
    RadiusMax=4000.0000000
    LPFRadiusMin=3000.0000000
    LPFRadiusMax=6000.0000000
}