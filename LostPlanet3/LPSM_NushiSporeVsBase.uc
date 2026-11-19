class LPSM_NushiSporeVsBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderPawn;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    MySPPawn = SPPawn(inPawn);
    DefenderPawn = LPAIPawnDefender(MySPPawn);
    // End:0x65
    if(DefenderPawn == none)
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
    local /*0x97E50000-0x00000000*/ private int indexToUse;

    out_ReplicatedAnimSeqs[0] = none;
    // End:0x70
    if(AnimationTemplates.Length > 0)
    {
        indexToUse = DefenderPawn.LandOnVsAttackSlotSocketIdx % AnimationTemplates.Length;
        out_ReplicatedAnimSeqs[0] = GetBestSequenceTemplateByIndex(indexToUse);
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
    DefenderPawn = none;
    //return;    
}
