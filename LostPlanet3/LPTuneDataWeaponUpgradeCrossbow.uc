class LPTuneDataWeaponUpgradeCrossbow extends LPTuneDataWeaponUpgrade
    hidecategories(Object,Object);

var(0.25_Pct) /*0x074C0000-0x00000000*/ private float ArrowSpreadMagnitude[65537];
var(0.25_Pct) /*0xABFC0000-0x00000000*/ private int MaxRepeaterClipsLoaded[65537];
var(0.25_Pct) /*0xABFC0000-0x00000000*/ private bool bUsesMultipleReload[65537];

function ApplyUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], OwnerCrossbow;

    super.ApplyUpgrade(OwnerWeapon);
    OwnerCrossbow = LPWeaponCrossbow(OwnerWeapon);
    // End:0x105
    if(OwnerCrossbow != none)
    {
        OwnerCrossbow.ArrowSpread = ArrowSpreadMagnitude;
        OwnerCrossbow.MaxRepeaterClipsLoaded = MaxRepeaterClipsLoaded;
        OwnerCrossbow.bMultipleReloadEnabled = bUsesMultipleReload;
        // End:0x105
        if(!bUsesMultipleReload)
        {
            OwnerCrossbow.AmmoLeftInMagazine = OwnerCrossbow.GetMagazineCapacity();
        }
    }
    //return;    
}

function RemoveUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], OwnerCrossbow;

    super.RemoveUpgrade(OwnerWeapon);
    OwnerCrossbow = LPWeaponCrossbow(OwnerWeapon);
    // End:0x151
    if(OwnerCrossbow != none)
    {
        OwnerCrossbow.ArrowSpread = OwnerCrossbow.TuneDataCrossbow.ArrowSpreadMagnitude;
        OwnerCrossbow.MaxRepeaterClipsLoaded = 0;
        OwnerCrossbow.bMultipleReloadEnabled = false;
        // End:0x151
        if(OwnerCrossbow.AmmoLeftInMagazine > OwnerCrossbow.GetMagazineCapacity())
        {
            OwnerCrossbow.AmmoLeftInMagazine = OwnerCrossbow.GetMagazineCapacity();
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataWeaponUpgradeCrossbow.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}