class LPTuneDataWeaponUpgrade extends SPInventoryTuneDataWeaponUpgrade
    hidecategories(Object,Object);

var(0.25_Pct) /*0x1B820000-0x00000400*/ private editfixedsize @NULL AimDownSightCameraParamsOverride[589825];
var(0.25_Pct) /*0x1B820000-0x00000000*/ private editfixedsize string ScopeTypeString[65537];
var(0.25_Pct) /*0x1B820000-0x00000000*/ private @NULL ScopeMovieClip[65537];
var(0.25_Pct) /*0xD0BE0000-0x00000000*/ private name UnlockName[65537];

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    LPPlayerController(InController).GiveWeaponUpgrade(self);
    //return;    
}

function ApplyUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609];

    super.ApplyUpgrade(OwnerWeapon);
    //return;    
}

function RemoveUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609];

    super.RemoveUpgrade(OwnerWeapon);
    //return;    
}

function GetADSCameraParamOverride()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimDownSightCameraParamsOverride;
    //return ReturnValue;    
}

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
        return HasBeenPurchased();
    }
    //return ReturnValue;    
}

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bWeaponUnlocked;
    local /*0x97E50000-0x00000000*/ private @NULL TDUnloaded, TDUpgrade;

    LPPC = LPPlayerController(InController);
    // End:0x162
    if(LPPC != none)
    {
        bWeaponUnlocked = false;
        I = 0;
        J0x42:

        // End:0x162 [Loop If]
        if(I < LPPC.StoredWeaponsList.Length)
        {
            TDUnloaded = LPTuneDataUnloadedWeaponInfo(FindObject(LPPC.StoredWeaponsList[I].TuneDataUnloadedWeaponInfoString, Class'LPTuneDataUnloadedWeaponInfo'));
            // End:0x154
            if(TDUnloaded != none)
            {
                TDUpgrade = SPTuneDataBaseWeaponUpgrade(FindObject(TDUnloaded.UpgradeDisplayInfo.UpgradeTuneDataString, Class'SPEngine.SPTuneDataBaseWeaponUpgrade'));
                // End:0x154
                if(TDUpgrade == self)
                {
                    bWeaponUnlocked = true;
                    // [Explicit Break]
                    goto J0x162;
                }
            }
            I++;
            // [Loop Continue]
            goto J0x42;
        }
    }
    J0x162:

    // End:0x172
    if(bWeaponUnlocked)
    {
        return 0;
    }
    return 3;
    //return ReturnValue;    
}

defaultproperties
{
    ScopeTypeString="None"
    // Reference: LPShopInterface'Default__LPTuneDataWeaponUpgrade.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}