class LPSM_PlayerVSSawArmSawing extends LPSM_PlayerVSRightArmActionBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn;

    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    vsPawn.StartRightArmPartAction(0, 1, true, 1,,,, false);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, vsPawn;

    vsPawn = LPVSPlayerPawn(MySPPawn);
    vsPawn.StopRightArmPartAction(0, NextMove != none);
    super(SPSpecialMove).SpecialMoveEnded(PrevMove, NextMove);
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
        // End:0x57
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
            MySPPawn.EndCurrentSpecialMove(self);
            // End:0x5A
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}
