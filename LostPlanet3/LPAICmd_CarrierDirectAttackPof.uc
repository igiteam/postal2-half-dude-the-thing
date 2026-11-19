class LPAICmd_CarrierDirectAttackPof extends LPAICmd_LeychAttack within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AnnouncePhaseIn[536870913];

function Pushed()
{
    super.Pushed();
    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = -1.0000000;
    Outer.CarrierPawn.PutMainCoreInInvulnerablePosition();
    AnnouncePhaseIn = 0;
    Outer.CarrierPawn.PlayRateForTransitionComponent = Outer.CarrierPawn.TuneDataCarrier.DirectAttackStateMaxSpeedScale.GetValue();
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x70
    if(((AnnouncePhaseIn > 0) && AnnouncePhaseIn < 4) && Outer.CarrierPawn.Health > 0)
    {
        EndAnnounceSpecialMove();
    }
    Outer.LastTimeEndedDirrectAttack = Outer.WorldInfo.TimeSeconds;
    Outer.CarrierPawn.PlayRateForTransitionComponent = Outer.CarrierPawn.TuneDataCarrier.NormalMaxSpeedScale_Tunable.GetValue();
    Outer.SetCurrentCarrierMacroCombatState(2);
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.CarrierPawn.PlayRateForTransitionComponent = Outer.CarrierPawn.TuneDataCarrier.DirectAttackStateMaxSpeedScale.GetValue();
    //return;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsValidGrenadeAssistTargetDurringAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3C
    if(!Outer.CarrierPawn.DoesHaveVulnerableCellsOnSide())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3C
    if(!Outer.CarrierPawn.DoesHaveVulnerableCellsOnSide())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeMoveCloserToTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(EnemyForAttack == none)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x24
    if(EnemyForAttack == none)
    {        
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1ED
    if(Outer.CarrierPawn != none)
    {
        // End:0xDA
        if((int(Outer.CurrentCarrierStrikeAttempting) == int(2)) || int(Outer.CurrentCarrierStrikeAttempting) == int(3))
        {
            return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartKnockdownStrikePof.GetValue();            
        }
        else
        {
            // End:0x165
            if(int(Outer.CurrentCarrierStrikeAttempting) == int(4))
            {
                return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePof.GetValue();                
            }
            else
            {
                // End:0x1ED
                if(int(Outer.CurrentCarrierStrikeAttempting) == int(8))
                {
                    return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikePof.GetValue();
                }
            }
        }
    }
    return 200.0000000;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if((EnemyForAttack != none) && !Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IfNeededChoosePreMoveInStrikeToAttempt()
{
    Outer.CurrentCarrierStrikeAttempting = PickAttack();
    //return;    
}

function IfNeededChooseInStrikeLoopPreMoveInStrikeToAttempt()
{
    Outer.CurrentCarrierStrikeAttempting = PickAttack();
    //return;    
}

function PickAttack()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TotalWeight, RandWeight;

    TotalWeight = Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_Sweep;
    TotalWeight += Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_PushAway;
    TotalWeight += Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_Flurry;
    RandWeight = RandRange(0.0000000, TotalWeight);
    // End:0x19E
    if(RandWeight < Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_Sweep)
    {
        // End:0x198
        if(Outer.bLastPofKnockDownStrikeFromRight)
        {
            return 2;            
        }
        else
        {
            return 3;
        }        
    }
    else
    {
        // End:0x244
        if(RandWeight < (Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_PushAway + Outer.CarrierPawn.TuneDataCarrier.DirectAttackWeight_Sweep))
        {
            return 8;            
        }
        else
        {
            return 4;
        }
    }
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    // End:0x82
    if((int(Outer.CurrentCarrierStrikeAttempting) == int(2)) || int(Outer.CurrentCarrierStrikeAttempting) == int(3))
    {
        Outer.CmdCarrierTalonSweepStrikePof(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0xD9
        if(int(Outer.CurrentCarrierStrikeAttempting) == int(4))
        {
            Outer.CmdCarrierTalonFlurryStrikePof(EnemyForAttack,, 1);            
        }
        else
        {
            // End:0x12D
            if(int(Outer.CurrentCarrierStrikeAttempting) == int(8))
            {
                Outer.CmdCarrierPushBackStrikePof(EnemyForAttack,, 1);
            }
        }
    }
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3C
    if(!Outer.CarrierPawn.DoesHaveVulnerableCellsOnSide())
    {
        return false;
    }
    // End:0x60
    if(Outer.bJustPerformedTauntRightOutOfStrike)
    {
        return false;
    }
    // End:0xC5
    if(RandRange(0.0000000, 100.0000000) >= float(Outer.CarrierPawn.TuneDataCarrier.DirectAttack_PercentChanceToTaunt))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4D
    if(!Outer.CarrierPawn.DoesHaveVulnerableCellsOnSide() || !IsMyEnemyAlive())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierShortWaitBetweenStrikes';
    //return ReturnValue;    
}

function StartAnnounceSpecialMove()
{
    AnnouncePhaseIn = 1;
    bShouldUseShortAnnounce = false;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierAnnounceStart', true, true, On_LPSM_AttackAnnounce_Finished);
    //return;    
}

function EndAnnounceSpecialMove()
{
    // End:0x5E
    if(AnnouncePhaseIn == 1)
    {
        AnnouncePhaseIn = -1;
        Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierAnnounceStart');        
    }
    else
    {
        // End:0xBD
        if(AnnouncePhaseIn == 2)
        {
            AnnouncePhaseIn = -1;
            Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierAnnounceLoop');            
        }
        else
        {
            // End:0x119
            if(AnnouncePhaseIn == 3)
            {
                AnnouncePhaseIn = -1;
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierAnnounceEnd');
            }
        }
    }
    //return;    
}

function On_LPSM_AttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;
    local /*0x97E50000-0x00000000*/ private float DurationOfPofDirectAttackAnnounceLoop;

    // End:0xF2
    if(AnnouncePhaseIn == 1)
    {
        DurationOfPofDirectAttackAnnounceLoop = Outer.CarrierPawn.TuneDataCarrier.DurationOfPofDirectAttackAnnounceLoop.GetValue();
        AnnouncePhaseIn = 2;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierAnnounceLoop', true, true);
        Outer.SetTimer(DurationOfPofDirectAttackAnnounceLoop, false, 'NotifyLoopingAttackAnnouncePhaseNeesToFinish', self);
        return;
    }
    //return;    
}

function NotifyLoopingAttackAnnouncePhaseNeesToFinish()
{
    // End:0xAA
    if(AnnouncePhaseIn == 2)
    {
        Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierAnnounceLoop');
        AnnouncePhaseIn = 3;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierAnnounceEnd', true, true, On_LPSM_AttackAnnounceEnd_Finished);
    }
    //return;    
}

function On_LPSM_AttackAnnounceEnd_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x28
    if(AnnouncePhaseIn == 3)
    {
        AnnouncePhaseIn = 4;
        bPerformingAnnounce = false;
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2AD
    if(((Outer.CarrierPawn != none) && HitCoreIndex > 0) && HitCoreIndex < Outer.CarrierPawn.MyCoreData.Length)
    {
        // End:0x2AD
        if((Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID != 1) && Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID != 0)
        {
            AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
            // End:0x244
            if(Outer.CarrierPawn.MyCoreData.Length >= HitCoreIndex)
            {
                // End:0x244
                if(Outer.CarrierPawn.IsThisCoreAStickGrenadeToCore(Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
                {
                    // End:0x244
                    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                    {
                        bTookGrenadeInMouth = true;
                        AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
                        bGettingKnockedDown = false;
                    }
                }
            }
            // End:0x29E
            if(((AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack) && !Outer.bRetreatingToMeleePoint) && !bTookGrenadeInMouth)
            {
                bGettingKnockedDown = true;
            }
            // End:0x2AD
            if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange())
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bTookGrenadeInMouth)
    {
        return false;
    }
    // End:0x130
    if((AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack) && !bGettingKnockedDown)
    {
        // End:0x5B
        if(Outer.bRetreatingToMeleePoint)
        {
            return true;
        }
        NumOfAttemptsToFindWithDrawPointThisAttack = 0;
        AbortAnyRunningChildCommand();
        // End:0x113
        if(bPerformingAnnounce)
        {
            // End:0xCA
            if(bShouldUseShortAnnounce)
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTauntLower');                
            }
            else
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTauntLower');
            }
            bPerformingAnnounce = false;
        }
        StartTryingToFindingWithDrawPoint();
        GotoState('RetreatToMeleePoint');
        return true;        
    }
    else
    {
        // End:0x1FA
        if(bGettingKnockedDown)
        {
            AbortAnyRunningChildCommand();
            // End:0x1EA
            if(bPerformingAnnounce)
            {
                // End:0x1A1
                if(bShouldUseShortAnnounce)
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTauntLower');                    
                }
                else
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTauntLower');
                }
                bPerformingAnnounce = false;
            }
            GotoState('TakeBigShotInTheMouth');
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function On_LPSM_MoveBackToLoiterPosition_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = true;
    //return;    
}

function IsMoveBackToLoiterPositionFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float deltaSinceStartedBackUp;

    // End:0x39
    if(Outer.CarrierPawn.bMoveBackToLoiterPositionFinished)
    {
        return true;
    }
    deltaSinceStartedBackUp = Outer.WorldInfo.TimeSeconds - Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition;
    // End:0xEE
    if(deltaSinceStartedBackUp > Outer.CarrierPawn.MaxTimeToSpendInBackUpSpecialMove)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{DamageAssessment:

    Outer.LockStrikeAccess(false);
    // End:0x2B7
    if(NeedToPerformDamageAssessment())
    {
        // End:0x73
        if(ShouldTurnToFaceFocusBeforeDamageAssessment())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        CurDamageAssessmentCmd = Outer.CmdPerformTauntPof(EnemyForAttack, Outer.CarrierPawn.TuneDataCarrier.MinTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.DamageAmountToCauseEndOfTaunt.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MinDistanceAwayForReactiveTaunt.GetValue(), false,, 1);
        CurDamageAssessmentCmd = none;
        Outer.Focus = EnemyForAttack;
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x2B4
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
        {
            Outer.EnableAnnounceEffects(true);
            IfNeededChoosePreMoveInStrikeToAttempt();
            goto 'MoveCloserToTarget';
        }        
    }
    else
    {
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x317
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
        {
            Outer.EnableAnnounceEffects(true);
            IfNeededChoosePreMoveInStrikeToAttempt();
            goto 'MoveCloserToTarget';
        }
    }
    goto 'EndCommand';
    stop;            
}

state RetreatToMeleePoint
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x169
    if(Outer.CarrierPawn.TuneDataCarrier.bBackUpWhenDirectAttackFinished)
    {
        Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
        Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = Outer.WorldInfo.TimeSeconds;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierMoveBackToLoiterPosition', true, true, On_LPSM_MoveBackToLoiterPosition_Finished);
        J0x13A:

        // End:0x169 [Loop If]
        if(!IsMoveBackToLoiterPositionFinished())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x13A;
        }
    }
    Outer.PopCommand(self);
    stop;            
}

state TakeBigShotInTheMouth
{
    ignores BeginState, PushedState, PoppedState, EndState;

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.CmdTakeBigShotInTheMouth(EnemyForAttack,, 1);
    StartTryingToFindingWithDrawPoint();
    GotoState('RetreatToMeleePoint');
    Outer.PopCommand(self);
    stop;                    
}
