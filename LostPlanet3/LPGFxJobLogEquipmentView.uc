class LPGFxJobLogEquipmentView extends GFxObject within GFxMoviePlayer
    config(UI);

struct UpgradeInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UpgradeTuneDataName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInRig;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectibleIndex[536870913];

    structdefaultproperties
    {
        UpgradeTuneDataName=""
        bInRig=false
        CollectibleIndex=0
    }
};

struct WeaponInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UnloadedTuneDataName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneData[536870913];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectibleIndex[536870913];

    structdefaultproperties
    {
        UnloadedTuneDataName=""
        TuneData=none
        CollectibleIndex=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayerUpgrades[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSUpgrades[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSWeapons[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerUpgradeIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSUpgradeIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Weapons[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string GrenadeIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewContent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCollectibleChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AccordionTabsViewed[3];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponsProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerUpgradesProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSUpgradesProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponsHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerUpgradesHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSUpgradesHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialAccordionIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialItemIndex;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    bNewContent = false;
    InitialAccordionIndex = LPPC.JobLogInfo.InventoryRecord.ListIndex;
    // End:0xCC
    if(InitialAccordionIndex < 0)
    {
        InitialAccordionIndex = 0;
    }
    InitialItemIndex = LPPC.JobLogInfo.InventoryRecord.ListSelectedIndex;
    // End:0x134
    if(InitialItemIndex < 0)
    {
        InitialItemIndex = 0;
    }
    InitEquipment();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    JLMP.SetTabNewContentIndicator(MyTabIndex, bNewContent);
    JLMP.SetSetCurrentEquipmentCollectibleDelegate(SetCurrentEquipmentCollectible);
    JLMP.SetSetEquipmentButtonLegendDelegate(SetEquipmentButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    JLMP.SetSetCurrentEquipmentCollectibleDelegate(None);
    JLMP.SetSetEquipmentButtonLegendDelegate(None);
    //return;    
}

function SetInitialSelection()
{
    local /*0x97E50000-0x00000000*/ private int accordionIndex[8388609], ItemIndex;

    SetInitialHeaderSelection(accordionIndex);
    SetInitialCollectibleSelection(ItemIndex);
    //return;    
}

function SetInitialHeaderSelection()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("SetInitialHeaderSelection");
    //return;    
}

function SetInitialCollectibleSelection()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("SetInitialCollectibleSelection");
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    LPPC.JobLogInfo.InventoryRecord.ListIndex = int(GetCurrentViewIndex());
    LPPC.JobLogInfo.InventoryRecord.ListSelectedIndex = int(GetCurrentCollectibleIndex());
    //return;    
}

function GetCurrentViewIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetFloat("selectedButtonIndex");
    //return ReturnValue;    
}

function GetCurrentCollectibleIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ActionScriptFloat("GetCurrentCollectibleIndex");
    //return ReturnValue;    
}

function InitEquipment()
{
    local /*0x97E50000-0x00000000*/ private int FoundCount, totalCount;

    InitWeapons();
    FoundCount = 0;
    totalCount = 0;
    InitCollectiblesFromUpgradesArray(0, 0, PlayerUpgrades, PlayerUpgradeIconName, FoundCount, totalCount);
    PlayerUpgradesProgString = (string(FoundCount) $ "/") $ string(totalCount);
    SetPlayerUpgradesProgressString();
    FoundCount = 0;
    totalCount = 0;
    InitCollectiblesFromUpgradesArray(1, 0, VSUpgrades, VSUpgradeIconName, FoundCount, totalCount);
    VSUpgradesProgString = (string(FoundCount) $ "/") $ string(totalCount);
    SetVSUpgradesProgressString();
    //return;    
}

function SetPlayerUpgradesProgressString()
{
    // End:0x46
    if(PlayerUpgradesHeader != none)
    {
        PlayerUpgradesHeader.SetString("progressText", PlayerUpgradesProgString);
    }
    //return;    
}

function SetVSUpgradesProgressString()
{
    // End:0x46
    if(VSUpgradesHeader != none)
    {
        VSUpgradesHeader.SetString("progressText", VSUpgradesProgString);
    }
    //return;    
}

function SetWeaponsProgressString()
{
    // End:0x46
    if(WeaponsHeader != none)
    {
        WeaponsHeader.SetString("progressText", WeaponsProgString);
    }
    //return;    
}

function SetCurrentEquipmentCollectible()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    bCollectibleChanged = true;
    switch(CollectibleSlotNum)
    {
        // End:0x4B
        case 1:
            SetCollectibleItemViewed(CollectibleSlotNum, CollectibleIndex, PlayerUpgrades);
            // End:0x9E
            break;
        // End:0x78
        case 2:
            SetCollectibleItemViewed(CollectibleSlotNum, CollectibleIndex, VSUpgrades);
            // End:0x9E
            break;
        // End:0x9B
        case 0:
            SetWeaponItemViewed(CollectibleSlotNum, CollectibleIndex);
            // End:0x9E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetCollectibleItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array InUpgrades[25165825];
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL TuneData, TDUpgrade, DDS, LPSI;
    local /*0x97E50000-0x00000000*/ private bool bLocked;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    I = 0;
    J0x37:

    // End:0x28A [Loop If]
    if(I < InUpgrades.Length)
    {
        // End:0x27C
        if(InUpgrades[I].CollectibleIndex == ItemIndex)
        {
            TuneData = SPTuneDataShopItem(FindObject(InUpgrades[I].UpgradeTuneDataName, Class'SPEngine.SPTuneDataShopItem'));
            // End:0x279
            if(TuneData != none)
            {
                TDUpgrade = LPTuneDataUpgradeBase(TuneData);
                // End:0x138
                if(TDUpgrade != none)
                {
                    bLocked = !TDUpgrade.IsEnabled();                    
                }
                else
                {
                    bLocked = !TuneData.HasBeenPurchased();
                }
                // End:0x279
                if(!bLocked)
                {
                    LPSI = LPShopInterface(TuneData.ShopInterface);
                    // End:0x279
                    if(LPSI != none)
                    {
                        J = 0;
                        J0x1BE:

                        // End:0x279 [Loop If]
                        if(J < LPSI.UnlockingObjectives.Length)
                        {
                            DDS = LPQDD_ObjectiveShopItem(LPSI.UnlockingObjectives[J].DynamicData);
                            // End:0x26B
                            if(DDS != none)
                            {
                                DDS.bItemViewedInJobLog = true;
                            }
                            J++;
                            // [Loop Continue]
                            goto J0x1BE;
                        }
                    }
                }
            }
            // [Explicit Break]
            goto J0x28A;
        }
        I++;
        // [Loop Continue]
        goto J0x37;
    }
    J0x28A:

    //return;    
}

function SetWeaponItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex, I, J;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, TDUnloaded;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    LPPC = LPPlayerController(Outer.GetPC());
    bFound = false;
    I = 0;
    J0x75:

    // End:0x226 [Loop If]
    if(I < Weapons.Length)
    {
        // End:0x218
        if(Weapons[I].CollectibleIndex == ItemIndex)
        {
            bFound = true;
            TDUnloaded = LPTuneDataUnloadedWeaponInfo(FindObject(Weapons[I].UnloadedTuneDataName, Class'LPTuneDataUnloadedWeaponInfo'));
            // End:0x215
            if(TDUnloaded != none)
            {
                J = 0;
                J0x133:

                // End:0x215 [Loop If]
                if(J < LPPC.StoredWeaponsList.Length)
                {
                    // End:0x207
                    if(LPPC.StoredWeaponsList[J].TuneDataUnloadedWeaponInfoString == Weapons[I].UnloadedTuneDataName)
                    {
                        LPPC.StoredWeaponsList[J].bJobLogViewed = true;
                        // [Explicit Break]
                        goto J0x215;
                    }
                    J++;
                    // [Loop Continue]
                    goto J0x133;
                }
            }
            J0x215:

            // [Explicit Break]
            goto J0x226;
        }
        I++;
        // [Loop Continue]
        goto J0x75;
    }
    J0x226:

    // End:0x25A
    if(!bFound)
    {
        SetCollectibleItemViewed(viewIndex, ItemIndex, VSWeapons);
    }
    //return;    
}

function InitWeapons()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, TDUnloaded, TDUpgrade, LPSI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked, bNewItem, bCanEquip;
    local /*0x97E50000-0x00000000*/ private int StatIdx;
    local /*0x97E50000-0x00000000*/ private float StatValue[3];
    local /*0x97E50000-0x00000000*/ private editfixedsize string statString[3];
    local /*0x97E50000-0x00000000*/ private float statUpgradeValue[3], statPercent;
    local /*0x97E50000-0x00000000*/ private bool bDisplayStats, bShowAltAmmo;
    local /*0x97E50000-0x00000000*/ private int AmmoCount;
    local /*0x97E50000-0x00000000*/ private editfixedsize string AltAmmoName, AltAmmoCount, AltAmmoIconName, upgradeName;
    local /*0x97E50000-0x00000000*/ private @NULL invWeapon, curPrimaryWeapon, curSecondaryWeapon, curTertiaryWeapon, LPP;

    local /*0x97E50000-0x00000000*/ private int FoundCount, totalCount;

    FoundCount = 0;
    totalCount = 0;
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x80
    if(LPPC != none)
    {
        LPP = LPPC.GetMyPlayerPawn();
    }
    // End:0x1F4
    if(LPP != none)
    {
        curPrimaryWeapon = SPInventoryWeapon(LPP.Weapon);
        curSecondaryWeapon = none;
        // End:0x1F3
        foreach LPP.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', invWeapon)
        {
            // End:0x15F
            if((curTertiaryWeapon == none) && !invWeapon.bCanEquip)
            {
                curTertiaryWeapon = invWeapon;
                // End:0x1F2
                continue;
            }
            // End:0x1F2
            if(((((curSecondaryWeapon == none) && invWeapon != curPrimaryWeapon) && LPInventoryWeaponNone(invWeapon) == none) && LPWeaponPistol(invWeapon) == none) && invWeapon.bCanEquip)
            {
                curSecondaryWeapon = invWeapon;
            }            
        }        
    }
    I = 0;
    J0x1FF:

    // End:0x1164 [Loop If]
    if(I < Weapons.Length)
    {
        TDUnloaded = LPTuneDataUnloadedWeaponInfo(FindObject(Weapons[I].UnloadedTuneDataName, Class'LPTuneDataUnloadedWeaponInfo'));
        // End:0x1156
        if(TDUnloaded != none)
        {
            bLocked = true;
            J = 0;
            J0x289:

            // End:0x3E2 [Loop If]
            if(J < LPPC.StoredWeaponsList.Length)
            {
                // End:0x3D4
                if(LPPC.StoredWeaponsList[J].TuneDataUnloadedWeaponInfoString == Weapons[I].UnloadedTuneDataName)
                {
                    bLocked = false;
                    bCanEquip = LPPC.StoredWeaponsList[J].bCanEquip;
                    bNewItem = !LPPC.StoredWeaponsList[J].bJobLogViewed;
                    // End:0x3D1
                    if(bNewItem)
                    {
                        bNewContent = true;
                    }
                    // [Explicit Break]
                    goto J0x3E2;
                }
                J++;
                // [Loop Continue]
                goto J0x289;
            }
            J0x3E2:

            DetailHUDIconName = "";
            bDisplayStats = false;
            upgradeName = "";
            bShowAltAmmo = false;
            AltAmmoName = "";
            AltAmmoCount = "";
            AltAmmoIconName = "";
            // End:0x10AF
            if(!bLocked)
            {
                LPSI = LPShopInterface(TDUnloaded.ShopInterface);
                // End:0x10AC
                if(LPSI != none)
                {
                    DetailHUDIconName = GetUILoaderPathForTexture(TDUnloaded.HUDIconTexture);
                    StatIdx = 0;
                    J0x4C2:

                    // End:0x6ED [Loop If]
                    if(StatIdx < 3)
                    {
                        // End:0x697
                        if(TDUnloaded.ShopItemAttributes.Length > StatIdx)
                        {
                            bDisplayStats = true;
                            statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].InitialValue);
                            statPercent = statPercent / 100.0000000;
                            statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                            StatValue[StatIdx] = statPercent;
                            statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].UpgradeValue);
                            statPercent = statPercent / 100.0000000;
                            statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                            statUpgradeValue[StatIdx] = statPercent;
                            statString[StatIdx] = TDUnloaded.ShopItemAttributes[StatIdx].AttributeName;                            
                        }
                        else
                        {
                            StatValue[StatIdx] = 0.0000000;
                            statUpgradeValue[StatIdx] = 0.0000000;
                            statString[StatIdx] = "";
                        }
                        StatIdx++;
                        // [Loop Continue]
                        goto J0x4C2;
                    }
                    // End:0xB22
                    if(bCanEquip)
                    {
                        // End:0xB1F
                        if(TDUnloaded.AmmoDisplayInfo.Length > 1)
                        {
                            // End:0xB1F
                            if(LPPC.IsAmmoTypeStringInMunitionsLocker(TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString))
                            {
                                bShowAltAmmo = true;
                                AltAmmoName = TDUnloaded.AmmoDisplayInfo[1].FriendlyName;
                                AmmoCount = LPPC.GetAmmoCountInMunitionsLockerFromString(TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString);
                                // End:0x8D6
                                if((curPrimaryWeapon != none) && TDUnloaded.contentClassName == string(curPrimaryWeapon.Class.Name))
                                {
                                    AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curPrimaryWeapon, TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString));                                    
                                }
                                else
                                {
                                    // End:0x993
                                    if((curSecondaryWeapon != none) && TDUnloaded.contentClassName == string(curSecondaryWeapon.Class.Name))
                                    {
                                        AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curSecondaryWeapon, TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString));                                        
                                    }
                                    else
                                    {
                                        // End:0xA4D
                                        if((curTertiaryWeapon != none) && TDUnloaded.contentClassName == string(curTertiaryWeapon.Class.Name))
                                        {
                                            AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curTertiaryWeapon, TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString));
                                        }
                                    }
                                }
                                // End:0xABF
                                if(AmmoCount == -1)
                                {
                                    AltAmmoCount = JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                                    
                                }
                                else
                                {
                                    AltAmmoCount = "" $ string(AmmoCount);
                                }
                                AltAmmoIconName = GetUILoaderPathForTexture(TDUnloaded.AmmoDisplayInfo[1].AmmoIconTexture);
                            }
                        }                        
                    }
                    else
                    {
                        AmmoCount = LPPC.GetAmmoCountInMunitionsLockerFromString(TDUnloaded.AmmoDisplayInfo[0].AmmoTuneDataString);
                        // End:0xC3B
                        if((curPrimaryWeapon != none) && TDUnloaded.contentClassName == string(curPrimaryWeapon.Class.Name))
                        {
                            AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curPrimaryWeapon, TDUnloaded.AmmoDisplayInfo[0].AmmoTuneDataString));                            
                        }
                        else
                        {
                            // End:0xCF8
                            if((curSecondaryWeapon != none) && TDUnloaded.contentClassName == string(curSecondaryWeapon.Class.Name))
                            {
                                AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curSecondaryWeapon, TDUnloaded.AmmoDisplayInfo[0].AmmoTuneDataString));                                
                            }
                            else
                            {
                                // End:0xDB2
                                if((curTertiaryWeapon != none) && TDUnloaded.contentClassName == string(curTertiaryWeapon.Class.Name))
                                {
                                    AmmoCount += (GetWeaponAmmoFromAmmoTypeString(curTertiaryWeapon, TDUnloaded.AmmoDisplayInfo[0].AmmoTuneDataString));
                                }
                            }
                        }
                        // End:0xE24
                        if(AmmoCount == -1)
                        {
                            AltAmmoCount = JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                            
                        }
                        else
                        {
                            AltAmmoCount = "" $ string(AmmoCount);
                        }
                    }
                    TDUpgrade = SPTuneDataBaseWeaponUpgrade(FindObject(TDUnloaded.UpgradeDisplayInfo.UpgradeTuneDataString, Class'SPEngine.SPTuneDataBaseWeaponUpgrade'));
                    // End:0xF34
                    if((TDUpgrade != none) && TDUpgrade.HasBeenPurchased())
                    {
                        upgradeName = TDUnloaded.UpgradeDisplayInfo.FriendlyName;
                        DetailHUDIconName = GetUILoaderPathForTexture(TDUnloaded.HUDIconUpgradeTexture);
                    }
                    Weapons[I].CollectibleIndex = totalCount;
                    InitWeaponCollectible(2, totalCount, LPSI.ItemTitle, ((bCanEquip) ? WeaponIconName : GrenadeIconName), false, false, bNewItem, DetailHUDIconName, JobLogMP.GetLocalizedString(LPSI.ItemDescription), bDisplayStats, StatValue[0], statUpgradeValue[0], statString[0], StatValue[1], statUpgradeValue[1], statString[1], StatValue[2], statUpgradeValue[2], statString[2], false, "", upgradeName, bShowAltAmmo, AltAmmoName, AltAmmoCount, AltAmmoIconName);
                }                
            }
            else
            {
                Weapons[I].CollectibleIndex = totalCount;
                InitWeaponCollectible(2, totalCount, "", "", true, false, false, "", "", false, 0.0000000, 0.0000000, "", 0.0000000, 0.0000000, "", 0.0000000, 0.0000000, "", false, "", "", false, "", "", "");
            }
            totalCount++;
            // End:0x1156
            if(!bLocked)
            {
                FoundCount++;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x1FF;
    }
    InitCollectiblesFromUpgradesArray(2, totalCount, VSWeapons, WeaponIconName, FoundCount, totalCount);
    WeaponsProgString = (string(FoundCount) $ "/") $ string(totalCount);
    SetWeaponsProgressString();
    //return;    
}

function GetWeaponAmmoFromAmmoTypeString()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTypeString[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    // End:0x37
    if((W == none) || W.TuneDataBaseWeapon == none)
    {
        return 0;
    }
    I = 0;
    J0x42:

    // End:0x192 [Loop If]
    if(I < W.TuneDataBaseWeapon.SupportedAmmoTypes.Length)
    {
        // End:0x184
        if(((string(W.TuneDataBaseWeapon.SupportedAmmoTypes[I].Name) == AmmoTypeString) && W.AmmoTypes.Length > I) && W.AmmoTypes[I] != none)
        {
            return W.AmmoTypes[I].GetTotalAmmo();
        }
        I++;
        // [Loop Continue]
        goto J0x42;
    }
    return 0;
    //return ReturnValue;    
}

function GetUILoaderPathForTexture()
{
    local /*0x97E50000-0x00000000*/ private @NULL Texture[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], imgString;

    imgString = "";
    // End:0x42
    if(Texture != none)
    {
        imgString = "img://" $ PathName(Texture);
    }
    return imgString;
    //return ReturnValue;    
}

function InitCollectiblesFromUpgradesArray()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], StartingIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array InUpgrades[25165825];
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName[8388609];
    local /*0x97E50000-0x00000000*/ private int outFoundCount[25165825], outTotalCount, I, J;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CollectibleName;
    local /*0x97E50000-0x00000000*/ private bool bLocked;
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private bool bNewItem, bIsInRig;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DataType, itemStatusMsg, itemStatusMsgRig, DetailHUDIconName, DescriptionString;

    local /*0x97E50000-0x00000000*/ private @NULL LPSI, TuneData, TDUpgrade, DDS;

    DataType = "nostats";
    itemStatusMsgRig = JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.InRig>");
    Index = StartingIndex;
    I = 0;
    J0x81:

    // End:0x4ED [Loop If]
    if(I < InUpgrades.Length)
    {
        TuneData = SPTuneDataShopItem(FindObject(InUpgrades[I].UpgradeTuneDataName, Class'SPEngine.SPTuneDataShopItem'));
        bLocked = true;
        CollectibleName = "";
        bNewItem = false;
        DetailHUDIconName = "";
        DescriptionString = "";
        bIsInRig = InUpgrades[I].bInRig;
        // End:0x176
        if(bIsInRig)
        {
            itemStatusMsg = itemStatusMsgRig;            
        }
        else
        {
            itemStatusMsg = "";
        }
        // End:0x417
        if(TuneData != none)
        {
            TDUpgrade = LPTuneDataUpgradeBase(TuneData);
            // End:0x1EB
            if(TDUpgrade != none)
            {
                bLocked = !TDUpgrade.IsEnabled();                
            }
            else
            {
                bLocked = !TuneData.HasBeenPurchased();
            }
            LPSI = LPShopInterface(TuneData.ShopInterface);
            // End:0x417
            if(LPSI != none)
            {
                CollectibleName = LPSI.ItemTitle;
                DescriptionString = JobLogMP.GetLocalizedString(LPSI.ItemDescription);
                DetailHUDIconName = JobLogMP.GetUILoaderPathForTextureFromPathName(LPSI.IconTextureString);
                // End:0x417
                if(!bLocked)
                {
                    bNewItem = true;
                    // End:0x341
                    if(bNewItem)
                    {
                        bNewContent = true;
                    }
                    J = 0;
                    J0x34C:

                    // End:0x417 [Loop If]
                    if(J < LPSI.UnlockingObjectives.Length)
                    {
                        DDS = LPQDD_ObjectiveShopItem(LPSI.UnlockingObjectives[J].DynamicData);
                        // End:0x409
                        if(DDS != none)
                        {
                            // End:0x409
                            if(DDS.bItemViewedInJobLog)
                            {
                                bNewItem = false;
                                // [Explicit Break]
                                goto J0x417;
                            }
                        }
                        J++;
                        // [Loop Continue]
                        goto J0x34C;
                    }
                }
            }
        }
        J0x417:

        InUpgrades[I].CollectibleIndex = outTotalCount;
        InitCollectible(CollectibleSlotNum, Index++, CollectibleName, HUDIconName, bLocked, false, bNewItem, DetailHUDIconName, DescriptionString, DataType, bIsInRig, itemStatusMsg);
        outTotalCount++;
        // End:0x4DF
        if(!bLocked)
        {
            outFoundCount++;
        }
        I++;
        // [Loop Continue]
        goto J0x81;
    }
    //return;    
}

function InitCollectible()
{
    local /*0x97E50000-0x00000000*/ private int Type[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName[8388609], HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bPartialComplete, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName[8388609], DescriptionString, DataType;
    local /*0x97E50000-0x00000000*/ private bool bInRig[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string itemStatusMsg[8388609];

    ActionScriptVoid("InitCollectible");
    //return;    
}

function InitWeaponCollectible()
{
    local /*0x97E50000-0x00000000*/ private int Type[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName[8388609], HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bPartialComplete, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName[8388609], DescriptionString;
    local /*0x97E50000-0x00000000*/ private bool bShowStats[8388609];
    local /*0x97E50000-0x00000000*/ private float statValue1[8388609], statUpgradeValue1;
    local /*0x97E50000-0x00000000*/ private editfixedsize string statString1[8388609];
    local /*0x97E50000-0x00000000*/ private float StatValue2[8388609], statUpgradeValue2;
    local /*0x97E50000-0x00000000*/ private editfixedsize string statString2[8388609];
    local /*0x97E50000-0x00000000*/ private float statValue3[8388609], statUpgradeValue3;
    local /*0x97E50000-0x00000000*/ private editfixedsize string statString3[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInRig[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string itemStatusMsg[8388609], upgradeName;
    local /*0x97E50000-0x00000000*/ private bool bShowAltAmmo[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string AltAmmoName[8388609], AltAmmoCount, AltAmmoIconName, DataType;

    "nostats"
    ActionScriptVoid("InitWeaponCollectible");
    //return;    
}

function OnWeaponsHeaderFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x31
    if(bViewed)
    {
        AccordionTabsViewed[0] = 1;
        SetWeaponItemViewed(0, int(GetCurrentCollectibleIndex()));
    }
    //return;    
}

function OnPlayerUpgradesHeaderFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3A
    if(bViewed)
    {
        AccordionTabsViewed[1] = 1;
        SetCollectibleItemViewed(1, int(GetCurrentCollectibleIndex()), PlayerUpgrades);
    }
    //return;    
}

function OnVSUpgradesHeaderFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x3B
    if(bViewed)
    {
        AccordionTabsViewed[2] = 1;
        SetCollectibleItemViewed(1, int(GetCurrentCollectibleIndex()), VSUpgrades);
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x2E
        case 'View':
            // End:0x13F
            break;
        // End:0x72
        case 'InfoLabel':
            InfoLabel = Widget;
            InfoLabel.SetText("");
            // End:0x13F
            break;
        // End:0x95
        case 'b1':
            SetUpWeaponsHeaderWidget(Widget, 0);
            // End:0x13F
            break;
        // End:0xB8
        case 'b2':
            SetUpPlayerUpgradesHeaderWidget(Widget, 1);
            // End:0x13F
            break;
        // End:0xDC
        case 'b3':
            SetUpVSUpgradesHeaderWidget(Widget, 2);
            // End:0x13F
            break;
        // End:0x13C
        case 'b4':
            Widget.SetString("label", "<Strings:LostPlanetGame.JobLog.KeyItems>");
            // End:0x13F
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x17E
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function SetUpWeaponsHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    ASRegisterHeader(TabIndex, "WeaponsView");
    WeaponsHeader = Widget;
    WeaponsHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.Weapons>");
    SetWeaponsProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnWeaponsHeaderFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function SetUpPlayerUpgradesHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    ASRegisterHeader(TabIndex, "PlayerGearView");
    PlayerUpgradesHeader = Widget;
    PlayerUpgradesHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.Upgrades>");
    SetPlayerUpgradesProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnPlayerUpgradesHeaderFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function SetUpVSUpgradesHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    ASRegisterHeader(TabIndex, "VSGearView");
    VSUpgradesHeader = Widget;
    VSUpgradesHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.UtilityRig>");
    SetVSUpgradesProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnVSUpgradesHeaderFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function ASRegisterHeader()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string DataViewName[8388609];

    ActionScriptVoid("RegisterHeader");
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    return Retval;
    //return ReturnValue;    
}

function SetEquipmentButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    s1 = "";
    s2 = "";
    s3 = "";
    s4 = "";
    s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    s6 = "";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Equipment>"), self);
    JobLogMP.ASRepositionButtonPrompts();
    //return;    
}

function Viewed()
{
    local /*0x97E50000-0x00000000*/ private int currentViewIndex;

    bViewed = true;
    currentViewIndex = int(GetCurrentViewIndex());
    AccordionTabsViewed[currentViewIndex] = 1;
    SetCurrentEquipmentCollectible(currentViewIndex, int(GetCurrentCollectibleIndex()));
    SetEquipmentButtonLegend();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x42
    if(bCollectibleChanged)
    {
        JobLogMP.PlaySoundFromTheme('InventoryCollectibleScroll');
        bCollectibleChanged = false;
    }
    //return;    
}

defaultproperties
{
    PlayerUpgrades=/* Array type was not detected. */
    VSUpgrades=/* Array type was not detected. */
    PlayerUpgradeIconName="iconPlayerUpgrades"
    VSUpgradeIconName="iconRigUpgrades"
    Weapons=/* Array type was not detected. */
    WeaponIconName="iconWeapons"
    GrenadeIconName="iconGrenades"
    SubWidgetBindings=/* Array type was not detected. */
}