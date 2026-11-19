class LPSM_Act1BossArmGrabVS extends SPSM_PlayAnimSequence
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

defaultproperties
{
    LoopAnimation=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}