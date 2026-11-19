class LPAICmd_CarrierDirectAttackVs extends LPAICmd_LeychAttack within LPAIControllerCarrier;

function Pushed()
{
    super.Pushed();
    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = -1.0000000;
    Outer.CarrierPawn.PlayRateForTransitionComponent = Outer.CarrierPawn.TuneDataCarrier.DirectAttackStateMaxSpeedScale.GetValue();
    //return;    
}

function Popped()
{
    super.Popped();
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

    // End:0x1C2
    if(Outer.CarrierPawn != none)
    {
        // End:0xAF
        if(int(Outer.CurrentCarrierStrikeAttempting) == int(11))
        {
            return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVs.GetValue();            
        }
        else
        {
            // End:0x13A
            if(int(Outer.CurrentCarrierStrikeAttempting) == int(6))
            {
                return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartComboBashStrikeVs.GetValue();                
            }
            else
            {
                // End:0x1C2
                if(int(Outer.CurrentCarrierStrikeAttempting) == int(9))
                {
                    return Outer.CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikeVs.GetValue();
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
    local /*0x97E50000-0x00000000*/ private float timeSinceLastTalonBash;

    timeSinceLastTalonBash = Outer.WorldInfo.TimeSeconds - Outer.LastTimeTalonBashedVs;
    // End:0xED
    if(timeSinceLastTalonBash > Outer.CarrierPawn.TuneDataCarrier.MinTimeBetweenWantingToTryAndTalonBashVs.GetValue())
    {
        Outer.CurrentCarrierStrikeAttempting = 6;        
    }
    else
    {
        Outer.CurrentCarrierStrikeAttempting = 11;
    }
    //return;    
}

function IfNeededChooseInStrikeLoopPreMoveInStrikeToAttempt()
{
    local /*0x97E50000-0x00000000*/ private float timeSinceLastTalonBash;

    timeSinceLastTalonBash = Outer.WorldInfo.TimeSeconds - Outer.LastTimeTalonBashedVs;
    // End:0xED
    if(timeSinceLastTalonBash > Outer.CarrierPawn.TuneDataCarrier.MinTimeBetweenWantingToTryAndTalonBashVs.GetValue())
    {
        Outer.CurrentCarrierStrikeAttempting = 6;        
    }
    else
    {
        Outer.CurrentCarrierStrikeAttempting = 11;
    }
    //return;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    // End:0x57
    if(int(Outer.CurrentCarrierStrikeAttempting) == int(11))
    {
        Outer.CmdCarrierTalonThrustStrikeVs(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0xAE
        if(int(Outer.CurrentCarrierStrikeAttempting) == int(6))
        {
            Outer.CmdCarrierComboBashStrikeVs(EnemyForAttack,, 1);            
        }
    }
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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

    // End:0x150
    if(Outer.CarrierPawn != none)
    {
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        // End:0x141
        if(Outer.CarrierPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x141
            if(Outer.CarrierPawn.IsThisCoreAStickGrenadeToCore(Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                // End:0x141
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    bTookGrenadeInMouth = true;
                    AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
                    bGettingKnockedDown = false;
                }
            }
        }
        // End:0x150
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
    // End:0x28B
    if(NeedToPerformDamageAssessment())
    {
        // End:0x73
        if(ShouldTurnToFaceFocusBeforeDamageAssessment())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        CurDamageAssessmentCmd = Outer.CmdPerformTauntVs(EnemyForAttack, Outer.CarrierPawn.TuneDataCarrier.MinTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.DamageAmountToCauseEndOfTaunt.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MinDistanceAwayForReactiveTaunt.GetValue(),, 1);
        CurDamageAssessmentCmd = none;
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x28B
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
Begin:

    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = Outer.WorldInfo.TimeSeconds;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierMoveBackToLoiterPosition', true, true, On_LPSM_MoveBackToLoiterPosition_Finished);
    J0xEE:

    // End:0x11D [Loop If]
    if(!IsMoveBackToLoiterPositionFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xEE;
    }
    Outer.PopCommand(self);
    stop;            
}
