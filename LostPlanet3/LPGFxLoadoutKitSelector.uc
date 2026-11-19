class LPGFxLoadoutKitSelector extends GFxObject within GFxMoviePlayer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KitManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int KitIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKitsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKitsVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKitRenamingEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RootMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovieInstance_MunitionsLocker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_MunitionsLocker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankDeployableTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlankPassiveTexture;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnRenameKitComplete__Delegate;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Root[8388609];

    RootMC = Root;
    //return;    
}

function InitKitSelector()
{
    local /*0x97E50000-0x00000000*/ private int DefaultLoadoutIdx;

    // End:0x2FC
    if(!bKitsInitialized)
    {
        // End:0x8C
        if(LPGFxMoviePlayerFrontEndManager(MoviePlayer) != none)
        {
            BlankDeployableTexture = LPGFxMoviePlayerFrontEndManager(MoviePlayer).BlankDeployableTexture;
            BlankPassiveTexture = LPGFxMoviePlayerFrontEndManager(MoviePlayer).BlankPassiveTexture;            
        }
        else
        {
            // End:0x106
            if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
            {
                BlankDeployableTexture = LPGFxMoviePlayerPauseMenu(MoviePlayer).BlankDeployableTexture;
                BlankPassiveTexture = LPGFxMoviePlayerPauseMenu(MoviePlayer).BlankPassiveTexture;
            }
        }
        // End:0x15D
        if(KitManager == none)
        {
            KitManager = LPPlayerController(Outer.GetPC()).GetLoadoutKitManager();
        }
        // End:0x2FC
        if((KitManager != none) && KitManager.bLoadedFromProfile)
        {
            bKitsInitialized = true;
            SetHeaderText(GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.WeaponsHeading>"), GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.DeployablesHeading>"), GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.AbilitiesHeading>"));
            SetKitNames(GetLoadoutName(0), GetLoadoutName(1), GetLoadoutName(2), GetLoadoutName(3));
            DefaultLoadoutIdx = KitManager.GetDefaultLoadoutIndex();
            ShowKitSelection(true);
            SetDefaultKit(DefaultLoadoutIdx + 1);
            SetSelectedKit(DefaultLoadoutIdx, false);
        }
    }
    //return;    
}

function OnKitSelectorClosed()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ClearKeyboardInputDoneDelegate(self.OnRenameKitComplete);
    // End:0x133
    if(KitManager != none)
    {
        KitManager.CurrentLoadout = KitManager.GetDefaultLoadoutIndex();
        // End:0x133
        if(bIsDirty)
        {
            KitManager.SaveLoadoutsToProfile();
            LPPlayerController(Outer.GetPC()).SaveProfile();
        }
    }
    //return;    
}

function SelectNextKit()
{
    // End:0xAC
    if(!Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        // End:0xA9
        if(KitIndex < (KitManager.4 - 1))
        {
            MoviePlayer.PlaySoundFromTheme('KitSelect');
            SetSelectedKit(Clamp(KitIndex + 1, 0, KitManager.4 - 1));
        }        
    }
    else
    {
        SetSelectedKit(Min(1, KitIndex + 1));
    }
    //return;    
}

function SelectPrevKit()
{
    // End:0x52
    if(KitIndex > 0)
    {
        MoviePlayer.PlaySoundFromTheme('KitSelect');
        SetSelectedKit(Max(0, KitIndex - 1));
    }
    //return;    
}

function SetSelectedKit()
{
    local /*0x97E50000-0x00000000*/ private int Idx[9437185];
    local /*0x97E50000-0x00000000*/ private bool bPlayAnim[9437185];

    -1
    true
    InitKitSelector();
    // End:0x78
    if(!bKitsInitialized)
    {
        LPPlayerController(Outer.GetPC()).AddOnPersistentDataInitDelegate(OnKitManagerInit);
        return;
    }
    KitIndex = Idx;
    // End:0xC7
    if(KitIndex == -1)
    {
        KitIndex = KitManager.GetCurrentLoadoutIndex();
    }
    KitManager.CurrentLoadout = KitIndex;
    SetupKit(KitIndex);
    SelectKit(KitIndex + 1);
    // End:0x13B
    if(bPlayAnim)
    {
        PlayKitAnimation(KitIndex + 1);
    }
    //return;    
}

function SetupKit()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private class W1, W2, GR;
    local /*0x97E50000-0x00000000*/ private @NULL W1_Ammo, W2_Ammo, W1_Upgrade, W2_Upgrade, GR_Upgrade;

    local /*0x97E50000-0x00000000*/ private editfixedsize string W1_Name, W1_AmmoName, W1_UILoaderIcon, W1_AmmoUILoaderIcon, GR_UILoaderIcon, W2_Name,
	    W2_AmmoName, W2_UILoaderIcon, W2_AmmoUILoaderIcon;

    local /*0x97E50000-0x00000000*/ private int W1_AmmoType, W2_AmmoType;
    local /*0x97E50000-0x00000000*/ private @NULL P1, P2, P3, P4;
    local /*0x97E50000-0x00000000*/ private editfixedsize string P1_Name, P2_Name, P3_Name, P4_Name, P1_UILoaderIcon, P2_UILoaderIcon,
	    P3_UILoaderIcon, P4_UILoaderIcon;

    local /*0x97E50000-0x00000000*/ private int P1_Pips, P2_Pips, P3_Pips, P4_Pips;
    local /*0x97E50000-0x00000000*/ private float P1_Cost, P2_Cost, P3_Cost, P4_Cost;
    local /*0x97E50000-0x00000000*/ private bool P1_Passive, P2_Passive, P3_Passive, P4_Passive, P1_Hack, P2_Hack,
	    P3_Hack, P4_Hack;

    local /*0x97E50000-0x00000000*/ private @NULL Kit, MyPC, Tex;

    Kit = KitManager.GetLoadout(KitIndex);
    // End:0x113B
    if(Kit != none)
    {
        MyPC = LPPlayerController(Outer.GetPC());
        W1 = Kit.GetWeaponClass(0);
        W1_Name = ((W1 == none) ? "" : W1.default.FriendlyName);
        W1_Ammo = Kit.GetAmmoTuneData(0);
        W1_AmmoName = (((W1_Ammo != none) && MyPC.IsUnlockedMP(W1_Ammo.UnlockName)) ? W1_Ammo.FriendlyName : "");
        W1_AmmoType = ((W1_AmmoName != "") ? int(W1_Ammo.AmmoCategory) : -1);
        W1_Upgrade = Kit.GetUpgradeTuneData(0);
        Tex = ((W1 == none) ? none : (((W1_Upgrade != none) && MyPC.IsUnlockedMP(W1_Upgrade.UnlockName)) ? W1.default.HUDIconUpgradeTexture : W1.default.HUDIconTexture));
        W1_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        Tex = (((W1_Ammo != none) && MyPC.IsUnlockedMP(W1_Ammo.UnlockName)) ? W1_Ammo.AmmoTypeIcon : none);
        W1_AmmoUILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        W2 = Kit.GetWeaponClass(1);
        W2_Name = ((W2 == none) ? "" : W2.default.FriendlyName);
        W2_Ammo = Kit.GetAmmoTuneData(1);
        W2_AmmoName = (((W2_Ammo != none) && MyPC.IsUnlockedMP(W2_Ammo.UnlockName)) ? W2_Ammo.FriendlyName : "");
        W2_AmmoType = ((W2_AmmoName != "") ? int(W2_Ammo.AmmoCategory) : -1);
        W2_Upgrade = Kit.GetUpgradeTuneData(1);
        Tex = ((W2 == none) ? none : (((W2_Upgrade != none) && MyPC.IsUnlockedMP(W2_Upgrade.UnlockName)) ? W2.default.HUDIconUpgradeTexture : W2.default.HUDIconTexture));
        W2_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        Tex = (((W2_Ammo != none) && MyPC.IsUnlockedMP(W2_Ammo.UnlockName)) ? W2_Ammo.AmmoTypeIcon : none);
        W2_AmmoUILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        GR = Kit.GetWeaponClass(2);
        GR_Upgrade = Kit.GetUpgradeTuneData(2);
        Tex = ((GR == none) ? none : (((GR_Upgrade != none) && MyPC.IsUnlockedMP(GR_Upgrade.UnlockName)) ? GR.default.HUDIconUpgradeTexture : GR.default.HUDIconTexture));
        GR_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        P1 = Kit.GetPerk(0);
        P1_Name = ((P1 == none) ? "" : P1.FriendlyName);
        P1_Passive = ((P1 == none) ? false : P1.IsPassive());
        P1_Pips = ((P1 == none) ? 0 : ((P1_Passive) ? 0 : LPPerkDeployable(P1).GetMaxPips()));
        P1_Cost = ((P1 == none) ? 0.0000000 : P1.GetCost());
        P1_Hack = LPPerkNanoThief(P1) != none;
        Tex = (((P1 == none) || P1.PerkBaseTuneData == none) ? BlankPassiveTexture : P1.PerkBaseTuneData.HUDIconTexture);
        P1_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        P2 = Kit.GetPerk(1);
        P2_Name = ((P2 == none) ? "" : P2.FriendlyName);
        P2_Passive = ((P2 == none) ? false : P2.IsPassive());
        P2_Pips = ((P2 == none) ? 0 : ((P2_Passive) ? 0 : LPPerkDeployable(P2).GetMaxPips()));
        P2_Cost = ((P2 == none) ? 0.0000000 : P2.GetCost());
        P2_Hack = LPPerkNanoThief(P2) != none;
        Tex = (((P2 == none) || P2.PerkBaseTuneData == none) ? BlankDeployableTexture : P2.PerkBaseTuneData.HUDIconTexture);
        P2_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        P3 = Kit.GetPerk(2);
        P3_Name = ((P3 == none) ? "" : P3.FriendlyName);
        P3_Passive = ((P3 == none) ? false : P3.IsPassive());
        P3_Pips = ((P3 == none) ? 0 : ((P3_Passive) ? 0 : LPPerkDeployable(P3).GetMaxPips()));
        P3_Cost = ((P3 == none) ? 0.0000000 : P3.GetCost());
        P3_Hack = LPPerkNanoThief(P3) != none;
        Tex = (((P3 == none) || P3.PerkBaseTuneData == none) ? BlankPassiveTexture : P3.PerkBaseTuneData.HUDIconTexture);
        P3_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        P4 = Kit.GetPerk(3);
        P4_Name = ((P4 == none) ? "" : P4.FriendlyName);
        P4_Passive = ((P4 == none) ? false : P4.IsPassive());
        P4_Pips = ((P4 == none) ? 0 : ((P4_Passive) ? 0 : LPPerkDeployable(P4).GetMaxPips()));
        P4_Cost = ((P4 == none) ? 0.0000000 : P4.GetCost());
        P4_Hack = LPPerkNanoThief(P4) != none;
        Tex = (((P4 == none) || P4.PerkBaseTuneData == none) ? BlankDeployableTexture : P4.PerkBaseTuneData.HUDIconTexture);
        P4_UILoaderIcon = MoviePlayer.GetUILoaderPathForTexture(Tex);
        SetKit(KitIndex + 1, W1_UILoaderIcon, W1_Name, W1_AmmoType, W1_AmmoName, W1_AmmoUILoaderIcon, W2_UILoaderIcon, W2_Name, W2_AmmoType, W2_AmmoName, W2_AmmoUILoaderIcon, GR_UILoaderIcon, GR.default.FriendlyName, P1_UILoaderIcon, P1_Name, P1_Passive, P1_Pips, int(P1_Cost), P1_Hack, P2_UILoaderIcon, P2_Name, P2_Passive, P2_Pips, int(P2_Cost), P2_Hack, P3_UILoaderIcon, P3_Name, P3_Passive, P3_Pips, int(P3_Cost), P3_Hack, P4_UILoaderIcon, P4_Name, P4_Passive, P4_Pips, int(P4_Cost), P4_Hack);
    }
    //return;    
}

function OnKitClicked()
{
    local /*0x97E50000-0x00000000*/ private int ClickIndex[8388609];

    MoviePlayer.PlaySoundFromTheme('KitAssign');
    SetSelectedKit(ClickIndex - 1);
    KitManager.SetDefaultLoadout();
    SetDefaultKit(ClickIndex);
    //return;    
}

function OnKitManagerInit()
{
    LPPlayerController(Outer.GetPC()).OnPersistentDataInitDelegates.RemoveItem(OnKitManagerInit);    
    SetSelectedKit();
    //return;    
}

function SetDefaultLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];

    -1
    KitManager.SetDefaultLoadout(LoadoutIndex);
    //return;    
}

function ApplyLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];

    -1
    KitManager.ApplyLoadout(LoadoutIndex);
    //return;    
}

function GetLoadoutName()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TransContext;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedKitName;
    local /*0x97E50000-0x00000000*/ private bool bNoName;

    LocalizedKitName = KitManager.GetLoadout(Idx).GetLoadoutName();
    bNoName = LocalizedKitName == "";
    // End:0xB2
    if(bNoName)
    {
        LocalizedKitName = "<Strings:LostPlanetGame.LoadoutKit.DefaultLoadoutKitName>";
    }
    TransContext = Class'Engine.Engine'.static.GetEngine().GamePlayers[0].GetTranslationContext();
    LocalizedKitName = Class'GFxUI.GFxObject'.static.TranslateString(LocalizedKitName, TransContext);
    // End:0x178
    if(bNoName)
    {
        LocalizedKitName = (LocalizedKitName $ " ") $ string(Idx + 1);
    }
    return LocalizedKitName;
    //return ReturnValue;    
}

function GetLocalizedString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LP;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;

    LP = Outer.GetLP();
    LocalizedString = Class'GFxUI.GFxObject'.static.TranslateString(Label, LP.GetTranslationContext());
    return LocalizedString;
    //return ReturnValue;    
}

function HandleRenameKit()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string KeyboardTitle, KeyboardDesc, CurrentKitName;

    // End:0x11
    if(!bKitRenamingEnabled)
    {
        return;
    }
    // End:0x2B
    if(LPGFxMoviePlayerFrontEndManager(MoviePlayer) == none)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    KeyboardTitle = GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.KeyboardUITitle>");
    KeyboardDesc = GetLocalizedString("<Strings:LostPlanetGame.LoadoutKit.KeyboardUIDesc>");
    CurrentKitName = KitManager.GetLoadout(KitManager.GetCurrentLoadoutIndex()).GetLoadoutName();
    OnlineSub.PlayerInterface.AddKeyboardInputDoneDelegate(self.OnRenameKitComplete);
    OnlineSub.PlayerInterface.ShowKeyboardUI(byte(Outer.GetLP().ControllerId), KeyboardTitle, KeyboardDesc, false, false, CurrentKitName, 24);
    //return;    
}

delegate OnRenameKitComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, RenamedKit;
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewKitName;
    local /*0x97E50000-0x00000000*/ private byte bWasCancelled;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    NewKitName = OnlineSub.PlayerInterface.GetKeyboardInputResults(bWasCancelled);
    OnlineSub.PlayerInterface.ClearKeyboardInputDoneDelegate(self.OnRenameKitComplete);
    // End:0x1B3
    if((int(bWasCancelled) <= int(0)) && NewKitName != "")
    {
        RenamedKit = KitManager.GetLoadout(KitManager.GetCurrentLoadoutIndex());
        RenamedKit.SetLoadoutName(NewKitName);
        KitManager.bIsDirty = true;
        SetKitNames(GetLoadoutName(0), GetLoadoutName(1), GetLoadoutName(2), GetLoadoutName(3));
    }
    //return;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LobbyMC;

    // End:0x1B0
    if((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter')
    {
        // End:0x1AB
        if(int(InputEvent) == int(0))
        {
            // End:0x182
            if(KitManager.GetDefaultLoadoutIndex() != KitManager.GetCurrentLoadoutIndex())
            {
                KitManager.SetDefaultLoadout();
                SetDefaultKit(KitIndex + 1);
                bIsDirty = true;
                LobbyMC = LPGFxFrontEnd_PreGameLobby(RootMC);
                // End:0x182
                if((LobbyMC != none) && LobbyMC.LobbySettingsMC != none)
                {
                    LobbyMC.LobbySettingsMC.ResetInvalidWeaponNotification();
                    LobbyMC.LobbySettingsMC.NotifyInvalidWeaponSelection();
                }
            }
            MoviePlayer.PlaySoundFromTheme('KitAssign');
        }
        return true;        
    }
    else
    {
        // End:0x203
        if((ButtonName == 'XboxTypeS_X') || ButtonName == 'One')
        {
            // End:0x1FE
            if(int(InputEvent) == int(0))
            {
                HandleRenameKit();
            }
            return true;            
        }
        else
        {
            // End:0x2DA
            if((ButtonName == 'XboxTypeS_Y') || ButtonName == 'Two')
            {
                // End:0x2D5
                if(!Class'LPGameViewportClient'.static.IsTGSDemo() && LPMenuGameGRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI) != none)
                {
                    // End:0x2D5
                    if(int(InputEvent) == int(0))
                    {
                        ApplyLoadout();
                        // End:0x2D5
                        if(ShowMunitionsLocker(true))
                        {
                            ShowKitSelection(false);
                        }
                    }
                }
                return true;                
            }
            else
            {
                // End:0x3A7
                if((((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XBoxTypeS_RightStick_Up') || ButtonName == 'Gamepad_RightStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up')
                {
                    // End:0x3A2
                    if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
                    {
                        SelectPrevKit();
                    }
                    return true;                    
                }
                else
                {
                    // End:0x471
                    if((((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XBoxTypeS_RightStick_Down') || ButtonName == 'Gamepad_RightStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down')
                    {
                        // End:0x46F
                        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
                        {
                            SelectNextKit();
                        }
                        return true;
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShowMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie_MunitionsLocker;
    local /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_MunitionsLocker;
    local /*0x97E50000-0x00000000*/ private @NULL FEManager;
    local /*0x97E50000-0x00000000*/ private bool bRetval;

    true
    FEManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    bRetval = true;
    // End:0x1F9
    if(bShow)
    {
        // End:0x1A6
        if(MyLPGFxMovie_MunitionsLocker == none)
        {
            // End:0xA8
            if(FEManager != none)
            {
                GFxFlashMovie_MunitionsLocker = FEManager.GFxFlashMovie_MunitionsLocker;
                GFxFlashMovieInstanceClass_MunitionsLocker = FEManager.GFxFlashMovieInstanceClass_MunitionsLocker;
            }
            // End:0x197
            if((GFxFlashMovie_MunitionsLocker != none) && GFxFlashMovieInstanceClass_MunitionsLocker != none)
            {
                Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, GFxFlashMovie_MunitionsLocker, GFxFlashMovieInstanceClass_MunitionsLocker, MoviePlayer.LocalPlayerOwnerIndex, GFxFlashMovieInstance_MunitionsLocker, 1);
                MyLPGFxMovie_MunitionsLocker = LPGFxMoviePlayerMunitionsLocker(GFxFlashMovieInstance_MunitionsLocker);
                MyLPGFxMovie_MunitionsLocker.OnCloseDelegate = OnMunitionsLockerClosed;
                MyLPGFxMovie_MunitionsLocker.bInShell = true;                
            }
            else
            {
                bRetval = false;
            }            
        }
        else
        {
            MyLPGFxMovie_MunitionsLocker.OnCloseDelegate = OnMunitionsLockerClosed;
            MyLPGFxMovie_MunitionsLocker.Start();
        }        
    }
    else
    {
        // End:0x233
        if(MyLPGFxMovie_MunitionsLocker != none)
        {
            MyLPGFxMovie_MunitionsLocker.Close(true);
            MyLPGFxMovie_MunitionsLocker = none;
        }
    }
    return bRetval;
    //return ReturnValue;    
}

function OnMunitionsLockerClosed()
{
    MyLPGFxMovie_MunitionsLocker.OnCloseDelegate = None;
    ShowKitSelection(true);
    SetSelectedKit();
    bIsDirty = true;
    //return;    
}

function SetFrontEndMode()
{
    local /*0x97E50000-0x00000000*/ private bool bFrontEnd[8388609];

    RootMC.ActionScriptVoid("setFrontEndMode");
    //return;    
}

function SetScreenMode()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScreenMode[8388609];

    RootMC.ActionScriptVoid("setScreenMode");
    //return;    
}

function SetDefaultKit()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    RootMC.ActionScriptVoid("setDefaultKit");
    //return;    
}

function SetKitEnabled()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    RootMC.ActionScriptVoid("setKitEnabled");
    //return;    
}

function ShowKitSelection()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x5F
    if(bShow != bKitsVisible)
    {
        RootMC.ActionScriptVoid("showKitSelection");
        bKitsVisible = bShow;
    }
    //return;    
}

function SetHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponString[8388609], DeployableString, AbilityString;

    RootMC.ActionScriptVoid("setHeaderText");
    //return;    
}

function SetKitNames()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Kit1[8388609], Kit2, Kit3, Kit4;

    RootMC.ActionScriptVoid("setKitNames");
    //return;    
}

function SetKit()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string W1_Image[8388609], W1_Name;
    local /*0x97E50000-0x00000000*/ private int W1_AmmoType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string W1_AmmoName[8388609], W1_AmmoImage, W2_Image, W2_Name;
    local /*0x97E50000-0x00000000*/ private int W2_AmmoType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string W2_AmmoName[8388609], W2_AmmoImage, GR_Image, GR_Name, P1_Image, P1_Name;

    local /*0x97E50000-0x00000000*/ private bool P1_Passive[8388609];
    local /*0x97E50000-0x00000000*/ private int P1_Pips[8388609], P1_Cost;
    local /*0x97E50000-0x00000000*/ private bool P1_Hack[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string P2_Image[8388609], P2_Name;
    local /*0x97E50000-0x00000000*/ private bool P2_Passive[8388609];
    local /*0x97E50000-0x00000000*/ private int P2_Pips[8388609], P2_Cost;
    local /*0x97E50000-0x00000000*/ private bool P2_Hack[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string P3_Image[8388609], P3_Name;
    local /*0x97E50000-0x00000000*/ private bool P3_Passive[8388609];
    local /*0x97E50000-0x00000000*/ private int P3_Pips[8388609], P3_Cost;
    local /*0x97E50000-0x00000000*/ private bool P3_Hack[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string P4_Image[8388609], P4_Name;
    local /*0x97E50000-0x00000000*/ private bool P4_Passive[8388609];
    local /*0x97E50000-0x00000000*/ private int P4_Pips[8388609], P4_Cost;
    local /*0x97E50000-0x00000000*/ private bool P4_Hack[8388609];

    RootMC.ActionScriptVoid("setKit");
    //return;    
}

function SelectKit()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    RootMC.ActionScriptVoid("selectKit");
    //return;    
}

function PlayKitAnimation()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    RootMC.ActionScriptVoid("playKitAnimation");
    //return;    
}

function RepositionButtonPrompts()
{
    RootMC.ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

function ScriptLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

function ShowLobbyMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185];
    local /*0x97E50000-0x00000000*/ private int MessageVal[9437185];

    ""
    -1
    // End:0x7D
    if((MyLPGFxMovie_MunitionsLocker != none) && MyLPGFxMovie_MunitionsLocker.bMovieIsOpen)
    {
        MyLPGFxMovie_MunitionsLocker.ShowLobbyMessage(bShow, Message, MessageVal);
    }
    //return;    
}
