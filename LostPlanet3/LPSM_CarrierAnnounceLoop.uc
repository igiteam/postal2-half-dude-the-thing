class LPSM_CarrierAnnounceLoop extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyLPAIPawn;

    MyLPAIPawn = LPAIPawnCarrier(MySPPawn);
    super.SpecialMoveEnded(PrevMove, NextMove);
    MyLPAIPawn.TurnOffRoarAudioComponent();
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}