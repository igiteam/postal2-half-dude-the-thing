class SoundNodeAmbient extends SoundNode
    editinlinenew
    dontsortcategories(Attenuation,LowPassFilter,Modulation,Sounds,Spatialization)
    hidecategories(Object,Object)
    autoexpandcategories(Attenuation,LowPassFilter,Modulation,Sounds,Spatialization);

struct native AmbientSoundSlot
{
    var(*) /*0x02530000-0x00000000*/ private @NULL Wave[65537];
    var(*) /*0x02530000-0x00000000*/ private float PitchScale[65537];
    var(*) /*0x02530000-0x00000000*/ private float VolumeScale[65537];
    var(*) /*0x02530000-0x00000000*/ private float Weight[65537];

    structdefaultproperties
    {
        Wave=none
        PitchScale=1.0000000
        VolumeScale=1.0000000
        Weight=1.0000000
    }
};

var(*) /*0x03B60000-0x00000000*/ private bool bAttenuate[65537];
var(*) /*0x03B60000-0x00000000*/ private bool bSpatialize[65537];
var(*) /*0x30090000-0x00000000*/ private bool bAttenuateWithLPF[65537];
var(*) /*0x03B60000-0x00000000*/ private float dBAttenuationAtMax[65537];
var(*) /*0x03B60000-0x00000000*/ private byte DistanceModel[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMin[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMax[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMin[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMax[65537];
var(*) /*0x33620000-0x00000000*/ private float PitchMin[65537];
var(*) /*0x33620000-0x00000000*/ private float PitchMax[65537];
var(*) /*0x33620000-0x00000000*/ private float VolumeMin[65537];
var(*) /*0x33620000-0x00000000*/ private float VolumeMax[65537];
var(*) /*0x487A0000-0x00000000*/ private editfixedsize array SoundSlots[65537];

defaultproperties
{
    bAttenuate=true
    bSpatialize=true
    dBAttenuationAtMax=-60.0000000
    RadiusMin=2000.0000000
    RadiusMax=5000.0000000
    LPFRadiusMin=3500.0000000
    LPFRadiusMax=7000.0000000
    PitchMin=1.0000000
    PitchMax=1.0000000
    VolumeMin=0.7000000
    VolumeMax=0.7000000
}