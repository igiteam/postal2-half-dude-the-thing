class SoundCue extends AkBaseSoundObject
    hidecategories(Object);

struct native export SoundNodeEditorData
{
    var(*) /*0x35EA0000-0x00000000*/ private int NodePosX[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private int NodePosY[268566529];
};

var(*) /*0x48400000-0x00000000*/ private name SoundClass[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte SoundClassName;
var(*) /*0x48400000-0x00000000*/ private bool bDebug[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FirstNode;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} EditorData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float MaxAudibleDistance[536870913];
var(*) /*0x48400000-0x00000000*/ private float VolumeMultiplier[65537];
var(*) /*0x48400000-0x00000000*/ private float PitchMultiplier[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Duration;
var(*) /*0x48400000-0x00000000*/ private @NULL FaceFXAnimSetRef[65537];
var(*) /*0x48400000-0x00000000*/ private editfixedsize string FaceFXGroupName[65537];
var(*) /*0x48400000-0x00000000*/ private editfixedsize string FaceFXAnimName[65537];
var(*) /*0x48400000-0x00000000*/ private int MaxConcurrentPlayCount[65537];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentPlayCount[537001985];
var(*) /*0x35EA0000-0x00000000*/ private transient name SoundGroup;
var(*) /*0x48400000-0x00000000*/ private float AIHearRadius[65537];
var(*) /*0x48400000-0x00000000*/ private float AISoundImportance[65537];

// Export USoundCue::execGetCueDuration(FFrame&, void* const)
native final function GetCueDuration()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

defaultproperties
{
    VolumeMultiplier=0.7500000
    PitchMultiplier=1.0000000
    MaxConcurrentPlayCount=16
    AISoundImportance=1.0000000
}