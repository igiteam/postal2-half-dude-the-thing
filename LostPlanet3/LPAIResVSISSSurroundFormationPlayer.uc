class LPAIResVSISSSurroundFormationPlayer extends LPAIResVSISSSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x108
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxInFormation = 1;
        Attribute.FormationRadius = 800.0000000;
        Attribute.MaxFormationRadius = Attribute.FormationRadius * 2.0000000;
        Attribute.MinFormationRadius = Attribute.FormationRadius * 0.5000000;
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
