class LPAICmd_CarrierTaunt extends LPAICmd_BasicDamageAssessment within LPAIControllerCarrier
    abstract
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTauntLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedToMouthCoreDuringTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTauntingRightOutOfStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];

function Pushed()
{
    super.Pushed();
    bTauntingRightOutOfStrike = false;
    Outer.bJustPerformedTauntRightOutOfStrike = false;
    Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = false;
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x68
    if((int(Outer.CurrentTauntState) == int(4)) || int(Outer.CurrentTauntState) == int(3))
    {
        FinishTauntLoopSpecialMove();
    }
    Outer.CarrierPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    Outer.bJustPerformedTauntRightOutOfStrike = bTauntingRightOutOfStrike;
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.CarrierPawn));
    //return;    
}

event SPAborted()
{
    super(LPAICommand).SPAborted();
    // End:0x68
    if((int(Outer.CurrentTauntState) == int(4)) || int(Outer.CurrentTauntState) == int(3))
    {
        FinishTauntLoopSpecialMove();
    }
    Outer.CarrierPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    Outer.bJustPerformedTauntRightOutOfStrike = bTauntingRightOutOfStrike;
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.CarrierPawn));
    //return;    
}

function SetMinTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MinTauntLoopTime = TimeToLoop;
    //return;    
}

function SetMaxTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MaxTauntLoopTime = TimeToLoop;
    //return;    
}

function SetDamageAmountToCauseEndOfTaunt()
{
    local /*0x97E50000-0x00000000*/ private float DamageToCauseEnd[8388609];

    DamageAmountToCauseEndOfTaunt = DamageToCauseEnd;
    //return;    
}

function SetMinDistanceToBeAwayForThisTaunt()
{
    local /*0x97E50000-0x00000000*/ private float MinDistanceNeeded[8388609];

    MinDistanceToBeAwayForThisTaunt = MinDistanceNeeded;
    //return;    
}

function SetTauntingRightOutOfStrike()
{
    local /*0x97E50000-0x00000000*/ private bool bTauntingOutOfStrike[8388609];

    bTauntingRightOutOfStrike = bTauntingOutOfStrike;
    //return;    
}

function GetRaiseIntoTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntRaise';
    //return ReturnValue;    
}

function GetTauntLoopSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLoop';
    //return ReturnValue;    
}

function GetLowerOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntLower';
    //return ReturnValue;    
}

function GetStrikeOutOfTauntSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTauntStrike';
    //return ReturnValue;    
}

function On_LPSM_TauntRaise_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 4;
    //return;    
}

function OnLPSM_TauntLower_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 7;
    //return;    
}

function OnLPSM_LPSM_TauntAttack_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 9;
    //return;    
}

function HandleGrenadeInMouthBasedOnState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x82
    if((int(Outer.CurrentTauntState) == int(4)) || int(Outer.CurrentTauntState) == int(5))
    {
        FinishTauntLoopSpecialMove();
        Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;        
    }
    else
    {
        // End:0xE4
        if(int(Outer.CurrentTauntState) == int(10))
        {
            Outer.CarrierPawn.TurnOffRoarAudioComponent();
            return false;            
        }
        else
        {
            // End:0x169
            if(int(Outer.CurrentTauntState) == int(1))
            {
                // End:0x145
                if(MoveToActorCmd != none)
                {
                    Outer.AbortCommand(MoveToActorCmd);
                }
                Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;                
            }
            else
            {
                Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;
            }
        }
    }
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    return true;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A6
    if(Outer.CarrierPawn != none)
    {
        // End:0x1A6
        if(Outer.CarrierPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x1A6
            if(Outer.CarrierPawn.IsThisCoreAStickGrenadeToCore(Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                // End:0x10F
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    return HandleGrenadeInMouthBasedOnState();
                }
                TotalDamageReceivedToMouthCoreDuringTaunt += AmountOfDamage;
                // End:0x170
                if(TotalDamageReceivedToMouthCoreDuringTaunt >= DamageAmountToCauseEndOfTaunt)
                {
                    // End:0x16D
                    if(int(Outer.CurrentTauntState) == int(4))
                    {
                        FinishTauntLoopSpecialMove();
                    }                    
                }
                Outer.CarrierPawn.TurnOffRoarAudioComponent();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function FinishTauntLoopSpecialMove()
{
    Outer.CarrierPawn.EndSpecialMove(GetTauntLoopSM());
    Outer.CurrentTauntState = 5;
    //return;    
}

function ShouldStrikeWhileEndingTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeToLoop;

    TimeToLoop = RandRange(MinTauntLoopTime, MaxTauntLoopTime);
    return TimeToLoop;
    //return ReturnValue;    
}

function RaiseIntoTaunt()
{
    Outer.CarrierPawn.DoSpecialMove(GetRaiseIntoTauntSM(), true, true, On_LPSM_TauntRaise_Finished, ActorToCareAboutWhileAssessing);
    //return;    
}

function MoveToEnemyForTaunt()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x20D
    if((IsActorToCareAboutWhileAssessingStillValidForAssessment()) && !bTauntingRightOutOfStrike)
    {
        Seperation = Outer.Seperation2DTight(ActorToCareAboutWhileAssessing);
        // End:0x20D
        if(Seperation > MinDistanceToBeAwayForThisTaunt)
        {
            Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataCarrier.RunningInForTauntAttackMaxSpeedScale.GetValue());
            MoveToActorCmd = Outer.CmdMoveToActorTight(ActorToCareAboutWhileAssessing, ActorToCareAboutWhileAssessing, MinDistanceToBeAwayForThisTaunt, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToTaunt);
            MoveToActorCmd.__MoveAvoidanceDelegate__Delegate = Outer.DelegateCarrierMovingToEngageEnemyAvoidance;
            MoveToActorCmd.bZeroVelocityOnFinish = false;
        }
    }
    //return;    
}

function GetDirectDamageStunDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.DurationOfStunAfterTakingToMuchDirrectDamageInMouth.GetValue();
    //return ReturnValue;    
}

function GetGrenadeInMouthStunDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.DurationOfStunAfterGettingGrenadeInMouth.GetValue();
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function IsDoneWithThisState()
    {
        local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x32
        if(int(Outer.CurrentTauntState) != int(StateToTest))
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x93
        if(durationOfAction > MaxDurationOfState)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
MoveIntoTauntRange:

    Outer.CurrentTauntState = 1;
    MoveToEnemyForTaunt();
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
RisingIntoTaunt:


    // End:0x307
    if(!bTauntingRightOutOfStrike)
    {
        Outer.CurrentTauntState = 2;
        TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
        // End:0x1BF
        if(Outer.CarrierPawn.TuneDataCarrier.bFocusOnEnemyDuringTaunt)
        {
            Outer.Focus = Outer.MyLPEnemy;            
        }
        else
        {
            Outer.Focus = none;
        }
        Outer.CarrierPawn.SetCurrentlyValidTargetForGrenadeAssist();
        RaiseIntoTaunt();
        J0x21D:

        // End:0x2CB [Loop If]
        if(!IsDoneWithThisState(2, Outer.CarrierPawn.TuneDataCarrier.MaxTimeForRaiseIntoTaunt.GetValue()))
        {
            Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x21D;
        }
        // End:0x2FA
        if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
        {
            goto 'EndCommand';            
        }
        else
        {
            goto 'LoopingTaunt';
        }        
    }
    else
    {
        Outer.CarrierPawn.SetCurrentlyValidTargetForGrenadeAssist();
        Outer.CurrentTauntState = 4;
    }
    J0x35C:

    // End:0x3E8
    if(Outer.CarrierPawn.TuneDataCarrier.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    DurationOfTauntLoop = GetTauntLoopTime();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.CarrierPawn.DoSpecialMove(GetTauntLoopSM(), true, true, None, ActorToCareAboutWhileAssessing);
    J0x4B3:

    // End:0x4ED [Loop If]
    if(!IsDoneWithThisState(4, DurationOfTauntLoop))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x4B3;
    }
    FinishTauntLoopSpecialMove();
    // End:0x526
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        goto 'EndCommand';        
    }
    else
    {
        // End:0x54A
        if(TotalDamageReceivedToMouthCoreDuringTaunt >= DamageAmountToCauseEndOfTaunt)
        {
            goto 'ToMuchDirrectDamageIntoMouth';            
        }
        else
        {
            // End:0x564
            if(ShouldStrikeWhileEndingTaunt())
            {
                goto 'StrikingOutOfTaunt';                
            }
            else
            {
                goto 'LoweringOutOfTaunt';
            }
        }
    }
    J0x56E:

    Outer.CurrentTauntState = 6;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x658
    if(Outer.CarrierPawn.TuneDataCarrier.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    Outer.CarrierPawn.DoSpecialMove(GetLowerOutOfTauntSM(), true, true, OnLPSM_TauntLower_Finished, ActorToCareAboutWhileAssessing);
    J0x6D2:

    // End:0x761 [Loop If]
    if(!IsDoneWithThisState(6, Outer.CarrierPawn.TuneDataCarrier.MaxTimeForLoweringOutOfTaunt.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x6D2;
    }
    goto 'EndCommand';
StrikingOutOfTaunt:


    Outer.CurrentTauntState = 8;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.CarrierPawn.DoSpecialMove(GetStrikeOutOfTauntSM(), true, true, OnLPSM_LPSM_TauntAttack_Finished);
    J0x858:

    // End:0x8E7 [Loop If]
    if(!IsDoneWithThisState(8, Outer.CarrierPawn.TuneDataCarrier.MaxTimeForStrikingOutOfTaunt.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x858;
    }
    goto 'EndCommand';
ToMuchDirrectDamageIntoMouth:


    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    goto 'EndCommand';
EndCommand:


    // End:0xA3B
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CarrierPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
        Outer.CurrentTauntState = 10;
        Outer.CarrierPawn.TurnOffRoarAudioComponent();
        Outer.CmdCarrierTakeGrenadeInMouth(GetGrenadeInMouthStunDuration(), LPPawn(ActorToCareAboutWhileAssessing), Class'LPSM_CarrierTauntSwallow', Class'LPSM_CarrierGrenadeInMouthToStun', Class'LPSM_CarrierGrenadeInMouthStun', Class'LPSM_CarrierRecoverFromGrenadeInMouthStun', 0);
    }
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}