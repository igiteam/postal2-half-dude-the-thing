class LPAICmd_CrabChargingStrikeVs extends LPAICmd_CrabChargingStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsActiveDefenseEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatWindow[536870913];

function Pushed()
{
    CombatWindow = Outer.CrabPawn.FindCombatWindow_ActiveDefense('Charge');
    bIsActiveDefenseEnabled = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x43
    if(bIsActiveDefenseEnabled)
    {
        Outer.CrabPawn.HandleNotifyPlayerActiveDefenseWindow(false);
    }
    bIsActiveDefenseEnabled = false;
    super.Popped();
    //return;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x82
    if(PawnRunInto != none)
    {
        // End:0x36
        if(CmdStatus_ChargeAttackUsing.WasActiveDefenseStruck())
        {
            return true;            
        }
        else
        {
            // End:0x82
            if(PawnRunInto.IsDoingSpecialMove(Class'LPSM_VSShieldBlock'))
            {
                CmdStatus_ChargeAttackUsing.NotifyStruckBlockingObject();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function StartChargingStrikeSpecialMove()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabChargingAttackVs', true, false);
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabChargingStrikeHitVs', true, false, OnLPSM_SnowCrabChargingStrikeHitEnd);
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabChargingAttackVs');
    //return;    
}

function OnLPSM_SnowCrabChargingStrikeVS_ActiveDefenseBlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender[8388609];
    local /*0x97E50000-0x00000000*/ private class SMClass[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Window[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4D
    if(!CombatWindow.IsValid(Defender, Outer.CrabPawn))
    {
        return false;
    }
    CmdStatus_ChargeAttackUsing.NotifyActiveDefenseStruck();
    SMClass = Class'LPSM_VSChargeActiveDefense';
    Window.Publisher = Outer.CrabPawn;
    Window.bTimedWindow = false;
    Window.StartTime = Outer.WorldInfo.TimeSeconds;
    Window.CombatWindow = CombatWindow;
    return true;
    //return ReturnValue;    
}

function ProcessActiveDefenseWindow()
{
    local /*0x97E50000-0x00000000*/ private float seperationFromEnemy;

    // End:0x1B0
    if(CmdStatus_ChargeAttackUsing.HasTargetPawn())
    {
        seperationFromEnemy = VSize(Outer.myAIPawn.Location - CmdStatus_ChargeAttackUsing.GetTargetPawn().Location);
        // End:0x129
        if(!bIsActiveDefenseEnabled && seperationFromEnemy < CombatWindow.MaxSeparationDistance)
        {
            Outer.CrabPawn.HandleNotifyPlayerActiveDefenseWindow(true, OnLPSM_SnowCrabChargingStrikeVS_ActiveDefenseBlocked);
            bIsActiveDefenseEnabled = true;            
        }
        else
        {
            // End:0x1B0
            if(bIsActiveDefenseEnabled && seperationFromEnemy < CombatWindow.MinSeparationDistance)
            {
                StopProcessActiveDefenseWindowTimer();
                Outer.CrabPawn.HandleNotifyPlayerActiveDefenseWindow(false);
                bIsActiveDefenseEnabled = false;
            }
        }
    }
    //return;    
}
