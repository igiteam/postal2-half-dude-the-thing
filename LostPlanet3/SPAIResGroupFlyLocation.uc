class SPAIResGroupFlyLocation extends SPAIResourceGroup within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attributes;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class GeneratedClass;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bLocationChanged;

// Export USPAIResGroupFlyLocation::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResGroupFlyLocation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

function Init()
{
    super.Init();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    //return;    
}

function InitResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609], ResLocation;

    ResLocation = SPAIResFlyLocation(Res);
    ResLocation.SetAttributesFromGroup(Attributes);
    ResLocation.__NotifyAccessLostDelegate__Delegate = NotifyAccessLost;
    ResLocation.__NotifyChangeLocationDelegate__Delegate = NotifyChangeLocationPrivate;
    ResLocation.__NotifyUnreachableDelegate__Delegate = NotifyUnreachable;
    ResLocation.SetFlyGroupFormation(self);
    super.InitResource(Res);
    //return;    
}

protected function GetWorldPos()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x99 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x8B
        if(Outer.IsValidResource(Resource[I]))
        {
            return SPAIResFlyLocation(Resource[I]).GetFormationCenter();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return super.GetWorldPos();
    //return ReturnValue;    
}

function NotifyFlyLocationAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609], ResAccess, LocUser;

    //return;    
}

protected function NotifyAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    //return;    
}

protected function NotifyUnreachable()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    //return;    
}

protected event NotifyChangeLocation()
{
    //return;    
}

private final function NotifyChangeLocationPrivate()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    bLocationChanged = true;
    //return;    
}

protected event CreateResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689], NewAIResLocation;

    NewAIResLocation = SPAIResFlyLocation(GeneratedClass.static.CreateNew(Outer, UniqueName, MaxUsers));
    // End:0x90
    if(NewAIResLocation != none)
    {
        NewAIResLocation.SetFlyGroupFormation(self);
        AddResource(NewAIResLocation);
    }
    return NewAIResLocation;
    //return ReturnValue;    
}

function AreOtherUsersInStrikePosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL Excluded[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I, J;
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users;
    local /*0x03A30000-0x00000000*/ private @NULL Res;

    I = 0;
    J0x0C:

    // End:0x186 [Loop If]
    if(I < Resource.Length)
    {
        Res = SPAIResFlyLocation(Resource[I]);
        // End:0x178
        if((Res != none) && !Res.IsDestroyed())
        {
            Res.GetAllUsers(Users);
            J = 0;
            J0xB3:

            // End:0x178 [Loop If]
            if(J < Users.Length)
            {
                // End:0x16A
                if((Users[J] != none) && Users[J] != Excluded)
                {
                    // End:0x16A
                    if((Res.GetUserSeperation(Users[J]) == float(0)) && !Res.IsBlcokedByLos(true))
                    {
                        return true;
                    }
                }
                ++J;
                // [Loop Continue]
                goto J0xB3;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0C;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    Attributes=(OverlapPriority=0,HeightOfLoc=100.0000000,RadiusOfLoc=25.0000000,ReachDistance=45.0000000,IdealRadius=0.0000000,MinFormationRadius=0.0000000,MaxFormationRadius=0.0000000,DistanceErrorBuffer=50.0000000,CostOfDistanceDeltaInsideIdealPerMeter=100.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000,MinFormationHeightDelta=1.0000000,FormationIdealHeightDelta=10.0000000,MaxFormationHeightDelta=20.0000000,HeightErrorBuffer=50.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=50.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInDegrees=10.0000000,IdealPitchInDegrees=10.0000000,MinPitchAllowedInDegrees=0.0000000,PitchErrorBufferInDegrees=5.0000000,CostOfPitchDeltaBelowIdealPerDegree=1.0000000,CostOfPitchDeltaAboveIdealPerDegree=1.0000000,MinRangeFromVsForFlyLocToBeValid=800.0000000,MoveThreshold=100.0000000,RevokeReachTimeTolerance=1.0000000,bRevokeAccessOnLocationChange=false,TestForBlockers=true,TestForLineOfSight=false,LineOfSightRadius=50.0000000,LineOfSightFrequency=2.0000000,bTestRechability=true,SpecialRadius=0.0000000,bTestForGround=true,bAutoPosition=true,MoveConstraintRadiusFactor=0.5000000)
    GeneratedClass=Class'SPAIResFlyLocation'
}