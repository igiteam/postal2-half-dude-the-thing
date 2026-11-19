class LPSM_PlayerIncapacitated extends LPSM_RecoverFromRagdoll
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private int RecoverIndex;

    super.SpecialMoveEnded(PrevMove, NextMove);
    RecoverIndex = (AnimIndex / 2) + int(10);
    PlaySequence(RecoverIndex, false);
    //return;    
}

event BeginGetUpAnimation()
{
    // End:0x6B
    if(!bPlayingGetUp)
    {
        MySPPawn.EndRagdoll();
        MySPPawn.SetPhysics(1);
        bPlayingGetUp = true;
        PlaySequence(AnimIndex + 1, true);
    }
    //return;    
}

defaultproperties
{
    bAllowAdditiveHitReaction=true
}