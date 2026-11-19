class LPSM_SpitterStunBase extends LPSM_SpitterAttackMoves
    abstract
    config(Game);

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Discard
    bManageRootMotionMode=true
}