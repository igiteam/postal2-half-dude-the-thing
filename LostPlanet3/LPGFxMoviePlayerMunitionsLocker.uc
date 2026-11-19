class LPGFxMoviePlayerMunitionsLocker extends SPGFxMoviePlayer
    config(UI);

enum EWeaponRing
{
    EWeaponRing_PRIMARY,            // 0
    EWeaponRing_SECONDARY,          // 1
    EWeaponRing_TERTIARY,           // 2
    EWeaponRing_DEPLOYABLE_LEFT,    // 3
    EWeaponRing_DEPLOYABLE_RIGHT,   // 4
    EWeaponRing_PASSIVE1,           // 5
    EWeaponRing_PASSIVE2,           // 6
    EWeaponRing_MAX                 // 7
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Root;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponCategoryLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponNameLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponDescriptionLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SubContentLeftHeaderLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SubContentRightHeaderLabel;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CurrentLoadout[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SFLoader[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LoadedInventoryClasses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxDamage[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxFiringRate[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxAccuracy[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankDeployableTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankPassiveTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInShell;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMessageVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL deployableObj[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL weaponObj[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MessageText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnCloseDelegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnLockerClosed__Delegate;

delegate OnLockerClosed()
{
    //return;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    false
    LPC = LPPlayerController(GetPC());
    bInShell = LPMenuGamePC(LPC) != none;
    bSaveProfile = false;
    // End:0xAC
    if((int(LPC.WorldInfo.NetMode) == int(NM_Standalone)) && !bInShell)
    {
        bPauseGameWhileActive = true;        
    }
    else
    {
        bPauseGameWhileActive = false;
    }
    super.Start();
    Advance(0.0000000);
    // End:0xFF
    if(deployableObj == none)
    {
        deployableObj = CreateObject("Object");
    }
    // End:0x12C
    if(weaponObj == none)
    {
        weaponObj = CreateObject("Object");
    }
    SetMovieCanReceiveInput(true);
    Root = GetVariableObject("_root");
    MunitionsLocker = GetVariableObject("_root.munitionsLocker");
    InitLoadout();
    // End:0x1F0
    if((int(LPC.WorldInfo.NetMode) == int(NM_Standalone)) && !bInShell)
    {
        InitRings(true);
        InitWeaponsSinglePlayer();        
    }
    else
    {
        InitRings(false);
        InitWeapons();
        InitPerks();
    }
    ReadyToDisplay();    
    GetPC().ConsoleCommand("HideLPHUD 1");
    PlayerBeginMunitionsLocker();
    // End:0x2A1
    if(bSaveProfile)
    {
        // End:0x295
        if(LPC != none)
        {
            LPC.SaveProfile();
        }
        bSaveProfile = false;
    }
    bMessageVisible = false;
    MessageText = "";
    MessageValue = -1;
    return true;
    //return ReturnValue;    
}

function EnableUtilitiesTab()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function PlayerBeginMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(GetPC());
    // End:0x4C
    if(LPC != none)
    {
        LPC.SetAimDownSightMode(false);
    }
    //return;    
}

function IsPerkUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL PerkTD[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PerkTD.IsUnlocked(GetPC(), bInShell);
    //return ReturnValue;    
}

function IsWeaponUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL WeaponTD[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x96
    if(bInShell || int(GetPC().WorldInfo.NetMode) != int(NM_Standalone))
    {
        return LPPlayerController(GetPC()).IsUnlockedMP(WeaponTD.UnlockName);
    }
    return false;
    //return ReturnValue;    
}

function InitRings()
{
    local /*0x97E50000-0x00000000*/ private bool bSinglePlayer[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LeftDeployableString, RightDeployableString;

    InitItemRing(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Primary>"), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 0)));
    InitItemRing(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Secondary>"), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 1)));
    InitItemRing(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Tertiary>"), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 2)));
    // End:0x442
    if(!bSinglePlayer)
    {
        // End:0x1DD
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            LeftDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.LeftDeployables360>";
            RightDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.RightDeployables360>";            
        }
        else
        {
            // End:0x293
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
            {
                LeftDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.LeftDeployablesPS3>";
                RightDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.RightDeployablesPS3>";                
            }
            else
            {
                LeftDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.LeftDeployables>";
                RightDeployableString = "<Strings:LostPlanetGame.MunitionsLocker.RightDeployables>";
            }
        }
        InitItemRing(GetLocalizedString(LeftDeployableString), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 3)));
        InitItemRing(GetLocalizedString(RightDeployableString), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 4)));
        InitItemRing(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Passives1>"), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 5)));
        InitItemRing(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Passives2>"), string(GetEnum(Enum'LPGFxMoviePlayerMunitionsLocker.EWeaponRing', 6)));
    }
    //return;    
}

function InitItemRing()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ringName[8388609], ringType;

    MunitionsLocker.ActionScriptVoid("InitItemRing");
    //return;    
}

function InitLoadout()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, ActiveKit;

    LPC = LPPlayerController(GetPC());
    // End:0xF9
    if(LPC != none)
    {
        // End:0x98
        if(CurrentLoadout.LoadoutKitManager == none)
        {
            CurrentLoadout.LoadoutKitManager = LPPlayerController(GetPC()).GetLoadoutKitManager();
        }
        ActiveKit = LPC.GetLoadoutKit();
        // End:0xF9
        if(ActiveKit != none)
        {
            CurrentLoadout.CopyProperties(ActiveKit);
        }
    }
    //return;    
}

function InitPerks()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, Perks, Perk;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bPassive;
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName, FriendlyName, Description;
    local /*0x97E50000-0x00000000*/ private @NULL LPS;
    local /*0x97E50000-0x00000000*/ private name PerkName;
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked;
    local /*0x97E50000-0x00000000*/ private int Cost, FloatUpgradeIdx, UpgradeIdx;
    local /*0x97E50000-0x00000000*/ private @NULL deployableUpgradesArray, deployableUpgrade;
    local /*0x97E50000-0x00000000*/ private int deployableUpgradeIdx;
    local /*0x97E50000-0x00000000*/ private @NULL PerkUpgrade;
    local /*0x97E50000-0x00000000*/ private bool bCheckMP, bInitialSelection;
    local /*0x97E50000-0x00000000*/ private int Slot;

    LPC = LPPlayerController(GetPC());
    // End:0x2E
    if(LPC == none)
    {
        return;
    }
    // End:0x5C
    if(CurrentLoadout != none)
    {
        CurrentLoadout.ApplyLoadoutPerks();
    }
    LPS = LPProfileSettings(LPC.ProfileSettings);
    bCheckMP = bInShell || int(GetPC().WorldInfo.NetMode) != int(NM_Standalone);
    Perks = LPPRI(LPC.PlayerReplicationInfo).PerksManager;
    // End:0x1167
    if(Perks != none)
    {
        deployableObj.SetString("name", "");
        deployableObj.SetString("friendlyName", "");
        deployableObj.SetString("description", "");
        deployableObj.SetBool("bPassive", false);
        deployableObj.SetString("CostString", "");
        deployableObj.SetObject("UpgradeStats", none);
        Slot = 0;
        bInitialSelection = Perks.AssignedPerk[Slot].Perk == none;
        deployableObj.SetString("iconName", GetUILoaderPathForTexture(BlankPassiveTexture));
        deployableObj.SetBool("bInitialSelection", bInitialSelection);
        InitDeployableFromObject(deployableObj, 5);
        Slot = 1;
        bInitialSelection = Perks.AssignedPerk[Slot].Perk == none;
        deployableObj.SetString("iconName", GetUILoaderPathForTexture(BlankDeployableTexture));
        deployableObj.SetBool("bInitialSelection", bInitialSelection);
        InitDeployableFromObject(deployableObj, 4);
        Slot = 2;
        bInitialSelection = Perks.AssignedPerk[Slot].Perk == none;
        deployableObj.SetString("iconName", GetUILoaderPathForTexture(BlankPassiveTexture));
        deployableObj.SetBool("bInitialSelection", bInitialSelection);
        InitDeployableFromObject(deployableObj, 6);
        Slot = 3;
        bInitialSelection = Perks.AssignedPerk[Slot].Perk == none;
        deployableObj.SetString("iconName", GetUILoaderPathForTexture(BlankDeployableTexture));
        deployableObj.SetBool("bInitialSelection", bInitialSelection);
        InitDeployableFromObject(deployableObj, 3);
        I = 0;
        J0x5DA:

        // End:0x1016 [Loop If]
        if(I < 22)
        {
            bIsUnlocked = false;
            // End:0x1008
            if(Perks.PerkList[I] != none)
            {
                Perk = Perks.PerkList[I];
                bIsUnlocked = IsPerkUnlocked(Perk.PerkBaseTuneData);
                // End:0x1008
                if(bIsUnlocked)
                {
                    HUDIconName = GetUILoaderPathForTexture(Perk.PerkBaseTuneData.HUDIconTexture);
                    FriendlyName = Perk.FriendlyName;
                    Description = GetLocalizedString(Perk.Description);
                    PerkName = Perk.PerkName;
                    bPassive = Perk.IsPassive();
                    deployableObj.SetString("name", string(PerkName));
                    deployableObj.SetString("iconName", HUDIconName);
                    deployableObj.SetString("friendlyName", FriendlyName);
                    deployableObj.SetString("description", Description);
                    deployableObj.SetBool("bPassive", bPassive);
                    Cost = int(Perk.GetCost());
                    // End:0x93D
                    if(Cost > 0)
                    {
                        deployableObj.SetString("CostString", GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Cost>" @ string(Cost)));                        
                    }
                    else
                    {
                        deployableObj.SetString("CostString", "");
                    }
                    deployableUpgradesArray = none;
                    deployableUpgradeIdx = 0;
                    FloatUpgradeIdx = 0;
                    J0x98C:

                    // End:0xBAC [Loop If]
                    if(FloatUpgradeIdx < Perk.PerkBaseTuneData.PerkUpgrades.Length)
                    {
                        PerkUpgrade = Perk.PerkBaseTuneData.PerkUpgrades[FloatUpgradeIdx];
                        UpgradeIdx = 0;
                        J0xA20:

                        // End:0xB9E [Loop If]
                        if(UpgradeIdx < PerkUpgrade.Upgrades.Length)
                        {
                            // End:0xA70
                            if(deployableUpgradesArray == none)
                            {
                                deployableUpgradesArray = CreateArray();
                            }
                            deployableUpgrade = CreateObject("Object");
                            deployableUpgrade.SetString("Name", PerkUpgrade.Upgrades[UpgradeIdx].FriendlyName);
                            deployableUpgrade.SetBool("bUnlocked", PerkUpgrade.UpgradeIsUnlocked(UpgradeIdx, LPC, bCheckMP));
                            deployableUpgradesArray.SetElementObject(deployableUpgradeIdx, deployableUpgrade);
                            deployableUpgradeIdx++;
                            UpgradeIdx++;
                            // [Loop Continue]
                            goto J0xA20;
                        }
                        FloatUpgradeIdx++;
                        // [Loop Continue]
                        goto J0x98C;
                    }
                    deployableObj.SetObject("UpgradeStats", deployableUpgradesArray);
                    // End:0xDFD
                    if(bPassive)
                    {
                        Slot = 0;
                        bInitialSelection = (Perks.AssignedPerk[Slot].Perk != none) && Perks.AssignedPerk[Slot].Perk.PerkName == PerkName;
                        deployableObj.SetBool("bInitialSelection", bInitialSelection);
                        InitDeployableFromObject(deployableObj, 5);
                        Slot = 2;
                        bInitialSelection = (Perks.AssignedPerk[Slot].Perk != none) && Perks.AssignedPerk[Slot].Perk.PerkName == PerkName;
                        deployableObj.SetBool("bInitialSelection", bInitialSelection);
                        InitDeployableFromObject(deployableObj, 6);                        
                    }
                    else
                    {
                        Slot = 3;
                        bInitialSelection = (Perks.AssignedPerk[Slot].Perk != none) && Perks.AssignedPerk[Slot].Perk.PerkName == PerkName;
                        deployableObj.SetBool("bInitialSelection", bInitialSelection);
                        InitDeployableFromObject(deployableObj, 3);
                        Slot = 1;
                        bInitialSelection = (Perks.AssignedPerk[Slot].Perk != none) && Perks.AssignedPerk[Slot].Perk.PerkName == PerkName;
                        deployableObj.SetBool("bInitialSelection", bInitialSelection);
                        InitDeployableFromObject(deployableObj, 4);
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0x5DA;
        }
        I = 0;
        J0x1021:

        // End:0x1167 [Loop If]
        if(I < 4)
        {
            // End:0x10F9
            if(Perks.AssignedPerk[I].bLocked)
            {
                LockSlot(I);
                // End:0x10F6
                if((LPS != none) && !LPS.IsDPadSlotLocked(I))
                {
                    LPS.SetDPadSlotStatus(I, true);
                    bSaveProfile = true;
                }                
            }
            else
            {
                // End:0x1159
                if(LPS.IsDPadSlotLocked(I))
                {
                    LPS.SetDPadSlotStatus(I, false);
                    bSaveProfile = true;
                }
            }
            I++;
            // [Loop Continue]
            goto J0x1021;
        }
    }
    //return;    
}

function InitDeployableFromObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL depObject[8388609];
    local /*0x97E50000-0x00000000*/ private int ringIndex[8388609];

    MunitionsLocker.ActionScriptVoid("InitDeployableFromObject");
    //return;    
}

function LockSlot()
{
    local /*0x97E50000-0x00000000*/ private int InputSlotIndex[8388609];

    MunitionsLocker.ActionScriptVoid("LockSlot");
    //return;    
}

function InitWeapons()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName, AmmoIconName, FriendlyName, Description;
    local /*0x97E50000-0x00000000*/ private class SPInvClass, LPWeaponClass;
    local /*0x97E50000-0x00000000*/ private @NULL TDWeapon, invWeapon, curPrimaryWeapon, curSecondaryWeapon, curTertiaryWeapon;

    local /*0x97E50000-0x00000000*/ private editfixedsize string curPrimaryWeaponClass, curSecondaryWeaponClass, curTertiaryWeaponClass;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private bool bInitialSelection, bIsWeaponUnlocked, bHasInvalidWeapons;
    local /*0x97E50000-0x00000000*/ private int UpgradeIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ProfilePrimaryWeapon, ProfileSecondaryWeapon, ProfileTertiaryWeapon;
    local /*0x97E50000-0x00000000*/ private int AmmoCount;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private @NULL TDAmmo;
    local /*0x97E50000-0x00000000*/ private int weaponCount, tertiaryCount;
    local /*0x97E50000-0x00000000*/ private @NULL TDUnloaded;
    local /*0x97E50000-0x00000000*/ private float statPercent;
    local /*0x97E50000-0x00000000*/ private int StatIdx, NumRingsRemoved;
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;

    LPC = LPPlayerController(GetPC());
    // End:0x55
    if(LPC != none)
    {
        LPP = LPC.GetMyPlayerPawn();
    }
    // End:0x478
    if(LPP != none)
    {
        curPrimaryWeapon = SPInventoryWeapon(LPP.Weapon);
        // End:0xD6
        if(curPrimaryWeapon != none)
        {
            curPrimaryWeaponClass = PathName(curPrimaryWeapon.Class);
        }
        curSecondaryWeapon = none;
        // End:0x28B
        foreach LPP.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', invWeapon)
        {
            // End:0x1B6
            if((curTertiaryWeapon == none) && !invWeapon.bCanEquip)
            {
                curTertiaryWeapon = invWeapon;
                // End:0x1B3
                if(curTertiaryWeapon != none)
                {
                    curTertiaryWeaponClass = PathName(curTertiaryWeapon.Class);
                }
                // End:0x28A
                continue;
            }
            // End:0x28A
            if(((((curSecondaryWeapon == none) && invWeapon != curPrimaryWeapon) && LPInventoryWeaponNone(invWeapon) == none) && LPWeaponPistol(invWeapon) == none) && invWeapon.bCanEquip)
            {
                curSecondaryWeapon = invWeapon;
                // End:0x28A
                if(curSecondaryWeapon != none)
                {
                    curSecondaryWeaponClass = PathName(curSecondaryWeapon.Class);
                }
            }            
        }        
        // End:0x330
        if(!LPC.IsValidWeaponForServer(curPrimaryWeaponClass))
        {
            curPrimaryWeaponClass = Class'LPLoadoutKitSerializableData'.default.WeaponPrimary;
            // End:0x324
            if(curPrimaryWeaponClass == "")
            {
                curPrimaryWeaponClass = PathName(curPrimaryWeapon.Class);
            }
            bHasInvalidWeapons = true;
        }
        // End:0x3D4
        if(!LPC.IsValidWeaponForServer(curSecondaryWeaponClass))
        {
            curSecondaryWeaponClass = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;
            // End:0x3C8
            if(curSecondaryWeaponClass == "")
            {
                curSecondaryWeaponClass = PathName(curSecondaryWeapon.Class);
            }
            bHasInvalidWeapons = true;
        }
        // End:0x478
        if(!LPC.IsValidWeaponForServer(curTertiaryWeaponClass))
        {
            curTertiaryWeaponClass = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;
            // End:0x46C
            if(curTertiaryWeaponClass == "")
            {
                curTertiaryWeaponClass = PathName(curTertiaryWeapon.Class);
            }
            bHasInvalidWeapons = true;
        }
    }
    // End:0x6B7
    if(CurrentLoadout != none)
    {
        ProfilePrimaryWeapon = CurrentLoadout.GetWeaponPath(0);
        ProfileSecondaryWeapon = CurrentLoadout.GetWeaponPath(1);
        ProfileTertiaryWeapon = CurrentLoadout.GetWeaponPath(2);
        // End:0x596
        if(!LPC.IsValidWeaponForServer(ProfilePrimaryWeapon))
        {
            ProfilePrimaryWeapon = Class'LPLoadoutKitSerializableData'.default.WeaponPrimary;
            // End:0x596
            if(ProfilePrimaryWeapon == "")
            {
                ProfilePrimaryWeapon = CurrentLoadout.GetWeaponPath(0);
            }
        }
        // End:0x626
        if(!LPC.IsValidWeaponForServer(ProfileSecondaryWeapon))
        {
            ProfileSecondaryWeapon = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;
            // End:0x626
            if(ProfileSecondaryWeapon == "")
            {
                ProfileSecondaryWeapon = CurrentLoadout.GetWeaponPath(1);
            }
        }
        // End:0x6B7
        if(!LPC.IsValidWeaponForServer(ProfileTertiaryWeapon))
        {
            ProfileTertiaryWeapon = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;
            // End:0x6B7
            if(ProfileTertiaryWeapon == "")
            {
                ProfileTertiaryWeapon = CurrentLoadout.GetWeaponPath(2);
            }
        }
    }
    I = 0;
    J0x6C2:

    // End:0x1F11 [Loop If]
    if(I < LPC.WeaponContentReferences.Length)
    {
        // End:0x755
        if(!LPC.IsValidWeaponForServer(PathName(LPC.WeaponContentReferences[I])))
        {
            bHasInvalidWeapons = true;            
        }
        else
        {
            LPWeaponClass = class<LPWeapon>(LPC.WeaponContentReferences[I]);
            SPInvClass = class<SPInventoryWeapon>(LPC.WeaponContentReferences[I]);
            // End:0x833
            if(LPWeaponClass != none)
            {
                TDWeapon = LPTuneDataBaseWeapon(LPWeaponClass.default.TuneDataBaseWeapon_MP);
                TDUnloaded = LPWeaponClass.default.TuneDataUnloadedWeaponInfo;
            }
            bIsWeaponUnlocked = ((LPP != none) && LPP.WorldInfo.IsPlayInEditor()) || (TDWeapon != none) && IsWeaponUnlocked(TDWeapon);
            // End:0x1F03
            if((SPInvClass != none) && bIsWeaponUnlocked)
            {
                weaponObj.SetString("UpgradeName", "");
                HUDIconName = GetUILoaderPathForTexture(SPInvClass.default.HUDIconTexture);
                // End:0xAAF
                if(!Class'LPWeapon'.static.IsPreOrderWeaponClass(SPInvClass))
                {
                    UpgradeIdx = 0;
                    J0x963:

                    // End:0xAAF [Loop If]
                    if(UpgradeIdx < TDWeapon.SupportedUpgrades.Length)
                    {
                        // End:0xAA1
                        if(LPTuneDataWeaponUpgrade(TDWeapon.SupportedUpgrades[UpgradeIdx]).IsUnlocked(LPC, true))
                        {
                            HUDIconName = GetUILoaderPathForTexture(SPInvClass.default.HUDIconUpgradeTexture);
                            weaponObj.SetString("UpgradeName", LPShopInterface(TDWeapon.SupportedUpgrades[UpgradeIdx].ShopInterface).ItemTitle);
                            // [Explicit Break]
                            goto J0xAAF;
                        }
                        UpgradeIdx++;
                        // [Loop Continue]
                        goto J0x963;
                    }
                }
                J0xAAF:

                FriendlyName = SPInvClass.default.FriendlyName;
                Description = GetLocalizedString(SPInvClass.default.Description);
                weaponObj.SetString("name", PathName(LPC.WeaponContentReferences[I]));
                weaponObj.SetString("iconName", HUDIconName);
                weaponObj.SetString("friendlyName", FriendlyName);
                weaponObj.SetString("description", Description);
                weaponObj.SetBool("bDisplayStats", false);
                weaponObj.SetFloat("statValue1", 0.0000000);
                weaponObj.SetFloat("statValue2", 0.0000000);
                weaponObj.SetFloat("statValue3", 0.0000000);
                weaponObj.SetString("statString1", Description);
                weaponObj.SetString("statString2", Description);
                weaponObj.SetString("statString3", Description);
                weaponObj.SetBool("bDisplayAmmo", false);
                weaponObj.SetString("PrimaryAmmoName", "");
                weaponObj.SetString("PrimaryAmmoCount", "");
                weaponObj.SetString("ammoIconName", "");
                weaponObj.SetBool("bShowAltAmmo", true);
                weaponObj.SetBool("bAltAmmoLocked", true);
                weaponObj.SetString("AltAmmoName", "");
                weaponObj.SetString("AltAmmoCount", "");
                weaponObj.SetString("AltAmmoIconName", "");
                weaponObj.SetBool("bTertiary", false);
                // End:0x19F8
                if(SPInvClass.default.bCanEquip)
                {
                    // End:0x11B2
                    if(TDUnloaded != none)
                    {
                        StatIdx = 0;
                        J0xF7E:

                        // End:0x11B2 [Loop If]
                        if(StatIdx < 3)
                        {
                            // End:0x1127
                            if(TDUnloaded.ShopItemAttributes.Length > StatIdx)
                            {
                                weaponObj.SetBool("bDisplayStats", true);
                                statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].InitialValue);
                                statPercent = statPercent / 100.0000000;
                                statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                                weaponObj.SetFloat("statValue" $ string(StatIdx + 1), statPercent);
                                weaponObj.SetString("statString" $ string(StatIdx + 1), TDUnloaded.ShopItemAttributes[StatIdx].AttributeName);                                
                            }
                            else
                            {
                                weaponObj.SetFloat("statValue" $ string(StatIdx + 1), 0.0000000);
                                weaponObj.SetString("statString" $ string(StatIdx + 1), "");
                            }
                            StatIdx++;
                            // [Loop Continue]
                            goto J0xF7E;
                        }
                    }
                    // End:0x17CC
                    if(TDWeapon != none)
                    {
                        // End:0x143E
                        if(TDWeapon.SupportedAmmoTypes.Length > 0)
                        {
                            weaponObj.SetBool("bDisplayAmmo", true);
                            weaponObj.SetString("PrimaryAmmoName", TDWeapon.SupportedAmmoTypes[0].FriendlyName);
                            AmmoCount = TDWeapon.SupportedAmmoTypes[0].GetMaxAmmoForWeapon();
                            // End:0x130D
                            if(AmmoCount > -1)
                            {
                                AmmoCount += TDWeapon.SupportedAmmoTypes[0].AmmoPerMagazine;
                            }
                            // End:0x136A
                            if(AmmoCount == -1)
                            {
                                S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                                
                            }
                            else
                            {
                                S = "" $ string(AmmoCount);
                            }
                            weaponObj.SetString("PrimaryAmmoCount", S);
                            AmmoIconName = GetUILoaderPathForTexture(TDWeapon.SupportedAmmoTypes[0].AmmoTypeIcon);
                            weaponObj.SetString("ammoIconName", AmmoIconName);
                        }
                        // End:0x17CC
                        if((TDWeapon.SupportedAmmoTypes.Length > 1) && !Class'LPWeapon'.static.IsPreOrderWeaponClass(SPInvClass))
                        {
                            TDAmmo = LPTuneDataAmmoDefault(TDWeapon.SupportedAmmoTypes[1]);
                            // End:0x1549
                            if((TDAmmo != none) && LPC.IsUnlockedMP(TDAmmo.UnlockName))
                            {
                                weaponObj.SetBool("bAltAmmoLocked", false);                                
                            }
                            else
                            {
                                weaponObj.SetBool("bAltAmmoLocked", true);
                            }
                            weaponObj.SetBool("bShowAltAmmo", true);
                            weaponObj.SetString("AltAmmoName", TDWeapon.SupportedAmmoTypes[1].FriendlyName);
                            AmmoCount = TDWeapon.SupportedAmmoTypes[1].GetMaxAmmoForWeapon();
                            // End:0x169C
                            if(AmmoCount > -1)
                            {
                                AmmoCount += TDWeapon.SupportedAmmoTypes[1].AmmoPerMagazine;
                            }
                            // End:0x16F9
                            if(AmmoCount == -1)
                            {
                                S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                                
                            }
                            else
                            {
                                S = "" $ string(AmmoCount);
                            }
                            weaponObj.SetString("AltAmmoCount", S);
                            AmmoIconName = GetUILoaderPathForTexture(TDWeapon.SupportedAmmoTypes[1].AmmoTypeIcon);
                            weaponObj.SetString("AltAmmoIconName", AmmoIconName);
                        }
                    }
                    bInitialSelection = false;
                    // End:0x1833
                    if(curPrimaryWeaponClass != "")
                    {
                        bInitialSelection = curPrimaryWeaponClass ~= PathName(LPC.WeaponContentReferences[I]);                        
                    }
                    else
                    {
                        // End:0x188B
                        if(ProfilePrimaryWeapon != "")
                        {
                            bInitialSelection = ProfilePrimaryWeapon ~= PathName(LPC.WeaponContentReferences[I]);
                        }
                    }
                    weaponObj.SetBool("bInitialSelection", bInitialSelection);
                    InitWeaponFromObject(weaponObj, 0);
                    bInitialSelection = false;
                    // End:0x1942
                    if(curSecondaryWeaponClass != "")
                    {
                        bInitialSelection = curSecondaryWeaponClass ~= PathName(LPC.WeaponContentReferences[I]);                        
                    }
                    else
                    {
                        // End:0x199A
                        if(ProfileSecondaryWeapon != "")
                        {
                            bInitialSelection = ProfileSecondaryWeapon ~= PathName(LPC.WeaponContentReferences[I]);
                        }
                    }
                    weaponObj.SetBool("bInitialSelection", bInitialSelection);
                    InitWeaponFromObject(weaponObj, 1);
                    weaponCount++;                    
                }
                else
                {
                    weaponObj.SetBool("bTertiary", true);
                    // End:0x1B9A
                    if(TDWeapon.SupportedAmmoTypes.Length > 0)
                    {
                        weaponObj.SetBool("bDisplayAmmo", true);
                        AmmoCount = TDWeapon.SupportedAmmoTypes[0].GetMaxAmmoForWeapon();
                        // End:0x1B13
                        if(AmmoCount == -1)
                        {
                            S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                            
                        }
                        else
                        {
                            S = "" $ string(AmmoCount);
                        }
                        weaponObj.SetString("PrimaryAmmoName", S);
                        weaponObj.SetString("PrimaryAmmoCount", "");
                    }
                    // End:0x1DE8
                    if(TDUnloaded != none)
                    {
                        StatIdx = 0;
                        J0x1BB4:

                        // End:0x1DE8 [Loop If]
                        if(StatIdx < 3)
                        {
                            // End:0x1D5D
                            if(TDUnloaded.ShopItemAttributes.Length > StatIdx)
                            {
                                weaponObj.SetBool("bDisplayStats", true);
                                statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].InitialValue);
                                statPercent = statPercent / 100.0000000;
                                statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                                weaponObj.SetFloat("statValue" $ string(StatIdx + 1), statPercent);
                                weaponObj.SetString("statString" $ string(StatIdx + 1), TDUnloaded.ShopItemAttributes[StatIdx].AttributeName);                                
                            }
                            else
                            {
                                weaponObj.SetFloat("statValue" $ string(StatIdx + 1), 0.0000000);
                                weaponObj.SetString("statString" $ string(StatIdx + 1), "");
                            }
                            StatIdx++;
                            // [Loop Continue]
                            goto J0x1BB4;
                        }
                    }
                    bInitialSelection = false;
                    // End:0x1E4F
                    if(curTertiaryWeaponClass != "")
                    {
                        bInitialSelection = curTertiaryWeaponClass ~= PathName(LPC.WeaponContentReferences[I]);                        
                    }
                    else
                    {
                        // End:0x1EA7
                        if(ProfileTertiaryWeapon != "")
                        {
                            bInitialSelection = ProfileTertiaryWeapon ~= PathName(LPC.WeaponContentReferences[I]);
                        }
                    }
                    weaponObj.SetBool("bInitialSelection", bInitialSelection);
                    InitWeaponFromObject(weaponObj, 2);
                    tertiaryCount++;
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x6C2;
    }
    NumRingsRemoved = 0;
    // End:0x1F4D
    if(weaponCount == 1)
    {
        ClearRing(1 - NumRingsRemoved, false);
        NumRingsRemoved++;
    }
    // End:0x1F7F
    if(tertiaryCount == 0)
    {
        ClearRing(2 - NumRingsRemoved, false);
        NumRingsRemoved++;
    }
    // End:0x20EE
    if(bHasInvalidWeapons && !LPC.bNotifiedOfInvalidWeapons)
    {
        OptionArray.AddItem("<Strings:SPGameUI.CalloutButtonText.Continue>");        
        Class'SPEngine.SPUIManager'.static.ShowUIMessage('InvalidWpnMunLocker', "<Strings:LostPlanetGame.MessageBoxStrings.DLCWeaponsNotAvailable_Title>", "<Strings:LostPlanetGame.MessageBoxStrings.DLCWeaponsNotAvailable_Message>", OptionArray,, none,,, false,, true, true,, None);
        LPC.bNotifiedOfInvalidWeapons = true;
    }
    //return;    
}

function InitWeaponsSinglePlayer()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName, AmmoIconName, FriendlyName, Description;
    local /*0x97E50000-0x00000000*/ private @NULL LPPWeapon, curPrimaryWeapon, curSecondaryWeapon, curTertiaryWeapon;
    local /*0x97E50000-0x00000000*/ private bool bInitialSelection, bIsPistolWeapon;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, LPP, TDUnloaded, TDUpgrade;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private int AmmoCount, weaponCount, tertiaryCount;
    local /*0x97E50000-0x00000000*/ private float statPercent;
    local /*0x97E50000-0x00000000*/ private int StatIdx, NumRingsRemoved;

    LPC = LPPlayerController(GetPC());
    // End:0x55
    if(LPC != none)
    {
        LPP = LPC.GetMyPlayerPawn();
    }
    LPC.ServerAddAllAmmoToMunitionsLocker();
    LPC.ServerRemoveAllAmmoFromWeapons();
    // End:0x205
    foreach LPP.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', LPPWeapon)
    {
        // End:0x204
        if(LPInventoryWeaponNone(LPPWeapon) == none)
        {
            bIsPistolWeapon = LPWeaponPistol(LPPWeapon) != none;
            // End:0x1D1
            if(LPPWeapon.bCanEquip)
            {
                // End:0x18A
                if((LPP.Weapon == LPPWeapon) && !bIsPistolWeapon)
                {
                    curPrimaryWeapon = LPPWeapon;
                    continue;                    
                }
                // End:0x1CE
                if(((curPrimaryWeapon != none) && curSecondaryWeapon == none) && !bIsPistolWeapon)
                {
                    curSecondaryWeapon = LPPWeapon;
                }
                // End:0x204
                continue;
            }
            // End:0x204
            if((curTertiaryWeapon == none) && !bIsPistolWeapon)
            {
                curTertiaryWeapon = LPPWeapon;
            }
        }        
    }    
    I = 0;
    J0x211:

    // End:0x1923 [Loop If]
    if(I < LPC.StoredWeaponsList.Length)
    {
        // End:0x2AE
        if(LPC.StoredWeaponsList[I].WeaponName == "LostPlanetGameContent.LPWeaponPistolContent")
        {            
        }
        else
        {
            HUDIconName = "";
            FriendlyName = LPC.StoredWeaponsList[I].WeaponFriendlyName;
            Description = GetLocalizedString(LPC.StoredWeaponsList[I].WeaponDescription);
            weaponObj.SetString("name", LPC.StoredWeaponsList[I].WeaponName);
            weaponObj.SetString("iconName", HUDIconName);
            weaponObj.SetString("friendlyName", FriendlyName);
            weaponObj.SetString("description", Description);
            weaponObj.SetBool("bDisplayStats", false);
            weaponObj.SetFloat("statValue1", 0.0000000);
            weaponObj.SetFloat("statValue2", 0.0000000);
            weaponObj.SetFloat("statValue3", 0.0000000);
            weaponObj.SetString("statString1", Description);
            weaponObj.SetString("statString2", Description);
            weaponObj.SetString("statString3", Description);
            weaponObj.SetBool("bDisplayAmmo", false);
            weaponObj.SetString("PrimaryAmmoName", "");
            weaponObj.SetString("PrimaryAmmoCount", "");
            weaponObj.SetString("ammoIconName", "");
            weaponObj.SetBool("bShowAltAmmo", true);
            weaponObj.SetBool("bAltAmmoLocked", true);
            weaponObj.SetString("AltAmmoName", "");
            weaponObj.SetString("AltAmmoCount", "");
            weaponObj.SetString("AltAmmoIconName", "");
            weaponObj.SetString("UpgradeName", "");
            weaponObj.SetBool("bTertiary", false);
            // End:0x1351
            if(LPC.StoredWeaponsList[I].bCanEquip)
            {
                TDUnloaded = LPTuneDataUnloadedWeaponInfo(FindObject(LPC.StoredWeaponsList[I].TuneDataUnloadedWeaponInfoString, Class'LPTuneDataUnloadedWeaponInfo'));
                // End:0x114C
                if(TDUnloaded != none)
                {
                    HUDIconName = GetUILoaderPathForTexture(TDUnloaded.HUDIconTexture);
                    weaponObj.SetString("iconName", HUDIconName);
                    StatIdx = 0;
                    J0x8DE:

                    // End:0xB12 [Loop If]
                    if(StatIdx < 3)
                    {
                        // End:0xA87
                        if(TDUnloaded.ShopItemAttributes.Length > StatIdx)
                        {
                            weaponObj.SetBool("bDisplayStats", true);
                            statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].InitialValue);
                            statPercent = statPercent / 100.0000000;
                            statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                            weaponObj.SetFloat("statValue" $ string(StatIdx + 1), statPercent);
                            weaponObj.SetString("statString" $ string(StatIdx + 1), TDUnloaded.ShopItemAttributes[StatIdx].AttributeName);                            
                        }
                        else
                        {
                            weaponObj.SetFloat("statValue" $ string(StatIdx + 1), 0.0000000);
                            weaponObj.SetString("statString" $ string(StatIdx + 1), "");
                        }
                        StatIdx++;
                        // [Loop Continue]
                        goto J0x8DE;
                    }
                    // End:0xD04
                    if((TDUnloaded.AmmoDisplayInfo.Length > 0) && !TDUnloaded.AmmoDisplayInfo[0].bMultiplayerOnly)
                    {
                        weaponObj.SetBool("bDisplayAmmo", true);
                        weaponObj.SetString("PrimaryAmmoName", TDUnloaded.AmmoDisplayInfo[0].FriendlyName);
                        S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");
                        weaponObj.SetString("PrimaryAmmoCount", S);
                        AmmoIconName = GetUILoaderPathForTexture(TDUnloaded.AmmoDisplayInfo[0].AmmoIconTexture);
                        weaponObj.SetString("ammoIconName", AmmoIconName);
                    }
                    // End:0xFFF
                    if((TDUnloaded.AmmoDisplayInfo.Length > 1) && !TDUnloaded.AmmoDisplayInfo[1].bMultiplayerOnly)
                    {
                        weaponObj.SetBool("bShowAltAmmo", true);
                        weaponObj.SetBool("bAltAmmoLocked", !LPC.IsAmmoTypeStringInMunitionsLocker(TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString));
                        weaponObj.SetString("AltAmmoName", TDUnloaded.AmmoDisplayInfo[1].FriendlyName);
                        AmmoCount = LPC.GetAmmoCountInMunitionsLockerFromString(TDUnloaded.AmmoDisplayInfo[1].AmmoTuneDataString);
                        // End:0xF2E
                        if(AmmoCount == -1)
                        {
                            S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                            
                        }
                        else
                        {
                            S = "" $ string(AmmoCount);
                        }
                        weaponObj.SetString("AltAmmoCount", S);
                        AmmoIconName = GetUILoaderPathForTexture(TDUnloaded.AmmoDisplayInfo[1].AmmoIconTexture);
                        weaponObj.SetString("AltAmmoIconName", AmmoIconName);
                    }
                    TDUpgrade = SPTuneDataBaseWeaponUpgrade(FindObject(TDUnloaded.UpgradeDisplayInfo.UpgradeTuneDataString, Class'SPEngine.SPTuneDataBaseWeaponUpgrade'));
                    // End:0x114C
                    if((TDUpgrade != none) && TDUpgrade.HasBeenPurchased())
                    {
                        weaponObj.SetString("UpgradeName", TDUnloaded.UpgradeDisplayInfo.FriendlyName);
                        HUDIconName = GetUILoaderPathForTexture(TDUnloaded.HUDIconUpgradeTexture);
                        weaponObj.SetString("iconName", HUDIconName);
                    }
                }
                bInitialSelection = false;
                // End:0x11D7
                if(curPrimaryWeapon != none)
                {
                    bInitialSelection = PathName(curPrimaryWeapon.Class) == LPC.StoredWeaponsList[I].WeaponName;
                }
                weaponObj.SetBool("bInitialSelection", bInitialSelection);
                InitWeaponFromObject(weaponObj, 0);
                bInitialSelection = false;
                // End:0x12F3
                if((curSecondaryWeapon != none) && LPC.StoredWeaponsList[I].bCanEquip)
                {
                    bInitialSelection = PathName(curSecondaryWeapon.Class) == LPC.StoredWeaponsList[I].WeaponName;
                }
                weaponObj.SetBool("bInitialSelection", bInitialSelection);
                InitWeaponFromObject(weaponObj, 1);
                weaponCount++;                
            }
            else
            {
                weaponObj.SetBool("bTertiary", true);
                TDUnloaded = LPTuneDataUnloadedWeaponInfo(FindObject(LPC.StoredWeaponsList[I].TuneDataUnloadedWeaponInfoString, Class'LPTuneDataUnloadedWeaponInfo'));
                // End:0x182E
                if(TDUnloaded != none)
                {
                    HUDIconName = GetUILoaderPathForTexture(TDUnloaded.HUDIconTexture);
                    weaponObj.SetString("iconName", HUDIconName);
                    weaponObj.SetBool("bDisplayAmmo", true);
                    AmmoCount = 0;
                    // End:0x150B
                    if(TDUnloaded.AmmoDisplayInfo.Length > 0)
                    {
                        AmmoCount = LPC.GetAmmoCountInMunitionsLockerFromString(TDUnloaded.AmmoDisplayInfo[0].AmmoTuneDataString);
                    }
                    // End:0x1568
                    if(AmmoCount == -1)
                    {
                        S = GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Infinite>");                        
                    }
                    else
                    {
                        S = "" $ string(AmmoCount);
                    }
                    weaponObj.SetString("PrimaryAmmoName", S);
                    weaponObj.SetString("PrimaryAmmoCount", "");
                    StatIdx = 0;
                    J0x15FA:

                    // End:0x182E [Loop If]
                    if(StatIdx < 3)
                    {
                        // End:0x17A3
                        if(TDUnloaded.ShopItemAttributes.Length > StatIdx)
                        {
                            weaponObj.SetBool("bDisplayStats", true);
                            statPercent = float(TDUnloaded.ShopItemAttributes[StatIdx].InitialValue);
                            statPercent = statPercent / 100.0000000;
                            statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                            weaponObj.SetFloat("statValue" $ string(StatIdx + 1), statPercent);
                            weaponObj.SetString("statString" $ string(StatIdx + 1), TDUnloaded.ShopItemAttributes[StatIdx].AttributeName);                            
                        }
                        else
                        {
                            weaponObj.SetFloat("statValue" $ string(StatIdx + 1), 0.0000000);
                            weaponObj.SetString("statString" $ string(StatIdx + 1), "");
                        }
                        StatIdx++;
                        // [Loop Continue]
                        goto J0x15FA;
                    }
                }
                bInitialSelection = false;
                // End:0x18B9
                if(curTertiaryWeapon != none)
                {
                    bInitialSelection = PathName(curTertiaryWeapon.Class) == LPC.StoredWeaponsList[I].WeaponName;
                }
                weaponObj.SetBool("bInitialSelection", bInitialSelection);
                InitWeaponFromObject(weaponObj, 2);
                tertiaryCount++;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x211;
    }
    NumRingsRemoved = 0;
    // End:0x195F
    if(weaponCount == 1)
    {
        ClearRing(1 - NumRingsRemoved, true);
        NumRingsRemoved++;
    }
    // End:0x1991
    if(tertiaryCount == 0)
    {
        ClearRing(2 - NumRingsRemoved, true);
        NumRingsRemoved++;
    }
    //return;    
}

function InitWeaponFromObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL weaponObject[8388609];
    local /*0x97E50000-0x00000000*/ private int ringIndex[8388609];

    MunitionsLocker.ActionScriptVoid("InitWeaponFromObject");
    //return;    
}

function ClearRing()
{
    local /*0x97E50000-0x00000000*/ private int ringIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRemoveIt[8388609];

    MunitionsLocker.ActionScriptVoid("ClearRing");
    //return;    
}

function ReadyToDisplay()
{
    Root.ActionScriptVoid("ReadyToDisplay");
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
        // End:0x8A
        case 'WeaponsLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Weapons>"));
            // End:0x6F1
            break;
        // End:0xF7
        case 'UtilitiesLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Utilities>"));
            // End:0x6F1
            break;
        // End:0x156
        case 'WeaponStatsLabel':
            Widget.SetText("<Strings:LostPlanetGame.MunitionsLocker.Stats>");
            // End:0x6F1
            break;
        // End:0x182
        case 'WeaponNameLabel':
            WeaponNameLabel = Widget;
            InitLabels();
            // End:0x6F1
            break;
        // End:0x1AE
        case 'WeaponCategoryLabel':
            WeaponCategoryLabel = Widget;
            InitLabels();
            // End:0x6F1
            break;
        // End:0x1DA
        case 'wpnDescription':
            WeaponDescriptionLabel = Widget;
            InitLabels();
            // End:0x6F1
            break;
        // End:0x247
        case 'b1':
            Widget.SetString("label", "<Strings:LostPlanetGame.MunitionsLocker.TotemsHeader>");
            // End:0x6F1
            break;
        // End:0x2B7
        case 'b2':
            Widget.SetString("label", "<Strings:LostPlanetGame.MunitionsLocker.AbilitiesHeader>");
            // End:0x6F1
            break;
        // End:0x327
        case 'b3':
            Widget.SetString("label", "<Strings:LostPlanetGame.MunitionsLocker.HandicapsHeader>");
            // End:0x6F1
            break;
        // End:0x38D
        case 'UtilityTitle':
            Widget.SetText("<Strings:LostPlanetGame.MunitionsLocker.UtilityTitle>");
            // End:0x6F1
            break;
        // End:0x3F9
        case 'Description':
            Widget.SetText("<Strings:LostPlanetGame.MunitionsLocker.UtilityDescription>");
            // End:0x6F1
            break;
        // End:0x45B
        case 'MapTitle':
            Widget.SetText("<Strings:LostPlanetGame.MunitionsLocker.MapTitle>");
            // End:0x6F1
            break;
        // End:0x4BE
        case 'SelectLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
            // End:0x6F1
            break;
        // End:0x51F
        case 'BackLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x6F1
            break;
        // End:0x58A
        case 'SetSlotLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.SetSlot>"));
            // End:0x6F1
            break;
        // End:0x5EE
        case 'RecommendLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
            // End:0x6F1
            break;
        // End:0x657
        case 'ClearLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Clear>"));
            // End:0x6F1
            break;
        // End:0x69B
        case 'subHdrRight':
            SubContentRightHeaderLabel = Widget.GetObject("textField");
            // End:0x6F1
            break;
        // End:0x6DF
        case 'subHdrLeft':
            SubContentLeftHeaderLabel = Widget.GetObject("textField");
            // End:0x6F1
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x6F1
            break;
            break;
    }
    // End:0x730
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function SetRightSubContentState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    switch(Label)
    {
        // End:0x80
        case "weaponStats":
            SubContentRightHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.Stats>"));
            // End:0x11D
            break;
        // End:0xF5
        case "upgradeStats":
            SubContentRightHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.UpgradeStats>"));
            // End:0x11D
            break;
        // End:0xFFFF
        default:
            SubContentRightHeaderLabel.SetText("");
            // End:0x11D
            break;
            break;
    }
    //return;    
}

function SetLeftSubContentState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    switch(Label)
    {
        // End:0x82
        case "ammoStats":
            SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.AmmoStats>"));
            // End:0x319
            break;
        // End:0xF9
        case "tertiaryStats":
            SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.TertiaryCount>"));
            // End:0x319
            break;
        // End:0x27C
        case "dpadMap":
            // End:0x18F
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.DPADMapping360>"));                
            }
            else
            {
                // End:0x219
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.DPADMappingPS3>"));                    
                }
                else
                {
                    SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.DPADMapping>"));
                }
            }
            // End:0x319
            break;
        // End:0x2F1
        case "passiveMap":
            SubContentLeftHeaderLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MunitionsLocker.PassiveMapping>"));
            // End:0x319
            break;
        // End:0xFFFF
        default:
            SubContentLeftHeaderLabel.SetText("");
            // End:0x319
            break;
            break;
    }
    //return;    
}

function InitLabels()
{
    MunitionsLocker.ActionScriptVoid("InitLabels");
    //return;    
}

function SetWeaponCategoryLabel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    //return;    
}

function SetPerkSlot()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PerkName[8388609];
    local /*0x97E50000-0x00000000*/ private int InputSlotIndex[8388609], I, MaxAssignedPerks;
    local /*0x97E50000-0x00000000*/ private bool bPerkSuccessfullyAssigned, bShouldReplicate;
    local /*0x97E50000-0x00000000*/ private @NULL Perks, LPC;

    LPC = LPPlayerController(GetPC());
    // End:0x517
    if(LPC != none)
    {
        // End:0x7D
        if(!bInShell && int(LPC.WorldInfo.NetMode) == int(NM_Standalone))
        {
            return;
        }
        Perks = LPPRI(LPC.PlayerReplicationInfo).PerksManager;
        // End:0x4DF
        if(Perks != none)
        {
            MaxAssignedPerks = 4;
            // End:0x4DF
            if((InputSlotIndex >= 0) && InputSlotIndex < MaxAssignedPerks)
            {
                I = 0;
                J0x111:

                // End:0x225 [Loop If]
                if(I < MaxAssignedPerks)
                {
                    // End:0x217
                    if(((I != InputSlotIndex) && Perks.AssignedPerk[I].Perk != none) && string(Perks.AssignedPerk[I].Perk.PerkName) == PerkName)
                    {
                        Perks.AssignPerk(I, 'None', false, false);
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x111;
                }
                bShouldReplicate = InputSlotIndex == (MaxAssignedPerks - 1);
                Perks.AssignPerk(InputSlotIndex, name(PerkName), false, bShouldReplicate);
                bPerkSuccessfullyAssigned = true;
                // End:0x4DF
                if(CurrentLoadout != none)
                {
                    CurrentLoadout.SetLoadoutPerks(((Perks.AssignedPerk[0].Perk == none) ? "" : string(Perks.AssignedPerk[0].Perk.PerkName)), ((Perks.AssignedPerk[1].Perk == none) ? "" : string(Perks.AssignedPerk[1].Perk.PerkName)), ((Perks.AssignedPerk[2].Perk == none) ? "" : string(Perks.AssignedPerk[2].Perk.PerkName)), ((Perks.AssignedPerk[3].Perk == none) ? "" : string(Perks.AssignedPerk[3].Perk.PerkName)));
                }
            }
        }
        // End:0x517
        if(bPerkSuccessfullyAssigned)
        {
            bSaveProfile = true;
            LPC.ForceDPadClusterUpdate();
        }
    }
    //return;    
}

function LoadClassesFromPackageFinished()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InLoadedClasses[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx, ClassIdx;

    ClassIdx = 0;
    J0x0B:

    // End:0x97 [Loop If]
    if(ClassIdx < InLoadedClasses.Length)
    {
        Idx = LoadedInventoryClasses.Find(InLoadedClasses[ClassIdx]);        
        // End:0x89
        if(Idx != -1)
        {
            LoadedInventoryClasses.AddItem(class<Inventory>(InLoadedClasses[ClassIdx]));            
        }
        ++ClassIdx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ConditionalLoadWeaponClass()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponClassName[8388609], FullWeaponClassName;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ClassNamesToLoad;

    InvClass = class<Inventory>(FindObject(FullWeaponClassName, Class'Core.Class'));
    // End:0xC6
    if(InvClass == none)
    {
        SFLoader.SetPackageName(WeaponClassName);
        ClassNamesToLoad.AddItem(FullWeaponClassName);        
        SFLoader.LoadClassesFromPackage(ClassNamesToLoad, true, false, false, true, false, LoadClassesFromPackageFinished);
        ClassNamesToLoad.Length = 0;
    }
    //return;    
}

function GetWeaponClassName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string FullPathName[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int ClassNameLength, DotIndex;

    ClassNameLength = Len(FullPathName);
    DotIndex = InStr(FullPathName, ".");
    // End:0x69
    if(DotIndex != -1)
    {
        return Right(FullPathName, (ClassNameLength - DotIndex) - 1);        
    }
    else
    {
        return FullPathName;
    }
    //return ReturnValue;    
}

function SetWeaponLoadout()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryWeaponClassName[8388609], SecondaryWeaponClassName, TertiaryWeaponClassName;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryWeaponFullClassName, SecondaryWeaponFullClassName, TertiaryWeaponFullClassName, PistolWeaponFullClassName, PistolWeaponClassName;

    LPPC = LPPlayerController(GetPC());
    // End:0x3B3
    if(LPPC != none)
    {
        // End:0x73
        if(InStr(PrimaryWeaponClassName, ".") < 0)
        {
            PrimaryWeaponFullClassName = "LostPlanetGameContent." $ PrimaryWeaponClassName;            
        }
        else
        {
            PrimaryWeaponFullClassName = PrimaryWeaponClassName;
            PrimaryWeaponClassName = GetWeaponClassName(PrimaryWeaponClassName);
        }
        // End:0xEA
        if(InStr(SecondaryWeaponClassName, ".") < 0)
        {
            SecondaryWeaponFullClassName = "LostPlanetGameContent." $ SecondaryWeaponClassName;            
        }
        else
        {
            SecondaryWeaponFullClassName = SecondaryWeaponClassName;
            SecondaryWeaponClassName = GetWeaponClassName(SecondaryWeaponClassName);
        }
        // End:0x161
        if(InStr(TertiaryWeaponClassName, ".") < 0)
        {
            TertiaryWeaponFullClassName = "LostPlanetGameContent." $ TertiaryWeaponClassName;            
        }
        else
        {
            TertiaryWeaponFullClassName = TertiaryWeaponClassName;
            TertiaryWeaponClassName = GetWeaponClassName(TertiaryWeaponClassName);
        }
        // End:0x2CC
        if(int(LPPC.WorldInfo.NetMode) == int(NM_Standalone))
        {
            // End:0x248
            if(!bInShell)
            {
                PistolWeaponClassName = "LPWeaponPistolContent";
                PistolWeaponFullClassName = "LostPlanetGameContent." $ PistolWeaponClassName;
                ConditionalLoadWeaponClass(PistolWeaponClassName, PistolWeaponFullClassName);
            }
            // End:0x274
            if(PrimaryWeaponClassName != "")
            {
                ConditionalLoadWeaponClass(PrimaryWeaponClassName, PrimaryWeaponFullClassName);
            }
            // End:0x2A0
            if(SecondaryWeaponClassName != "")
            {
                ConditionalLoadWeaponClass(SecondaryWeaponClassName, SecondaryWeaponFullClassName);
            }
            // End:0x2CC
            if(TertiaryWeaponClassName != "")
            {
                ConditionalLoadWeaponClass(TertiaryWeaponClassName, TertiaryWeaponFullClassName);
            }
        }
        CurrentLoadout.SetLoadoutWeapons(PrimaryWeaponFullClassName, SecondaryWeaponFullClassName, TertiaryWeaponFullClassName);
        LPPC.ServerSetWeaponLoadout(PrimaryWeaponFullClassName, SecondaryWeaponFullClassName, TertiaryWeaponFullClassName, PistolWeaponFullClassName);
        // End:0x3A7
        if((int(LPPC.WorldInfo.NetMode) == int(NM_Standalone)) && !bInShell)
        {
            LoadedInventoryClasses.Length = 0;            
        }
        else
        {
            bSaveProfile = true;
        }
    }
    //return;    
}

function CancelMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0xBC
    if(((LPPC != none) && int(LPPC.WorldInfo.NetMode) == int(NM_Standalone)) && !bInShell)
    {
        LPPC.MyPlayerPawn.ServerReplenishAmmoFromMunitionsLocker(LPPC, true);
    }
    AcceptMunitionsLocker();
    //return;    
}

function AcceptMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, KitManager;

    // End:0x9A
    if(bSaveProfile)
    {
        LPPC = LPPlayerController(GetPC());
        // End:0x9A
        if(LPPC != none)
        {
            KitManager = LPPC.GetLoadoutKitManager();
            // End:0x9A
            if(KitManager != none)
            {
                KitManager.SetLoadout(CurrentLoadout);
            }
        }
    }
    GoToOutro();
    //return;    
}

function MunitionsLockerOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0x95
    if(LPPC != none)
    {
        LPPC.CheckMunitionsLockerProximity();
        // End:0x95
        if(LPPC.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerMunitionsLocker'))
        {
            LPPC.EndSpecialMove();
        }
    }    
    GetPC().ConsoleCommand("HideLPHUD 0");
    Reset();
    Close(false);
    SetMovieCanReceiveInput(false);
    // End:0x10E
    if(OnCloseDelegate != none)
    {
        OnLockerClosed();
    }
    //return;    
}

event OnClose()
{
    super.OnClose();
    CurrentLoadout.LoadoutKitManager = none;
    //return;    
}

function Reset()
{
    ActionScriptVoid("Reset");
    //return;    
}

function GoToIntro()
{
    ActionScriptVoid("GoToIntro");
    //return;    
}

function GoToOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    ActionScriptVoid("GoToOutro");
    LPPC = LPPlayerController(GetPC());
    // End:0xC2
    if(LPPC != none)
    {
        // End:0xC2
        if(LPPC.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerMunitionsLockerVS'))
        {
            LPPC.MySPPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_PlayJobLogOutro);
        }
    }
    //return;    
}

function ShowLobbyMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185];
    local /*0x97E50000-0x00000000*/ private int MessageVal[9437185];

    ""
    -1
    ASShowMatchStartingTimer(bShow);
    // End:0x65
    if(bShow)
    {
        ASSetMatchStartingText(Message);
        // End:0x65
        if(MessageVal >= 0)
        {
            ASSetMatchStartingTimer(MessageVal);
        }
    }
    //return;    
}

function ASShowMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x50
    if(bShow != bMessageVisible)
    {
        ActionScriptVoid("showMatchStartingTimer");
        bMessageVisible = bShow;
    }
    //return;    
}

function ASSetMatchStartingText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string StartText[8388609];

    // End:0x4A
    if(StartText != MessageText)
    {
        ActionScriptVoid("setMatchStartingText");
        MessageText = StartText;
    }
    //return;    
}

function ASSetMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private int Time[8388609];

    // End:0x4B
    if(Time != MessageValue)
    {
        ActionScriptVoid("setMatchStartingTimer");
        MessageValue = Time;
    }
    //return;    
}

function PostWidgetInit()
{
    ASRepositionButtonPrompts();
    //return;    
}

function ASRepositionButtonPrompts()
{
    ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

defaultproperties
{
    // Reference: LPLoadoutKit'Default__LPGFxMoviePlayerMunitionsLocker.LoadoutKitObj'
    begin object name=LoadoutKitObj class=Class'LPLoadoutKit'
    end object
    CurrentLoadout=LoadoutKitObj
    // Reference: SPSeekFreePackageLoader'Default__LPGFxMoviePlayerMunitionsLocker.SFLoaderDefObj'
    begin object name=SFLoaderDefObj class=Class'SPEngine.SPSeekFreePackageLoader'
    end object
    SFLoader=SFLoaderDefObj
    DefaultMaxDamage=250.0000000
    DefaultMaxFiringRate=3.0000000
    DefaultMaxAccuracy=10.0000000
    BlankDeployableTexture=Texture2D'HUD.icon_deployableEmpty'
    BlankPassiveTexture=Texture2D'HUD.icon_passiveEmpty'
    bCaptureInput=true
    Priority=50
    SoundThemes=/* Array type was not detected. */
}