class LPSM_PlayerVSSawArmSwing1Start extends LPSM_PlayerVSArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x67
    if(vsPawn != none)
    {
        vsPawn.NotifyArmQuickGrab();
    }
    //return;    
}

defaultproperties
{
    EndSpecialMoveClass=Class'LPSM_PlayerVSDrillArmSwing1End'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}