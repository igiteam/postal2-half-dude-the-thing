class LPAICmd_CrabStrikePof extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleePofInFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleePofHoldFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleePofEndFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ClawStuckTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToFreeStuckClaw[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepTimeInSecsDuringAttackUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeClawStrikeWrapUpStarted[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bMeleePofInFinished = false;
    bMeleePofHoldFinished = false;
    bMeleePofEndFinished = false;
    TimeToFreeStuckClaw = Outer.WorldInfo.TimeSeconds;
    Outer.bStruckVsWithClawWhileVsWasBlocking = false;
    TimeClawStrikeWrapUpStarted = -1.0000000;
    ClawStuckTime = GetClawStuckTime();
    Outer.SetWantsNewEnemy(false);
    //return;    
}

function Popped()
{
    Outer.SetWantsNewEnemy(true);
    super.Popped();
    Outer.MeleeFinished();
    Outer.ResetRotationRate();
    // End:0x162
    if(Outer.CrabPawn != none)
    {
        // End:0xF7
        if(Outer.CrabPawn.IsClawRightBeingUsedInStrike())
        {
            Outer.CrabPawn.ClawRightSetToStrikeDoneWith();
        }
        // End:0x162
        if(Outer.CrabPawn.IsClawLeftBeingUsedInStrike())
        {
            Outer.CrabPawn.ClawLeftSetToStrikeDoneWith();
        }
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x95
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
        Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x8C
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
        Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
    }
    //return;    
}

function On_LPSM_SnowCrabAttackPOFStart_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePofInFinished = true;
    //return;    
}

function On_LPSM_SnowCrabAttackPOFHold_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePofHoldFinished = true;
    //return;    
}

function On_LPSM_SnowCrabAttackPOFEnd_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePofEndFinished = true;
    //return;    
}

function GetClawStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ClawStuck, MinTime, MaxTime, StuckTime;

    StuckTime = 0.0000000;
    ClawStuck = Outer.CrabPawn.TuneDataIceCrab.ClawStuckPercentage.GetValue();
    // End:0x9A
    if(ClawStuck < float(0))
    {
        ClawStuck = 0.0000000;        
    }
    else
    {
        // End:0xBB
        if(ClawStuck > float(100))
        {
            ClawStuck = 100.0000000;
        }
    }
    // End:0x213
    if(RandRange(0.0100000, 100.0000000) <= ClawStuck)
    {
        MinTime = Outer.CrabPawn.TuneDataIceCrab.ClawStuckTimeMin.GetValue();
        MaxTime = Outer.CrabPawn.TuneDataIceCrab.ClawStuckTimeMax.GetValue();
        // End:0x1ED
        if(MinTime < MaxTime)
        {
            StuckTime = RandRange(MinTime, MaxTime);            
        }
        else
        {
            StuckTime = RandRange(MaxTime, MinTime);
        }
    }
    return StuckTime;
    //return ReturnValue;    
}

function IsItTimeToUnStuckClaw()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(Outer.WorldInfo.TimeSeconds > TimeToFreeStuckClaw)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], curTargetDodge;
    local /*0x97E50000-0x00000000*/ private bool bplayerDodgedAttack;
    local /*0x97E50000-0x00000000*/ private float Damage;
    local /*0x97E50000-0x00000000*/ private class dmgType;

    bplayerDodgedAttack = false;
    // End:0x144
    if(LPVSThermalEnergyPocket(Info.Impact.HitActor) != none)
    {
        Outer.CrabPawn.GetDamageAmountAndTypeFromSpline(Info.SplineName, Damage, dmgType);
        Info.Impact.HitActor.TakeDamage(int(Damage), none, Info.Impact.HitLocation, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    }
    // End:0x331
    if((!bHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x331
        if(Info.Impact.HitActor == EnemyForStrike)
        {
            curTargetDodge = LPSM_PlayerDodgeBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
            // End:0x316
            if(curTargetDodge != none)
            {
                // End:0x2C2
                if(Outer.CrabPawn.DidTheRightClawJustStartStrike())
                {
                    // End:0x2BF
                    if(curTargetDodge.IsA('LPSM_PlayerDodgeClawRight') || curTargetDodge.IsA('LPSM_PlayerDodgeClawLeft'))
                    {
                        bplayerDodgedAttack = true;
                    }                    
                }
                else
                {
                    // End:0x316
                    if(curTargetDodge.IsA('LPSM_PlayerDodgeLClawRight') || curTargetDodge.IsA('LPSM_PlayerDodgeLClawLeft'))
                    {
                        bplayerDodgedAttack = true;
                    }
                }
            }
            // End:0x331
            if(!bplayerDodgedAttack)
            {
                bHitEnemy = true;
            }
        }
    }
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    Outer.Focus = none;
    //return;    
}

function StartMeleePofIn()
{
    // End:0x93
    if(Outer.CrabPawn.DidTheRightClawJustStartStrike())
    {
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOFStart', true, false, On_LPSM_SnowCrabAttackPOFStart_Finished, EnemyForStrike);        
    }
    else
    {
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Start', true, false, On_LPSM_SnowCrabAttackPOFStart_Finished, EnemyForStrike);
    }
    //return;    
}

function StartMeleePofHold()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    TimeToFreeStuckClaw = ClawStuckTime + Outer.WorldInfo.TimeSeconds;
    // End:0x1AA
    if(ClawStuckTime > float(0))
    {
        // End:0x11D
        if(Outer.CrabPawn.DidTheRightClawJustStartStrike())
        {
            // End:0x11A
            if(Outer.CrabPawn.ClawRightSetToStuckWith())
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOFHold', true, false, On_LPSM_SnowCrabAttackPOFHold_Finished);
                return true;
            }            
        }
        else
        {
            // End:0x1A7
            if(Outer.CrabPawn.ClawLeftSetToStuckWith())
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Hold', true, false, On_LPSM_SnowCrabAttackPOFHold_Finished);
                return true;
            }
        }        
    }
    else
    {
        bMeleePofHoldFinished = true;
    }
    return false;
    //return ReturnValue;    
}

function StartMeleePofEnd()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    TimeClawStrikeWrapUpStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x101
    if(Outer.CrabPawn.IsClawRightBeingUsedInStrike())
    {
        // End:0xFE
        if(Outer.CrabPawn.ClawRightSetToRecoveringWith())
        {
            Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOFEnd', true, false, On_LPSM_SnowCrabAttackPOFEnd_Finished);
            return true;
        }        
    }
    else
    {
        // End:0x18B
        if(Outer.CrabPawn.ClawLeftSetToRecoveringWith())
        {
            Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_End', true, false, On_LPSM_SnowCrabAttackPOFEnd_Finished);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DongoPawn;

    DongoPawn = LPAIPawnDongo(Outer.myAIPawn);
    // End:0xE8
    if(DongoPawn != none)
    {
        DongoPawn.StopPawnChoreography();
        Outer.Focus = none;
        Outer.SetFocalPoint(DongoPawn.Location + (Vector(DongoPawn.Rotation) * float(1000)), true);
    }
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

    event HandleDismemberment()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
        local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1ED
        if((Outer.CrabPawn != none) && Outer.CrabPawn.IsClawRightBeingUsedInStrike())
        {
            // End:0x1EA
            if(CoreTag.GetCoreId() == 5)
            {
                // End:0x138
                if(Outer.CrabPawn.IsDoingSpecialMove(Class'LPSM_SnowCrabAttackPOFHold'))
                {
                    Outer.StopLatentExecution();
                    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOFHold');
                    GotoState('StateCmdActive', 'End', false, true);                    
                }
                else
                {
                    // End:0x1EA
                    if(Outer.CrabPawn.IsDoingSpecialMove(Class'LPSM_SnowCrabAttackPOFStart'))
                    {
                        Outer.StopLatentExecution();
                        Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOFStart');
                        GotoState('StateCmdActive', 'End', false, true);
                    }
                }
            }            
        }
        else
        {
            // End:0x37A
            if(CoreTag.GetCoreId() == 6)
            {
                // End:0x2C8
                if(Outer.CrabPawn.IsDoingSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Hold'))
                {
                    Outer.StopLatentExecution();
                    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Hold');
                    GotoState('StateCmdActive', 'End', false, true);                    
                }
                else
                {
                    // End:0x37A
                    if(Outer.CrabPawn.IsDoingSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Start'))
                    {
                        Outer.StopLatentExecution();
                        Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Start');
                        GotoState('StateCmdActive', 'End', false, true);
                    }
                }
            }
        }
        return true;
        //return ReturnValue;        
    }

    function IsMeleePofEndFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeInStrike;

        // End:0x0F
        if(bMeleePofEndFinished)
        {
            return true;
        }
        timeInStrike = Outer.WorldInfo.TimeSeconds - TimeClawStrikeWrapUpStarted;
        // End:0xC5
        if(timeInStrike > Outer.CrabPawn.TuneDataIceCrab.MaxTimeToWaitForClawStrikeToFinish_Tunable.GetValue())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = EnemyForStrike;
    // End:0x39D
    if(Outer.DetermineWhichClawToAttackWith())
    {
        // End:0x39A
        if(Outer.CanBeMyEnemy(EnemyForStrike))
        {
            StartMeleePofIn();
            J0x7F:

            // End:0x13C [Loop If]
            if(!bMeleePofInFinished)
            {
                Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
                Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
                // End:0x139
                if(Outer.CrabPawn.TuneDataIceCrab.bAllowHastyPincerBashDuringClawIn)
                {
                    Outer.HandleHastyPincerBashBehavior();
                }
                // [Loop Continue]
                goto J0x7F;
            }
            Outer.Focus = none;
            Outer.LockStrikeAccess(false);
            // End:0x31C
            if(((ClawStuckTime > float(0)) && !bHitEnemy) && Outer.CanBeMyEnemy(EnemyForStrike))
            {
                Outer.ReleaseAllAttackAccess();
                // End:0x31C
                if(StartMeleePofHold())
                {
                    J0x1F7:

                    // End:0x268 [Loop If]
                    if(!IsItTimeToUnStuckClaw())
                    {
                        Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
                        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
                        Outer.HandleHastyPincerBashBehavior();
                        // [Loop Continue]
                        goto J0x1F7;
                    }
                    // End:0x2DF
                    if(Outer.CrabPawn.IsClawRightBeingUsedInStrike())
                    {
                        Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOFHold');                        
                    }
                    else
                    {
                        Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabAttackPOF_L_Hold');
                    }
                }
            }
            // End:0x39A
            if(StartMeleePofEnd())
            {
                J0x329:

                // End:0x39A [Loop If]
                if(!IsMeleePofEndFinished())
                {
                    Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
                    Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
                    Outer.HandleHastyPincerBashBehavior();
                    // [Loop Continue]
                    goto J0x329;
                }
            }
        }        
    }
    else
    {
        Outer.CmdCrabPincerStrikePof(EnemyForStrike,, 1);
    }
    J0x3C8:

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    SleepTimeInSecsDuringAttackUpdate=0.0100000
    bInterruptible=false
}