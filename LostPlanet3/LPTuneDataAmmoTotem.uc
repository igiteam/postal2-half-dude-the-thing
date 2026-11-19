class LPTuneDataAmmoTotem extends LPTuneDataAmmoDefault
    hidecategories(Object,Object,VSAmmoReplenishment,AmmoPackReplenishment,AmmoCapacity,InstantFireParams,ProjectileFireParams);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PerkType;

function IsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185], ReturnValue;

    // End:0x94
    if(bForceMPCheck || (InController != none) && int(InController.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return LPPlayerController(InController).IsUnlockedMP(UnlockName);        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AmmoContainerClass=none
    LocationalDamageParts=/* Array type was not detected. */
}