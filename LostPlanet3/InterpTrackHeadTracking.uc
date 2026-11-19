class InterpTrackHeadTracking extends InterpTrack
    collapsecategories
    hidecategories(Object);

enum EHeadTrackingAction
{
    EHTA_DisableHeadTracking,       // 0
    EHTA_EnableHeadTracking,        // 1
    EHTA_MAX                        // 2
};

struct native HeadTrackingKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x28F00000-0x00000000*/ private byte Action[65537];

    structdefaultproperties
    {
        Time=0.0000000
        Action=EHeadTrackingAction.EHTA_DisableHeadTracking
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array HeadTrackingTrack;
var(*) /*0x2BF40000-0x00000000*/ private editfixedsize array TrackControllerName[65537];
var(*) /*0x2BF40000-0x00000000*/ private float LookAtActorRadius[65537];
var(*) /*0x2BF40000-0x00000000*/ private bool bDisableBeyondLimit[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bLookAtPawns[65537];
var(*) /*0x2BF40000-0x00000000*/ private float MaxLookAtTime[65537];
var(*) /*0x2BF40000-0x00000000*/ private float MinLookAtTime[65537];
var(*) /*0x2BF40000-0x00000000*/ private float MaxInterestTime[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array ActorClassesToLookAt[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array TargetBoneNames[65537];

defaultproperties
{
    TrackControllerName=/* Array type was not detected. */
    LookAtActorRadius=500.0000000
    bLookAtPawns=true
    MaxLookAtTime=5.0000000
    MinLookAtTime=3.0000000
    MaxInterestTime=7.0000000
    TargetBoneNames=/* Array type was not detected. */
    TrackInstClass=Class'InterpTrackInstHeadTracking'
    TrackTitle="HeadTracking"
}