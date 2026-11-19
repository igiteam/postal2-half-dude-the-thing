class NavigationPoint extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force)
    classgroup(Navigation);

const INFINITE_PATH_COST = 10000000;

struct native NavigationOctreeObject
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BoundingBox;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BoxCenter;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OctreeNode[805437441];
    var(*) /*0x35EA0000-0x00000080*/ private @NULL Owner[131073];
    var(*) /*0x35EA0000-0x00000080*/ private byte OwnerType[131073];

    structdefaultproperties
    {
        BoundingBox=(Min=(X=0.0000000,Y=0.0000000,Z=0.0000000),Max=(X=0.0000000,Y=0.0000000,Z=0.0000000),IsValid=0)
        BoxCenter=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Owner=none
        OwnerType=0
    }
};

struct native DebugNavCost
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Desc;
    var(*) /*0x35EA0000-0x00000000*/ private int Cost;

    structdefaultproperties
    {
        Desc=""
        Cost=0
    }
};

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlocked;

    structdefaultproperties
    {
        bDisabled=false
        bBlocked=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bEndPoint[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bTransientEndPoint[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHideEditorPaths[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanReach[536870913];
var(*) /*0x347B0000-0x00000000*/ private bool bBlocked[65537];
var(*) /*0x347B0000-0x00000000*/ private bool bOneWayPath[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeverUseStrafing;
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysUseStrafing;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceNoStrafing[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoBuilt[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bSpecialMove;
var(*) /*0x35EA0000-0x00000000*/ private bool bNoAutoConnect;
var(*) /*0x347B0000-0x00000000*/ private bool bNotBased[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bPathsChanged[131073];
var(*) /*0x347B0000-0x00000000*/ private bool bDestinationOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSourceOnly;
var(*) /*0x35EA0000-0x00000000*/ private bool bSpecialForced;
var(*) /*0x35EA0000-0x00000000*/ private bool bMustBeReachable;
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockable;
var(*) /*0x35EA0000-0x00000000*/ private bool bFlyingPreferred;
var(*) /*0x35EA0000-0x00000000*/ private bool bMayCausePain;
var(*) /*0x35EA0000-0x00000000*/ private bool bAlreadyVisited[536870913];
var(*) /*0x347B0000-0x00000000*/ private bool bVehicleDestination[65537];
var(*) /*0x347B0000-0x00000000*/ private bool bMakeSourceOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bMustTouchToReach;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanWalkOnToReach;
var(*) /*0x35EA0000-0x00000000*/ private bool bBuildLongPaths;
var(*) /*0x4F6C0000-0x00000000*/ private bool bBlockedForVehicles[65537];
var(*) /*0x4F6C0000-0x00000000*/ private bool bPreferredVehiclePath[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasCrossLevelPaths[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldSaveForCheckpoint[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NavOctreeObject[805437441];
var(*) /*0x347B0000-0x00000400*/ private const editfixedsize array PathList[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EditorProscribedPaths;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EditorForcedPaths;
var(*) /*0x347B0000-0x00000000*/ private const editfixedsize array Volumes[196609];
var(*) /*0x35EA0000-0x00000000*/ private int visitedWeight;
var(*) /*0x35EA0000-0x00000000*/ private int bestPathWeight[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL nextNavigationPoint[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL nextOrdered[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL prevOrdered[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL previousPath[131073];
var(*) /*0x35EA0000-0x00000000*/ private int Cost;
var(*) /*0x347B0000-0x00000000*/ private int ExtraCost[65537];
var(*) /*0x35EA0000-0x00000000*/ private int TransientCost[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int FearCost[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CostArray[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InventoryCache;
var(*) /*0x35EA0000-0x00000000*/ private float InventoryDist;
var(*) /*0x35EA0000-0x00000000*/ private float LastDetourWeight[131073];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(*) /*0x347B0000-0x00000000*/ private const @NULL MaxPathSize[196609];
var(*) /*0x347B0000-0x00000000*/ private const @NULL NavGuid[196609];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL GoodSprite[537526273];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL BadSprite[537526273];
var(*) /*0x347B0000-0x00000000*/ private const int NetworkID[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnchoredPawn[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float LastAnchoredPawnTime[536870913];

// Export UNavigationPoint::execGetBoundingCylinder(FFrame&, void* const)
native function GetBoundingCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float CollisionRadius[25165825], CollisionHeight;


}

// Export UNavigationPoint::execGetReachSpecTo(FFrame&, void* const)
native final function GetReachSpecTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Nav[8388609];
    local /*0x35EA0000-0x00000000*/ private class SpecClass[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UNavigationPoint::execIsUsableAnchorFor(FFrame&, void* const)
native function IsUsableAnchorFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationPoint::execCanTeleport(FFrame&, void* const)
native function CanTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event SpecialCost()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Seeker[8388609], Path;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}

event Accept()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Incoming[8388609], Source;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = Incoming.SetLocation(Location);
    // End:0x8D
    if(bResult)
    {
        Incoming.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Incoming.SetRotation(Rotation);
    }
    Incoming.PlayTeleportEffect(true, false);
    return bResult;
    //return ReturnValue;    
}

event DetourWeight()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private float PathWeight[8388609], ReturnValue;

    //return ReturnValue;    
}

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Other.SpecialMoveTo(Other.Anchor, self, Other.Controller.MoveTarget);
    //return ReturnValue;    
}

function ProceedWithMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

static final function GetNearestNavToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ChkActor[8388609];
    local /*0x35EA0000-0x00000000*/ private class RequiredClass[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ExcludeList[9437185];
    local /*0x35EA0000-0x00000000*/ private float MinDist[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Nav, BestNav;
    local /*0x35EA0000-0x00000000*/ private float Dist, bestDist;

    // End:0x16B
    if(ChkActor != none)
    {
        // End:0x16A
        foreach ChkActor.WorldInfo.AllNavigationPoints(Class'NavigationPoint', Nav)
        {
            // End:0x169
            if(((RequiredClass == none) || Nav.Class == RequiredClass) && ExcludeList.Find(Nav) == )
            {                
                Dist = VSize(Nav.Location - ChkActor.Location);
                // End:0x169
                if(Dist > MinDist)
                {
                    // End:0x169
                    if((BestNav == none) || Dist < bestDist)
                    {
                        BestNav = Nav;
                        bestDist = Dist;
                    }
                }
            }            
        }        
    }
    return BestNav;
    //return ReturnValue;    
}

static final function GetNearestNavToPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ChkActor[8388609], ChkPoint;
    local /*0x35EA0000-0x00000000*/ private class RequiredClass[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ExcludeList[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Nav, BestNav;
    local /*0x35EA0000-0x00000000*/ private float Dist, bestDist;

    // End:0x13E
    if(ChkActor != none)
    {
        // End:0x13D
        foreach ChkActor.WorldInfo.AllNavigationPoints(Class'NavigationPoint', Nav)
        {
            // End:0x13C
            if(((RequiredClass == none) || Nav.Class == RequiredClass) && ExcludeList.Find(Nav) == )
            {                
                Dist = VSize(Nav.Location - ChkPoint);
                // End:0x13C
                if((BestNav == none) || Dist < bestDist)
                {
                    BestNav = Nav;
                    bestDist = Dist;
                }
            }            
        }        
    }
    return BestNav;
    //return ReturnValue;    
}

// Export UNavigationPoint::execGetAllNavInRadius(FFrame&, void* const)
native static final function GetAllNavInRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ChkActor[8388609], ChkPoint;
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_NavList[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bSkipBlocked[9437185];
    local /*0x35EA0000-0x00000000*/ private int inNetworkID[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL MinSize[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1                                        
}

// Export UNavigationPoint::execIsOnDifferentNetwork(FFrame&, void* const)
native final function IsOnDifferentNetwork()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Nav[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bBlocked = false;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bBlocked = true;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bBlocked = !bBlocked;
            }
        }
    }
    WorldInfo.Game.NotifyNavigationChanged(self);
    bShouldSaveForCheckpoint = true;
    //return;    
}

simulated event ShutDown()
{
    super.ShutDown();
    bBlocked = true;
    WorldInfo.Game.NotifyNavigationChanged(self);
    bShouldSaveForCheckpoint = true;
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bShouldSaveForCheckpoint;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bBlocked = bBlocked;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bBlocked = Record.bBlocked;
    bShouldSaveForCheckpoint = true;
    //return;    
}

simulated event GetDebugAbbrev()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "NP?";
    //return ReturnValue;    
}

defaultproperties
{
    bMayCausePain=true
    bMustTouchToReach=true
    bBuildLongPaths=true
    // Reference: CylinderComponent'Default__NavigationPoint.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    NetworkID=-1
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bStatic=true
    bNoDelete=true
    bCollideWhenPlacing=true
    bForceAllowKismetModification=true
    CollisionComponent=CollisionCylinder
}