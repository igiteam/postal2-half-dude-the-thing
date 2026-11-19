class LPAICmd_CrabTaunt extends LPAICmd_Strike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTauntLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedToMouthCoreDuringTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TauntTypePerforming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(TauntTypePerforming);
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    Outer.CurrentTauntState = 0;
    Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = false;
    TimeLastSpecialMoveStarted = -1.0000000;
    DurationOfTauntLoop = -1.0000000;
    MinTauntLoopTime = 1.0000000;
    MaxTauntLoopTime = 5.0000000;
    TotalDamageReceivedToMouthCoreDuringTaunt = 0.0000000;
    TauntTypePerforming = 4;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    FinishTauntLoopSpecialMove();
    Outer.EnableMouthGlow(false);
    Outer.bIgnoreStunCommands = false;
    Outer.CrabPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    Outer.SetHavedPerformedTauntFlagsForCurrentClawStatus();
    MoveToActorCmd = none;
    Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.CrabPawn));
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

function SetTauntTypePerforming()
{
    local /*0x97E50000-0x00000000*/ private byte TauntTypeToPerform[8388609];

    TauntTypePerforming = TauntTypeToPerform;
    //return;    
}

function On_LPSM_SnowCrabTauntRaise_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 4;
    //return;    
}

function OnLPSM_SnowCrabTauntLower_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 7;
    //return;    
}

function OnLPSM_LPSM_SnowCrabTauntAttack_Finished()
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
            Outer.CrabPawn.TurnOffRoarAudioComponent();
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
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    return true;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x166
    if(Outer.CrabPawn != none)
    {
        // End:0x166
        if(Outer.CrabPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x166
            if(Outer.CrabPawn.MyCoreData[HitCoreIndex].CoreID == 7)
            {
                // End:0xDF
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    return HandleGrenadeInMouthBasedOnState();
                }
                TotalDamageReceivedToMouthCoreDuringTaunt += AmountOfDamage;
                // End:0x140
                if(TotalDamageReceivedToMouthCoreDuringTaunt >= DamageAmountToCauseEndOfTaunt)
                {
                    // End:0x13D
                    if(int(Outer.CurrentTauntState) == int(4))
                    {
                        FinishTauntLoopSpecialMove();
                    }                    
                }
                else
                {
                    Outer.StartAdditiveMouthBulletHitAnimation(2.5000000);
                }
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function FinishTauntLoopSpecialMove()
{
    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabTauntLoop');
    Outer.CurrentTauntState = 5;
    //return;    
}

function ShouldStrikeWhileEndingTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

    Displacement = EnemyForStrike.Location - Outer.CrabPawn.Location;
    DistanceToTarget = VSize(Displacement);
    // End:0xE1
    if(DistanceToTarget < Outer.GetCurrentPincerSmashReachDistanceAgaintPof())
    {
        // End:0xE1
        if(Outer.IsInBashAngularRange(EnemyForStrike.Location))
        {
            return true;
        }
    }
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
    local /*0x97E50000-0x00000000*/ private float timeSinceLossOfClaw;

    Outer.EnableMouthGlow(true);
    // End:0x169
    if(int(TauntTypePerforming) == int(1))
    {
        timeSinceLossOfClaw = Outer.WorldInfo.TimeSeconds - Outer.CrabPawn.GetClawLeftTimeDismembered();
        // End:0x166
        if(timeSinceLossOfClaw <= Outer.CrabPawn.TuneDataIceCrab.HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable.GetValue())
        {
            Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabLeftClawDismemberedToTaunt', true, true, On_LPSM_SnowCrabTauntRaise_Finished);
            return;
        }        
    }
    else
    {
        // End:0x2AF
        if(int(TauntTypePerforming) == int(2))
        {
            timeSinceLossOfClaw = Outer.WorldInfo.TimeSeconds - Outer.CrabPawn.GetClawRightTimeDismembered();
            // End:0x2AF
            if(timeSinceLossOfClaw <= Outer.CrabPawn.TuneDataIceCrab.HowLongAfterLossOfClawToStillPlayClassRippedOffTauntAnim_Tunable.GetValue())
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabRightClawDismemberedToTaunt', true, true, On_LPSM_SnowCrabTauntRaise_Finished);
                return;
            }
        }
    }
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntRaise', true, true, On_LPSM_SnowCrabTauntRaise_Finished);
    //return;    
}

function MoveToEnemyForTaunt()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x1DE
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2DTight();
        // End:0x1DE
        if(Seperation > MinDistanceToBeAwayForThisTaunt)
        {
            Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.RunningInForTauntAttackMaxSpeedScale_Tunable.GetValue());
            MoveToActorCmd = Outer.CmdMoveToActorTight(EnemyForStrike, EnemyForStrike, MinDistanceToBeAwayForThisTaunt, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToTaunt, false);
            MoveToActorCmd.__MoveAvoidanceDelegate__Delegate = Outer.DelegateCrabMovingToEngageEnemyAvoidance;
            MoveToActorCmd.bZeroVelocityOnFinish = false;
        }
    }
    //return;    
}

function GetDirectDamageStunDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x73
    if(int(TauntTypePerforming) == int(3))
    {
        return Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterTakingToMuchDirrectDamageInMouth.GetValue();
    }
    return Outer.CrabPawn.TuneDataIceCrab.DurationOfStunAfterTakingToMuchDirrectDamageInMouth.GetValue();
    //return ReturnValue;    
}

function GetGrenadeInMouthStunDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x73
    if(int(TauntTypePerforming) == int(3))
    {
        return Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue();
    }
    return Outer.CrabPawn.TuneDataIceCrab.DurationOfStunAfterGettingGrenadeInMouth.GetValue();
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

        super(SPStateObject).EndState(NextStateName);
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


    Outer.CurrentTauntState = 2;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x1B0
    if(Outer.CrabPawn.TuneDataIceCrab.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    Outer.CrabPawn.SetCurrentlyValidTargetForGrenadeAssist();
    RaiseIntoTaunt();
    J0x20E:

    // End:0x2BC [Loop If]
    if(!IsDoneWithThisState(2, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForRaiseIntoTaunt_Tunable.GetValue()))
    {
        Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x20E;
    }
    // End:0x2EB
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        goto 'EndCommand';        
    }
    else
    {
        goto 'LoopingTaunt';
    }
    J0x2F5:

    // End:0x381
    if(Outer.CrabPawn.TuneDataIceCrab.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    DurationOfTauntLoop = GetTauntLoopTime();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLoop', true, true);
    J0x433:

    // End:0x46D [Loop If]
    if(!IsDoneWithThisState(4, DurationOfTauntLoop))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x433;
    }
    FinishTauntLoopSpecialMove();
    // End:0x4A6
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        goto 'EndCommand';        
    }
    else
    {
        // End:0x4CA
        if(TotalDamageReceivedToMouthCoreDuringTaunt >= DamageAmountToCauseEndOfTaunt)
        {
            goto 'ToMuchDirrectDamageIntoMouth';            
        }
        else
        {
            // End:0x4E4
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
    J0x4EE:

    Outer.CurrentTauntState = 6;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLower', true, true, OnLPSM_SnowCrabTauntLower_Finished);
    J0x5DA:

    // End:0x669 [Loop If]
    if(!IsDoneWithThisState(6, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForLoweringOutOfTaunt_Tunable.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x5DA;
    }
    goto 'EndCommand';
StrikingOutOfTaunt:


    Outer.CurrentTauntState = 8;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntAttack', true, true, OnLPSM_LPSM_SnowCrabTauntAttack_Finished);
    J0x75F:

    // End:0x7EE [Loop If]
    if(!IsDoneWithThisState(8, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForStrikingOutOfTaunt_Tunable.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x75F;
    }
    goto 'EndCommand';
ToMuchDirrectDamageIntoMouth:


    Outer.bIgnoreStunCommands = false;
    Outer.EnableMouthGlow(false);
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    Outer.CmdCrabHitReactionToStun(GetDirectDamageStunDuration(), Class'LPSM_SnowCrabGrenadeInMouthStun', Class'LPSM_SnowCrabTauntToStun', 1);
    goto 'EndCommand';
EndCommand:


    // End:0x9C5
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CrabPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
        Outer.CurrentTauntState = 10;
        Outer.EnableMouthGlow(false);
        Outer.CrabPawn.TurnOffRoarAudioComponent();
        Outer.CmdCrabTakeGrenadeInMouth(GetGrenadeInMouthStunDuration(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 1);
    }
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}