class LPAICmd_BasicDamageAssessment extends LPAICommand within LPAIController
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToCareAboutWhileAssessing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OtherActorRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OtherActorHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJumpingBack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAssessingDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRandDelayBeforeStartAssessmentSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeJumpBackStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAssessingDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeOfThisDamageAssessment[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeOfThisDamageAssessment[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalTimeThisDamageAssessmentIsAllowed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FactorToIncreasePawnRadiusByForSeperationBeforeDamAss[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DesiredDamageAssessmentLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AssessmentSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSpeedScaleBeforeJumpBack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentSeperationToEnemySq[536870913];

function Pushed()
{
    super.Pushed();
    bJumpingBack = false;
    bAssessingDamage = false;
    TimeJumpBackStarted = 0.0000000;
    TimeStartedAssessingDamage = 0.0000000;
    TotalTimeThisDamageAssessmentIsAllowed = 5.0000000;
    MinTimeOfThisDamageAssessment = 5.0000000;
    MaxTimeOfThisDamageAssessment = 5.0000000;
    CurrentSeperationToEnemySq = -1.0000000;
    MaxSpeedScaleBeforeJumpBack = Outer.myAIPawn.ReplicatedMaxSpeedScale;
    //return;    
}

function Popped()
{
    Outer.EnableAnnounceEffects(false);
    MoveToPositionCmd = none;
    Outer.myAIPawn.SetMaxSpeedScale(MaxSpeedScaleBeforeJumpBack);
    Outer.myAIPawn.AccelRate = Outer.myAIPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
    GotoState('Finished');
    super.Popped();
    //return;    
}

function SetActorToCareAboutWhileAssessing()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActorToCareAboutWhileAssessing[8388609];

    ActorToCareAboutWhileAssessing = inActorToCareAboutWhileAssessing;
    // End:0xEF
    if(ActorToCareAboutWhileAssessing != none)
    {
        OtherActorRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(ActorToCareAboutWhileAssessing);
        // End:0xB5
        if(Pawn(ActorToCareAboutWhileAssessing) != none)
        {
            OtherActorHeight = Pawn(ActorToCareAboutWhileAssessing).CylinderComponent.CollisionHeight;            
        }
        else
        {
            OtherActorHeight = -1.0000000;
        }
        Outer.Focus = inActorToCareAboutWhileAssessing;        
    }
    else
    {
        OtherActorRadius = -1.0000000;
        OtherActorHeight = -1.0000000;
    }
    //return;    
}

function SetAssessmentSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    AssessmentSpecialMove = InSpecialMove;
    //return;    
}

function GetAssessmentSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return AssessmentSpecialMove;
    //return ReturnValue;    
}

function SetMinTimeOfThisDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609];

    MinTimeOfThisDamageAssessment = InMinTimeOfThisDamageAssessment;
    //return;    
}

function SetMaxTimeOfThisDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDamageAssessment[8388609];

    MaxTimeOfThisDamageAssessment = InMaxTimeOfThisDamageAssessment;
    //return;    
}

function GetDamageAssessmentTurnToFaceEnemySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'SPEngine.SPSpecialMove';
    //return ReturnValue;    
}

function GetJumpBackSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'SPEngine.SPSpecialMove';
    //return ReturnValue;    
}

function IsActorToCareAboutWhileAssessingStillValidForAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x41
    if(Pawn(ActorToCareAboutWhileAssessing) != none)
    {
        return Outer.CanBeMyEnemy(ActorToCareAboutWhileAssessing);
    }
    return true;
    //return ReturnValue;    
}

function HandlePostJumpBackGoingIntoDamAssSpecialMoveEffects()
{
    Outer.EnableAnnounceEffects(true);
    //return;    
}

function HandleEndOfDamAssSpecialMoveEffects()
{
    Outer.EnableAnnounceEffects(true);
    //return;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(Obstacle == Outer.MyLPEnemy)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function On_LPSM_JumpBackBeforeDamageAssessment_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bJumpingBack = false;
    //return;    
}

function On_LPSM_DamageAssessment_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bAssessingDamage = false;
    //return;    
}

function ShouldFocusOnEnemyWhileJumpingBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldDoSpeiclMoveTurnToFaceEnemyAfterJumpBackButBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldDoFastSprintToDamageAssessmentPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasEnemyGottenToCloseDurringAssessmentOrAnnounce()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.super(LPAICmd_BasicDamageAssessment).HasEnemyGottenToCloseDurringAssessmentOrAnnounce(outSepeartionToEnemySq);
    //return ReturnValue;    
}

function HasEnemyGottenToFarAwayDurringAssessment()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    return Outer.super(LPAICmd_BasicDamageAssessment).HasEnemyGottenToFarAwayDurringAssessment(outSepeartionToEnemySq);
    //return ReturnValue;    
}

function GetDistanceToFromEnemyBeforeAssessment()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], calculatedSeperationAfterMovement;

    calculatedSeperationAfterMovement = (Outer.myAIPawn.TuneDataAIPawn.AttemptedSeperationFromEnemyBeforeDamageAssessment + Outer.MyKynapseRadius) + OtherActorRadius;
    // End:0xD3
    if(calculatedSeperationAfterMovement < Outer.myAIPawn.TuneDataAIPawn.MinRangeToAllowDamageAssessmentOrAnnounceToPerformOrContinue)
    {
    }
    return Outer.myAIPawn.TuneDataAIPawn.AttemptedSeperationFromEnemyBeforeDamageAssessment;
    //return ReturnValue;    
}

function CalculateSeperationPointForDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToWithDrawPoint;
    local /*0x97E50000-0x00000000*/ private float distanceAwayTheWithdrawPointShouldBe;

    displacementToWithDrawPoint = Outer.myAIPawn.Location - Outer.MyLPEnemy.Location;
    displacementToWithDrawPoint = Normal(displacementToWithDrawPoint);
    displacementToWithDrawPoint.Z = 0.0000000;
    distanceAwayTheWithdrawPointShouldBe = ((GetDistanceToFromEnemyBeforeAssessment()) + (Outer.MyKynapseRadius * FactorToIncreasePawnRadiusByForSeperationBeforeDamAss)) + (OtherActorRadius * FactorToIncreasePawnRadiusByForSeperationBeforeDamAss);
    displacementToWithDrawPoint = displacementToWithDrawPoint * distanceAwayTheWithdrawPointShouldBe;
    DesiredDamageAssessmentLocation = displacementToWithDrawPoint + Outer.MyLPEnemy.Location;
    // End:0x191
    if(Outer.IsDestinationInsideAiMesh(DesiredDamageAssessmentLocation))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function FakeJumpBackByMovingAccelerationRateToUse()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.myAIPawn.TuneDataAIPawn.AccelRateWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss;
    //return ReturnValue;    
}

function FakeJumpBackByMovingSpeedScaleToUse()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    MaxSpeedScaleBeforeJumpBack = Outer.myAIPawn.ReplicatedMaxSpeedScale;
    return Outer.myAIPawn.TuneDataAIPawn.MaxSpeedScaleWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss;
    //return ReturnValue;    
}

function FakeJumpBackByMoving()
{
    local /*0x97E50000-0x00000000*/ private float distanceFromDesiredSeperationPoint;

    // End:0x3E3
    if(CalculateSeperationPointForDamageAssessment())
    {
        distanceFromDesiredSeperationPoint = VSize(DesiredDamageAssessmentLocation - Outer.myAIPawn.Location);
        // End:0x3E3
        if(distanceFromDesiredSeperationPoint > Outer.myAIPawn.TuneDataAIPawn.MinDistanceAwayFromSeperationPointForDamAssBeforeDoingMovement)
        {
            // End:0x175
            if(Outer.myAIPawn.TuneDataAIPawn.bUseDifferentSpeedScaleAndAccelerationWhenSeparatingFromEnemyAfterStrikeAndBeforeDamAss)
            {
                Outer.myAIPawn.AccelRate = FakeJumpBackByMovingAccelerationRateToUse();
                Outer.myAIPawn.SetMaxSpeedScale(FakeJumpBackByMovingSpeedScaleToUse());
            }
            // End:0x1C2
            if(ShouldFocusOnEnemyWhileJumpingBackBeforeDamageAssessment())
            {
                Outer.Focus = Outer.MyLPEnemy;                
            }
            else
            {
                Outer.Focus = none;
            }
            MoveToPositionCmd = Outer.CmdMoveToPosition(DesiredDamageAssessmentLocation,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfFakeJumpBackBeforeDamAss);
            MoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
            MoveToPositionCmd.bZeroVelocityOnFinish = true;
            MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartSeparatingFromEnemyAfterStrikeAndBeforeDamAssBeforeMonitorStarts, NotifyOfFailedSeparationFromEnemyAfterStrikeAndBeforeDamAss);            
        }
    }
    //return;    
}

function NotifyOfFailedSeparationFromEnemyAfterStrikeAndBeforeDamAss()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

function MaxDelayBeforeStartAssessmentSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function GetMaxTimeForJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 5.0000000;
    //return ReturnValue;    
}

function GetTotalTimeThisDamageAssessmentIsAllowed()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TotalTimeThisDamageAssessmentIsAllowed;
    //return ReturnValue;    
}

function DetermineTotalTimeThisDamageAssessmentIsAllowed()
{
    TotalTimeThisDamageAssessmentIsAllowed = RandRange(MinTimeOfThisDamageAssessment, MaxTimeOfThisDamageAssessment);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x4E
        if((GetJumpBackSpecialMove()) != none)
        {
            Outer.myAIPawn.EndSpecialMove(GetJumpBackSpecialMove());
        }
        // End:0x9C
        if((GetAssessmentSpecialMove()) != none)
        {
            Outer.myAIPawn.EndSpecialMove(GetAssessmentSpecialMove());
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function IsJumpBackFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x11
        if(!bJumpingBack)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeJumpBackStarted;
        // End:0x73
        if(durationOfAction > (GetMaxTimeForJumpBackBeforeDamageAssessment()))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function IsDamagedAssessmentFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x11
        if(!bAssessingDamage)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAssessingDamage;
        // End:0x73
        if(durationOfAction > (GetTotalTimeThisDamageAssessmentIsAllowed()))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    DetermineTotalTimeThisDamageAssessmentIsAllowed();
JumpBack:


    bJumpingBack = true;
    TimeJumpBackStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = none;
    // End:0x104
    if(ShouldJumpBackBeforeDamageAssessment())
    {
        Outer.myAIPawn.DoSpecialMove(GetJumpBackSpecialMove(), true, true, On_LPSM_JumpBackBeforeDamageAssessment_Finished);
        J0xD2:

        // End:0x101 [Loop If]
        if(!IsJumpBackFinished())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xD2;
        }        
    }
    else
    {
        // End:0x11E
        if(ShouldDoFastSprintToDamageAssessmentPosition())
        {
            FakeJumpBackByMoving();            
        }
    }
    J0x11E:

    // End:0x175
    if(ShouldDoSpeiclMoveTurnToFaceEnemyAfterJumpBackButBeforeDamageAssessment())
    {
        Outer.Focus = none;
        Outer.CmdSnapTurn(GetDamageAssessmentTurnToFaceEnemySpecialMove());
    }
    goto 'DamageAssessment';
DamageAssessment:


    Outer.myAIPawn.SetMaxSpeedScale(MaxSpeedScaleBeforeJumpBack);
    Outer.myAIPawn.AccelRate = Outer.myAIPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
    // End:0x44F
    if(!HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
    {
        HandlePostJumpBackGoingIntoDamAssSpecialMoveEffects();
        bAssessingDamage = true;
        Outer.Focus = Outer.MyLPEnemy;
        TimeStartedAssessingDamage = Outer.WorldInfo.TimeSeconds;
        // End:0x38B
        if((GetAssessmentSpecialMove()) != none)
        {
            // End:0x339
            if(bRandDelayBeforeStartAssessmentSpecialMove)
            {
                Outer.Sleep(FRand() * (MaxDelayBeforeStartAssessmentSpecialMove()));
            }
            Outer.myAIPawn.DoSpecialMove(GetAssessmentSpecialMove(), true, true, On_LPSM_DamageAssessment_Finished);
        }
        J0x38B:

        // End:0x44C [Loop If]
        if(!IsDamagedAssessmentFinished())
        {
            // End:0x42C
            if((HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq)) || HasEnemyGottenToFarAwayDurringAssessment(CurrentSeperationToEnemySq))
            {
                // End:0x422
                if((GetAssessmentSpecialMove()) != none)
                {
                    bAssessingDamage = false;
                    Outer.myAIPawn.EndSpecialMove(GetAssessmentSpecialMove());
                }
                goto 'EndCommand';
            }
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x38B;
        }        
    }
    J0x44F:

    HandleEndOfDamAssSpecialMoveEffects();
    GotoState('Finished');
    stop;                    
}

state Finished
{Begin:

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    FactorToIncreasePawnRadiusByForSeperationBeforeDamAss=1.2000000
}