class LPAIResourceSepiaAttackPlayer extends LPAIResourceSepiaAttack within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResource).SetFromTuneData();
    // End:0xDD
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxAttackAttempters = int(ThePawn.TuneDataBasePlayerPawn.Sepia_MaxAttackAttempters.GetValue());
        // End:0xCA
        if(MaxAttackAttempters < 1)
        {
            MaxAttackAttempters = 1;
        }
        SetMaxUsers(MaxAttackAttempters);
    }
    //return;    
}
