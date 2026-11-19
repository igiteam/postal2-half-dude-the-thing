class LPAICmd_CrabHitReactionToStun extends LPAICmd_HitReactionToStun within LPAIControllerBaseSnowCrab;

state StateCmdActive
{Begin:

    Outer.Focus = none;
    Outer.CmdHitReaction(0.0000000, HitReactionSpecialMove, 1);
    Outer.CmdBecomeCrabDefaultStunned(StunTime, true, StunnedSpecialMove, false,,, 1);
    Outer.PopCommand(self);
    stop;        
}
