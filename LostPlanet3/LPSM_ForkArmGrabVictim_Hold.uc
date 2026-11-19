class LPSM_ForkArmGrabVictim_Hold extends LPSM_ForkArmGrabVictim_Base
    config(Game);

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL holdSM;

    switch(MessageName)
    {
        // End:0xDE
        case Class'LPSMMTypes'.default.SMM_PlayTakeDamageEffects:
            // End:0xDB
            if(MySPPawn.TakeDamageParams.InstigatedByPawn == LeaderPawn)
            {
                holdSM = LPSM_ForkArmGrab_Hold(LeaderSMInstance);
                // End:0xDB
                if(holdSM != none)
                {
                    holdSM.NotifyFollowerDamagedByLeader(MySPPawn.TakeDamageParams);
                }
            }
            // End:0xE1
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}
