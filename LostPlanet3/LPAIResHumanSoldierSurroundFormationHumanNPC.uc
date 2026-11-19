class LPAIResHumanSoldierSurroundFormationHumanNPC extends LPAIResHumanSoldierSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(Outer.ResourceManagerOuter);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x221
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MaxInFormation = int(ThePawn.TuneDataHumanSoldier.HumanSoldier_MaxAttackers.GetValue());
        Attribute.FormationRadius = ThePawn.TuneDataHumanSoldier.HumanSoldier_Surround_Radius.GetValue() + OuterActorRadius;
        Attribute.MaxFormationRadius = Attribute.FormationRadius * 2.0000000;
        Attribute.MinFormationRadius = Attribute.FormationRadius * 0.5000000;
        // End:0x1D0
        if(MaxInFormation < 0)
        {
            MaxInFormation = 0;
        }
        // End:0x221
        if(Attribute.FormationRadius < float(30 * 3))
        {
            Attribute.FormationRadius = 30.0000000 * float(3);
        }
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
