class LPAITimerPhadyrStrikeHumanNPC extends LPAITimerPhadyrStrike within SPAIResourceManager
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    super(SPAICountdownTimer).SetFromTuneData();
    // End:0x101
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        CountDownTimeMin = ThePawn.TuneDataHumanSoldier.Phadyr_TimeBetweenStrikesMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataHumanSoldier.Phadyr_TimeBetweenStrikesMax.GetValue();
    }
    //return;    
}
