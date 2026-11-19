class LPSM_VSFutureBoostBase extends LPSM_PlayerRollBase
    abstract
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSBoost', 'None', MySPPawn, none, none);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(SPSpecialMove).SpecialMoveEnded(PrevMove, NextMove);
    SpecialMoveEndedStopAnimation(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bShouldLoop=true
}