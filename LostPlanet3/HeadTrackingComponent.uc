class HeadTrackingComponent extends ActorComponent;

struct native ActorToLookAt
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Actor;
    var(*) /*0x35EA0000-0x00000000*/ private float Rating;
    var(*) /*0x35EA0000-0x00000000*/ private float EnteredTime;
    var(*) /*0x35EA0000-0x00000000*/ private float LastKnownDistance;
    var(*) /*0x35EA0000-0x00000000*/ private float StartTimeBeingLookedAt;
    var(*) /*0x35EA0000-0x00000000*/ private bool CurrentlyBeingLookedAt;

    structdefaultproperties
    {
        Actor=none
        Rating=0.0000000
        EnteredTime=0.0000000
        LastKnownDistance=0.0000000
        StartTimeBeingLookedAt=0.0000000
        CurrentlyBeingLookedAt=false
    }
};

var(*) /*0x28EF0000-0x00000000*/ private editfixedsize array TrackControllerName[65537];
var(*) /*0x28EF0000-0x00000000*/ private float LookAtActorRadius[65537];
var(*) /*0x28EF0000-0x00000000*/ private bool bDisableBeyondLimit[65537];
var(*) /*0x28EF0000-0x00000000*/ private float MaxLookAtTime[65537];
var(*) /*0x28EF0000-0x00000000*/ private float MinLookAtTime[65537];
var(*) /*0x28EF0000-0x00000000*/ private float MaxInterestTime[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array ActorClassesToLookAt[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array TargetBoneNames[65537];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} CurrentActorMap[805437441];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SkeletalMeshComp[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TrackControls[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMeshLocation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMeshRotation[536870913];
