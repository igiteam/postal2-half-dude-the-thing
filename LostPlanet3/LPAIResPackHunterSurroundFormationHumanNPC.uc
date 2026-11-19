class LPAIResPackHunterSurroundFormationHumanNPC extends LPAIResPackHunterSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x457
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        // End:0x244
        if(int(ThePawn.WorldInfo.NetMode) == int(NM_Standalone))
        {
            MaxInFormation = int(ThePawn.TuneDataHumanSoldier.PackHunter_MaxInStaticFormation.GetValue());
            Attribute.FormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_Radius.GetValue() + OuterActorRadius;
            Attribute.MaxFormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_MaxRadius.GetValue() + OuterActorRadius;
            Attribute.MinFormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_MinRadius.GetValue() + OuterActorRadius;            
        }
        else
        {
            MaxInFormation = int(ThePawn.TuneDataHumanSoldier.MP_PackHunter_MaxInStaticFormation.GetValue());
            Attribute.FormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_Radius.GetValue() + OuterActorRadius;
            Attribute.MaxFormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_MaxRadius.GetValue() + OuterActorRadius;
            Attribute.MinFormationRadius = ThePawn.TuneDataHumanSoldier.PackHunter_StaticFormation_MinRadius.GetValue() + OuterActorRadius;
        }
        // End:0x406
        if(MaxInFormation < 1)
        {
            MaxInFormation = 1;
        }
        // End:0x457
        if(Attribute.FormationRadius < float(180 * 3))
        {
            Attribute.FormationRadius = 180.0000000 * float(3);
        }
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
