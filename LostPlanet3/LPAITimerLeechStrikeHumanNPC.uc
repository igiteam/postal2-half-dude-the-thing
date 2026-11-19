class LPAITimerLeechStrikeHumanNPC extends LPAITimerLeechStrike within SPAIResourceManager
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
        CountDownTimeMin = ThePawn.TuneDataHumanSoldier.Leech_TimeBetweenStrikesMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataHumanSoldier.Leech_TimeBetweenStrikesMax.GetValue();
    }
    //return;    
}
