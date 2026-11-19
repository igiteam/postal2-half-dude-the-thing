class MultiCueSplineAudioComponent extends SplineAudioComponent
    editinlinenew
    collapsecategories
    hidecategories(Object,ActorComponent,Object,ActorComponent,Object,ActorComponent,Object,ActorComponent);

struct native MultiCueSplineSoundSlot
{
    var(*) /*0x33F70000-0x00000000*/ private @NULL SoundCue[65537];
    var(*) /*0x33F70000-0x00000000*/ private float PitchScale[65537];
    var(*) /*0x33F70000-0x00000000*/ private float VolumeScale[65537];
    var(*) /*0x33F70000-0x00000000*/ private int StartPoint[65537];
    var(*) /*0x33F70000-0x00000000*/ private int EndPoint[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LastUpdateTime[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorVolume[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorLPF[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorVolume[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorLPF[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private bool bPlaying;

    structdefaultproperties
    {
        SoundCue=none
        PitchScale=1.0000000
        VolumeScale=1.0000000
        StartPoint=-1
        EndPoint=-1
        bPlaying=false
    }
};

var(*) /*0x487A0000-0x00000010*/ private editfixedsize array SoundSlots[65537];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentSlotIndex;
