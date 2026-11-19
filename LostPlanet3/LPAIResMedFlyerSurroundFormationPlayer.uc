class LPAIResMedFlyerSurroundFormationPlayer extends LPAIResMedFlyerSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x98
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        FilloutAttributeFromFlyFormData(ThePawn.TuneDataBasePlayerPawn.MedFlyer_FormationInfo);
    }
    //return;    
}
