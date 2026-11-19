class LPAICmd_SpitterTailStingResponseToVsHit extends LPAICmd_SpitterTailStingVS within LPAIControllerSpitter;

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

function GetTailStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function IsItTimeToUnStuckTail()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    LPSMClassStingIn=Class'LPSM_SpitterAttackTailStingVSFastIn'
    bReactive=true
    AttackCSA=eSpitterCSA.eSpitterCSA_None
    bInterruptible=false
}