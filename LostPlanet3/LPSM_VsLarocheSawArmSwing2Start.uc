class LPSM_VsLarocheSawArmSwing2Start extends LPSM_VsLarocheArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x61
    if(MyVsLaPawn != none)
    {
        // End:0x61
        if(MyVsLaPawn.bPerformComboMeleeMoveThisStrike)
        {
            NextSpecialMoveClass = ComboSpecialMoveClass;
        }
    }
    //return;    
}

defaultproperties
{
    ComboSpecialMoveClass=Class'LPSM_VsLarocheSawArmSwing3Start'
    EndSpecialMoveClass=Class'LPSM_VsLarocheSawArmSwing2End'
    AttackIndex=1
    AnimationTemplateNodeNames=/* Array type was not detected. */
}