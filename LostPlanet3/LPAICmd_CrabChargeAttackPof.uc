class LPAICmd_CrabChargeAttackPof extends LPAICmd_CrabChargeAttack within LPAIControllerBaseSnowCrab;

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
    CurStrikeCmd = Outer.CmdPerformChargingStrikePof(CmdStatus_ChargeAttackUsing, 1);
    //return;    
}

function GetDistanceBeyondTargetForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.DistanceBeyondTargetForChargingStrike_Tunable.GetValue();
    //return ReturnValue;    
}

function GetDurationOfChargingShakeOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.DurationOfChargingShakeOff.GetValue();
    //return ReturnValue;    
}

function OpenDodgeWindow()
{
    Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 0, EnemyForAttack);
    CmdStatus_ChargeAttackUsing.OpenDodgeWindow(Outer.CrabPawn.TuneDataIceCrab.ChargeDodgeMessage);
    //return;    
}

function CloseDodgeWindow()
{
    Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForAttack);
    bDodgeWindownHasBeenOpenedAndClosed = true;
    CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    //return;    
}

function ProcessDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private float seperationFormMeatBag, distanceToOpenWindow;

    super.ProcessDodgeWindow();
    // End:0x1D5
    if((EnemyForAttack != none) && !bDodgeWindownHasBeenOpenedAndClosed)
    {
        seperationFormMeatBag = VSize(Outer.myAIPawn.Location - EnemyForAttack.Location);
        distanceToOpenWindow = Outer.CrabPawn.TuneDataIceCrab.DistanceAwayToOpenDodgeWindowPof.GetValue();
        // End:0x13B
        if(!CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFormMeatBag < distanceToOpenWindow)
        {
            OpenDodgeWindow();            
        }
        else
        {
            // End:0x1D5
            if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFormMeatBag < Outer.CrabPawn.TuneDataIceCrab.DistanceAwayToCloseDodgeWindowPof.GetValue())
            {
                CloseDodgeWindow();
            }
        }
    }
    //return;    
}
