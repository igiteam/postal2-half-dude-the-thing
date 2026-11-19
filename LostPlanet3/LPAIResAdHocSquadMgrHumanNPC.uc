class LPAIResAdHocSquadMgrHumanNPC extends LPAIResAdHocSquadMgr within SPAIResourceManager
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

    super.SetFromTuneData();
    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x5B
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
    }
    //return;    
}
