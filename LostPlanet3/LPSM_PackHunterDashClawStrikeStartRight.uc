class LPSM_PackHunterDashClawStrikeStartRight extends LPSM_PackHunterMovingStrikeBase
    config(Game);

defaultproperties
{
    ExpectedNextMove=Class'LPSM_PackHunterDashClawStrikeRight'
    BlendInTime=0.0500000
    bEndSpecialMoveOnAnimFinish=false
    AnimFinishedDelegate=OnAnimForChainedSpecialMoveFinished
    AnimationTemplateNodeNames=/* Array type was not detected. */
}