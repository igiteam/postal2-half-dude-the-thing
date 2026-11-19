class LPAITimerCrabWithDrawAndChargeHumanNPC extends LPAITimerCrabStrike within SPAIResourceManager
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
        CountDownTimeMin = ThePawn.TuneDataHumanSoldier.IceCrab_TimeBetweenWithdrawAndChargeMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataHumanSoldier.IceCrab_TimeBetweenWithdrawAndChargeMax.GetValue();
    }
    //return;    
}
