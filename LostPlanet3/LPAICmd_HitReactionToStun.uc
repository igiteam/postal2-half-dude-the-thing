class LPAICmd_HitReactionToStun extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StunTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class StunnedSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RecoverSpecialMove;

function SetStunnedDuration()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    StunTime = inTime;
    //return;    
}

function SetSunnedSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    StunnedSpecialMove = InSpecialMove;
    //return;    
}

function SetHitReactionSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    // End:0x25
    if(InSpecialMove != none)
    {
        HitReactionSpecialMove = InSpecialMove;        
    }
    else
    {
        HitReactionSpecialMove = default.HitReactionSpecialMove;
    }
    //return;    
}

function SetRecoverSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    RecoverSpecialMove = InSpecialMove;
    //return;    
}

function DoneWithHitReactionPreStun()
{
    //return;    
}

function DoneWithStunPreRecovery()
{
    //return;    
}

function CanActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    Outer.Focus = none;
    // End:0x5E
    if(HitReactionSpecialMove != none)
    {
        Outer.CmdHitReaction(0.0000000, HitReactionSpecialMove, 1);
    }
    DoneWithHitReactionPreStun();
    Outer.CmdBecomeStunned(StunTime, StunnedSpecialMove, false,, 1);
    DoneWithStunPreRecovery();
    // End:0xE4
    if(RecoverSpecialMove != none)
    {
        Outer.CmdSpecialMove(RecoverSpecialMove);
    }
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    StunTime=5.0000000
    HitReactionSpecialMove=Class'LPSM_DirectionalHitReactionAI_PreStun'
    bInterruptible=false
}