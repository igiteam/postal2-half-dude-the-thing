class SPAIResMultiLocation extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native SPAIResMultiLocationAttributes
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float Radius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float Height;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MinFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float FormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxFormationRadius;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MoveConstraintRadiusFactor;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RevokeReachTimeTolerance;

    structdefaultproperties
    {
        Radius=0.0000000
        Height=0.0000000
        MinFormationRadius=0.0000000
        FormationRadius=0.0000000
        MaxFormationRadius=0.0000000
        MoveConstraintRadiusFactor=0.5000000
        RevokeReachTimeTolerance=1.0000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array WorldPosition;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attribute;

// Export USPAIResMultiLocation::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResMultiLocation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResMultiLocation::execGetWorldPositions(FFrame&, void* const)
native function GetWorldPositions()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array Position[25165825];


}

// Export USPAIResMultiLocation::execAddLocation(FFrame&, void* const)
native function AddLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewLocation[25296897];


}

// Export USPAIResMultiLocation::execClearLocations(FFrame&, void* const)
native function ClearLocations();

// Export USPAIResMultiLocation::execGetWorldPos(FFrame&, void* const)
protected native function GetWorldPos()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResMultiLocation::execGetNearestWorldPosition(FFrame&, void* const)
native function GetNearestWorldPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL InPos[25296897], ReturnValue;


}

// Export USPAIResMultiLocation::execGetNearestWorldPositionIndex(FFrame&, void* const)
native function GetNearestWorldPositionIndex()
{
    local /*0x03A30000-0x00000000*/ private @NULL InPos[25296897];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

function Init()
{
    super.Init();
    //return;    
}

// Export USPAIResMultiLocation::execGetUserSeperation(FFrame&, void* const)
native final function GetUserSeperation()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResMultiLocation::execGetUserSeperationStatic(FFrame&, void* const)
protected native static final function GetUserSeperationStatic()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float Radius[8388609], Height;
    local /*0x03A30000-0x00000000*/ private @NULL InWorldPos[25296897];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResMultiLocation::execGetUserReachTime(FFrame&, void* const)
protected native event GetUserReachTime()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResMultiLocation::execGetUserReachTimeForRating(FFrame&, void* const)
native event GetUserReachTimeForRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResMultiLocation::execSetSortKey(FFrame&, void* const)
native function SetSortKey()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResMultiLocation::execFindUserThatCanBeRevokedInFavourOf(FFrame&, void* const)
protected native event FindUserThatCanBeRevokedInFavourOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;


}

// Export USPAIResMultiLocation::execGetRevokeRating(FFrame&, void* const)
protected native event GetRevokeRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609], Requester;
    local /*0x03A30000-0x00000000*/ private float UserRevokeTimeTolerance[8388609], RequesterReachTime, ReturnValue;


}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private float MaxRadius, CandidateRadius;

    MaxRadius = 0.0000000;
    OutLocation = GetWorldPos();
    I = 0;
    J0x2E:

    // End:0xC6 [Loop If]
    if(I < WorldPosition.Length)
    {
        CandidateRadius = VSize(WorldPosition[I] - OutLocation) + Attribute.Radius;
        // End:0xB8
        if(CandidateRadius > MaxRadius)
        {
            MaxRadius = CandidateRadius;
        }
        ++I;
        // [Loop Continue]
        goto J0x2E;
    }
    OutRadius = MaxRadius;
    //return;    
}

function GetWorldPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x2C
    if(WorldPosition.Length > 0)
    {
        return WorldPosition[WorldPosition.Length / 2];        
    }
    else
    {
        return GetFormationCenter();
    }
    //return ReturnValue;    
}

function NumPositions()
{
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];

    return WorldPosition.Length;
    //return ReturnValue;    
}

function GetPosition()
{
    local /*0x03A30000-0x00000000*/ private int Index[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return WorldPosition[Index];
    //return ReturnValue;    
}

function HasPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL InPos[25296897];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return VSizeSq((GetNearestWorldPosition(InPos)) - InPos) <= (Attribute.Radius * Attribute.Radius);
    //return ReturnValue;    
}

function ReachDistance()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Attribute.Radius;
    //return ReturnValue;    
}

event GetFormationCenter()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.GetOuterLocation();
    //return ReturnValue;    
}

event GetFormationRadius()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Attribute.FormationRadius;
    //return ReturnValue;    
}

event GetFormationMoveConstraintRadius()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Attribute.FormationRadius * Attribute.MoveConstraintRadiusFactor;
    //return ReturnValue;    
}

function SetAttributesFromGroup()
{
    local /*0x03A30000-0x00000000*/ private @NULL InAttribute[25296897];

    Attribute = InAttribute;
    //return;    
}

function MarkAsChanged()
{
    NotifyAIResourceChanged();
    //return;    
}

function GetFarthestIndexFromPoint()
{
    local /*0x03A30000-0x00000000*/ private @NULL InPoint[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689], Idx, FarthestIdx;
    local /*0x03A30000-0x00000000*/ private float DistanceSQ, FarthestDistanceSQ;
    local /*0x03A30000-0x00000000*/ private @NULL Delta;

    FarthestIdx = -1;
    Idx = 0;
    J0x1A:

    // End:0xCF [Loop If]
    if(Idx < WorldPosition.Length)
    {
        Delta = WorldPosition[Idx] - InPoint;
        DistanceSQ = VSizeSq(Delta);
        // End:0xC1
        if((FarthestIdx == -1) || DistanceSQ > FarthestDistanceSQ)
        {
            FarthestIdx = Idx;
            FarthestDistanceSQ = DistanceSQ;
        }
        Idx++;
        // [Loop Continue]
        goto J0x1A;
    }
    return FarthestIdx;
    //return ReturnValue;    
}

function HandleSequenceAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], OverrideFormationRadius;

    OverrideFormationRadius = SPSeqAct_OverrideFormationRadius(inAction);
    // End:0x3E
    if(OverrideFormationRadius != none)
    {
        OnOverrideFormationRadius(OverrideFormationRadius);
    }
    //return;    
}

function OnOverrideFormationRadius()
{
    local /*0x03A30000-0x00000000*/ private @NULL OverrideFormationRadius[8388609];

    // End:0x24C
    if(OverrideFormationRadius != none)
    {
        // End:0x12F
        if(int(OverrideFormationRadius.Mode) == int(0))
        {
            Attribute.MinFormationRadius = OverrideFormationRadius.Override.MinRadius;
            Attribute.FormationRadius = OverrideFormationRadius.Override.IdealRadius;
            Attribute.MaxFormationRadius = OverrideFormationRadius.Override.MaxRadius;
            RevokeAllAccess();            
        }
        else
        {
            // End:0x24C
            if(int(OverrideFormationRadius.Mode) == int(1))
            {
                Attribute.MinFormationRadius = default.Class.default.Attribute.MinFormationRadius;
                Attribute.FormationRadius = default.Class.default.Attribute.FormationRadius;
                Attribute.MaxFormationRadius = default.Class.default.Attribute.MaxFormationRadius;
                RevokeAllAccess();
            }
        }
    }
    //return;    
}

function IsInFront()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorToSeeIfResourceIsInFrontOf[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL positionToTest, dirToOtherVector;

    positionToTest = GetNearestWorldPosition(ActorToSeeIfResourceIsInFrontOf.Location);
    dirToOtherVector = positionToTest - ActorToSeeIfResourceIsInFrontOf.Location;
    // End:0x9A
    if((Vector(ActorToSeeIfResourceIsInFrontOf.Rotation) Dot dirToOtherVector) > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    Attribute=(Radius=0.0000000,Height=0.0000000,MinFormationRadius=0.0000000,FormationRadius=0.0000000,MaxFormationRadius=0.0000000,MoveConstraintRadiusFactor=0.5000000,RevokeReachTimeTolerance=1.0000000)
}