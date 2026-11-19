class LPAIResDongoSurroundFormationHumanNPC extends LPAIResDongoSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;
    local /*0x97E50000-0x00000000*/ private float MinRadius;

    MinRadius = 180.0000000 * float(3);
    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x384
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MaxInFormation = int(ThePawn.TuneDataHumanSoldier.Dongo_MaxInFormation.GetValue());
        // End:0xDF
        if(MaxInFormation < 0)
        {
            MaxInFormation = 0;
        }
        Attribute.FormationRadius = ThePawn.TuneDataHumanSoldier.Dongo_Formation_IdealRadius.GetValue() + OuterActorRadius;
        // End:0x1A0
        if(Attribute.FormationRadius < MinRadius)
        {
            Attribute.FormationRadius = MinRadius;
        }
        Attribute.MinFormationRadius = ThePawn.TuneDataHumanSoldier.Dongo_Formation_MinRadius.GetValue() + OuterActorRadius;
        // End:0x292
        if(Attribute.MinFormationRadius >= Attribute.FormationRadius)
        {
            Attribute.MinFormationRadius = Attribute.FormationRadius - MinRadius;
        }
        Attribute.MaxFormationRadius = ThePawn.TuneDataHumanSoldier.Dongo_Formation_MaxRadius.GetValue() + OuterActorRadius;
        // End:0x384
        if(Attribute.MaxFormationRadius <= Attribute.FormationRadius)
        {
            Attribute.MaxFormationRadius = Attribute.FormationRadius + MinRadius;
        }
    }
    //return;    
}
