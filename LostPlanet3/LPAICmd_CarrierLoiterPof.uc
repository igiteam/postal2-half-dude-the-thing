class LPAICmd_CarrierLoiterPof extends LPAICmd_CarrierLoiter within LPAIControllerCarrier;

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

function AttackEnemy()
{
    super(LPAICmd_Melee).AttackEnemy();
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MinRangeToTryAndGetFromTargetWhenLoiteringPof.GetValue();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxRangeToTryAndGetFromTargetWhenLoiteringPof.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering.GetValue();
    //return ReturnValue;    
}

function StartDirectAttack()
{
    Outer.CurrentCarrierAttackCmd = Outer.CmdCarrierDirectAttackPof(EnemyForAttack, int(Outer.CarrierPawn.TuneDataCarrier.MinNumberOfStrikeAttemptsWhenDirectAttackPof.GetValue()), int(Outer.CarrierPawn.TuneDataCarrier.MaxNumberOfStrikeAttemptsWhenDirectAttackPof.GetValue()), Outer.CarrierPawn.TuneDataCarrier.MinAmountOfDamageRequiredToStopDirectAttackPof.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfDamageRequiredToStopDirectAttackPof.GetValue(), none,, 1);
    //return;    
}

function StartBerserkAttack()
{
    Outer.CurrentCarrierAttackCmd = Outer.CmdCarrierBerserkAttackPof(EnemyForAttack, int(Outer.CarrierPawn.TuneDataCarrier.MinNumberOfStrikeAttemptsWhenBerserkAttackPof.GetValue()), int(Outer.CarrierPawn.TuneDataCarrier.MaxNumberOfStrikeAttemptsWhenBerserkAttackPof.GetValue()), Outer.CarrierPawn.TuneDataCarrier.MinAmountOfDamageRequiredToStopBerserkAttackPof.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfDamageRequiredToStopBerserkAttackPof.GetValue(), none,, 1);
    //return;    
}

function GetMinSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MinSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    MinAttackRange=70.0000000
    MaxAttackRange=80.0000000
}