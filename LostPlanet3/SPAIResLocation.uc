class SPAIResLocation extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native SPAIResLocationAttributes
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int OverlapPriority;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float Radius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float Height;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MoveThreshold;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RevokeReachTimeTolerance;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bRevokeAccessOnLocationChange;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool TestForBlockers;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool TestForLineOfSight;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LineOfSightRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LineOfSightFrequency;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bTestRechability;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float SpecialRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bTestForGround;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAutoPosition;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MoveConstraintRadiusFactor;

    structdefaultproperties
    {
        OverlapPriority=0
        Radius=0.0000000
        Height=0.0000000
        MoveThreshold=100.0000000
        RevokeReachTimeTolerance=1.0000000
        bRevokeAccessOnLocationChange=false
        TestForBlockers=true
        TestForLineOfSight=false
        LineOfSightRadius=50.0000000
        LineOfSightFrequency=2.0000000
        bTestRechability=true
        SpecialRadius=0.0000000
        bTestForGround=true
        bAutoPosition=true
        MoveConstraintRadiusFactor=0.5000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attributes;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL RelativeLocation;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL WorldPosition;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL LastResourceManagerOuterLocation;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bWorldPositionValid;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeForLineOfSightCheck;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL DebugLosFrom;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL DebugLosTo;
//var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize delegate<@NULL> __NotifyChangeLocationDelegate__Delegate;
//var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize delegate<@NULL> __NotifyAccessLostDelegate__Delegate;
//var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize delegate<@NULL> __NotifyUnreachableDelegate__Delegate;

delegate NotifyChangeLocationDelegate()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    //return;    
}

delegate NotifyAccessLostDelegate()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    //return;    
}

delegate NotifyUnreachableDelegate()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    //return;    
}

// Export USPAIResLocation::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResLocation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResLocation::execCalculateWorldLocation(FFrame&, void* const)
native static final function CalculateWorldLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL InRelativePosition[25296897], InResourceManagerOuterLocation, InAttributes, OutPosition;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsReachableByStatic(FFrame&, void* const)
native static final function IsReachableByStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsBlcokedByOverlapStatic(FFrame&, void* const)
native static final function @NULL IsBlcokedByOverlapStatic()
{
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsBlcokedByLosStatic(FFrame&, void* const)
native static final function @NULL IsBlcokedByLosStatic()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[25296897];
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos, InFormationCenter;
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185], ReturnValue;


}

// Export USPAIResLocation::execGetLosStartEnd(FFrame&, void* const)
native static final function GetLosStartEnd()
{
    local /*0x03A30000-0x00000000*/ private @NULL InAttributes[25296897], InWorldPos, FormationCenter, From, To;

    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsValidLocationExtraChecksStatic(FFrame&, void* const)
native static function IsValidLocationExtraChecksStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsAtValidLocation(FFrame&, void* const)
protected native final function IsAtValidLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsBlcokedByOverlap(FFrame&, void* const)
protected native final function IsBlcokedByOverlap()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsAnyBlockerAtLocation(FFrame&, void* const)
native final function IsAnyBlockerAtLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsBlcokedByLos(FFrame&, void* const)
native final function IsBlcokedByLos()
{
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185], ReturnValue;


}

// Export USPAIResLocation::execIsReachableBy(FFrame&, void* const)
protected native final function IsReachableBy()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsMoveRequired(FFrame&, void* const)
protected native final function IsMoveRequired()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execSetSortKey(FFrame&, void* const)
native function SetSortKey()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResLocation::execGetRelativeLocation(FFrame&, void* const)
native final function GetRelativeLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResLocation::execUpdateWorldLocation(FFrame&, void* const)
private native final function UpdateWorldLocation();

// Export USPAIResLocation::execUpdateWorldLocationConditional(FFrame&, void* const)
private native final function UpdateWorldLocationConditional()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execUpdateLineOfSightConditional(FFrame&, void* const)
private native final function UpdateLineOfSightConditional()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execResetLosCheckTime(FFrame&, void* const)
private native final function ResetLosCheckTime();

// Export USPAIResLocation::execUpdateAccess(FFrame&, void* const)
private native final function UpdateAccess();

// Export USPAIResLocation::execRevokeAccessForUser(FFrame&, void* const)
protected native function RevokeAccessForUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execRevokeAllAccess(FFrame&, void* const)
native function RevokeAllAccess()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execPlaceInWorld(FFrame&, void* const)
private native final function PlaceInWorld();

// Export USPAIResLocation::execIsAnyUserAtLocation(FFrame&, void* const)
native final function IsAnyUserAtLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execCheckForPawnsLos(FFrame&, void* const)
native static function @NULL CheckForPawnsLos()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[25296897];
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos, From, To;

    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResLocation::execIsAnyBlockerAtLocationStatic(FFrame&, void* const)
native static function IsAnyBlockerAtLocationStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x03A30000-0x00000000*/ private float Inradius[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super.Init();
    LastResourceManagerOuterLocation = Outer.GetOuterLocation();
    PlaceInWorld();
    //return;    
}

function GetWorldPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return WorldPosition;
    //return ReturnValue;    
}

event GetFormationCenter()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LastResourceManagerOuterLocation;
    //return ReturnValue;    
}

event GetFormationRadius()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(RelativeLocation);
    //return ReturnValue;    
}

event GetFormationMoveConstraintRadius()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return (GetFormationRadius()) * Attributes.MoveConstraintRadiusFactor;
    //return ReturnValue;    
}

protected event IsAtValidForRequester()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return ((IsAllowedAccess(Requester)) && IsAtValidLocation(Requester)) && IsReachableBy(Requester);
    //return ReturnValue;    
}

function SetAttributesFromGroup()
{
    local /*0x03A30000-0x00000000*/ private @NULL InAttributes[25296897];

    Attributes = InAttributes;
    //return;    
}

function SetRelativeLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL InRelativeLocation[25296897];

    RelativeLocation = InRelativeLocation;
    PlaceInWorld();
    NotifyChangeLocation();
    //return;    
}

function SetRelativeLocationOnCreate()
{
    local /*0x03A30000-0x00000000*/ private @NULL InRelativeLocation[25296897];

    RelativeLocation = InRelativeLocation;
    //return;    
}

static event @NULL ShouldBlockdLosStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Blocker[8388609], AIResourceManager, InAttributes, InWorldPos, LosFrom, LosTo;

    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private float BlockerRadius, BlockerHeight, DistFromLine;
    local /*0x03A30000-0x00000000*/ private @NULL TestPoint;

    // End:0x31
    if(Blocker == AIResourceManager.Outer)
    {
        return false;        
    }
    else
    {
        AIResourceManager.GetUserRadiusAndHeight(Blocker, BlockerRadius, BlockerHeight);
        TestPoint = Blocker.Location;
        TestPoint.Z = LosFrom.Z;
        DistFromLine = Class'SPEngine.SPUtil'.static.DistFromLineSegment(LosFrom, LosTo, TestPoint);
        // End:0x147
        if(DistFromLine < (BlockerRadius + InAttributes.LineOfSightRadius))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

static function @NULL IsRelativeLocationValidForResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], AIResourceManager, InAttributes, InRelativeLocation;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689], bValid;
    local /*0x03A30000-0x00000000*/ private @NULL OuterLoc, WorldPos;

    bValid = Requester != none;
    bValid = bValid && AIResourceManager != none;
    // End:0x73
    if(bValid)
    {
        OuterLoc = AIResourceManager.GetOuterLocation();
    }
    bValid = bValid && default.Class.static.CalculateWorldLocation(InRelativeLocation, OuterLoc, InAttributes, WorldPos);
    bValid = bValid && default.Class.static.IsWorldLocationValidForResource(Requester, AIResourceManager, InAttributes, WorldPos);
    return bValid;
    //return ReturnValue;    
}

static function @NULL IsWorldLocationValidForResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], AIResourceManager, InAttributes, InWorldLocation;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689], bValid;

    bValid = Requester != none;
    bValid = bValid && AIResourceManager != none;
    bValid = bValid && default.Class.static.IsValidLocationExtraChecksStatic(Requester, InAttributes, InWorldLocation);
    bValid = bValid && default.Class.static.IsReachableByStatic(Requester, InAttributes, InWorldLocation);
    bValid = bValid && !default.Class.static.IsBlcokedByOverlapStatic(AIResourceManager, InAttributes, InWorldLocation);
    return bValid;
    //return ReturnValue;    
}

protected event NotifyChangeLocation()
{
    NotifyChangeLocationDelegate(self);
    NotifyAIResourceChanged();
    // End:0x48
    if(Attributes.bRevokeAccessOnLocationChange)
    {
        RevokeAllAccess();
    }
    //return;    
}

// Export USPAIResLocation::execGetUserSeperation(FFrame&, void* const)
native final function GetUserSeperation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResLocation::execGetUserSeperationStatic(FFrame&, void* const)
protected native static final function GetUserSeperationStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float Radius[8388609], Height;
    local /*0x03A30000-0x00000000*/ private @NULL InWorldPos[25296897];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResLocation::execGetUserReachTime(FFrame&, void* const)
native event GetUserReachTime()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResLocation::execGetUserReachTimeForRating(FFrame&, void* const)
native event GetUserReachTimeForRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResLocation::execFindUserThatCanBeRevokedInFavourOf(FFrame&, void* const)
protected native event FindUserThatCanBeRevokedInFavourOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;


}

// Export USPAIResLocation::execGetRevokeRating(FFrame&, void* const)
protected native event GetRevokeRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609], Requester;
    local /*0x03A30000-0x00000000*/ private float UserRevokeTimeTolerance[8388609], RequesterReachTime, ReturnValue;


}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];

    OutLocation = WorldPosition;
    OutRadius = Attributes.Radius;
    //return;    
}

function ReachDistance()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Attributes.Radius;
    //return ReturnValue;    
}

event IsUsable()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsUsable(Requester) && !IsAnyBlockerAtLocation(Requester);
    //return ReturnValue;    
}

protected event IsAtValidLocationForDebugDraw()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689], NotValid;

    NotValid = ((!bWorldPositionValid || IsBlcokedByOverlap(Requester)) || IsBlcokedByLos()) || IsAnyBlockerAtLocation(Requester);
    return !NotValid;
    //return ReturnValue;    
}

function IsInFront()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorToSeeIfResourceIsInFrontOf[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL positionToTest, dirToOtherVector;

    positionToTest = GetWorldPosition();
    dirToOtherVector = positionToTest - ActorToSeeIfResourceIsInFrontOf.Location;
    // End:0x7C
    if((Vector(ActorToSeeIfResourceIsInFrontOf.Rotation) Dot dirToOtherVector) > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    Attributes=(OverlapPriority=0,Radius=0.0000000,Height=0.0000000,MoveThreshold=100.0000000,RevokeReachTimeTolerance=1.0000000,bRevokeAccessOnLocationChange=false,TestForBlockers=true,TestForLineOfSight=false,LineOfSightRadius=50.0000000,LineOfSightFrequency=2.0000000,bTestRechability=true,SpecialRadius=0.0000000,bTestForGround=true,bAutoPosition=true,MoveConstraintRadiusFactor=0.5000000)
}