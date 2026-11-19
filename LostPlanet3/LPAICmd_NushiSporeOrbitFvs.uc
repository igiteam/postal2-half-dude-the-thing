class LPAICmd_NushiSporeOrbitFvs extends LPAICmd_NushiSporeOrbitBaseVs within LPAIControllerNushiSpore;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    Outer.CmdReactiveAttackFvs(TheVs);
    //return;    
}

function GetSpecialMoveForLandingOnVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeFvsLandOn';
    //return ReturnValue;    
}

function GetSpecialMoveForAttachedToVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeFvsSucking';
    //return ReturnValue;    
}
