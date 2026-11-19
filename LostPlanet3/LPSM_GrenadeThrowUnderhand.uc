class LPSM_GrenadeThrowUnderhand extends LPSM_GrenadeThrow
    config(Pawn);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], GrenadeWeapon;

    GrenadeWeapon = LPPlayerPawn(MySPPawn).GetGrenade();
    // End:0x62
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.bUnderhandToss = true;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}