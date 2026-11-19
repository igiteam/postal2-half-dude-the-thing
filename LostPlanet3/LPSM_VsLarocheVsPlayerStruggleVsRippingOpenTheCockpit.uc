class LPSM_VsLarocheVsPlayerStruggleVsRippingOpenTheCockpit extends LPSM_FollowerVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawnVsLaroche(inPawn).TuneDataStruggleVsPlayerRippingOpenTheCockpit;
    super(LPSM_FollowerStruggleMode).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyPawn;

    // End:0x8B
    if((MySPPawn.Health <= 0) && LPAIPawnVsLaroche(MySPPawn) != none)
    {
        MyPawn = LPAIPawnVsLaroche(MySPPawn);
        MyPawn.NeedToShutdown(LPPawn(LeaderPawn));
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerRippingOpenTheCockpit'
}