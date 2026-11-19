class LPSM_VSChargeActiveDefense extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x7E
    if(LPPC != none)
    {
        LPPC.CompletedTutorialMode(4);
    }
    //return;    
}

function PickAnimTemplateToReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ReplicatedAnimSeqs[25165826];

    LPPawn(MySPPawn).TemplateLogicData.TargetPawn = LPPawn(MySPPawn).ReplicatedCombatWindowInfo.Window.Publisher;
    super.PickAnimTemplateToReplicate(out_ReplicatedAnimSeqs);
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS:
            return true;
        // End:0x59
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}