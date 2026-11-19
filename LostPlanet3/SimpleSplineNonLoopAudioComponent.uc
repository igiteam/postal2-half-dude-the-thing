class SimpleSplineNonLoopAudioComponent extends SimpleSplineAudioComponent
    editinlinenew
    collapsecategories
    hidecategories(Object,ActorComponent,Object,ActorComponent,Object,ActorComponent,Object,ActorComponent,Object,ActorComponent);

var(*) /*0x3F9E0000-0x00000000*/ private float DelayMin[65537];
var(*) /*0x3F9E0000-0x00000000*/ private float DelayMax[65537];
var(*) /*0x3F9E0000-0x00000000*/ private float PitchMin[65537];
var(*) /*0x3F9E0000-0x00000000*/ private float PitchMax[65537];
var(*) /*0x3F9E0000-0x00000000*/ private float VolumeMin[65537];
var(*) /*0x3F9E0000-0x00000000*/ private float VolumeMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentSlotIndex;
var(*) /*0x35EA0000-0x00000000*/ private float UsedVolumeModulation;
var(*) /*0x35EA0000-0x00000000*/ private float UsedPitchModulation;
var(*) /*0x35EA0000-0x00000000*/ private float NextSoundTime;
