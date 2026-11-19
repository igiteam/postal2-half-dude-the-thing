class SimpleSplineAudioComponent extends SplineAudioComponent
    editinlinenew
    collapsecategories
    hidecategories(Object,ActorComponent,Object,ActorComponent,Object,ActorComponent,Object,ActorComponent);

struct native SplineSoundSlot
{
    var(*) /*0x493D0000-0x00000000*/ private @NULL Wave[65537];
    var(*) /*0x493D0000-0x00000000*/ private float PitchScale[65537];
    var(*) /*0x493D0000-0x00000000*/ private float VolumeScale[65537];
    var(*) /*0x493D0000-0x00000000*/ private int StartPoint[65537];
    var(*) /*0x493D0000-0x00000000*/ private int EndPoint[65537];
    var(*) /*0x493D0000-0x00000000*/ private float Weight[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LastUpdateTime[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorVolume[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorLPF[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorVolume[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorLPF[268566529];

    structdefaultproperties
    {
        Wave=none
        PitchScale=1.0000000
        VolumeScale=1.0000000
        StartPoint=-1
        EndPoint=-1
        Weight=1.0000000
    }
};

var(*) /*0x30090000-0x00000000*/ private bool bAttenuateWithLPF[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMin[65537];
var(*) /*0x30090000-0x00000000*/ private float LPFRadiusMax[65537];
var(*) /*0x03B60000-0x00000000*/ private float dBAttenuationAtMax[65537];
var(*) /*0x03B60000-0x00000000*/ private float FlattenAttenuationRadius[65537];
var(*) /*0x03B60000-0x00000000*/ private byte DistanceAlgorithm[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMin[65537];
var(*) /*0x03B60000-0x00000000*/ private float RadiusMax[65537];
var(*) /*0x487A0000-0x00000010*/ private editfixedsize array SoundSlots[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NotifyBufferFinishedHook;
