class LPAICmd_CarrierTakeGrenadeInMouth extends LPAICmd_HitReactionToStun within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GrenInMouthSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeThrower;

function Pushed()
{
    super(LPAICommand).Pushed();
    Outer.bIgnoreStunCommands = true;
    Outer.CurrentGrenadeReactionState = 1;
    //return;    
}

function Popped()
{
    Outer.bIgnoreStunCommands = false;
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

function SetGrenadeThrower()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenadeThrower[8388609];

    GrenadeThrower = InGrenadeThrower;
    //return;    
}

function OnLPSM_Swallow_Finished()
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
    Outer.StartArbitraryDefenderLaunch(Outer.GetNumOfDefenderToSquirtOutWhenTakingGrenInMouth(), GrenadeThrower, Outer.GetIfShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInMouth(), Outer.GetIfShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth(), -1.0000000, Outer.GetMinDelayBeforeProtectingTheCellsWhenTakingGrenInMouth(), Outer.GetMaxDelayBeforeProtectingTheCellsWhenTakingGrenInMouth(), Outer.GetMinDelayBeforeUnclaimingCellsWhenTakingGrenInMouth(), Outer.GetMaxDelayBeforeUnclaimingCellsWhenTakingGrenInMouth());
    Outer.CarrierPawn.DoSpecialMove(GrenInMouthSpecialMove, true, true, OnLPSM_Swallow_Finished);
    J0x1D8:

    // End:0x267 [Loop If]
    if(!IsDoneWithThisState(2, Outer.CarrierPawn.TuneDataCarrier.MaxTimeForTakingGrenInTheMouth.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x1D8;
    }
ReactingToExplosionInMouth:


    Outer.CurrentGrenadeReactionState = 4;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.HandleArbitraryDefenderLaunching(true);
    Outer.CarrierPawn.DoSpecialMove(HitReactionSpecialMove, true, true, OnLPSM_HitReactionSpecialMove_Finished);
    J0x336:

    // End:0x3C5 [Loop If]
    if(!IsDoneWithThisState(4, Outer.CarrierPawn.TuneDataCarrier.MaxTimeForReactingToExplosionInTheMouth.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x336;
    }
StunnedAfterExplosion:


    Outer.bIgnoreStunCommands = false;
    Outer.CmdBecomeStunned(StunTime, StunnedSpecialMove, false,, 1);
RecoverFromStun:


    Outer.bIgnoreStunCommands = true;
    // End:0x479
    if(RecoverSpecialMove != none)
    {
        Outer.CmdSpecialMove(RecoverSpecialMove);
    }
    Outer.PopCommand(self);
    stop;            
}
