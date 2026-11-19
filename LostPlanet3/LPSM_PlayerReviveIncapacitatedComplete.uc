class LPSM_PlayerReviveIncapacitatedComplete extends LPSM_BaseChoreography
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x7C
    if(LPPC != none)
    {
        LPPC.HideCrosshair(false);
    }
    //return;    
}

function StartPawnChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609];

    Params.RotationMode = 2;
    super.StartPawnChoreography(Params);
    //return;    
}

defaultproperties
{
    bDefaultCameraOnCompletion=true
    PlayBackRate=2.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowAdditiveHitReaction=true
    bAllowRotationInterpolation=true
}