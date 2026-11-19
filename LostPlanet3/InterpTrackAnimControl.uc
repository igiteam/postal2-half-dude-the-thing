class InterpTrackAnimControl extends InterpTrackFloatBase
    collapsecategories
    hidecategories(Object);

struct native AnimControlTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float StartTime;
    var(*) /*0x35EA0000-0x00000000*/ private name AnimSeqName;
    var(*) /*0x35EA0000-0x00000000*/ private float AnimStartOffset;
    var(*) /*0x35EA0000-0x00000000*/ private float AnimEndOffset;
    var(*) /*0x35EA0000-0x00000000*/ private float AnimPlayRate;
    var(*) /*0x35EA0000-0x00000000*/ private bool bLooping;
    var(*) /*0x35EA0000-0x00000000*/ private bool bReverse;

    structdefaultproperties
    {
        StartTime=0.0000000
        AnimSeqName="None"
        AnimStartOffset=0.0000000
        AnimEndOffset=0.0000000
        AnimPlayRate=0.0000000
        bLooping=false
        bReverse=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimSets;
var(*) /*0x2BE70000-0x00000000*/ private name SlotName[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimSeqs;
var(*) /*0x2BE70000-0x00000000*/ private bool bEnableRootMotion[65537];
var(*) /*0x2BE70000-0x00000000*/ private bool bSkipAnimNotifiers[65537];

defaultproperties
{
    bEnableRootMotion=true
    TrackInstClass=Class'InterpTrackInstAnimControl'
    TrackTitle="Anim"
    bIsAnimControlTrack=true
}