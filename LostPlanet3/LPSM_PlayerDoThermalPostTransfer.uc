class LPSM_PlayerDoThermalPostTransfer extends LPSM_BaseChoreography
    config(Game);

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0xFC
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            // End:0xD9
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).bThermalTransferInterruptedByDamage = true;
                LPPlayerController(MySPPawn.Controller).EndDoThermalPostTransfer();
            }
            MySPPawn.EndCurrentSpecialMove();
            // End:0xFF
            break;
        // End:0xFFFF
        default:
            break;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowAdditiveHitReaction=true
}