class LPAITimerPackHunterTimeInPaternBeforeFirstAttackPlayer extends LPAITimerPackHunterAttack within SPAIResourceManager
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
        CountDownTimeMin = ThePawn.TuneDataBasePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMin.GetValue();
        CountDownTimeMax = ThePawn.TuneDataBasePlayerPawn.PackHunter_TimeInPaternBeforeFirstAttackMax.GetValue();
    }
    //return;    
}
