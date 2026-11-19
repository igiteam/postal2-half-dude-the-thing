class LPAICmd_BurrowerJumpBiteStrike extends LPAICmd_BurrowerStaticStrikeBase within LPAIControllerBurrower;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_BurrowerJumpBiteStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x58
    if(Outer.BurrowerPawn != none)
    {
        return Outer.BurrowerPawn.MaxTimeForJumpBiteStrikeAnimation;
    }
    return 10.0000000;
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

    function NotifyTakeHit()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Momentum[8388609];

        Outer.BurrowerPawn.TakeDamage(Outer.BurrowerPawn.Health + 1, InstigatedBy, HitLocation, Momentum, DamageType, Outer.BurrowerPawn.TakeDamageParams.HitInfo, Outer.BurrowerPawn.TakeDamageParams.DamageCauser);
        //return;        
    }

    event WantsToDoStruggleMode()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4E
        if(Outer.BurrowerPawn.TuneDataAIPawn.bDisableStruggleMode)
        {
            return false;
        }
        // End:0x9C
        if(Outer.BurrowerPawn.TuneDataAIPawn.bDoOnlyForcedStruggle)
        {
            return true;
        }
        // End:0xC2
        if(!EnemyForStrike.bBearTrapped)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function CheckGoToStruggleMode()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CombatWindow;

        // End:0x11
        if(!WantsToDoStruggleMode())
        {
            return;
        }
        // End:0xE1
        if(EnemyForStrike.FindActiveCombatWindow(Class'LPCombatWindow_Melee', Outer.BurrowerPawn, CombatWindow))
        {
            // End:0xE1
            if(Outer.WorldInfo.TimeSeconds > CombatWindow.EndTime)
            {
                Outer.CmdBurrowerStrugglePofStrike(EnemyForStrike);
            }
        }
        //return;        
    }
Begin:

    StartStaticStrikeSpecialMove();
    J0x0A:

    // End:0x43 [Loop If]
    if(!IsStrikeAnimationDone())
    {
        CheckGoToStruggleMode();
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    J0x43:

    // End:0x9A [Loop If]
    if(Outer.BurrowerPawn.InStruggleMode)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x43;
    }
    Outer.PopCommand(self);
    stop;        
}
