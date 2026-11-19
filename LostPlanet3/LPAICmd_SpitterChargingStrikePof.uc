class LPAICmd_SpitterChargingStrikePof extends LPAICmd_SpitterChargingStrike within LPAIControllerSpitter;

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
        Outer.SpitterPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForStrike);
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
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargingAttackPof', true, false);
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargingStrikeHitPof', true, false, OnLPSM_SpitterChargingStrikeHitEnd);
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
        if(!CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFromEnemy < Outer.SpitterPawn.TuneDataSpitter.DistanceAwayToOpenDodgeWindowPof.GetValue())
        {
            Outer.SpitterPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 0, EnemyForStrike);
            CmdStatus_ChargeAttackUsing.OpenDodgeWindow(Outer.SpitterPawn.TuneDataSpitter.ChargeDodgeMessage);            
        }
        else
        {
            // End:0x276
            if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen() && seperationFromEnemy < Outer.SpitterPawn.TuneDataSpitter.DistanceAwayToCloseDodgeWindowPof.GetValue())
            {
                StopProcessDodgeWindowTimer();
            }
        }
    }
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterChargingAttackPof');
    //return;    
}
