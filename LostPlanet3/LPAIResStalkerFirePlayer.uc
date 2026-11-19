class LPAIResStalkerFirePlayer extends LPAIResStalkerFire within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResource).SetFromTuneData();
    // End:0xB0
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        SetMaxUsers(int(ThePawn.TuneDataBasePlayerPawn.HumanSoldier_MaxFireAttacker.GetValue()));
    }
    //return;    
}
