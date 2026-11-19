class LPTuneDataUnloadedWeaponInfo extends SPTuneDataShopItem
    hidecategories(Object,Object);

struct native UnloadedAmmoTuneDataInfo
{
    var(0.25_Pct) /*0xD0B70000-0x00000000*/ private editfixedsize string FriendlyName;
    var(0.25_Pct) /*0xD0B70000-0x00000000*/ private @NULL EditorOnlyAmmoTuneData[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTuneDataString;
    var(0.25_Pct) /*0xD0B70000-0x00000000*/ private @NULL AmmoIconTexture[65537];
    var(0.25_Pct) /*0xD0B70000-0x00000000*/ private bool bMultiplayerOnly[65537];

    structdefaultproperties
    {
        FriendlyName=""
        EditorOnlyAmmoTuneData=none
        AmmoTuneDataString=""
        AmmoIconTexture=none
        bMultiplayerOnly=false
    }
};

struct native UnloadedUpgradeTuneDataInfo
{
    var(0.25_Pct) /*0xD0B90000-0x00000000*/ private editfixedsize string FriendlyName;
    var(0.25_Pct) /*0xD0B90000-0x00000000*/ private @NULL EditorOnlyUpgradeTuneData[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UpgradeTuneDataString;

    structdefaultproperties
    {
        FriendlyName=""
        EditorOnlyUpgradeTuneData=none
        UpgradeTuneDataString=""
    }
};

struct native IconOffsetInfo
{
    var(0.25_Pct) /*0x68A00000-0x00000000*/ private @NULL Offset[65537];
    var(0.25_Pct) /*0x68A00000-0x00000000*/ private int Scale[65537];

    structdefaultproperties
    {
        Offset=(X=0.0000000,Y=0.0000000)
        Scale=100
    }
};

var(0.25_Pct) /*0xD6660000-0x00000000*/ private editfixedsize string contentClassName[65537];
var(0.25_Pct) /*0xD6660000-0x00000000*/ private editfixedsize string WeaponFriendlyName;
var(0.25_Pct) /*0xD6660000-0x00000000*/ private editfixedsize string WeaponDescription;
var(0.25_Pct) /*0xD6660000-0x00000000*/ private bool bCanEquip[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private editfixedsize string HUDIconName[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private @NULL HUDIconTexture[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private @NULL HUDIconUpgradeTexture[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private @NULL WeaponClusterOffset[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private editfixedsize array AmmoDisplayInfo[65537];
var(0.25_Pct) /*0x68130000-0x00000000*/ private editfixedsize @NULL UpgradeDisplayInfo[65537];

// Export ULPTuneDataUnloadedWeaponInfo::execGetWeaponFriendlyNameMarkup(FFrame&, void* const)
native function GetWeaponFriendlyNameMarkup()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export ULPTuneDataUnloadedWeaponInfo::execGetWeaponDescriptionMarkup(FFrame&, void* const)
native function GetWeaponDescriptionMarkup()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x37
    if(LPPlayerController(InController).IsWeaponUnlocked_ByContentClassName(contentClassName))
    {
        return 4;
    }
    return 0;
    //return ReturnValue;    
}

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    LPPlayerController(InController).AddWeaponToStorage_ByGiveWeaponTuneData(self);
    //return;    
}

defaultproperties
{
    bCanEquip=true
    WeaponClusterOffset=(Offset=(X=0.0000000,Y=0.0000000),Scale=100)
    // Reference: LPShopInterface'Default__LPTuneDataUnloadedWeaponInfo.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}