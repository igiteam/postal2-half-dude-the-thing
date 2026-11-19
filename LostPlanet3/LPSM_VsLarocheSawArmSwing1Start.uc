class LPSM_VsLarocheSawArmSwing1Start extends LPSM_VsLarocheArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x80
    if(MyVsLaPawn != none)
    {
        // End:0x61
        if(MyVsLaPawn.bPerformComboMeleeMoveThisStrike)
        {
            NextSpecialMoveClass = ComboSpecialMoveClass;
        }
        MyVsLaPawn.NotifyArmQuickGrab();
    }
    //return;    
}

defaultproperties
{
    ComboSpecialMoveClass=Class'LPSM_VsLarocheSawArmSwing2Start'
    EndSpecialMoveClass=Class'LPSM_VsLarocheSawArmSwing1End'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}