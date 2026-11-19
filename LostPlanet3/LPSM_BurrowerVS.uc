class LPSM_BurrowerVS extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BurrowerPawn;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    MySPPawn = SPPawn(inPawn);
    BurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x65
    if(BurrowerPawn == none)
    {
        return;
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function PickAnimTemplateToReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ReplicatedAnimSeqs[25165826];

    out_ReplicatedAnimSeqs[0] = none;
    // End:0x51
    if(AnimationTemplates.Length > 0)
    {
        out_ReplicatedAnimSeqs[0] = GetBestSequenceTemplateByIndex(BurrowerPawn.AttackSlotSocketIdx);
    }
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    BurrowerPawn = none;
    //return;    
}
