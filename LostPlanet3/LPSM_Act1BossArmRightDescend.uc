class LPSM_Act1BossArmRightDescend extends SPSM_PlayAnimSequence
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.SetHidden(true);
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Died(none, Class'Engine.DamageType', MySPPawn.Location);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}