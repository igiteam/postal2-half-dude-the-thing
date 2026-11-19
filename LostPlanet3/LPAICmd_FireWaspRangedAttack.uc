class LPAICmd_FireWaspRangedAttack extends LPAICmd_MedFlyerBasicRangedAttack within LPAIControllerFireWasp;

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

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForAnnounceDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounceBeforeRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if((EnemyForAttack != none) && !Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdFireWaspPlasmaStrikePof(EnemyForAttack,, 1);
    //return;    
}

function NeedToPerformRangedAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PhadyrPauseBetweenStrikes';
    //return ReturnValue;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x49
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super.ShouldEndRangedAttackAfterStrikes();
    }
    return true;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }
    stop;    
}
