class LPAIResSurroundFlyFormation extends SPAIResGroupFlyLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const LPAIResSurroundFlyFormation_UpdateFrequency = 1.0;
const LPAIResSurroundFlyFormation_UpdateFlyLocFlgFrequency = 0.33;

struct native FlyContentClassInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PawnClassName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ControllerClassName;

    structdefaultproperties
    {
        PawnClassName="None"
        ControllerClassName="None"
    }
};

struct native InvalidLocFlagStamp
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UserMarkingInvalid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundNotViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToRemoveFoundNotViableStamp;

    structdefaultproperties
    {
        UserMarkingInvalid=none
        LastTimeFoundNotViable=0.0000000
        TimeToRemoveFoundNotViableStamp=0.0000000
    }
};

struct native FlyFormationPosition
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Resource;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocOfFlyPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChanged;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToUnflagNoPathFound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ListOfPathInvalidLocFlagStamps;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToUnflagFoundNotCombatViable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ListOfCombatInvalidLocFlagStamps;

    structdefaultproperties
    {
        Resource=none
        LocOfFlyPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bValid=true
        bChanged=false
        bNoPathFound=false
        LastTimeNoPathFound=-1.0000000
        TimeToUnflagNoPathFound=-1.0000000
        ListOfPathInvalidLocFlagStamps=none
        bFoundNotCombatViable=false
        LastTimeFoundNotCombatViable=-1.0000000
        TimeToUnflagFoundNotCombatViable=-1.0000000
        ListOfCombatInvalidLocFlagStamps=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxInFormation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumberPerOrbitSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentOfUsersRequiredToMarkLocNotCombatViable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NumberOfUsersRequiredToMarkLocNotPathViable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfExplorerSectors[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FlyFormationExplorer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastExploreOrigin[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ContentClasses[537001985];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentContentClasses[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FlyFormationPositions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsExploring[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewFlyPositionsAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFormationInvalidNeedToRebuild[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool TraversalRender[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool FormationBlockCheckEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsFormationBlocked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDrawForamtionExplorer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumPositionsAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextUpdateTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMinRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultIdealRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrequencyOfFormationBlockCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckDisableTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckMaxTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckFrequency[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckNextTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SectorsPerAttackerFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextFlyFormationPositionFlagUpdateTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultDelayTimeToTurnNoPathFoundFlagOff[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultDelayTimeToTurnFoundNotCombatViableFlagOff[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovementBufferBeforeRequireReexploration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovementBufferBeforeRequireReexplorationSq;

// Export ULPAIResSurroundFlyFormation::execGetBestFlyPositionForResource(FFrame&, void* const)
native final function GetBestFlyPositionForResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewFlyLocRes[8388609], Requester;
    local /*0x97E50000-0x00000000*/ private int outBest[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL RequesterCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execGetBestFlyPositionForUser(FFrame&, void* const)
native final function GetBestFlyPositionForUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResUser[8388609], CtrlToLogOn;
    local /*0x97E50000-0x00000000*/ private int outBest[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execIsThisFlyFormationPositionValidForNewUser(FFrame&, void* const)
native final function IsThisFlyFormationPositionValidForNewUser()
{
    local /*0x97E50000-0x00000000*/ private int FlyPosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserToTestFor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTestForCombatViable[8388609];
    local /*0x97E50000-0x00000000*/ private int bNotValidForAtkVal[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL RequesterCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execHasThisUserAlreadyFlaggedThisFlyFormationPositionForNoPathFound(FFrame&, void* const)
native final function HasThisUserAlreadyFlaggedThisFlyFormationPositionForNoPathFound()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserTestingForFlag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execTestIfFlyFormationPositionShouldBeFlaggedForFoundNotPathViable(FFrame&, void* const)
native final function TestIfFlyFormationPositionShouldBeFlaggedForFoundNotPathViable()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserSettingFlag[8388609], AIResLocation;
    local /*0x97E50000-0x00000000*/ private float DelayBeforeUnflagging[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execGetDelayBeforeUnflaggingToUse(FFrame&, void* const)
native final function GetDelayBeforeUnflaggingToUse()
{
    local /*0x97E50000-0x00000000*/ private float PassedInDelayBeforeUnflagging[8388609], DefaultFromTuneDataDelayTimeToTurnNotViableFlagOff, ReturnValue;


}

// Export ULPAIResSurroundFlyFormation::execNotifyNoPathToFlyLocationByIndex(FFrame&, void* const)
native final function NotifyNoPathToFlyLocationByIndex()
{
    local /*0x97E50000-0x00000000*/ private int FlyPosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserSettingFlag[8388609], CtrlToLogOn;
    local /*0x97E50000-0x00000000*/ private float DelayBeforeUnflagging[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -2.0000000                        
}

// Export ULPAIResSurroundFlyFormation::execHandlePossibilityFormationInvalidAndNeedsRebuilt(FFrame&, void* const)
native final function HandlePossibilityFormationInvalidAndNeedsRebuilt()
{
    local /*0x97E50000-0x00000000*/ private @NULL CtrlToLogOn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execIsThisOrbitSlotLocationStillValid(FFrame&, void* const)
native final function IsThisOrbitSlotLocationStillValid()
{
    local /*0x97E50000-0x00000000*/ private int FlyPosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ActorTestingAgainst[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceErrorBuffer[9437185], HeightErrorBuffer, PitchErrorBufferInDegrees;
    local /*0x97E50000-0x00000000*/ private @NULL CtrlToLogOn[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    -1.0000000
    -1.0000000                                    
}

// Export ULPAIResSurroundFlyFormation::execIsThisLocationInGoodOrbitLocForThisTarget(FFrame&, void* const)
native final function IsThisLocationInGoodOrbitLocForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocToUseAsTargetsLoc[25296897], ActorTestingAgainst;
    local /*0x97E50000-0x00000000*/ private float DistanceErrorBuffer[9437185], HeightErrorBuffer, PitchErrorBufferInDegrees;
    local /*0x97E50000-0x00000000*/ private @NULL CtrlToLogOn[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    -1.0000000
    -1.0000000                                    
}

// Export ULPAIResSurroundFlyFormation::execUpdate(FFrame&, void* const)
native function Update();

// Export ULPAIResSurroundFlyFormation::execGetAccessForNewUser(FFrame&, void* const)
native function GetAccessForNewUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000                
}

// Export ULPAIResSurroundFlyFormation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResSurroundFlyFormation::execIsAllowedAccess(FFrame&, void* const)
protected native function IsAllowedAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFlyFormation::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super.Init();
    bIsExploring = false;
    bFormationInvalidNeedToRebuild = false;
    NextUpdateTime = Outer.GetTimeSeconds() + 0.1000000;
    NextFlyFormationPositionFlagUpdateTime = Outer.GetTimeSeconds() + 0.1000000;
    //return;    
}

function BeginPlay()
{
    super(SPAIResourceGroup).BeginPlay();
    //return;    
}

function Destroy()
{
    super(SPAIResourceGroup).Destroy();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    RemoveAllResources();
    ClearOutAllFlyFormationPositions();
    // End:0x82
    if(FlyFormationExplorer != none)
    {
        FlyFormationExplorer.AbortExploration();
        FlyFormationExplorer.Destroy();
        FlyFormationExplorer = none;
        bIsExploring = false;
    }
    bStarted = false;
    //return;    
}

function ClearOutAllFlyFormationPositions()
{
    FlyFormationPositions.Length = 0;
    //return;    
}

function FilloutAttributeFromFlyFormData()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewFormationInfo[8388609];

    // End:0xA28
    if(NewFormationInfo != none)
    {
        MaxInFormation = int(NewFormationInfo.MaxAttackers.GetValue());
        // End:0x69
        if(MaxInFormation < 0)
        {
            MaxInFormation = 1;
        }
        // End:0xEA
        if(NewFormationInfo.MaxNumberPerOrbitSlot != none)
        {
            MaxNumberPerOrbitSlot = int(NewFormationInfo.MaxNumberPerOrbitSlot.GetValue());
            // End:0xE7
            if(MaxNumberPerOrbitSlot < 0)
            {
                MaxNumberPerOrbitSlot = 1;
            }            
        }
        else
        {
            MaxNumberPerOrbitSlot = 1;
        }
        // End:0x176
        if(NewFormationInfo.PercentOfUsersRequiredToMarkLocNotCombatViable != none)
        {
            PercentOfUsersRequiredToMarkLocNotCombatViable = NewFormationInfo.PercentOfUsersRequiredToMarkLocNotCombatViable.GetValue();
            // End:0x173
            if(PercentOfUsersRequiredToMarkLocNotCombatViable < float(0))
            {
                MaxNumberPerOrbitSlot = 0;
            }            
        }
        else
        {
            PercentOfUsersRequiredToMarkLocNotCombatViable = 1.0000000;
        }
        // End:0x1EA
        if(NewFormationInfo.NumberOfUsersRequiredToMarkLocNotPathViable != none)
        {
            NumberOfUsersRequiredToMarkLocNotPathViable = NewFormationInfo.NumberOfUsersRequiredToMarkLocNotPathViable.GetValue();            
        }
        else
        {
            NumberOfUsersRequiredToMarkLocNotPathViable = 1.0000000;
        }
        NumberOfExplorerSectors = int(NewFormationInfo.NumberOfExplorerSectors.GetValue());
        // End:0x255
        if(NumberOfExplorerSectors < 4)
        {
            NumberOfExplorerSectors = 4;
        }
        Attributes.IdealRadius = NewFormationInfo.IdealRadius.GetValue() + OuterActorRadius;
        Attributes.MaxFormationRadius = NewFormationInfo.MaxRadius.GetValue() + OuterActorRadius;
        Attributes.MinFormationRadius = NewFormationInfo.MinRadius.GetValue() + OuterActorRadius;
        Attributes.DistanceErrorBuffer = NewFormationInfo.DistanceErrorBuffer.GetValue();
        // End:0x416
        if(Attributes.IdealRadius < (OuterActorRadius * float(3)))
        {
            Attributes.IdealRadius = OuterActorRadius * float(3);
        }
        Attributes.CostOfDistanceDeltaInsideIdealPerMeter = NewFormationInfo.CostOfDistanceDeltaInsideIdealPerMeter.GetValue();
        Attributes.CostOfDistanceDeltaOutsideIdealPerMeter = NewFormationInfo.CostOfDistanceDeltaOutsideIdealPerMeter.GetValue();
        Attributes.FormationIdealHeightDelta = NewFormationInfo.IdealHeightDelta.GetValue();
        Attributes.MaxFormationHeightDelta = NewFormationInfo.MaxHeightDelta.GetValue();
        Attributes.MinFormationHeightDelta = NewFormationInfo.MinHeightDelta.GetValue();
        Attributes.HeightErrorBuffer = NewFormationInfo.HeightErrorBuffer.GetValue();
        Attributes.CostOfHeightDeltaBelowIdealPerMeter = NewFormationInfo.CostOfHeightDeltaBelowIdealPerMeter.GetValue();
        Attributes.CostOfHeightDeltaAboveIdealPerMeter = NewFormationInfo.CostOfHeightDeltaAboveIdealPerMeter.GetValue();
        Attributes.IdealPitchInDegrees = NewFormationInfo.IdealPitchInDegrees.GetValue();
        Attributes.MinPitchAllowedInDegrees = NewFormationInfo.MinPitchAllowedInDegrees.GetValue();
        Attributes.MaxPitchAllowedInDegrees = NewFormationInfo.MaxPitchAllowedInDegrees.GetValue();
        Attributes.PitchErrorBufferInDegrees = NewFormationInfo.PitchErrorBufferInDegrees.GetValue();
        Attributes.CostOfPitchDeltaBelowIdealPerDegree = NewFormationInfo.CostOfPitchDeltaBelowIdealPerDegree.GetValue();
        Attributes.CostOfPitchDeltaAboveIdealPerDegree = NewFormationInfo.CostOfPitchDeltaAboveIdealPerDegree.GetValue();
        Attributes.MinRangeFromVsForFlyLocToBeValid = NewFormationInfo.MinRangeFromVsForFlyLocToBeValid.GetValue();
        Attributes.bUseHeightInsteadOfPitchForEvaluations = NewFormationInfo.bUseHeightInsteadOfPitchForEvaluations;
        Attributes.ReachDistance = NewFormationInfo.ReachDistance;
        DefaultDelayTimeToTurnNoPathFoundFlagOff = NewFormationInfo.DefaultDelayTimeToTurnNoPathFoundFlagOff.GetValue();
        DefaultDelayTimeToTurnFoundNotCombatViableFlagOff = NewFormationInfo.DefaultDelayTimeToTurnFoundNotCombatViableFlagOff.GetValue();
        MovementBufferBeforeRequireReexploration = NewFormationInfo.MovementBufferBeforeRequireReexploration.GetValue();
        MovementBufferBeforeRequireReexplorationSq = MovementBufferBeforeRequireReexploration * MovementBufferBeforeRequireReexploration;        
    }
    //return;    
}

function GiveFollowerFormationSlotLocationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL LeaderGiving[8388609], FollowerAsking, LeadersAccess, ReturnValue, newAccess;

    // End:0xFE
    if(((LeaderGiving != none) && FollowerAsking != none) && LeadersAccess != none)
    {
        // End:0xFE
        if(LeaderGiving.MyAdHocSquadMemberData.CurrentSquadIn == FollowerAsking.MyAdHocSquadMemberData.CurrentSquadIn)
        {
            newAccess = LeadersAccess.GetResource().GetAccess(FollowerAsking.myAIPawn);            
        }
    }
    return newAccess;
    //return ReturnValue;    
}

event AssignResourceToFormationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewFlyLocRes[8388609], Requester, RequesterCtrl;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int bestLocIndex;

    // End:0x72
    if(NewFlyLocRes != none)
    {
        // End:0x60
        if(GetBestFlyPositionForResource(NewFlyLocRes, Requester, bestLocIndex, RequesterCtrl))
        {
            return AddResourceToFormationFlyPosition(bestLocIndex, NewFlyLocRes);            
        }
        else
        {
            // End:0x6F
            if(RequesterCtrl != none)
            {
            }
        }        
    }
    else
    {
        // End:0x81
        if(RequesterCtrl != none)
        {
        }
    }
    return false;
    //return ReturnValue;    
}

event GetNumberFlyFormationPositionsValidForNewUsers()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResUser[8388609], CtrlToLogOn;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, numOfFlyPos, numOfValidFlyPos, bNotValidForAtkVal;

    numOfValidFlyPos = 0;
    numOfFlyPos = FlyFormationPositions.Length;
    iter = 0;
    J0x2A:

    // End:0x8C [Loop If]
    if(iter < numOfFlyPos)
    {
        // End:0x7E
        if(IsThisFlyFormationPositionValidForNewUser(iter, ResUser, true, bNotValidForAtkVal, CtrlToLogOn))
        {
            ++numOfValidFlyPos;
        }
        ++iter;
        // [Loop Continue]
        goto J0x2A;
    }
    return numOfValidFlyPos;
    //return ReturnValue;    
}

function AddResourceToFormationFlyPosition()
{
    local /*0x97E50000-0x00000000*/ private int FlyPosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewFlyRes[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int numOfFlyPos;
    local /*0x97E50000-0x00000000*/ private @NULL curFormFlyPos;

    // End:0x101
    if((NewFlyRes != none) && FlyFormationExplorer != none)
    {
        numOfFlyPos = FlyFormationPositions.Length;
        // End:0x101
        if(FlyPosIndex < numOfFlyPos)
        {
            curFormFlyPos = FlyFormationPositions[FlyPosIndex].LocOfFlyPos;
            NewFlyRes.SetWorldLocation(curFormFlyPos);
            FlyFormationPositions[FlyPosIndex].Resource = NewFlyRes;
            FlyFormationPositions[FlyPosIndex].bChanged = true;
            return true;            
        }
    }
    return false;
    //return ReturnValue;    
}

protected function RemoveResourceFromFlyFormation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609];
    local /*0x97E50000-0x00000000*/ private int iter, numOfFlyPos;

    // End:0x11
    if(AIResLocation == none)
    {
        return;
    }
    numOfFlyPos = FlyFormationPositions.Length;
    iter = 0;
    J0x30:

    // End:0xB1 [Loop If]
    if(iter < numOfFlyPos)
    {
        // End:0xA3
        if(FlyFormationPositions[iter].Resource == AIResLocation)
        {
            FlyFormationPositions[iter].Resource = none;
        }
        ++iter;
        // [Loop Continue]
        goto J0x30;
    }
    //return;    
}

protected function NotifyAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609];

    RemoveResourceFromFlyFormation(AIResLocation);
    Resource.RemoveItem(AIResLocation);    
    //return;    
}

function NotifyFlyLocationAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609], ResAccess, LocUser;

    //return;    
}

function HasThisUserAlreadyFlaggedThisFlyFormationPositionForFoundNotCombatViable()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserTestingForFlag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int numOfUsers;
    local /*0x97E50000-0x00000000*/ private bool bhasFlagged;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL curUser;

    bhasFlagged = false;
    // End:0x142
    if(PosIndex < FlyFormationPositions.Length)
    {
        numOfUsers = FlyFormationPositions[PosIndex].ListOfCombatInvalidLocFlagStamps.Length;
        // End:0x9F
        if(numOfUsers > FlyFormationPositions[PosIndex].Resource.GetMaxUsers())
        {
        }
        iter = 0;
        J0xAA:

        // End:0x142 [Loop If]
        if(iter < numOfUsers)
        {
            curUser = FlyFormationPositions[PosIndex].ListOfCombatInvalidLocFlagStamps[iter].UserMarkingInvalid;
            // End:0x134
            if(curUser == UserTestingForFlag)
            {
                bhasFlagged = true;
                // [Explicit Break]
                goto J0x142;
            }
            ++iter;
            // [Loop Continue]
            goto J0xAA;
        }
    }
    J0x142:

    return bhasFlagged;
    //return ReturnValue;    
}

function TestIfFlyFormationPositionShouldBeFlaggedForFoundNotCombatViable()
{
    local /*0x97E50000-0x00000000*/ private int PosIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UserSettingFlag[8388609], AIResLocation;
    local /*0x97E50000-0x00000000*/ private float DelayBeforeUnflagging[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL newStamp;
    local /*0x97E50000-0x00000000*/ private int numOfMarks, numOfUsers;
    local /*0x97E50000-0x00000000*/ private float perOfUsersMarked;

    // End:0x1F0
    if(PosIndex < FlyFormationPositions.Length)
    {
        // End:0x50
        if(AIResLocation != none)
        {
            numOfUsers = AIResLocation.NumUsers();
        }
        // End:0x1F0
        if(numOfUsers > 0)
        {
            // End:0x184
            if(!HasThisUserAlreadyFlaggedThisFlyFormationPositionForFoundNotCombatViable(PosIndex, UserSettingFlag))
            {
                newStamp.UserMarkingInvalid = UserSettingFlag;
                newStamp.LastTimeFoundNotViable = UserSettingFlag.WorldInfo.TimeSeconds;
                newStamp.TimeToRemoveFoundNotViableStamp = UserSettingFlag.WorldInfo.TimeSeconds + DelayBeforeUnflagging;
                FlyFormationPositions[PosIndex].ListOfCombatInvalidLocFlagStamps.AddItem(newStamp);                
            }
            numOfMarks = FlyFormationPositions[PosIndex].ListOfCombatInvalidLocFlagStamps.Length;
            perOfUsersMarked = float(numOfMarks) / float(numOfUsers);
            // End:0x1F0
            if(perOfUsersMarked >= PercentOfUsersRequiredToMarkLocNotCombatViable)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyFoundNotCombatViable()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609], UserSettingFlag, CtrlToLogOn, AccessThatWillBeingGivenUp;
    local /*0x97E50000-0x00000000*/ private float DelayBeforeUnflagging[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, numOfFlyPos;
    local /*0x97E50000-0x00000000*/ private float delayToUseForUnflagging;

    -2.0000000
    // End:0x1A
    if(AIResLocation == none)
    {
        return false;
    }
    numOfFlyPos = FlyFormationPositions.Length;
    iter = 0;
    J0x39:

    // End:0x225 [Loop If]
    if(iter < numOfFlyPos)
    {
        // End:0x217
        if(FlyFormationPositions[iter].Resource == AIResLocation)
        {
            delayToUseForUnflagging = GetDelayBeforeUnflaggingToUse(DelayBeforeUnflagging, DefaultDelayTimeToTurnFoundNotCombatViableFlagOff);
            // End:0x215
            if(TestIfFlyFormationPositionShouldBeFlaggedForFoundNotCombatViable(iter, UserSettingFlag, AIResLocation, delayToUseForUnflagging))
            {
                FlyFormationPositions[iter].bFoundNotCombatViable = true;
                FlyFormationPositions[iter].LastTimeFoundNotCombatViable = GetOuterActor().WorldInfo.TimeSeconds;
                // End:0x1CB
                if(delayToUseForUnflagging > float(0))
                {
                    FlyFormationPositions[iter].TimeToUnflagFoundNotCombatViable = FlyFormationPositions[iter].LastTimeFoundNotCombatViable + delayToUseForUnflagging;                    
                }
                else
                {
                    FlyFormationPositions[iter].TimeToUnflagFoundNotCombatViable = -1.0000000;
                }
                TellAllOtherUsersForFlyLocationFoundNotCombatViable(AIResLocation, UserSettingFlag);
                return true;
            }
            return false;
        }
        ++iter;
        // [Loop Continue]
        goto J0x39;
    }
    return false;
    //return ReturnValue;    
}

function TellAllOtherUsersForFlyLocationFoundNotCombatViable()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609], UserSettingFlag;
    local /*0x97E50000-0x00000000*/ private int numOfUsers, UserIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize array usersOfLoc;
    local /*0x97E50000-0x00000000*/ private @NULL curAiPawn;

    // End:0x11
    if(AIResLocation == none)
    {
        return;
    }
    AIResLocation.GetAllUsers(usersOfLoc);
    numOfUsers = usersOfLoc.Length;
    UserIdx = 0;
    J0x59:

    // End:0xF2 [Loop If]
    if(UserIdx < numOfUsers)
    {
        curAiPawn = LPAIPawn(usersOfLoc[UserIdx]);
        // End:0xE4
        if(curAiPawn != none)
        {
            // End:0xE4
            if(curAiPawn != UserSettingFlag)
            {
                curAiPawn.NotifyFormationLocationBecomingInvalid(AIResLocation);
            }
        }
        ++UserIdx;
        // [Loop Continue]
        goto J0x59;
    }
    //return;    
}

event NotifyNoPathToFlyLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIResLocation[8388609], UserSettingFlag, CtrlToLogOn;
    local /*0x97E50000-0x00000000*/ private float DelayBeforeUnflagging[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, numOfFlyPos;

    -2.0000000
    // End:0x1A
    if(AIResLocation == none)
    {
        return false;
    }
    numOfFlyPos = FlyFormationPositions.Length;
    iter = 0;
    J0x39:

    // End:0xC1 [Loop If]
    if(iter < numOfFlyPos)
    {
        // End:0xB3
        if(FlyFormationPositions[iter].Resource == AIResLocation)
        {
            return NotifyNoPathToFlyLocationByIndex(iter, UserSettingFlag, CtrlToLogOn, DelayBeforeUnflagging);
        }
        ++iter;
        // [Loop Continue]
        goto J0x39;
    }
    return false;
    //return ReturnValue;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private @NULL AUser, AUserController;

    AUser = Pawn(GetAUser());
    // End:0x54
    if(AUser != none)
    {
        AUserController = AUser.Controller;
    }
    // End:0xB1
    if(AUserController == none)
    {
        AUserController = Controller(Class'SPEngine.SPUtil'.static.GetDefaultObject(CurrentContentClasses.ControllerClassName));
    }
    bCanSee = false;
    // End:0x105
    if(AUserController != none)
    {
        bCanSee = AUserController.LineOfSightTo(TestActor, FromLocation, false);        
    }
    return bCanSee;
    //return ReturnValue;    
}

function SetMaxInFormation()
{
    local /*0x97E50000-0x00000000*/ private int NewMax[8388609];

    // End:0x1A
    if(NewMax < 0)
    {
        NewMax = 0;
    }
    MaxInFormation = NewMax;
    OnParametersChanged();
    //return;    
}

function OnParametersChanged()
{
    RevokeAllAccess();
    RemoveAllResources();
    LastExploreOrigin.X = 0.0000000;
    LastExploreOrigin.Y = 0.0000000;
    LastExploreOrigin.Z = 0.0000000;
    ShutDown();
    //return;    
}

function IsPawnClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(SPPawn(Class'SPEngine.SPUtil'.static.GetDefaultObject(CurrentContentClasses.PawnClassName)) != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function FindValidContentClass()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    CurrentContentClasses.PawnClassName = 'None';
    CurrentContentClasses.ControllerClassName = 'None';
    I = 0;
    J0x57:

    // End:0x1AD [Loop If]
    if(I < ContentClasses.Length)
    {
        // End:0x19F
        if(SPPawn(Class'SPEngine.SPUtil'.static.GetDefaultObject(ContentClasses[I].PawnClassName)) != none)
        {
            // End:0x19F
            if(SPAIController(Class'SPEngine.SPUtil'.static.GetDefaultObject(ContentClasses[I].ControllerClassName)) != none)
            {
                CurrentContentClasses.PawnClassName = ContentClasses[I].PawnClassName;
                CurrentContentClasses.ControllerClassName = ContentClasses[I].ControllerClassName;
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x57;
    }
    return false;
    //return ReturnValue;    
}

protected event ShouldExplore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float changeInFormationOrigin;

    // End:0xAA
    if(!bIsExploring && IsPawnClassLoaded())
    {
        // End:0x39
        if(bFormationInvalidNeedToRebuild)
        {
            bFormationInvalidNeedToRebuild = false;
            return true;
        }
        // End:0x5B
        if((NumPositionsAvailable == 0) || FlyFormationExplorer == none)
        {
            return true;
        }
        changeInFormationOrigin = VSize(LastExploreOrigin - Outer.GetOuterLocation());
        // End:0xAA
        if(changeInFormationOrigin > MovementBufferBeforeRequireReexploration)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function ExplorationFinished()
{
    bNewFlyPositionsAvailable = FlyFormationExplorer.WerePositionsUpdated();
    bIsExploring = false;
    //return;    
}

protected event GetNewFlyPositionsAndUpdate()
{
    local /*0x97E50000-0x00000000*/ private int iter, numOfFlyLocs;
    local /*0x97E50000-0x00000000*/ private @NULL flyLocRes, tempFlyPos, tempPos, pawnForConversion, CtrlToLogOn;

    // End:0x3DF
    if(FlyFormationExplorer != none)
    {
        // End:0x3DF
        if(bNewFlyPositionsAvailable)
        {
            bNewFlyPositionsAvailable = false;
            FlyFormationPositions.Length = 0;
            numOfFlyLocs = FlyFormationExplorer.NumPositions(0);
            NumPositionsAvailable = 0;
            iter = 0;
            J0x74:

            // End:0x253 [Loop If]
            if(iter < numOfFlyLocs)
            {
                FlyFormationExplorer.GetPosition(iter, 0, tempPos);
                tempFlyPos.bValid = true;
                tempFlyPos.Resource = none;
                tempFlyPos.LocOfFlyPos = tempPos;
                tempFlyPos.bNoPathFound = false;
                tempFlyPos.LastTimeNoPathFound = -1.0000000;
                tempFlyPos.TimeToUnflagNoPathFound = -1.0000000;
                tempFlyPos.ListOfPathInvalidLocFlagStamps.Length = 0;
                tempFlyPos.bFoundNotCombatViable = false;
                tempFlyPos.LastTimeFoundNotCombatViable = -1.0000000;
                tempFlyPos.TimeToUnflagFoundNotCombatViable = -1.0000000;
                tempFlyPos.ListOfCombatInvalidLocFlagStamps.Length = 0;
                ++NumPositionsAvailable;
                FlyFormationPositions.AddItem(tempFlyPos);                
                ++iter;
                // [Loop Continue]
                goto J0x74;
            }
            iter = 0;
            J0x25E:

            // End:0x3DF [Loop If]
            if(iter < Resource.Length)
            {
                flyLocRes = SPAIResFlyLocation(Resource[iter]);
                // End:0x3D1
                if(flyLocRes != none)
                {
                    pawnForConversion = LPAIPawn(flyLocRes.GetAUser());
                    // End:0x320
                    if(pawnForConversion != none)
                    {
                        CtrlToLogOn = LPAIController(pawnForConversion.Controller);                        
                    }
                    else
                    {
                        CtrlToLogOn = none;
                    }
                    // End:0x33A
                    if(CtrlToLogOn != none)
                    {
                    }
                    // End:0x3D1
                    if(!AssignResourceToFormationPosition(flyLocRes, pawnForConversion, CtrlToLogOn))
                    {
                        // End:0x373
                        if(CtrlToLogOn != none)
                        {
                        }
                        flyLocRes.RevokeAllAccess();
                        Resource.Remove(iter, 1);                        
                        flyLocRes.Destroy();
                        --iter;
                    }
                }
                ++iter;
                // [Loop Continue]
                goto J0x25E;
            }
        }
    }
    //return;    
}

event StartExploration()
{
    // End:0x20C
    if(MaxInFormation > 0)
    {
        // End:0x61
        if(!IsPawnClassLoaded())
        {
            // End:0x57
            if(FlyFormationExplorer != none)
            {
                FlyFormationExplorer.Destroy();
                FlyFormationExplorer = none;
            }
            FindValidContentClass();
        }
        // End:0x20C
        if(IsPawnClassLoaded())
        {
            // End:0xC2
            if(FlyFormationExplorer == none)
            {
                FlyFormationExplorer = Class'LPSurroundFlyFormationExplorer'.static.CreateFlyFromPawnClassName(CurrentContentClasses.PawnClassName);
            }
            // End:0x20C
            if(FlyFormationExplorer != none)
            {
                FlyFormationExplorer.SetSectors(NumberOfExplorerSectors);
                FlyFormationExplorer.SetFlySearchDistances(Attributes);
                FlyFormationExplorer.SetLosFunction(IsVisible);
                FlyFormationExplorer.SetFinishCallBack(ExplorationFinished);
                LastExploreOrigin = Outer.GetOuterLocation();
                bIsExploring = true;
                bNewFlyPositionsAvailable = false;
                FlyFormationExplorer.StartExploration(Outer.GetResourceManagerOwner());
                bStarted = true;
            }
        }
    }
    //return;    
}

event IsMyLocationInGoodOrbitLocForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorAsking[8388609], ActorTestingAgainst;
    local /*0x97E50000-0x00000000*/ private float DistanceErrorBuffer[9437185], HeightErrorBuffer, PitchErrorBufferInDegrees;
    local /*0x97E50000-0x00000000*/ private @NULL CtrlToLogOn[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    -1.0000000
    -1.0000000    
    // End:0x90
    if(ActorAsking != none)
    {
        // End:0x3A
        if(CtrlToLogOn != none)
        {
        }
        return IsThisLocationInGoodOrbitLocForThisTarget(ActorAsking.Location, ActorTestingAgainst, DistanceErrorBuffer, HeightErrorBuffer, PitchErrorBufferInDegrees, CtrlToLogOn);
    }
    return false;
    //return ReturnValue;    
}

protected event RemoveUnUsedResources()
{
    local /*0x97E50000-0x00000000*/ private int R;
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    R = 0;
    J0x0B:

    // End:0xC5 [Loop If]
    if(R < Resource.Length)
    {
        Res = Resource[R];
        // End:0xB7
        if(Res.GetAUser() == none)
        {
            Res.RevokeAllAccess();
            RemoveResourceFromFlyFormation(Res);
            Resource.Remove(R, 1);            
            --R;
        }
        ++R;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

protected event NotifyUserOfChanges()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private int locIndex;
    local /*0x97E50000-0x00000000*/ private @NULL flyRes;

    false
    locIndex = 0;
    J0x10:

    // End:0xF6 [Loop If]
    if(locIndex < FlyFormationPositions.Length)
    {
        // End:0xE8
        if(bForced || FlyFormationPositions[locIndex].bChanged)
        {
            FlyFormationPositions[locIndex].bChanged = false;
            flyRes = FlyFormationPositions[locIndex].Resource;
            // End:0xE8
            if(flyRes != none)
            {
                flyRes.MarkAsChanged();
            }
        }
        ++locIndex;
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}

protected event UpdateFlyFormationPositionFlags()
{
    local /*0x97E50000-0x00000000*/ private float CurrentTime[8388609];
    local /*0x97E50000-0x00000000*/ private int locIndex, stampIndex;

    locIndex = 0;
    J0x0B:

    // End:0x3F7 [Loop If]
    if(locIndex < FlyFormationPositions.Length)
    {
        // End:0x106
        if(FlyFormationPositions[locIndex].bNoPathFound && FlyFormationPositions[locIndex].TimeToUnflagNoPathFound > float(0))
        {
            // End:0x103
            if(CurrentTime >= FlyFormationPositions[locIndex].TimeToUnflagNoPathFound)
            {
                FlyFormationPositions[locIndex].bNoPathFound = false;
                FlyFormationPositions[locIndex].ListOfPathInvalidLocFlagStamps.Length = 0;
            }            
        }
        else
        {
            // End:0x206
            if(FlyFormationPositions[locIndex].ListOfPathInvalidLocFlagStamps.Length > 0)
            {
                stampIndex = 0;
                J0x13E:

                // End:0x206 [Loop If]
                if(stampIndex < FlyFormationPositions[locIndex].ListOfPathInvalidLocFlagStamps.Length)
                {
                    // End:0x1F8
                    if(CurrentTime >= FlyFormationPositions[locIndex].ListOfPathInvalidLocFlagStamps[stampIndex].TimeToRemoveFoundNotViableStamp)
                    {
                        FlyFormationPositions[locIndex].ListOfPathInvalidLocFlagStamps.Remove(stampIndex--, 1);                        
                    }
                    ++stampIndex;
                    // [Loop Continue]
                    goto J0x13E;
                }
            }
        }
        // End:0x2E9
        if(FlyFormationPositions[locIndex].bFoundNotCombatViable && FlyFormationPositions[locIndex].TimeToUnflagFoundNotCombatViable > float(0))
        {
            // End:0x2E6
            if(CurrentTime >= FlyFormationPositions[locIndex].TimeToUnflagFoundNotCombatViable)
            {
                FlyFormationPositions[locIndex].bFoundNotCombatViable = false;
                FlyFormationPositions[locIndex].ListOfCombatInvalidLocFlagStamps.Length = 0;
            }            
        }
        else
        {
            // End:0x3E9
            if(FlyFormationPositions[locIndex].ListOfCombatInvalidLocFlagStamps.Length > 0)
            {
                stampIndex = 0;
                J0x321:

                // End:0x3E9 [Loop If]
                if(stampIndex < FlyFormationPositions[locIndex].ListOfCombatInvalidLocFlagStamps.Length)
                {
                    // End:0x3DB
                    if(CurrentTime >= FlyFormationPositions[locIndex].ListOfCombatInvalidLocFlagStamps[stampIndex].TimeToRemoveFoundNotViableStamp)
                    {
                        FlyFormationPositions[locIndex].ListOfCombatInvalidLocFlagStamps.Remove(stampIndex--, 1);                        
                    }
                    ++stampIndex;
                    // [Loop Continue]
                    goto J0x321;
                }
            }
        }
        ++locIndex;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    MaxNumberPerOrbitSlot=1
    PercentOfUsersRequiredToMarkLocNotCombatViable=1.0000000
    DefaultDelayTimeToTurnNoPathFoundFlagOff=10.0000000
    DefaultDelayTimeToTurnFoundNotCombatViableFlagOff=5.0000000
    MovementBufferBeforeRequireReexploration=600.0000000
    MovementBufferBeforeRequireReexplorationSq=360000.0000000
}