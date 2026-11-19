class LPAICmd_CrabChargeAttackVs extends LPAICmd_CrabChargeAttack within LPAIControllerBaseSnowCrab;

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

    return Outer.CrabPawn.TuneDataIceCrab.DistanceBeyondTargetForChargingStrikeAgainstVs_Tunable.GetValue();
    //return ReturnValue;    
}

function GetDurationOfChargingShakeOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.DurationOfChargingShakeOffAgainstVs.GetValue();
    //return ReturnValue;    
}
