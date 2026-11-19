class LPSM_GrappleDownLeap extends LPSM_GrapplingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerPawn;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    PlayerPawn.OnGrappleDownBegin();
    bDisableCollision = true;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function ShouldLoop()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(AnimTemplateIndex == 1)
    {
        return true;
    }
    return super.ShouldLoop(AnimTemplateIndex);
    //return ReturnValue;    
}

simulated function PlaySequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayerPawn;

    // End:0x67
    if(SequenceID == 1)
    {
        PlayerPawn = LPPlayerPawn(MySPPawn);
        // End:0x3C
        if(PlayerPawn == none)
        {
            return none;
        }
        bDisableCollision = false;
        PlayerPawn.OnGrappleDownDrop();
    }
    return super.PlaySequence();
    //return ReturnValue;    
}

simulated function ShouldUseRotationExtraction()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bDisableCollision=true
}