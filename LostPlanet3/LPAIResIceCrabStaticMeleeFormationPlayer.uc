class LPAIResIceCrabStaticMeleeFormationPlayer extends LPAIResIceCrabStaticMeleeFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(Outer.ResourceManagerOuter);
    // End:0x159
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxAttackers = int(ThePawn.TuneDataBasePlayerPawn.IceCrab_MaxAttackers.GetValue());
        Radius = ThePawn.TuneDataBasePlayerPawn.IceCrab_Melee_Circle_Radius.GetValue();
        // End:0x128
        if(MaxAttackers < 1)
        {
            MaxAttackers = 1;
        }
        // End:0x156
        if(Radius < float(490 * 3))
        {
            Radius = 490.0000000 * float(3);
        }        
    }
    else
    {
        MaxAttackers = 1;
        Radius = 490.0000000 * float(3);
    }
    super.Init();
    //return;    
}
