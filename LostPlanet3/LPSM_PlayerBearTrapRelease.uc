class LPSM_PlayerBearTrapRelease extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerCtrl;

    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0x63
    if(PlayerCtrl != none)
    {
        PlayerCtrl.GotoState('StruggleBurrowerAttack');
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, PlayerCtrl;

    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0x63
    if(PlayerCtrl != none)
    {
        PlayerCtrl.GotoState('PlayerWalking');
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerStruggleAnimations'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}