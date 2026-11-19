class LPAICmd_StruggleVsStrike extends LPAICmd_Strike within LPAIController
    abstract;

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    //return;    
}

function Popped()
{
    SetInterruptible(true, true);
    Outer.MeleeFinished();
    Outer.ResetStruggleModeWaitTimer(EnemyForStrike);
    super.Popped();
    //return;    
}

event SPAborted()
{
    Outer.MeleeFinished();
    Outer.ReleaseAllAttackAccess();
    super.SPAborted();
    //return;    
}

function OnSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.PopCommand(self);
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function CanDoStruggle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bEnemyIsCinematic;

    // End:0x11
    if(!IsInStrikeRange())
    {
        return false;
    }
    // End:0x22
    if(!HaveStruggleStrikeAccess())
    {
        return false;
    }
    // End:0xA4
    if((EnemyForStrike.IsDoingASpecialMove() && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_GrenadePrime')) && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerMeleeAttack'))
    {
        return false;
    }
    bEnemyIsCinematic = (EnemyForStrike.Controller != none) && LPPlayerController(EnemyForStrike.Controller).bCinematicMode == true;
    // End:0x15D
    if(bEnemyIsCinematic || Outer.myAIPawn.bIsUnderMatineeControl)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsInStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
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
Begin:

    // End:0x2F
    if(!CanDoStruggle())
    {
        Outer.PopCommand(self);
    }
    SetInterruptible(false);
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.PawnZeroVelocity();
    EnemyForStrike.ServerDoSpecialMove(GetStruggleSpecialMoveClass(), true, false, self.OnSpecialMoveFinished, Outer.myAIPawn);
    J0x10E:

    // End:0x132 [Loop If]
    if(true)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x10E;
    }
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}