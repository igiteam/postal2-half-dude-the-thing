class LPAICmd_CarrierBerserkAttackPof extends LPAICmd_LeychAttack within LPAIControllerCarrier;

function Pushed()
{
    super.Pushed();
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataCarrier.BerserkStateMaxSpeedScale.GetValue());
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.LastTimeEndedDirrectAttack = Outer.WorldInfo.TimeSeconds;
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataCarrier.NormalMaxSpeedScale_Tunable.GetValue());
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
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataCarrier.BerserkStateMaxSpeedScale.GetValue());
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

    return false;
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

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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

    TotalWeight = Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_Sweep;
    TotalWeight += Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_PushAway;
    TotalWeight += Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_Flurry;
    RandWeight = RandRange(0.0000000, TotalWeight);
    // End:0x19E
    if(RandWeight < Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_Sweep)
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
        if(RandWeight < (Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_PushAway + Outer.CarrierPawn.TuneDataCarrier.BerzerkAttackWeight_Sweep))
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

    // End:0x24
    if(Outer.bJustPerformedTauntRightOutOfStrike)
    {
        return false;
    }
    // End:0x89
    if(RandRange(0.0000000, 100.0000000) >= float(Outer.CarrierPawn.TuneDataCarrier.BerzerkAttack_PercentChanceToTaunt))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierShortWaitBetweenStrikes';
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bGettingKnockedDown = false;
    // End:0x1A5
    if(((Outer.CarrierPawn != none) && HitCoreIndex > 0) && HitCoreIndex < Outer.CarrierPawn.MyCoreData.Length)
    {
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        // End:0x196
        if(Outer.CarrierPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x196
            if(Outer.CarrierPawn.IsThisCoreAStickGrenadeToCore(Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                // End:0x196
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    bTookGrenadeInMouth = true;
                    AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
                }
            }
        }
        // End:0x1A5
        if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange())
        {
            return true;
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
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                
            }
            else
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
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
            GotoState('StopRunInFallDownOrPlowIn');
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

state StateCmdActive
{DamageAssessment:

    Outer.LockStrikeAccess(false);
    // End:0x28F
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
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x28C
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
        // End:0x2EF
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
