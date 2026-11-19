class LPAIResIceLeechStaticMeleeFormationHumanNPC extends LPAIResIceLeechStaticMeleeFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x20B
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MaxInFormation = int(ThePawn.TuneDataHumanSoldier.Leech_MaxAttackers.GetValue());
        Attribute.FormationRadius = ThePawn.TuneDataHumanSoldier.Leech_Melee_Circle_Radius.GetValue() + OuterActorRadius;
        Attribute.MaxFormationRadius = Attribute.FormationRadius * float(2);
        Attribute.MinFormationRadius = Attribute.FormationRadius * 0.5000000;
        // End:0x1BA
        if(MaxInFormation < 1)
        {
            MaxInFormation = 1;
        }
        // End:0x20B
        if(Attribute.FormationRadius < float(45 * 3))
        {
            Attribute.FormationRadius = 45.0000000 * float(3);
        }
    }
    //return;    
}
