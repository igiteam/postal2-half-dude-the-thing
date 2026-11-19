class LPAIResourceSepiaAttackHumanNPC extends LPAIResourceSepiaAttack within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    super(SPAIResource).SetFromTuneData();
    // End:0xDD
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        MaxAttackAttempters = int(ThePawn.TuneDataHumanSoldier.Sepia_MaxAttackAttempters.GetValue());
        // End:0xCA
        if(MaxAttackAttempters < 1)
        {
            MaxAttackAttempters = 1;
        }
        SetMaxUsers(MaxAttackAttempters);
    }
    //return;    
}
