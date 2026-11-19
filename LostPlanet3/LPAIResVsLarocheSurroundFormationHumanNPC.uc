class LPAIResVsLarocheSurroundFormationHumanNPC extends LPAIResVsLarocheSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x1E2
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxInFormation = int(ThePawn.TuneDataBasePlayerPawn.VsLaroche_MaxAttackers.GetValue());
        Attribute.FormationRadius = ThePawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_IdealRadius.GetValue();
        Attribute.MaxFormationRadius = ThePawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MaxRadius.GetValue();
        Attribute.MinFormationRadius = ThePawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MinRadius.GetValue();
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
