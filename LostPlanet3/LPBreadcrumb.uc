class LPBreadcrumb extends LPSplineActor
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableDestination;

    structdefaultproperties
    {
        bDisableDestination=false
    }
};

var(0.25_Pct) /*0x7C560000-0x00000400*/ private editfixedsize @NULL MustBeCompletedObjectiveEntry[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayedOnPath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte BreadcrumbDisplayType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisplayDistanceToPlayer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisplayAlpha[536870913];

// Export ULPBreadcrumb::execRegisterWithManager(FFrame&, void* const)
native final function RegisterWithManager();

// Export ULPBreadcrumb::execIsDisplayedOnPath(FFrame&, void* const)
native final function IsDisplayedOnPath()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPBreadcrumb::execCanVisitForAStar(FFrame&, void* const)
native function CanVisitForAStar()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    RegisterWithManager();
    //return;    
}

event SetDisplayOnPath()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private float InDistance[9437185], InAlpha;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    1.0000000
    DisplayDistanceToPlayer = InDistance;
    DisplayAlpha = InAlpha;
    // End:0x120
    if(bOn != bDisplayedOnPath)
    {
        bDisplayedOnPath = bOn;
        LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
        // End:0xEB
        if(bOn)
        {
            LPPC.myLPHUD.NotifyWaypointActivated(self);            
        }
        else
        {
            LPPC.myLPHUD.NotifyWaypointDeactivated(self);
        }
    }
    return true;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bDisableDestination = bDisableDestination;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bDisableDestination = Record.bDisableDestination;
    //return;    
}

defaultproperties
{
    SplineActorTangent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    bUseAdvancedAStarCanUseFn=true
    bAllowReverseConnectionsInAStar=true
    bNoRuntimeSplineComponent=true
}