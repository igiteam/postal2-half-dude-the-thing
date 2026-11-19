class LPSM_ClawGrabRecoverStruggle extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
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
        // End:0x39
        case Class'LPSMMTypes'.default.SMM_IsPawnGrabbed:
            return true;
            // End:0x3F
            break;
        // End:0xFFFF
        default:
            // End:0x3F
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    BlendInTime=0.0000000
    bEndSpecialMoveOnAnimFinish=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}