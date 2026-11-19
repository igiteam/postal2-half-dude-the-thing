class LPAICmd_StalkerFireFromOpen extends LPAICmd_FireFromOpen within LPAIControllerStalker;

function Pushed()
{
    Outer.StalkerPawn.EnableArmsShootingGlowFactor(true);
    // End:0x77
    if(Outer.WantsWarningBurst())
    {
        Outer.SetWarningBurst(true);
    }
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.StalkerPawn.EnableArmsShootingGlowFactor(false);
    Outer.SetWarningBurst(false);
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}
