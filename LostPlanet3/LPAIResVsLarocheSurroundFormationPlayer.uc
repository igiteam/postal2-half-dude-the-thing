class LPAIResVsLarocheSurroundFormationPlayer extends LPAIResVsLarocheSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPawn;

    MyPawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x1E2
    if((MyPawn != none) && MyPawn.TuneDataBasePlayerPawn != none)
    {
        MaxInFormation = int(MyPawn.TuneDataBasePlayerPawn.VsLaroche_MaxAttackers.GetValue());
        Attribute.FormationRadius = MyPawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_IdealRadius.GetValue();
        Attribute.MaxFormationRadius = MyPawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MaxRadius.GetValue();
        Attribute.MinFormationRadius = MyPawn.TuneDataBasePlayerPawn.VsLaroche_Loiter_Circle_MinRadius.GetValue();
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
