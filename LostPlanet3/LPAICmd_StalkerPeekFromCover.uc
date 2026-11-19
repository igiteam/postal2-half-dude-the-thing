class LPAICmd_StalkerPeekFromCover extends LPAICmd_PeekFromCover within LPAIControllerStalker;

function Pushed()
{
    Outer.StalkerPawn.EnableEyeLookingGlowFactor(true);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.StalkerPawn.EnableEyeLookingGlowFactor(false);
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
