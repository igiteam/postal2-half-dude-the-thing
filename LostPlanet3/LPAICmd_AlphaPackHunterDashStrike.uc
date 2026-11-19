class LPAICmd_AlphaPackHunterDashStrike extends LPAICmd_PackHunterDashStrike within LPAIControllerAlphaPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRamFinished;

function Pushed()
{
    super.Pushed();
    bRamFinished = false;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x11E
    if(Info.SplineName == 'PackHunterFullBodyRamStrike')
    {
        // End:0x11E
        if((EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
        {
            // End:0x11E
            if(Info.Impact.HitActor == EnemyForStrike)
            {
                Outer.APHPawn.StopPawnChoreographyReplicated();
                Outer.APHPawn.ScriptToCodeDebugHelper();
            }
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x58
    if(Outer.APHPawn != none)
    {
        Outer.APHPawn.StopPawnChoreographyReplicated();
    }
    //return;    
}

function StartStrikePoF()
{
    Outer.Focus = none;
    bRamFinished = false;
    Outer.APHPawn.DoSpecialMove(Class'LPSM_PackHunterRuuningRam', true, true, On_LPSM_PackHunterDashStikePOFSwipe_Finished, EnemyForStrike);
    //return;    
}

function On_LPSM_PackHunterDashStikePOFSwipe_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRamFinished = true;
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
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        CleanUpEndOfStikeSpecialMove();
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        CleanUpEndOfStikeSpecialMove();
        super.EndState(NextStateName);
        //return;        
    }

    function IsStrikeDashClawFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return bRamFinished;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    // End:0x8B
    if(Outer.PHPawn.TuneDataPackHunter.bZeroHunterVelocityAtStartOfDashStrike)
    {
        Outer.PawnZeroVelocity();
    }
    // End:0x13D
    if(Outer.APHPawn.TuneDataPackHunter.DashAttackPauseTimeWhileLaunchingIntoStrike > 0.0000000)
    {
        Outer.Sleep(Outer.PHPawn.TuneDataPackHunter.DashAttackPauseTimeWhileLaunchingIntoStrike);
    }
    Outer.APHPawn.HandleNotifyPlayerDodgeWindow(10, 0, EnemyForStrike);
    TimeAttackStarted = Outer.WorldInfo.TimeSeconds;
    StartStrikePoF();
    J0x1C5:

    // End:0x1F4 [Loop If]
    if(!IsStrikeDashClawFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x1C5;
    }
    Outer.APHPawn.HandleNotifyPlayerDodgeWindow(10, 1, EnemyForStrike);
    Outer.Focus = none;
    Outer.ResetRotationRate();
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAICmd_AlphaPackHunterDashStrike.LPAICmdStatus_MoveToPosition_FollowThrough0'
    begin object name=LPAICmdStatus_MoveToPosition_FollowThrough0
    end object
    FollowThroughMoveStatus=LPAICmdStatus_MoveToPosition_FollowThrough0
}