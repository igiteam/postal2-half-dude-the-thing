class LPAICmd_HitReaction extends LPAICmd_SpecialMove within LPAIController;

function SetHitReactionSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    // End:0x22
    if(InSpecialMove != none)
    {
        SetSpecialMove(InSpecialMove);
    }
    //return;    
}

defaultproperties
{
    SpecialMoveClass=Class'LPSM_DirectionalHitReactionAI'
}