class LPAIResPackHunterSurroundFormationPlayer extends LPAIResPackHunterSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x459
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        // End:0x244
        if(int(ThePawn.WorldInfo.NetMode) == int(NM_Standalone))
        {
            MaxInFormation = int(ThePawn.TuneDataBasePlayerPawn.PackHunter_MaxInStaticFormation.GetValue());
            Attribute.FormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_Radius.GetValue() + OuterActorRadius;
            Attribute.MaxFormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_MaxRadius.GetValue() + OuterActorRadius;
            Attribute.MinFormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_MinRadius.GetValue() + OuterActorRadius;            
        }
        else
        {
            MaxInFormation = int(ThePawn.TuneDataBasePlayerPawn.MP_PackHunter_MaxInStaticFormation.GetValue());
            Attribute.FormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_Radius.GetValue() + OuterActorRadius;
            Attribute.MaxFormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_MaxRadius.GetValue() + OuterActorRadius;
            Attribute.MinFormationRadius = ThePawn.TuneDataBasePlayerPawn.PackHunter_StaticFormation_MinRadius.GetValue() + OuterActorRadius;
        }
        // End:0x408
        if(MaxInFormation < 2)
        {
            MaxInFormation = 2;
        }
        // End:0x459
        if(Attribute.FormationRadius < float(180 * 3))
        {
            Attribute.FormationRadius = 180.0000000 * float(3);
        }
    }
    Attribute.FormationRadius += OuterActorRadius;
    //return;    
}
