class LPAIResSepiaSurroundFormationHumanNPC extends LPAIResSepiaSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x26E
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxInFormation = int(ThePawn.TuneDataBasePlayerPawn.Sepia_MaxAttackers.GetValue());
        Attribute.FormationRadius = ThePawn.TuneDataBasePlayerPawn.Sepia_Melee_Circle_Radius.GetValue() + OuterActorRadius;
        Attribute.MaxFormationRadius = ThePawn.TuneDataBasePlayerPawn.Sepia_Melee_Circle_MaxRadius.GetValue() + OuterActorRadius;
        Attribute.MinFormationRadius = ThePawn.TuneDataBasePlayerPawn.Sepia_Melee_Circle_MinRadius.GetValue() + OuterActorRadius;
        // End:0x21D
        if(MaxInFormation < 0)
        {
            MaxInFormation = 0;
        }
        // End:0x26E
        if(Attribute.FormationRadius < float(50 * 3))
        {
            Attribute.FormationRadius = 50.0000000 * float(3);
        }
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
