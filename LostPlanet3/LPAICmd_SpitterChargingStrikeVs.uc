class LPAICmd_SpitterChargingStrikeVs extends LPAICmd_SpitterChargingStrike within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsActiveDefenseEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatWindow[536870913];

function Pushed()
{
    CombatWindow = Outer.SpitterPawn.FindCombatWindow_ActiveDefense('Charge');
    bIsActiveDefenseEnabled = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x43
    if(bIsActiveDefenseEnabled)
    {
        Outer.SpitterPawn.HandleNotifyPlayerActiveDefenseWindow(false);
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
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargingAttackVs', true, false);
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterChargingStrikeHitVs', true, false, OnLPSM_SpitterChargingStrikeHitEnd);
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterChargingAttackVs');
    //return;    
}

function OnLPSM_SpitterChargingStrikeVS_ActiveDefenseBlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender[8388609];
    local /*0x97E50000-0x00000000*/ private class SMClass[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Window[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4D
    if(!CombatWindow.IsValid(Defender, Outer.SpitterPawn))
    {
        return false;
    }
    CmdStatus_ChargeAttackUsing.NotifyActiveDefenseStruck();
    SMClass = Class'LPSM_VSChargeActiveDefense';
    Window.Publisher = Outer.SpitterPawn;
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
            Outer.SpitterPawn.HandleNotifyPlayerActiveDefenseWindow(true, OnLPSM_SpitterChargingStrikeVS_ActiveDefenseBlocked);
            bIsActiveDefenseEnabled = true;            
        }
        else
        {
            // End:0x1B0
            if(bIsActiveDefenseEnabled && seperationFromEnemy < CombatWindow.MinSeparationDistance)
            {
                StopProcessActiveDefenseWindowTimer();
                Outer.SpitterPawn.HandleNotifyPlayerActiveDefenseWindow(false);
                bIsActiveDefenseEnabled = false;
            }
        }
    }
    //return;    
}
