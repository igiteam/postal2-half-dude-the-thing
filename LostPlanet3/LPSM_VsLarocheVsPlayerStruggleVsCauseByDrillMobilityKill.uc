class LPSM_VsLarocheVsPlayerStruggleVsCauseByDrillMobilityKill extends LPSM_VsLarocheVsPlayerStruggleVsCauseMobilityKill
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawnVsLaroche(inPawn).TuneDataStruggleVsPlayerCauseByDrillMobilityKill;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerCauseByDrillMobilityKill'
}