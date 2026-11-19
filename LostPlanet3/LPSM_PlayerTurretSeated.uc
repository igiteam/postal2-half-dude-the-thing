class LPSM_PlayerTurretSeated extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    LPPC = LPPlayerPawn(MySPPawn).SavedController;
    LPPC.ChangeCameraMode(LPPC.FirstPersonAimCamParams, LPPC.FirstPersonAimTransitionParam);
    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Weapon.Mesh.SetHidden(true);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Weapon.Mesh.SetHidden(false);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    BlendInTime=0.1000000
    BlendOutTime=0.1000000
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}