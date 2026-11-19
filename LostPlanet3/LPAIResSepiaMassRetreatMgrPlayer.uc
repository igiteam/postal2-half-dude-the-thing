class LPAIResSepiaMassRetreatMgrPlayer extends LPAIResSepiaMassRetreatMgr within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    super.Init();
    //return;    
}

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private int maxNumKilledToCausePanic, minNumKilledToCausePanic;

    super(LPAIResourceMassRetreatMgr).SetFromTuneData();
    ThePawn = LPBasePlayerPawn(OuterActor);
    // End:0x130
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        minNumKilledToCausePanic = int(ThePawn.TuneDataBasePlayerPawn.Sepia_MinNumToCausePanicRetreat.GetValue());
        maxNumKilledToCausePanic = int(ThePawn.TuneDataBasePlayerPawn.Sepia_MaxNumToCausePanicRetreat.GetValue());
        NumOfDeathsToTriggerMassRetreat = Rand(maxNumKilledToCausePanic - minNumKilledToCausePanic) + minNumKilledToCausePanic;
    }
    //return;    
}
