class SoundNodeAttenuationAndGain extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x03BD0000-0x00000000*/ private bool bAttenuate[65537];
var(*) /*0x03BD0000-0x00000000*/ private bool bSpatialize[65537];
var(*) /*0x30090000-0x00000000*/ private bool bAttenuateWithLPF[65537];
var(*) /*0x03BD0000-0x00000000*/ private float dBAttenuationAtMax[65537];
var(*) /*0x03BD0000-0x00000000*/ private float OmniRadius[65537];
var(*) /*0x03BD0000-0x00000000*/ private byte GainDistanceAlgorithm[65537];
var(*) /*0x03BD0000-0x00000000*/ private byte AttenuateDistanceAlgorithm[65537];
var(*) /*0x03BD0000-0x00000000*/ private byte DistanceType[65537];
var(*) /*0x03BD0000-0x00000000*/ private float MinimalVolume[65537];
var(*) /*0x03BD0000-0x00000000*/ private float RadiusMin[65537];
var(*) /*0x03BD0000-0x00000000*/ private float RadiusPeak[65537];
var(*) /*0x03BD0000-0x00000000*/ private float RadiusMax[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFMinimal[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMin[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusPeak[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMax[65537];

defaultproperties
{
    bAttenuate=true
    bSpatialize=true
    dBAttenuationAtMax=-60.0000000
    MinimalVolume=0.7500000
    RadiusMin=400.0000000
    RadiusPeak=2000.0000000
    RadiusMax=4000.0000000
    LPFMinimal=0.7500000
    LPFRadiusMin=400.0000000
    LPFRadiusPeak=2000.0000000
    LPFRadiusMax=4000.0000000
}