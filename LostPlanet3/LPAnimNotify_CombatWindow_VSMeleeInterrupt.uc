class LPAnimNotify_CombatWindow_VSMeleeInterrupt extends LPAnimNotify_CombatWindow
    editinlinenew
    collapsecategories
    hidecategories(Object);

function FindCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], ReturnValue;

    return P.FindCombatWindow_VSMeleeInterrupt(WindowName);
    //return ReturnValue;    
}

defaultproperties
{
    AutoCommentName="MeleeInterrupt"
}