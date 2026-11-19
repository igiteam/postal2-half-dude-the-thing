class LPSM_PlayerVSWinchFireRetract extends LPSM_PlayerVSWinchFireBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPVP, Winch;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPVP = LPBaseVSPlayerPawn(MySPPawn);
    Winch = LPWeaponVSWinch(LPVP.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xA7
    if(Winch != none)
    {
        Winch.GotoState('Retracting');
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}