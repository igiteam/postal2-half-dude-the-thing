class LPAICmd_FireWaspReactiveAttackPoF extends LPAICmd_MedFlyerReactiveAttack within LPAIControllerFireWasp;

function Pushed()
{
    super.Pushed();
    Outer.UseSwoopStingAnimations();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.UseAnimationAggressive();
    Outer.EnableAggressiveGlow(true);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_FireWaspSwoopStingStart';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_FireWaspSwoopStingStart';
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    Outer.CmdFireWaspReactiveStrikePoF(EnemyForAttack,, 1);
    //return;    
}
