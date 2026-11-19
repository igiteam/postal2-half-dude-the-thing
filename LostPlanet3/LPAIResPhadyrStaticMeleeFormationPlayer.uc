class LPAIResPhadyrStaticMeleeFormationPlayer extends LPAIResPhadyrStaticMeleeFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(Outer.ResourceManagerOuter);
    // End:0x156
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxAttackers = int(ThePawn.TuneDataBasePlayerPawn.Phadyr_MaxAttackers.GetValue());
        Radius = ThePawn.TuneDataBasePlayerPawn.Phadyr_Melee_Circle_Radius.GetValue();
        // End:0x128
        if(MaxAttackers < 0)
        {
            MaxAttackers = 0;
        }
        // End:0x153
        if(Radius < float(45 * 3))
        {
            Radius = 45.0000000 * float(3);
        }        
    }
    else
    {
        MaxAttackers = 1;
        Radius = 45.0000000 * float(3);
    }
    super.Init();
    //return;    
}
