class LPSM_PlayerVSDrillArmSwing1Start extends LPSM_PlayerVSArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x4B
    if(MyLPVSPlayerPawn != none)
    {
        MyLPVSPlayerPawn.NotifyArmQuickGrab();
    }
    // End:0xA0
    if(MyLPVSPlayerPawn.SubscribedOnArmAction != none)
    {
        MyLPVSPlayerPawn.OnArmAction('RightActionShort');
    }
    //return;    
}

defaultproperties
{
    EndSpecialMoveClass=Class'LPSM_PlayerVSDrillArmSwing1End'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}