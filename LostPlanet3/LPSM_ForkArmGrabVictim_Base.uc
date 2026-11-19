class LPSM_ForkArmGrabVictim_Base extends SPSM_FollowerPawnBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanHandlePawnNotificationOfAbruptGrabRelease;

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ClassIsChildOf(NewMove, Class'LPSM_ForkArmGrabVictim_Base');
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SMGrab;

    SMGrab = LPSM_ForkArmGrab_Base(LeaderSMInstance);
    switch(MessageName)
    {
        // End:0x82
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            // End:0x7F
            if(SMGrab != none)
            {
                return SMGrab.VictimDamaged();
            }
            // End:0x22E
            break;
        // End:0x102
        case Class'LPSMMTypes'.default.SMM_HandleDismemberment:
            // End:0xFF
            if(SMGrab != none)
            {
                // End:0xFF
                if(Data == SMGrab.GetVictimVulnerableCoreID())
                {
                    return SMGrab.HandleDismemberment();
                }
            }
            // End:0x22E
            break;
        // End:0x182
        case Class'LPSMMTypes'.default.SMM_HandleCoreDestroyed:
            // End:0x17F
            if(SMGrab != none)
            {
                // End:0x17F
                if(Data == SMGrab.GetVictimVulnerableCoreID())
                {
                    return SMGrab.HandleCoreDestroyed();
                }
            }
            // End:0x22E
            break;
        // End:0x1D5
        case Class'LPSMMTypes'.default.SMM_PlayDying:
            // End:0x1D2
            if(SMGrab != none)
            {
                return SMGrab.VictimDied();
            }
            // End:0x22E
            break;
        // End:0x22B
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabVictimLidRemoved:
            // End:0x229
            if(SMGrab != none)
            {
                // End:0x229
                if(SMGrab.NotifyVictimLidRemoved())
                {
                    return true;
                }
            }
            return false;
        // End:0xFFFF
        default:
            break;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bKeepPoseOnDead=true
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}