class LPAICmd_SpitterChargeAttackVs extends LPAICmd_SpitterChargeAttack within LPAIControllerSpitter;

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

function StartChargingStrikeCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToStrike[8388609], strikeTargetPoint;

    super.StartChargingStrikeCmd(PawnToStrike, strikeTargetPoint);
    CurStrikeCmd = Outer.CmdPerformChargingStrikeVs(Outer.CmdStatus_ChargeAttack, 1);
    //return;    
}

function GetDistanceBeyondTargetForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SpitterPawn.TuneDataSpitter.DistanceBeyondTargetForChargingStrikeAgainstVs.GetValue();
    //return ReturnValue;    
}

function GetDurationOfChargingShakeOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SpitterPawn.TuneDataSpitter.DurationOfChargingShakeOffAgainstVs.GetValue();
    //return ReturnValue;    
}
