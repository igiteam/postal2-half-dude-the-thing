class LPAICmd_CrabTakeGrenadeInMouth extends LPAICmd_HitReactionToStun within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GrenInMouthSpecialMove;

function Pushed()
{
    super(LPAICommand).Pushed();
    Outer.CurrentGrenadeReactionState = 1;
    //return;    
}

function Popped()
{
    super(LPAICommand).Popped();
    Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = false;
    //return;    
}

function SetGrenInMouthSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    GrenInMouthSpecialMove = InSpecialMove;
    //return;    
}

function OnLPSM_LPSM_SnowCrabTauntSwallow_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentGrenadeReactionState = 3;
    //return;    
}

function OnLPSM_HitReactionSpecialMove_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentGrenadeReactionState = 5;
    //return;    
}

function IsDoneWithThisState()
{
    local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x32
    if(int(Outer.CurrentGrenadeReactionState) != int(StateToTest))
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

state StateCmdActive
{Begin:

    Outer.Focus = none;
TakingGrenadeInTheMouth:


    Outer.CurrentGrenadeReactionState = 2;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.CrabPawn.DoSpecialMove(GrenInMouthSpecialMove, true, true, OnLPSM_LPSM_SnowCrabTauntSwallow_Finished);
    J0xCF:

    // End:0x15E [Loop If]
    if(!IsDoneWithThisState(2, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForTakingGrenInTheMouth_Tunable.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xCF;
    }
ReactingToExplosionInMouth:


    Outer.CurrentGrenadeReactionState = 4;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.CrabPawn.DoSpecialMove(HitReactionSpecialMove, true, true, OnLPSM_HitReactionSpecialMove_Finished);
    J0x24A:

    // End:0x2D9 [Loop If]
    if(!IsDoneWithThisState(4, Outer.CrabPawn.TuneDataIceCrab.MaxTimeForReactingToExplosionInTheMouth_Tunable.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x24A;
    }
StunnedAfterExplosion:


    Outer.CmdBecomeCrabDefaultStunned(StunTime, true, StunnedSpecialMove, false,,, 1);
    Outer.PopCommand(self);
    stop;                
}
