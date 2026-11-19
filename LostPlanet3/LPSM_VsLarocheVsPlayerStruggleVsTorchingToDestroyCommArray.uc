class LPSM_VsLarocheVsPlayerStruggleVsTorchingToDestroyCommArray extends LPSM_VsLarocheVsPlayerStruggleVsDestroyingCommArray
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawnVsLaroche(inPawn).TuneDataStruggleVsPlayerTorchingToExposeCommArray;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}
