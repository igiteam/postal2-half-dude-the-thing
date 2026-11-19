class LPSM_VsLarocheSawArmSawingStart extends LPSM_VsLarocheStrikeVsBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x92
    if(MyVsLaPawn != none)
    {
        MyVsLaPawn.StartRightArmPartAction(0, 1, true,,, false);
        LPWeaponVsSaw(MyVsLaPawn.RightArmPart).SetSuperSweetSpotParameters();
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x3D
    if(MyVsLaPawn != none)
    {
        MyVsLaPawn.StopRightArmPartAction(0, NextMove != none);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}