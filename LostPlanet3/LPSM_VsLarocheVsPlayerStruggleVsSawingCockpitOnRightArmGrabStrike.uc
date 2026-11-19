class LPSM_VsLarocheVsPlayerStruggleVsSawingCockpitOnRightArmGrabStrike extends LPSM_FollowerVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawnVsLaroche(inPawn).TuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab;
    super(LPSM_FollowerStruggleMode).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function NotifyFollowersSpecialMoveOfSuccessPctg()
{
    local /*0x97E50000-0x00000000*/ private float CurrentPctgSuccess[8388609];

    // End:0x144
    if(PawnVsLaroche != none)
    {
        // End:0xAA
        if(CurrentPctgSuccess > PawnVsLaroche.TuneDataVsLaroche.SucessPctgToStopDamagingWhenSawingTheCockpit.GetValue())
        {
            // End:0xA7
            if(PawnVsLaroche.bSawingTheCockpit)
            {
                PawnVsLaroche.NotifyStoppedSawingTheCockpit();
            }            
        }
        else
        {
            // End:0x144
            if(CurrentPctgSuccess < PawnVsLaroche.TuneDataVsLaroche.SucessPctgToStartDamagingWhenSawingTheCockpit.GetValue())
            {
                // End:0x144
                if(!PawnVsLaroche.bSawingTheCockpit)
                {
                    PawnVsLaroche.NotifyStartedSawingTheCockpit();
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab'
}