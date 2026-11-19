class LPSM_GrappleRappelRecovery extends LPSM_GrapplingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerPawn;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    PlayerPawn.OnGrappleDownDrop();
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function ShouldAutoPlayNextSequence()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(SequenceID == 0)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function OnGrappleHookConnected()
{
    // End:0x24
    if(SequenceID == 0)
    {
        SequenceID++;
        PlaySequence();
    }
    //return;    
}

simulated function ShouldLoop()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(AnimTemplateIndex)
    {
        // End:0x17
        case 0:
        // End:0x1D
        case 1:
            return false;
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return ReturnValue;    
}

simulated function ShouldUseRotationExtraction()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}