class LPSM_WeaponReloadPistol extends LPSM_ReloadWeaponBase
    config(Game);

function PlayReloadAnim()
{
    local /*0x97E50000-0x00000000*/ private int ReloadIndex;

    // End:0x50
    if(SPInventoryWeapon(MySPPawn.Weapon).AmmoLeftInMagazine == 0)
    {
        ReloadIndex = 1;        
    }
    else
    {
        ReloadIndex = 0;
    }
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(ReloadIndex), ReloadAnimFinished,, (1.0000000 * SPWeapon(MySPPawn.Weapon).GetReloadSpeedMultiplier()) * MySPPawn.GetWeaponReloadMultiplier(), 0.1000000, 0.2500000, false, true);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}