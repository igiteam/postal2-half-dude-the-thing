class LPAICmd_CrabChargingStrikePof extends LPAICmd_CrabChargingStrike within LPAIControllerBaseSnowCrab;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x8A
    if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen())
    {
        Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForStrike);
        CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    }
    super.Popped();
    //return;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    curTargetDodge = LPSM_PlayerDodgeBase(PawnRunInto.SpecialMoveState.CurSMInstance);
    // End:0x55
    if(curTargetDodge != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartChargingStrikeSpecialMove()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabChargingAttackPof', true, false);
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabChargingStrikeHitPof', true, false, OnLPSM_SnowCrabChargingStrikeHitEnd);
    //return;    
}

function ProcessDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private float seperationFromEnemy;

    // End:0x276
    if(CmdStatus_ChargeAttackUsing.HasTargetPawn())
    {
        seperationFromEnemy = VSize(Outer.myAIPawn.Location - CmdStatus_ChargeAttackUsing.GetTargetPawn().Location);
        // End:0x1DC
        if(!CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFromEnemy < Outer.CrabPawn.TuneDataIceCrab.DistanceAwayToOpenDodgeWindowPof.GetValue())
        {
            Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 0, EnemyForStrike);
            CmdStatus_ChargeAttackUsing.OpenDodgeWindow(Outer.CrabPawn.TuneDataIceCrab.ChargeDodgeMessage);            
        }
        else
        {
            // End:0x276
            if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFromEnemy < Outer.CrabPawn.TuneDataIceCrab.DistanceAwayToCloseDodgeWindowPof.GetValue())
            {
                StopProcessDodgeWindowTimer();
            }
        }
    }
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabChargingAttackPof');
    //return;    
}
