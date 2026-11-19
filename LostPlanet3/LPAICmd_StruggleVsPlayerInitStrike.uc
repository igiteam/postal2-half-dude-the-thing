class LPAICmd_StruggleVsPlayerInitStrike extends LPAICmd_StruggleVsStrike within LPAIController
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
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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
