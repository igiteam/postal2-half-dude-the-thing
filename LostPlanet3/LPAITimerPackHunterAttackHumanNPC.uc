class LPAITimerPackHunterAttackHumanNPC extends LPAITimerPackHunterAttack within SPAIResourceManager
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
        CountDownTimeMin = ThePawn.TuneDataHumanSoldier.PackHunter_TimeBetweenAttacksMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataHumanSoldier.PackHunter_TimeBetweenAttacksMax.GetValue();
    }
    //return;    
}
