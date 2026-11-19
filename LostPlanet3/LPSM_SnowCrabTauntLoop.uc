class LPSM_SnowCrabTauntLoop extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myLPAIPawnBaseSnowCrab;

    myLPAIPawnBaseSnowCrab = LPAIPawnBaseSnowCrab(MySPPawn);
    super.SpecialMoveEnded(PrevMove, NextMove);
    myLPAIPawnBaseSnowCrab.TurnOffRoarAudioComponent();
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}