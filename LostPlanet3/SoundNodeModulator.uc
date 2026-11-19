class SoundNodeModulator extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x33620000-0x00000000*/ private float PitchMin[65537];
var(*) /*0x33620000-0x00000000*/ private float PitchMax[65537];
var(*) /*0x33620000-0x00000000*/ private float VolumeMin[65537];
var(*) /*0x33620000-0x00000000*/ private float VolumeMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL PitchModulation;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL VolumeModulation;

defaultproperties
{
    PitchMin=0.9500000
    PitchMax=1.0500000
    VolumeMin=0.9500000
    VolumeMax=1.0500000
}