class LPAIResHumanSoldierFireHumanNPC extends LPAIResHumanSoldierFire within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(Outer.ResourceManagerOuter);
    super(SPAIResource).SetFromTuneData();
    // End:0xC5
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        SetMaxUsers(int(ThePawn.TuneDataHumanSoldier.HumanSoldier_MaxFireAttacker.GetValue()));
    }
    //return;    
}
