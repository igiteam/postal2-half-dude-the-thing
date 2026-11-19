class LPSM_PlayerPrepareThermalPostBattery extends LPSM_BaseChoreography
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PlayBackRate = 1.0000000;
    PRI = LPPRI(inPawn.PlayerReplicationInfo);
    // End:0x97
    if(PRI != none)
    {
        PlayBackRate *= PRI.GetReplicatedPerkDeployRate(18);
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0xBF
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            // End:0x9C
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).bThermalTransferInterruptedByDamage = true;
            }
            MySPPawn.EndCurrentSpecialMove();
            // End:0xC2
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
    AnimationTemplateNodeNames=/* Array type was not detected. */
}