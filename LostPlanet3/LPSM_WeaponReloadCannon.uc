class LPSM_WeaponReloadCannon extends LPSM_ReloadWeaponBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function PlayReloadAnim()
{
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(SPSM_ReloadWeaponBase).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}