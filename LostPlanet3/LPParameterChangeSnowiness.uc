class LPParameterChangeSnowiness extends SPParameterChangeFloat
    editinlinenew;

event Apply()
{
    local /*0x97E50000-0x00000000*/ private @NULL toPawn[8388609], lp_pawn, lp_playerpawn;

    lp_pawn = LPPawn(toPawn);
    // End:0x9E
    if(lp_pawn != none)
    {
        lp_playerpawn = LPPlayerPawn(lp_pawn);
        // End:0x9E
        if(lp_playerpawn != none)
        {
            lp_playerpawn.SnowPercent = FMax(lp_playerpawn.SnowPercent, ParameterValue);
        }
    }
    //return;    
}
