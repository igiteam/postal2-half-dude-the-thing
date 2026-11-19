class SplineActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

struct native SplineConnection
{
    var(*) /*0x49310000-0x00000400*/ private export @NULL SplineComponent[589825];
    var(*) /*0x49310000-0x00000000*/ private @NULL ConnectTo[65537];
    var(*) /*0x35EA0000-0x00000000*/ private float Distance;

    structdefaultproperties
    {
        SplineComponent=none
        ConnectTo=none
        Distance=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export array Connections;
var(*) /*0x49270000-0x00000000*/ private editconst @NULL SplineActorTangent[65537];
var(*) /*0x49270000-0x00000000*/ private @NULL SplineColor[65537];
var(*) /*0x49270000-0x00000000*/ private bool bDisableDestination[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlreadyVisited[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseAdvancedAStarCanUseFn;
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowReverseConnectionsInAStar;
var(*) /*0x35EA0000-0x00000000*/ private bool bNoRuntimeSplineComponent;
var(*) /*0x35EA0000-0x00000000*/ private bool bDragCopyKeepOldConnections;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LinksFrom;
var(*) /*0x35EA0000-0x00000000*/ private @NULL nextOrdered[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL prevOrdered[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL previousPath[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int bestPathWeight[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int visitedWeight[536870913];
var(*) /*0x49270000-0x00000400*/ private editfixedsize @NULL SplineVelocityOverTime[65537];

// Export USplineActor::execGetWorldSpaceTangent(FFrame&, void* const)
native function GetWorldSpaceTangent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USplineActor::execUpdateSplineComponents(FFrame&, void* const)
native function UpdateSplineComponents();

// Export USplineActor::execUpdateConnectedSplineComponents(FFrame&, void* const)
native function UpdateConnectedSplineComponents()
{
    local /*0x35EA0000-0x00000000*/ private bool bFinish[8388609];


}

// Export USplineActor::execAddConnectionTo(FFrame&, void* const)
native function AddConnectionTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NextActor[8388609];


}

// Export USplineActor::execIsConnectedTo(FFrame&, void* const)
native function IsConnectedTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NextActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bCheckForDisableDestination[8388609], ReturnValue;


}

// Export USplineActor::execFindSplineComponentTo(FFrame&, void* const)
native function @NULL FindSplineComponentTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NextActor[8388609], ReturnValue;


}

// Export USplineActor::execFindTargetForComponent(FFrame&, void* const)
native function @NULL FindTargetForComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SplineComp[8388609], ReturnValue;


}

// Export USplineActor::execBreakConnectionTo(FFrame&, void* const)
native function BreakConnectionTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NextActor[8388609];


}

// Export USplineActor::execBreakAllConnections(FFrame&, void* const)
native function BreakAllConnections();

// Export USplineActor::execBreakAllConnectionsFrom(FFrame&, void* const)
native function BreakAllConnectionsFrom();

// Export USplineActor::execGetRandomConnection(FFrame&, void* const)
native function GetRandomConnection()
{
    local /*0x35EA0000-0x00000000*/ private bool bUseLinksFrom[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USplineActor::execGetBestConnectionInDirection(FFrame&, void* const)
native function GetBestConnectionInDirection()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredDir[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bUseLinksFrom[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USplineActor::execFindSplinePathTo(FFrame&, void* const)
native function FindSplinePathTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Goal[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutRoute[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USplineActor::execGetAllConnectedSplineActors(FFrame&, void* const)
native function GetAllConnectedSplineActors()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutSet[25165825];


}

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bDisableDestination = false;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bDisableDestination = true;            
        }
        else
        {
            bDisableDestination = !bDisableDestination;
        }
    }
    UpdateConnectedSplineComponents(true);
    //return;    
}

simulated function OnToggleHidden()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    super.OnToggleHidden(Action);
    UpdateConnectedSplineComponents(true);
    //return;    
}

defaultproperties
{
    SplineActorTangent=(X=300.0000000,Y=0.0000000,Z=0.0000000)
    SplineColor=(R=255,G=0,B=255,A=255)
    Components[0]=none
}