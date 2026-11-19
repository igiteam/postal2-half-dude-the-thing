class LPAITimerGlobalStruggle extends LPAICountdownTimer within SPAIResourceManager
    editinlinenew
    hidecategories(Object);

function Reset()
{
    local /*0x97E50000-0x00000000*/ private float DesiredCountDownTimeMin[9437185], DesiredCountDownTimeMax;

    -1.0000000
    -1.0000000
    super(SPAICountdownTimer).Reset(DesiredCountDownTimeMin, DesiredCountDownTimeMax);
    //return;    
}

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAICountdownTimer).SetFromTuneData();
    // End:0xC1
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        CountDownTimeMin = ThePawn.TuneDataBasePlayerPawn.MinTimeBetweenStruggles.GetValue();
        CountDownTimeMax = CountDownTimeMin;
    }
    //return;    
}

defaultproperties
{
    UniqueName="StruggleTimer"
}