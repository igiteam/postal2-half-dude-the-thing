class LPSM_IssPlayerStruggle extends LPSM_FollowerStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawn(inPawn).TuneDataStruggle;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x60
    if(int(MySPPawn.Physics) != int(1))
    {
        MySPPawn.SetPhysics(1);
    }
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStrugglePlayerIss'
}