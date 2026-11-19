class LPAICmd_CarrierLoiterVs extends LPAICmd_CarrierLoiter within LPAIControllerCarrier;

function Pushed()
{
    super.Pushed();
    // End:0x55
    if(int(Outer.GetCurrentCarrierMacroCombatState()) == int(1))
    {
        Outer.SetCurrentCarrierMacroCombatState(2);
    }
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

function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior)
    {
        return false;
    }
    // End:0x4A
    if(Outer.CarrierReactAndSwellWhenAllCellsDestroyedCmd != none)
    {
        return false;
    }
    // End:0x93
    if(!ProcessShouldTryAndLaunchDefenderElement(false))
    {
        // End:0x76
        if(ProcessShouldTryDirectAttack(false))
        {
            return OnEngagementAttackOptionFullPhysicalDirectAttackApproved();            
        }
        else
        {
            // End:0x90
            if(!ProcessLookForReactionPhysicalAttackOpportunity())
            {
                return OnEngagementAttackOptionReactionPhysicalAttackApproved();
            }
        }        
    }
    else
    {
        StopPocessLookForAttackOpportunityTimer();
        OnLaunchDefendersApproved();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AttackEnemy()
{
    super(LPAICmd_Melee).AttackEnemy();
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    //return ReturnValue;    
}

function ShouldTryDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x87
    if(Outer.CarrierPawn.TuneDataCarrier.bForceBerserkAttack || Outer.CarrierPawn.bAllHiveCellsDestroyed)
    {
        return true;
    }
    // End:0xF4
    if((int(Outer.GetCurrentCarrierMacroCombatState()) != int(1)) || int(Outer.GetCurrentCarrierMacroCombatState()) != int(0))
    {
        // End:0xEF
        if(IsMyEnemyAlive())
        {
            return true;            
        }
        else
        {
            return false;
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsCurrentCarrierMacroCombatStateRightForLaunchingDefenders()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(int(Outer.GetCurrentCarrierMacroCombatState()) != int(4))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PerformCarrierReactionPhysicalAttackCmd()
{
    CurReactiveAttack = Outer.CmdCarrierReactionPhysicalAttackVs(EnemyForAttack, 1, 1, 5000.0000000, 5000.0000000, none,, 1);
    //return;    
}

function StartDirectAttack()
{
    Outer.CurrentCarrierAttackCmd = Outer.CmdCarrierDirectAttackVs(EnemyForAttack, int(Outer.CarrierPawn.TuneDataCarrier.MinNumberOfStrikeAttemptsWhenDirectAttackVs.GetValue()), int(Outer.CarrierPawn.TuneDataCarrier.MaxNumberOfStrikeAttemptsWhenDirectAttackVs.GetValue()), Outer.CarrierPawn.TuneDataCarrier.MinAmountOfDamageRequiredToStopDirectAttackVs.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfDamageRequiredToStopDirectAttackVs.GetValue(), none,, 1);
    //return;    
}

function StartBerserkAttack()
{
    Outer.CurrentCarrierAttackCmd = Outer.CmdCarrierBerserkAttackVs(EnemyForAttack, int(Outer.CarrierPawn.TuneDataCarrier.MinNumberOfStrikeAttemptsWhenBerserkAttackVs.GetValue()), int(Outer.CarrierPawn.TuneDataCarrier.MaxNumberOfStrikeAttemptsWhenBerserkAttackVs.GetValue()), Outer.CarrierPawn.TuneDataCarrier.MinAmountOfDamageRequiredToStopBerserkAttackVs.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfDamageRequiredToStopBerserkAttackVs.GetValue(), none,, 1);
    //return;    
}

function GetMinSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MinSeperationRequiredToMaintainLoiterVs.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationRequiredToMaintainLoiterVs.GetValue();
    //return ReturnValue;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MinRangeToTryAndGetFromTargetWhenLoiteringVs.GetValue();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxRangeToTryAndGetFromTargetWhenLoiteringVs.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoiteringVs.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoiteringVs.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    MinAttackRange=70.0000000
    MaxAttackRange=80.0000000
}