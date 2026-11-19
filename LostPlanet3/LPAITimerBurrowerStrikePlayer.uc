class LPAITimerBurrowerStrikePlayer extends LPAITimerBurrowerStrike within SPAIResourceManager
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAICountdownTimer).SetFromTuneData();
    // End:0x101
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        CountDownTimeMin = ThePawn.TuneDataBasePlayerPawn.Burrower_TimeBetweenStrikesMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataBasePlayerPawn.Burrower_TimeBetweenStrikesMax.GetValue();
    }
    //return;    
}
