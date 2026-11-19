class SPAIResFlyLocation extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native SPAIResFlyLocationAttributes
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int OverlapPriority;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float HeightOfLoc;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RadiusOfLoc;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float ReachDistance;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float IdealRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float DistanceErrorBuffer;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfDistanceDeltaInsideIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfDistanceDeltaOutsideIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinFormationHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float FormationIdealHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxFormationHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float HeightErrorBuffer;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfHeightDeltaBelowIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfHeightDeltaAboveIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bUseHeightInsteadOfPitchForEvaluations;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxPitchAllowedInDegrees;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float IdealPitchInDegrees;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinPitchAllowedInDegrees;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float PitchErrorBufferInDegrees;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfPitchDeltaBelowIdealPerDegree;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfPitchDeltaAboveIdealPerDegree;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinRangeFromVsForFlyLocToBeValid;
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
        HeightOfLoc=100.0000000
        RadiusOfLoc=25.0000000
        ReachDistance=45.0000000
        IdealRadius=0.0000000
        MinFormationRadius=0.0000000
        MaxFormationRadius=0.0000000
        DistanceErrorBuffer=50.0000000
        CostOfDistanceDeltaInsideIdealPerMeter=100.0000000
        CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000
        MinFormationHeightDelta=1.0000000
        FormationIdealHeightDelta=10.0000000
        MaxFormationHeightDelta=20.0000000
        HeightErrorBuffer=50.0000000
        CostOfHeightDeltaBelowIdealPerMeter=100.0000000
        CostOfHeightDeltaAboveIdealPerMeter=50.0000000
        bUseHeightInsteadOfPitchForEvaluations=true
        MaxPitchAllowedInDegrees=10.0000000
        IdealPitchInDegrees=10.0000000
        MinPitchAllowedInDegrees=0.0000000
        PitchErrorBufferInDegrees=5.0000000
        CostOfPitchDeltaBelowIdealPerDegree=1.0000000
        CostOfPitchDeltaAboveIdealPerDegree=1.0000000
        MinRangeFromVsForFlyLocToBeValid=800.0000000
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

struct native SPFlyLocationExploreData
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float IdealRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float DistanceErrorBuffer;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfDistanceDeltaInsideIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfDistanceDeltaOutsideIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinFormationHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float FormationIdealHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxFormationHeightDelta;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float HeightErrorBuffer;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfHeightDeltaBelowIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfHeightDeltaAboveIdealPerMeter;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bUseHeightInsteadOfPitchForEvaluations;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int MaxPitchAllowedInUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int IdealPitchInUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int MinPitchAllowedInUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int PitchErrorBufferInUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfPitchDeltaBelowIdealPerUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CostOfPitchDeltaAboveIdealPerUU;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinRangeFromVsForFlyLocToBeValid;

    structdefaultproperties
    {
        IdealRadius=1000.0000000
        MinFormationRadius=500.0000000
        MaxFormationRadius=2000.0000000
        DistanceErrorBuffer=50.0000000
        CostOfDistanceDeltaInsideIdealPerMeter=100.0000000
        CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000
        MinFormationHeightDelta=1.0000000
        FormationIdealHeightDelta=10.0000000
        MaxFormationHeightDelta=20.0000000
        HeightErrorBuffer=50.0000000
        CostOfHeightDeltaBelowIdealPerMeter=100.0000000
        CostOfHeightDeltaAboveIdealPerMeter=50.0000000
        bUseHeightInsteadOfPitchForEvaluations=true
        MaxPitchAllowedInUU=10
        IdealPitchInUU=10
        MinPitchAllowedInUU=0
        PitchErrorBufferInUU=5
        CostOfPitchDeltaBelowIdealPerUU=1.0000000
        CostOfPitchDeltaAboveIdealPerUU=1.0000000
        MinRangeFromVsForFlyLocToBeValid=800.0000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attributes;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL FlyGroupFormationBelongsTo;
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

// Export USPAIResFlyLocation::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResFlyLocation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResFlyLocation::execCalculateWorldLocation(FFrame&, void* const)
native static final function CalculateWorldLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL InRelativePosition[25296897], InResourceManagerOuterLocation, InAttributes, OutPosition;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsReachableByStatic(FFrame&, void* const)
native static final function IsReachableByStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsBlcokedByOverlapStatic(FFrame&, void* const)
native static final function @NULL IsBlcokedByOverlapStatic()
{
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execCanAnotherFlyerAccessLocation(FFrame&, void* const)
native final function CanAnotherFlyerAccessLocation()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsBlcokedByLosStatic(FFrame&, void* const)
native static final function @NULL IsBlcokedByLosStatic()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[25296897];
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos, InFormationCenter;
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185], ReturnValue;


}

// Export USPAIResFlyLocation::execGetLosStartEnd(FFrame&, void* const)
native static final function GetLosStartEnd()
{
    local /*0x03A30000-0x00000000*/ private @NULL InAttributes[25296897], InWorldPos, FormationCenter, From, To;

    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsValidLocationExtraChecksStatic(FFrame&, void* const)
native static final function IsValidLocationExtraChecksStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], InAttributes, InWorldPos;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsAtValidLocation(FFrame&, void* const)
protected native final function IsAtValidLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsBlcokedByOverlap(FFrame&, void* const)
protected native final function IsBlcokedByOverlap()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsAnyBlockerAtLocation(FFrame&, void* const)
native final function IsAnyBlockerAtLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsReachableBy(FFrame&, void* const)
protected native final function IsReachableBy()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsMoveRequired(FFrame&, void* const)
protected native final function IsMoveRequired()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execGetUserSeperation(FFrame&, void* const)
native final function GetUserSeperation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execGetUserSeperationStatic(FFrame&, void* const)
protected native static final function GetUserSeperationStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float Radius[8388609], Height;
    local /*0x03A30000-0x00000000*/ private @NULL InWorldPos[25296897];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execCheckForPawnsLos(FFrame&, void* const)
native static final function @NULL CheckForPawnsLos()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[25296897];
    local /*0x03A30000-0x00000400*/ private @NULL AIResourceManager[8388609], InAttributes, InWorldPos, From, To;

    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsAnyBlockerAtLocationStatic(FFrame&, void* const)
native static final function IsAnyBlockerAtLocationStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x03A30000-0x00000000*/ private float Inradius[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array IgnoreActors[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsBlcokedByLos(FFrame&, void* const)
native final function IsBlcokedByLos()
{
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185], ReturnValue;


}

// Export USPAIResFlyLocation::execSetSortKey(FFrame&, void* const)
native function SetSortKey()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResFlyLocation::execUpdateLineOfSightConditional(FFrame&, void* const)
private native final function UpdateLineOfSightConditional()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execResetLosCheckTime(FFrame&, void* const)
private native final function ResetLosCheckTime();

// Export USPAIResFlyLocation::execUpdateAccess(FFrame&, void* const)
private native final function UpdateAccess();

// Export USPAIResFlyLocation::execRevokeAccessForUser(FFrame&, void* const)
protected native function RevokeAccessForUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execRevokeAllAccess(FFrame&, void* const)
native function RevokeAllAccess()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResFlyLocation::execIsAnyUserAtLocation(FFrame&, void* const)
native final function IsAnyUserAtLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super.Init();
    LastResourceManagerOuterLocation = Outer.GetOuterLocation();
    //return;    
}

function SetFlyGroupFormation()
{
    local /*0x03A30000-0x00000000*/ private @NULL OwnerFormation[8388609];

    FlyGroupFormationBelongsTo = OwnerFormation;
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

    return VSize2D(WorldPosition);
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

function SetWorldLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL InWorldLocation[25296897];

    WorldPosition = InWorldLocation;
    bWorldPositionValid = true;
    //return;    
}

function MarkAsChanged()
{
    NotifyAIResourceChanged();
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

static function BuildExploreDataFromAttribite()
{
    local /*0x03A30000-0x00000000*/ private @NULL AttributeToBuildFrom[25296897], DataGettingBuilt;

    DataGettingBuilt.MinFormationRadius = AttributeToBuildFrom.MinFormationRadius;
    DataGettingBuilt.IdealRadius = AttributeToBuildFrom.IdealRadius;
    DataGettingBuilt.MaxFormationRadius = AttributeToBuildFrom.MaxFormationRadius;
    DataGettingBuilt.DistanceErrorBuffer = AttributeToBuildFrom.DistanceErrorBuffer;
    DataGettingBuilt.CostOfDistanceDeltaInsideIdealPerMeter = AttributeToBuildFrom.CostOfDistanceDeltaInsideIdealPerMeter;
    DataGettingBuilt.CostOfDistanceDeltaOutsideIdealPerMeter = AttributeToBuildFrom.CostOfDistanceDeltaOutsideIdealPerMeter;
    DataGettingBuilt.MinFormationHeightDelta = AttributeToBuildFrom.MinFormationHeightDelta;
    DataGettingBuilt.MaxFormationHeightDelta = AttributeToBuildFrom.MaxFormationHeightDelta;
    DataGettingBuilt.FormationIdealHeightDelta = AttributeToBuildFrom.FormationIdealHeightDelta;
    DataGettingBuilt.HeightErrorBuffer = AttributeToBuildFrom.HeightErrorBuffer;
    DataGettingBuilt.CostOfHeightDeltaBelowIdealPerMeter = AttributeToBuildFrom.CostOfHeightDeltaBelowIdealPerMeter;
    DataGettingBuilt.CostOfHeightDeltaAboveIdealPerMeter = AttributeToBuildFrom.CostOfHeightDeltaAboveIdealPerMeter;
    DataGettingBuilt.bUseHeightInsteadOfPitchForEvaluations = AttributeToBuildFrom.bUseHeightInsteadOfPitchForEvaluations;
    DataGettingBuilt.MaxPitchAllowedInUU = Class'SPEngine.SPUtil'.static.DegToUnrRotWithNormalize(AttributeToBuildFrom.MaxPitchAllowedInDegrees);
    DataGettingBuilt.IdealPitchInUU = Class'SPEngine.SPUtil'.static.DegToUnrRotWithNormalize(AttributeToBuildFrom.IdealPitchInDegrees);
    DataGettingBuilt.MinPitchAllowedInUU = Class'SPEngine.SPUtil'.static.DegToUnrRotWithNormalize(AttributeToBuildFrom.MinPitchAllowedInDegrees);
    DataGettingBuilt.PitchErrorBufferInUU = Class'SPEngine.SPUtil'.static.DegToUnrRotWithNormalize(AttributeToBuildFrom.PitchErrorBufferInDegrees);
    DataGettingBuilt.CostOfPitchDeltaBelowIdealPerUU = Class'SPEngine.SPUtil'.static.fDegToUnrRotWithNormalize(AttributeToBuildFrom.CostOfPitchDeltaBelowIdealPerDegree);
    DataGettingBuilt.CostOfPitchDeltaAboveIdealPerUU = Class'SPEngine.SPUtil'.static.fDegToUnrRotWithNormalize(AttributeToBuildFrom.CostOfPitchDeltaAboveIdealPerDegree);
    DataGettingBuilt.MinRangeFromVsForFlyLocToBeValid = AttributeToBuildFrom.MinRangeFromVsForFlyLocToBeValid;
    //return;    
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

event GetUserReachTime()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689], Seperation, MaxSpeed, ReachTime;

    ReachTime = 0.0000000;
    Seperation = GetUserSeperation(Requester);
    // End:0x78
    if(Seperation > float(0))
    {
        MaxSpeed = GetUserMaxSpeed(Requester);
        ReachTime = Seperation / MaxSpeed;
    }
    return ReachTime;
    //return ReturnValue;    
}

event GetUserReachTimeForRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return GetUserReachTime(Requester);
    //return ReturnValue;    
}

protected event FindUserThatCanBeRevokedInFavourOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;
    local /*0x03A30000-0x00000000*/ private int Idx, BestIdx;
    local /*0x03A30000-0x00000000*/ private float RequesterReachTime, BestRating, RevokeRating;
    local /*0x03A30000-0x00000000*/ private editfixedsize array User, RevokeTimes;

    // End:0x26
    if(Attributes.RevokeReachTimeTolerance < float(0))
    {
        return none;
    }
    GetAllRevokableUsers(User, RevokeTimes);
    RequesterReachTime = GetUserReachTimeForRating(Requester);
    BestIdx = -1;
    BestRating = -1.0000000;
    Idx = 0;
    J0x88:

    // End:0x14A [Loop If]
    if(Idx < User.Length)
    {
        RevokeRating = GetRevokeRating(User[Idx], Requester, RevokeTimes[Idx], RequesterReachTime);
        // End:0x13C
        if((RevokeRating > float(0)) && RevokeRating > BestRating)
        {
            BestRating = RevokeRating;
            BestIdx = Idx;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x88;
    }
    // End:0x174
    if(BestIdx > -1)
    {
        return User[BestIdx];        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

protected event GetRevokeRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609], Requester;
    local /*0x03A30000-0x00000000*/ private float UserRevokeTimeTolerance[8388609], RequesterReachTime, ReturnValue, DistFromLine, UserReachTime;

    local /*0x03A30000-0x00000000*/ private @NULL ClosestPoint, Segment, VectToPoint;
    local /*0x03A30000-0x00000000*/ private float Dot1, Dot2, RequesterRadius, RequesterHalfHeight, UserRadius, UserHalfHeight;

    // End:0x20
    if(UserRevokeTimeTolerance < float(0))
    {
        UserRevokeTimeTolerance = 0.0000000;
    }
    UserReachTime = GetUserReachTimeForRating(User);
    // End:0x290
    if(UserReachTime >= UserRevokeTimeTolerance)
    {
        // End:0xAF
        if((RequesterReachTime < UserReachTime) && (UserReachTime - RequesterReachTime) >= Attributes.RevokeReachTimeTolerance)
        {
            return UserReachTime;            
        }
        else
        {
            Outer.GetUserRadiusAndHeight(Requester, RequesterRadius, RequesterHalfHeight);
            Outer.GetUserRadiusAndHeight(User, UserRadius, UserHalfHeight);
            DistFromLine = PointDistToSegment(Requester.Location, User.Location, WorldPosition, ClosestPoint);
            // End:0x290
            if(DistFromLine < (RequesterRadius + UserRadius))
            {
                VectToPoint = Requester.Location - User.Location;
                Segment = User.Location - WorldPosition;
                Dot1 = VectToPoint Dot Segment;
                // End:0x290
                if(Dot1 > float(0))
                {
                    Dot2 = Segment Dot Segment;
                    // End:0x290
                    if(Dot2 > Dot1)
                    {
                        return UserReachTime;
                    }
                }
            }
        }
    }
    return float(-2147483647);
    //return ReturnValue;    
}

function NotifyAIResourceAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users;
    local /*0x03A30000-0x00000000*/ private bool bhasUserBesidesLoserUser;
    local /*0x03A30000-0x00000000*/ private int iter;
    local /*0x03A30000-0x00000000*/ private @NULL curResUser;

    // End:0x57
    if(FlyGroupFormationBelongsTo != none)
    {
        FlyGroupFormationBelongsTo.NotifyFlyLocationAccessLost(self, ResAccess, ResAccess.GetResourceUser());
    }
    bhasUserBesidesLoserUser = false;
    curResUser = ResAccess.GetResourceUser();
    GetAllUsers(Users);
    iter = 0;
    J0xAB:

    // End:0xFE [Loop If]
    if(iter < Users.Length)
    {
        // End:0xF0
        if(Users[iter] != curResUser)
        {
            bhasUserBesidesLoserUser = true;
        }
        ++iter;
        // [Loop Continue]
        goto J0xAB;
    }
    // End:0x117
    if(!bhasUserBesidesLoserUser)
    {
        Destroy();
    }
    //return;    
}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];

    OutLocation = WorldPosition;
    OutRadius = Attributes.IdealRadius;
    //return;    
}

function ReachDistance()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Attributes.ReachDistance;
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

defaultproperties
{
    Attributes=(OverlapPriority=0,HeightOfLoc=100.0000000,RadiusOfLoc=25.0000000,ReachDistance=45.0000000,IdealRadius=0.0000000,MinFormationRadius=0.0000000,MaxFormationRadius=0.0000000,DistanceErrorBuffer=50.0000000,CostOfDistanceDeltaInsideIdealPerMeter=100.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000,MinFormationHeightDelta=1.0000000,FormationIdealHeightDelta=10.0000000,MaxFormationHeightDelta=20.0000000,HeightErrorBuffer=50.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=50.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInDegrees=10.0000000,IdealPitchInDegrees=10.0000000,MinPitchAllowedInDegrees=0.0000000,PitchErrorBufferInDegrees=5.0000000,CostOfPitchDeltaBelowIdealPerDegree=1.0000000,CostOfPitchDeltaAboveIdealPerDegree=1.0000000,MinRangeFromVsForFlyLocToBeValid=800.0000000,MoveThreshold=100.0000000,RevokeReachTimeTolerance=1.0000000,bRevokeAccessOnLocationChange=false,TestForBlockers=true,TestForLineOfSight=false,LineOfSightRadius=50.0000000,LineOfSightFrequency=2.0000000,bTestRechability=true,SpecialRadius=0.0000000,bTestForGround=true,bAutoPosition=true,MoveConstraintRadiusFactor=0.5000000)
}