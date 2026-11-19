class LPSM_SnowCrabTauntRaise extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_SnowCrabStartTauntRoar:
            StartTauntRoar();
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function StartTauntRoar()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPAIPawnBaseSnowCrab;

    myLPAIPawnBaseSnowCrab = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x53
    if(myLPAIPawnBaseSnowCrab != none)
    {
        myLPAIPawnBaseSnowCrab.TurnOnRoarAudioComponent('SnowCrabTauntRoar');
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionMode = 3;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}