class LPGFxMoviePlayerHUD extends SPGFxMoviePlayerHUD
    config(UI);

enum EUIElements_HUD
{
    EUIElement_Minimap,             // 0
    EUIElement_WeaponInfoCluster,   // 1
    EUIElement_HealthInfoCluster,   // 2
    EUIElement_Reticle_Hex,         // 3
    EUIElement_Reticle_VS,          // 4
    EUIElement_Reticle_VSFuture,    // 5
    EUIElement_Reticle_LeechStruggle,// 6
    EUIElement_DirectionalDamage,   // 7
    EUIElement_DirectionalDamageVS, // 8
    EUIElement_DpadCluster,         // 9
    EUIElement_VSInteractionPointManager,// 10
    EUIElement_VSWeldPointManager,  // 11
    EUIElement_VSTaserPointManager, // 12
    EUIElement_VSDrillPointManager, // 13
    EUIElement_VSWinchPointManager, // 14
    EUIElement_VSGrabPointManager,  // 15
    EUIElement_GrapplePointManager, // 16
    EUIElement_TENGPointManager,    // 17
    EUIElement_DNATagManager,       // 18
    EUIElement_MunitionsLockerManager,// 19
    EUIElement_GrenadeWarningManager,// 20
    EUIElement_CourierItemManager,  // 21
    EUIElement_SeizeControlPointManager,// 22
    EUIElement_DisableRepairPointManager,// 23
    EUIElement_KillObjectiveManager,// 24
    EUIElement_BombPointManager,    // 25
    EUIElement_SnowcatPointManager, // 26
    EUIElement_EnhancedRepairManager,// 27
    EUIElement_CreditsForDamageManager,// 28
    EUIElement_NametagManager,      // 29
    EUIElement_WaypointManager,     // 30
    EUIElement_DirectionalDamageFutureVS,// 31
    EUIElement_SixthSense,          // 32
    EUIElement_Award,               // 33
    EUIElement_MetagameTracker,     // 34
    EUIElement_WinLossSplash,       // 35
    EUIElement_MusicPlayer,         // 36
    EUIElement_PlatformMeter,       // 37
    EUIElement_MAX                  // 38
};

struct native sAwardQueueInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Award;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CreditsAwarded;

    structdefaultproperties
    {
        Award=none
        CreditsAwarded=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Reticles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentReticle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NonStruggleReticle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShowReticleInNUpdates[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastReticleShow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMasterSwitchRadar;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMasterSwitchHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMasterSwitchReticle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMasterSwitchDPAD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMasterSwitchWeaponsCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFutureVSHUD_Panels_Created;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMPObjectiveVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMPObjectiveActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMPSubObjectiveVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCountdownVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSJobLogFocused;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovieInstance_JobLog[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_JobLog;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_JobLog[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovieInstance_MunitionsLocker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_MunitionsLocker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_Shop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_Shop;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_Elevator[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_Elevator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnterUmbilicalRangeSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitUmbilicalRangeSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InBetweenUmbilicalRangeSound;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LoopingUmbilicalAC[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardOpenSound;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL MPNotifications[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL MPTeamScores[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Minimap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_WeaponInfoCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_HealthInfoCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Reticle_Hex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Reticle_VS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Reticle_VSFuture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Reticle_LeechStruggle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DirectionalDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DirectionalDamageVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DPadCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSInteractionPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSWeldPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSTaserPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSDrillPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSWinchPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSGrabPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_NametagManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_WaypointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_GrapplePointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_TENGPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DNATagManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_MunitionsLockerManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_GrenadeWarningManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_CourierItemManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_SeizeControlPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DisableRepairPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_KillObjectiveManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_BombPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_SnowcatPointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_CreditsForDamageManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_EnhancedRepairManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DirectionalDamageFutureVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_SixthSense;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Award;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_MetagameTracker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_MusicPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_PlatformMeter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_WinLossSplash;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AwardDisplayQueue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AwardString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MPObjectiveQueue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownPriority;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownTimeRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CountdownTextMarkUp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD_Container;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSJobLogFocusedTime;

// Export ULPGFxMoviePlayerHUD::execGetVSJobLogFocused(FFrame&, void* const)
native final function GetVSJobLogFocused()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxMoviePlayerHUD::execCreateGrapplePoint(FFrame&, void* const)
native final function CreateGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];


}

// Export ULPGFxMoviePlayerHUD::execStopGrapplePoint(FFrame&, void* const)
native final function StopGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];


}

// Export ULPGFxMoviePlayerHUD::execSetGrapplePointValid(FFrame&, void* const)
native final function SetGrapplePointValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool bValid[8388609];


}

// Export ULPGFxMoviePlayerHUD::execRemoveAllGrapplePoints(FFrame&, void* const)
native final function RemoveAllGrapplePoints();

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185], LPPC;
    local /*0x97E50000-0x00000000*/ private bool bIsMPHUD;

    super.Init(Player);
    RootMC = GetVariableObject("_root");
    ViewLoader.SetRootMC(RootMC);
    ViewLoader.SetManagerMC(RootMC);
    UI_WeaponInfoCluster = LPGFxUIElementWeaponInfoCluster(UIElements[1]);
    UI_Reticle_Hex = LPGFxUIElementReticle_Hex(UIElements[3]);
    UI_DirectionalDamage = LPGFxUIElementDirectionalDamage(UIElements[7]);
    UI_DirectionalDamageVS = LPGFxUIElementDirectionalDamageVS(UIElements[8]);
    UI_DPadCluster = LPGFxUIElementDpadCluster(UIElements[9]);
    UI_GrapplePointManager = LPGFxUIElementGrapplePointManager(UIElements[16]);
    UI_TENGPointManager = LPGFxUIElementTENGPointManager(UIElements[17]);
    LPPC = LPPlayerController(GetPC());
    // End:0x1C6
    if(LPPC != none)
    {
        bIsMPHUD = LPPC.HUDContentClass.default.bIsMultiplayerHUD;        
    }
    else
    {
        bIsMPHUD = int(GetPC().WorldInfo.NetMode) != int(NM_Standalone);
    }
    // End:0x4B0
    if(bIsMPHUD)
    {
        UI_HealthInfoCluster = LPGFxUIElementHealthInfoCluster(UIElements[2]);
        UI_Reticle_VSFuture = LPGFxUIElementReticle_VSFuture(UIElements[5]);
        UI_GrenadeWarningManager = LPGFxUIElementGrenadeWarningManager(UIElements[20]);
        UI_CourierItemManager = LPGFxUIElementCourierItemManager(UIElements[21]);
        UI_SeizeControlPointManager = LPGFxUIElementSeizeControlPointManager(UIElements[22]);
        UI_DisableRepairPointManager = LPGFxUIElementDisableRepairPointManager(UIElements[23]);
        UI_KillObjectiveManager = LPGFxUIElementKillObjectiveManager(UIElements[24]);
        UI_BombPointManager = LPGFxUIElementBombPointManager(UIElements[25]);
        UI_SnowcatPointManager = LPGFxUIElementSnowcatPointManager(UIElements[26]);
        UI_CreditsForDamageManager = LPGFxUIElementCreditsForDamageManager(UIElements[28]);
        UI_EnhancedRepairManager = LPGFxUIElementEnhancedRepairManager(UIElements[27]);
        UI_Award = LPGFxUIElementAward(UIElements[33]);
        UI_MetagameTracker = LPGFxUIElementMetagameTracker(UIElements[34]);
        UI_WinLossSplash = LPGFxUIElementWinLossSplash(UIElements[35]);
        UIElements[4] = none;
        UIElements[6] = none;
        UIElements[18] = none;
        UIElements[10] = none;
        UIElements[11] = none;
        UIElements[12] = none;
        UIElements[13] = none;
        UIElements[14] = none;
        UIElements[15] = none;
        UIElements[36] = none;
        UIElements[37] = none;
        UIElements[0] = none;
        UIElements[35] = none;
        Reticles.AddItem(UI_Reticle_Hex);        
        Reticles.AddItem(UI_Reticle_VSFuture);                
    }
    else
    {
        UI_Reticle_VS = LPGFxUIElementReticle_VS(UIElements[4]);
        UI_Reticle_LeechStruggle = LPGFxUIElementReticle_LeechStruggle(UIElements[6]);
        UI_DNATagManager = LPGFxUIElementDNATagManager(UIElements[18]);
        UI_VSInteractionPointManager = LPGFxUIElementVSInteractionPointManager(UIElements[10]);
        UI_VSWeldPointManager = LPGFxUIElementVSWeldPointManager(UIElements[11]);
        UI_VSTaserPointManager = LPGFxUIElementVSTaserPointManager(UIElements[12]);
        UI_VSDrillPointManager = LPGFxUIElementVSDrillPointManager(UIElements[13]);
        UI_VSWinchPointManager = LPGFxUIElementVSWinchPointManager(UIElements[14]);
        UI_VSGrabPointManager = LPGFxUIElementVSGrabPointManager(UIElements[15]);
        UI_MusicPlayer = LPGFxUIElementMusicPlayer(UIElements[36]);
        UI_PlatformMeter = LPGFxUIElementPlatformMeter(UIElements[37]);
        UI_GrenadeWarningManager = LPGFxUIElementGrenadeWarningManager(UIElements[20]);
        UI_WaypointManager = new (self) Class'LPGFxUIElementWaypointManager';
        UIElements[30] = UI_WaypointManager;
        UI_WaypointManager.Init(self);
        UIElements[2] = none;
        UIElements[5] = none;
        UIElements[21] = none;
        UIElements[22] = none;
        UIElements[23] = none;
        UIElements[24] = none;
        UIElements[25] = none;
        UIElements[26] = none;
        UIElements[28] = none;
        UIElements[27] = none;
        UIElements[33] = none;
        UIElements[34] = none;
        UIElements[35] = none;
        Reticles.AddItem(UI_Reticle_Hex);        
        Reticles.AddItem(UI_Reticle_VS);        
        Reticles.AddItem(UI_Reticle_LeechStruggle);        
    }
    // End:0x81B
    if((int(GetPC().WorldInfo.NetMode) != int(NM_Standalone)) || Class'Engine.Engine'.static.IsSplitScreen())
    {
        UI_NametagManager = new (self) Class'LPGFxUIElementNametagManager';
        UIElements[29] = UI_NametagManager;
        UI_NametagManager.Init(self);
    }
    UI_SixthSense = LPGFxUIElementSixthSense(UIElements[32]);
    // End:0x86A
    if(UI_SixthSense != none)
    {
        UI_SixthSense.SetActive(false, true);
    }
    UI_DirectionalDamage.SetActive(false, true);
    UI_DirectionalDamageVS.SetActive(false, true);
    UI_DPadCluster.SetActive(false, true);
    // End:0x8FD
    if(UI_MusicPlayer != none)
    {
        UI_MusicPlayer.SetActive(false, true);
    }
    // End:0x92D
    if(UI_PlatformMeter != none)
    {
        UI_PlatformMeter.SetActive(false, true);
    }
    // End:0x95D
    if(UI_Award != none)
    {
        UI_Award.SetActive(false, true);
    }
    ToggleVSDisplayState(false);
    ShowWeaponCluster(bIsMPHUD);
    ShowHealthCluster(bIsMPHUD);
    SetImageSubstitutions();
    NotifyMPHUDLoaded(GetVariableObject("_root"));
    //return;    
}

function IsSinglePlayer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string VarName[8388609], VarType;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], TempObj, asval;
    local /*0x97E50000-0x00000000*/ private editfixedsize array args;

    TempObj = CreateObject("Object");
    switch(VarType)
    {
        // End:0x5C
        case "bool":
            asval.Type = 5;
            // End:0x62
            break;
        // End:0xFFFF
        default:
            // End:0x62
            break;
            break;
    }
    // End:0x112
    if(VarName == "bIsSinglePlayer")
    {
        // End:0x112
        if(((GetPC()) != none) && GetPC().WorldInfo != none)
        {
            asval.B = int(GetPC().WorldInfo.NetMode) == int(NM_Standalone);
        }
    }
    args[0] = asval;
    TempObj.Set(VarName, args[0]);
    return TempObj;
    //return ReturnValue;    
}

function LoadMPHUD()
{
    ActionScriptVoid("LoadMPHUD");
    //return;    
}

function NotifyMPHUDLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609];

    MPHUD_Container = InMPHUD_Container;
    // End:0x4A
    if(UI_NametagManager != none)
    {
        UI_NametagManager.NotifyMPHUDLoaded(InMPHUD_Container);
    }
    // End:0x81
    if(UI_TENGPointManager != none)
    {
        UI_TENGPointManager.NotifyMPHUDLoaded(InMPHUD_Container);
    }
    // End:0xB8
    if(UI_Award != none)
    {
        UI_Award.NotifyMPHUDLoaded(InMPHUD_Container);
    }
    MPTeamScores.Init(self);
    MPNotifications.Init(self);
    //return;    
}

function ShowAmmoModeSwitch()
{
    local /*0x97E50000-0x00000000*/ private int AmmoMode[8388609];

    UI_WeaponInfoCluster.setAmmoMode(AmmoMode);
    //return;    
}

function ShowAmmoSwitchProgress()
{
    local /*0x97E50000-0x00000000*/ private float progressPercent[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode[8388609];

    UI_WeaponInfoCluster.ShowAmmoSwitchProgress(progressPercent, CurrentAmmoMode);
    //return;    
}

function CreateFutureVSHUDPanels()
{
    // End:0x8B
    if(bFutureVSHUD_Panels_Created == false)
    {
        UI_DirectionalDamageFutureVS = new (self) Class'LPGFxUIElementDirectionalDamageVSFuture';
        UIElements[31] = UI_DirectionalDamageFutureVS;
        UI_DirectionalDamageFutureVS.Init(self);
        UI_DirectionalDamageFutureVS.SetActive(false, true);
        bFutureVSHUD_Panels_Created = true;
    }
    //return;    
}

function SetMCPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609], pos, DI;

    DI = MovieClip.GetDisplayInfo();
    DI.X = pos.X;
    DI.Y = pos.Y;
    MovieClip.SetDisplayInfo(DI);
    //return;    
}

function SetMCScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = MovieClip.GetDisplayInfo();
    Scale *= float(100);
    DI.XScale = Scale;
    DI.YScale = Scale;
    MovieClip.SetDisplayInfo(DI);
    //return;    
}

function ShowMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = MovieClip.GetDisplayInfo();
    DI.Visible = bShow;
    MovieClip.SetDisplayInfo(DI);
    //return;    
}

function GetMCFrame()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ActionScriptInt("getMovieClipFrame");
    //return ReturnValue;    
}

function RemoveMovieClip()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];

    // End:0x3F
    if(MovieClip != none)
    {
        MovieClip.ActionScriptVoid("removeMovieClip");
    }
    //return;    
}

function CreateLoopingUmbilicalAC()
{
    // End:0x5C
    if(LoopingUmbilicalAC == none)
    {
        LoopingUmbilicalAC = GetPC().Pawn.CreateAudioComponent(InBetweenUmbilicalRangeSound, false, true);
    }
    //return;    
}

function ShowShop()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGFxFlashMovie[8388609];
    local /*0x97E50000-0x00000000*/ private byte ShopType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ShopAction[8388609], GFxFlashMovieInstance_Shop;

    // End:0xF2
    if(bShow)
    {
        // End:0xF2
        if(MyLPGFxMovie_Shop == none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, InGFxFlashMovie, GFxFlashMovieInstanceClass_Shop, LocalPlayerOwnerIndex, GFxFlashMovieInstance_Shop, 1);
            MyLPGFxMovie_Shop = LPGFxMoviePlayerShop(GFxFlashMovieInstance_Shop);
            MyLPGFxMovie_Shop.Parent = self;
            MyLPGFxMovie_Shop.SetShopType(ShopType);
            MyLPGFxMovie_Shop.SetShopKismetAction(ShopAction);
        }
    }
    //return;    
}

function ShowElevatorLevelSelector()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGFxFlashMovie[8388609], Action, GFxFlashMovieInstance_Elevator;

    // End:0xCA
    if(bShow)
    {
        // End:0xCA
        if(MyLPGFxMovie_Elevator == none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, InGFxFlashMovie, GFxFlashMovieInstanceClass_Elevator, LocalPlayerOwnerIndex, GFxFlashMovieInstance_Elevator, 1);
            MyLPGFxMovie_Elevator = LPGFxMoviePlayerElevator(GFxFlashMovieInstance_Elevator);
            MyLPGFxMovie_Elevator.Parent = self;
            MyLPGFxMovie_Elevator.SetKismetAction(Action);
        }
    }
    //return;    
}

function ShowJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bVSMode, bForceImmediateCancel;
    local /*0x97E50000-0x00000000*/ private @NULL JobLogRenderTexture, LPPC, GFxFlashMovie_JobLog;

    false
    false
    // End:0x1D1
    if(bShow)
    {
        JobLogRenderTexture = none;
        LPPC = LPPlayerController(GetPC());
        // End:0x76
        if(LPPC != none)
        {
            GFxFlashMovie_JobLog = LPPC.GFxFlashMovie_JobLog;
        }
        // End:0x1CE
        if(GFxFlashMovie_JobLog != none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, GFxFlashMovie_JobLog, GFxFlashMovieInstanceClass_JobLog, LocalPlayerOwnerIndex, GFxFlashMovieInstance_JobLog, 1, false, JobLogRenderTexture, 2);
            // End:0x169
            if(JobLogRenderTexture != none)
            {
                GFxFlashMovieInstance_JobLog.SetViewScaleMode(1);
                GFxFlashMovieInstance_JobLog.SetAspectRatio(float(JobLogRenderTexture.SizeY) / float(JobLogRenderTexture.SizeX));
            }
            MyLPGFxMovie_JobLog = LPGFxMoviePlayerJobLog(GFxFlashMovieInstance_JobLog);
            MyLPGFxMovie_JobLog.Parent = self;
            MyLPGFxMovie_JobLog.SetVSMode(bVSMode);
        }        
    }
    else
    {
        // End:0x209
        if(MyLPGFxMovie_JobLog != none)
        {
            MyLPGFxMovie_JobLog.CancelJobLog(bForceImmediateCancel);
        }
    }
    //return;    
}

function ShowMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ParentScoreboard[9437185], GFxFlashMovie_MunitionsLocker;
    local /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_MunitionsLocker;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MunitionsLocker, ML, MLockerRenderTexture;

    // End:0x3D2
    if(bShow)
    {
        MLockerRenderTexture = none;
        // End:0x3CF
        if(true)
        {
            LPPC = LPPlayerController(GetPC());
            // End:0x71
            if(LPPC != none)
            {
                MunitionsLocker = LPPC.MunitionsLockerActor;
            }
            // End:0x17B
            if(MunitionsLocker != none)
            {
                ML = LPMunitionsLocker(MunitionsLocker);
                // End:0xFE
                if(ML != none)
                {
                    GFxFlashMovie_MunitionsLocker = ML.GFxFlashMovie;
                    GFxFlashMovieInstanceClass_MunitionsLocker = ML.GFxFlashMovieInstanceClass;                    
                }
                else
                {
                    // End:0x178
                    if(LPVSPlayerPawn(MunitionsLocker) != none)
                    {
                        GFxFlashMovie_MunitionsLocker = LPVSPlayerPawn(MunitionsLocker).GFxFlashMovie;
                        GFxFlashMovieInstanceClass_MunitionsLocker = LPVSPlayerPawn(MunitionsLocker).GFxFlashMovieInstanceClass;
                    }
                }                
            }
            else
            {
                // End:0x200
                if((LPPC != none) && LPPC.GFxFlashMovie_MunitionsLocker != none)
                {
                    GFxFlashMovie_MunitionsLocker = LPPC.GFxFlashMovie_MunitionsLocker;
                    GFxFlashMovieInstanceClass_MunitionsLocker = LPPC.GFxFlashMovieInstanceClass_MunitionsLocker;
                }
            }
            // End:0x359
            if((GFxFlashMovie_MunitionsLocker != none) && GFxFlashMovieInstanceClass_MunitionsLocker != none)
            {
                Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, GFxFlashMovie_MunitionsLocker, GFxFlashMovieInstanceClass_MunitionsLocker, LocalPlayerOwnerIndex, GFxFlashMovieInstance_MunitionsLocker, 1, false, MLockerRenderTexture);
                // End:0x281
                if(MLockerRenderTexture != none)
                {
                }
                MyLPGFxMovie_MunitionsLocker = LPGFxMoviePlayerMunitionsLocker(GFxFlashMovieInstance_MunitionsLocker);
                // End:0x2D7
                if(ParentScoreboard != none)
                {
                    MyLPGFxMovie_MunitionsLocker.Parent = ParentScoreboard;                    
                }
                else
                {
                    MyLPGFxMovie_MunitionsLocker.Parent = self;
                }
                // End:0x356
                if(int(GetPC().WorldInfo.NetMode) == int(NM_Standalone))
                {
                    MyLPGFxMovie_MunitionsLocker.EnableUtilitiesTab(false);
                }                
            }
            else
            {
                LPPC = LPPlayerController(GetPC());
                // End:0x3CF
                if(LPPC != none)
                {
                    // End:0x3CF
                    if(LPPC.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerMunitionsLocker'))
                    {
                        LPPC.EndSpecialMove();
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x401
        if(MyLPGFxMovie_MunitionsLocker != none)
        {
            MyLPGFxMovie_MunitionsLocker.Close(false);
        }
    }
    //return;    
}

function CancelMunitionsLocker()
{
    // End:0x2E
    if(MyLPGFxMovie_MunitionsLocker != none)
    {
        MyLPGFxMovie_MunitionsLocker.CancelMunitionsLocker();
    }
    //return;    
}

function IsMunitionsLockerOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(MyLPGFxMovie_MunitionsLocker == none)
    {
        return false;
    }
    return MyLPGFxMovie_MunitionsLocker.bMovieIsOpen;
    //return ReturnValue;    
}

function ChildIsClosing()
{
    local /*0x97E50000-0x00000000*/ private @NULL Child[8388609];

    super(SPGFxMoviePlayer).ChildIsClosing(Child);
    // End:0x2D
    if(Child == MyLPGFxMovie_MunitionsLocker)
    {        
    }
    else
    {
        // End:0x52
        if(Child == MyLPGFxMovie_Shop)
        {
            MyLPGFxMovie_Shop = none;            
        }
        else
        {
            // End:0x77
            if(Child == MyLPGFxMovie_Elevator)
            {
                MyLPGFxMovie_Elevator = none;                
            }
            else
            {
                // End:0x99
                if(Child == MyLPGFxMovie_JobLog)
                {
                    MyLPGFxMovie_JobLog = none;
                }
            }
        }
    }
    //return;    
}

function ResetElementsAfterRoundOrDeath()
{
    // End:0x2C
    if(IsMunitionsLockerOpen())
    {
        MyLPGFxMovie_MunitionsLocker.CancelMunitionsLocker();
    }
    // End:0x5C
    if(UI_DirectionalDamageFutureVS != none)
    {
        UI_DirectionalDamageFutureVS.SetActive(false);
    }
    // End:0x8C
    if(UI_DirectionalDamageVS != none)
    {
        UI_DirectionalDamageVS.SetActive(false);
    }
    // End:0xBC
    if(UI_DirectionalDamage != none)
    {
        UI_DirectionalDamage.SetActive(false);
    }
    SetCountdownTime(0);
    ShowCountdown(false);
    ShowJobLog(false);
    //return;    
}

function NotifyWeaponFired()
{
    CurrentReticle.NotifyWeaponFired();
    //return;    
}

function NotifyShoulderAimCameraActive()
{
    CurrentReticle.NotifyShoulderAimCameraActive();
    //return;    
}

function NotifyShoulderAimCameraInactive()
{
    CurrentReticle.NotifyShoulderAimCameraInactive();
    //return;    
}

function PlayerDied()
{
    super(SPGFxMoviePlayer).PlayerDied();
    UI_WeaponInfoCluster.NotifyDead(0);
    ResetElementsAfterRoundOrDeath();
    //return;    
}

function RoundEnded()
{
    super(SPGFxMoviePlayer).RoundEnded();
    ResetElementsAfterRoundOrDeath();
    UI_NametagManager.RemoveAll();
    //return;    
}

function SetCurrentReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL newReticle[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool HadActiveReticle;

    // End:0x61
    if(((CurrentReticle == newReticle) && CurrentReticle.IsActive()) && CurrentReticle.IsVisible())
    {
        return;
    }
    CurrentReticle = newReticle;
    HadActiveReticle = false;
    LastReticleShow = -1;
    I = 0;
    J0x9A:

    // End:0x172 [Loop If]
    if(I < Reticles.Length)
    {
        // End:0x139
        if(Reticles[I].IsActive())
        {
            // End:0x12A
            if(Reticles[I] != newReticle)
            {
                Reticles[I].SetActive(false, true);
            }
            HadActiveReticle = true;            
        }
        else
        {
            Reticles[I].SetActive(false, true);
        }
        I++;
        // [Loop Continue]
        goto J0x9A;
    }
    SetCrosshairActive(true, HadActiveReticle);
    //return;    
}

function SetReticleCustomAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private bool bUseCustomMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CustomAddColor[9437185], CustomMultiplyColor;

    UI_Reticle_Hex.SetCustomAmmoMode(bUseCustomMode, CustomAddColor, CustomMultiplyColor);
    //return;    
}

function SetHalberdReticleChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    UI_Reticle_Hex.SetHalberdChargePercent(ChargePercent);
    //return;    
}

function SetCrossbowReticleChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    UI_Reticle_Hex.SetCrossbowChargePercent(ChargePercent);
    //return;    
}

function UpdateStruggleModeDirection()
{
    local /*0x97E50000-0x00000000*/ private float AngleDegrees[8388609];

    UI_Reticle_LeechStruggle.UpdateStruggleModeDirection(AngleDegrees);
    //return;    
}

function SetStruggleReticleProgress()
{
    local /*0x97E50000-0x00000000*/ private float NewTime[8388609];

    UI_Reticle_LeechStruggle.SetStruggleReticleProgress(NewTime);
    //return;    
}

function ToggleStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bStruggleMode[8388609], bReticleHidden;

    true
    UI_Reticle_Hex.ShowAmmoCluster(!bStruggleMode);
    // End:0x66
    if(bStruggleMode)
    {
        NonStruggleReticle = CurrentReticle;
        SetCurrentReticle(UI_Reticle_LeechStruggle);        
    }
    else
    {
        SetCurrentReticle(((NonStruggleReticle == none) ? UI_Reticle_Hex : NonStruggleReticle));
        NonStruggleReticle = none;
    }
    //return;    
}

function ToggleStruggleReticleInRange()
{
    local /*0x97E50000-0x00000000*/ private bool bInRange[8388609];

    UI_Reticle_LeechStruggle.ToggleStruggleReticleInRange(bInRange);
    //return;    
}

function ToggleVSDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bIsInVS[8388609], bFutureVS;
    local /*0x97E50000-0x00000000*/ private @NULL HUD;

    false
    // End:0xAB
    if(myHUD != none)
    {
        HUD = LPHUD(myHUD);
        ShowWeaponCluster(HUD.ShouldDisplayWeaponInfoCluster());
        ShowHealthCluster(HUD.ShouldDisplayHealthInfoCluster());
        ShowRadar(HUD.ShouldDisplayRadar());
    }
    // End:0x12B
    if(bIsInVS)
    {
        // End:0xE5
        if(bFutureVS)
        {
            CreateFutureVSHUDPanels();
            SetCurrentReticle(UI_Reticle_VSFuture);            
        }
        else
        {
            SetCurrentReticle(UI_Reticle_VS);
            // End:0x128
            if(UI_WaypointManager != none)
            {
                UI_WaypointManager.SetUmbilicalState(1);
            }
        }        
    }
    else
    {
        // End:0x15B
        if(UI_WaypointManager != none)
        {
            UI_WaypointManager.SetUmbilicalState(2);
        }
        SetCurrentReticle(UI_Reticle_Hex);
    }
    // End:0x19F
    if(bFutureVS)
    {
        UI_DirectionalDamageFutureVS.SetActive(false, true);        
    }
    else
    {
        UI_DirectionalDamageVS.SetActive(false, true);
    }
    UI_DirectionalDamage.SetActive(false, true);
    //return;    
}

function EnableTurretReticle()
{
    SetCurrentReticle(UI_Reticle_VSFuture);
    //return;    
}

function AddNametag()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttachedPawn[8388609];

    // End:0x37
    if(UI_NametagManager != none)
    {
        UI_NametagManager.AddNametag(AttachedPawn);
    }
    //return;    
}

function createMPNameTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ActionScriptObject("createMPNameTag");
    //return ReturnValue;    
}

function LoadScope()
{
    ActionScriptVoid("loadScope");
    //return;    
}

function SetScopeRangeText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RangeText[8388609];

    ActionScriptVoid("setScopeRangeText");
    //return;    
}

function SetScopeRange()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609];

    ActionScriptVoid("setScopeRange");
    //return;    
}

function SetScopeZoomText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ZoomText[8388609];

    ActionScriptVoid("setScopeZoomText");
    //return;    
}

function CreateGrabPointMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ActionScriptObject("createGrabPoint");
    //return ReturnValue;    
}

function CreateGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex[8388609];

    // End:0x40
    if(UI_VSGrabPointManager != none)
    {
        UI_VSGrabPointManager.AddElementForActor(TPawn, GrabPointIndex);
    }
    //return;    
}

function UpdateGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFirmGrab[8388609], bPlayerIsBusy;

    // End:0x5D
    if(UI_VSGrabPointManager != none)
    {
        UI_VSGrabPointManager.UpdateGrabPointForPawn(TPawn, GrabPointIndex, pos, bFirmGrab, bPlayerIsBusy);
    }
    //return;    
}

function StopGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex[8388609];

    // End:0x42
    if(UI_VSGrabPointManager != none)
    {
        UI_VSGrabPointManager.SetElementActiveForActor(TPawn, false, false, GrabPointIndex);
    }
    //return;    
}

function StopAllGrabPoints()
{
    // End:0x2E
    if(UI_VSGrabPointManager != none)
    {
        UI_VSGrabPointManager.RemoveAll();
    }
    //return;    
}

function CleanupOrphans()
{
    // End:0x2E
    if(UI_VSInteractionPointManager != none)
    {
        UI_VSInteractionPointManager.CleanupOrphans();
    }
    // End:0x5C
    if(UI_VSWeldPointManager != none)
    {
        UI_VSWeldPointManager.CleanupOrphans();
    }
    // End:0x8A
    if(UI_VSTaserPointManager != none)
    {
        UI_VSTaserPointManager.CleanupOrphans();
    }
    // End:0xB8
    if(UI_VSDrillPointManager != none)
    {
        UI_VSDrillPointManager.CleanupOrphans();
    }
    // End:0xE6
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.CleanupOrphans();
    }
    // End:0x114
    if(UI_VSGrabPointManager != none)
    {
        UI_VSGrabPointManager.CleanupOrphans();
    }
    //return;    
}

function CreateWinchPointReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint[8388609];

    // End:0x38
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.AddElementForActor(WinchPoint);
    }
    //return;    
}

function StopWinchPointReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint[8388609];

    // End:0x3A
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.SetElementActiveForActor(WinchPoint, false, false);
    }
    //return;    
}

function CreateWinchPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIndex[8388609];

    // End:0x40
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.AddElementForActor(TPawn, WinchPointIndex);
    }
    //return;    
}

function UpdateWinchPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFirmGrab[8388609], bPlayerIsBusy;

    // End:0x5D
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.UpdateWinchPointForPawn(TPawn, WinchPointIndex, pos, bFirmGrab, bPlayerIsBusy);
    }
    //return;    
}

function UpdateWinchPointForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayerIsBusy[8388609];

    // End:0x41
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.UpdateWinchPointForActor(TheActor, bPlayerIsBusy);
    }
    //return;    
}

function AnyWinchPointActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inTestActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(UI_VSWinchPointManager != none)
    {
        return UI_VSWinchPointManager.AnyWinchPointActive(inTestActor);
    }
    return false;
    //return ReturnValue;    
}

function StopWinchPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIndex[8388609];

    // End:0x42
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.SetElementActiveForActor(TPawn, false, false, WinchPointIndex);
    }
    //return;    
}

function RemoveAllWinchPoints()
{
    // End:0x2E
    if(UI_VSWinchPointManager != none)
    {
        UI_VSWinchPointManager.RemoveAll();
    }
    //return;    
}

function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSReticle(ReticleName);
    }
    //return;    
}

function VSGrabSuccessComplete()
{
    //return;    
}

function PlayVSGrabSuccess()
{
    // End:0x2E
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.PlayVSGrabSuccess();
    }
    //return;    
}

function ShowVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSGrabIndicator(bShow);
    }
    //return;    
}

function SetVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private float InValue[8388609];

    // End:0x37
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSGrabIndicator(InValue);
    }
    //return;    
}

function NotifyWinchProjectileRetracted()
{
    // End:0x2E
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.NotifyWinchProjectileRetracted();
    }
    //return;    
}

function ShowWinchGear()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WinchProjectile[9437185];

    // End:0x43
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowWinchGear(bOn, WinchProjectile);
    }
    //return;    
}

function SetMaxWinchDistance()
{
    local /*0x97E50000-0x00000000*/ private float newdist[8388609];

    // End:0x37
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetMaxWinchDistance(newdist);
    }
    //return;    
}

function NotifyWinchProjectileRetracting()
{
    // End:0x2E
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.NotifyWinchProjectileRetracting();
    }
    //return;    
}

function SetWinchMechanicalError()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetWinchMechanicalError(bShowIt);
    }
    //return;    
}

function SetVSReticleDrillSpeed()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewSpeed[8388609];

    // End:0x37
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSReticleDrillSpeed(NewSpeed);
    }
    //return;    
}

function SetVSReticleWelderState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSReticleWelderState(bOn);
    }
    //return;    
}

function SetVSReticleWeldProgress()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    // End:0x37
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetWeldProgress(val);
    }
    //return;    
}

function ShowVSReticleWeldCompletionMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowWeldCompletionMeter(bShowIt);
    }
    //return;    
}

function ShowVSReticleShockMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x39
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSShockMeter(bShowIt);
    }
    //return;    
}

function SetVSReticleShockMeterLevel()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    // End:0x37
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSShockMeterLevel(val);
    }
    //return;    
}

function SetVSReticleShockHelp()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSShockHelp(bShowIt);
    }
    //return;    
}

function SetVSReticleShockActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSShockActive(bShowIt);
    }
    //return;    
}

function SetVSReticleShockCharging()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSShockCharging(bShowIt);
    }
    //return;    
}

function SetVSReticleGrabState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSReticleGrabState(bOn);
    }
    //return;    
}

function ShowVSReticle_Winch_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSReticle_Winch_Tutorial(bShow);
    }
    //return;    
}

function ShowVSReticle_LeftArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSReticle_LeftArm_Tutorial(bShow);
    }
    //return;    
}

function ShowVSReticle_ShieldBlock_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSReticle_ShieldBlock_Tutorial(bShow);
    }
    //return;    
}

function ShowVSReticle_RightArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.ShowVSReticle_RightArm_Tutorial(bShow);
    }
    //return;    
}

function SetVSReticleQuickGrab()
{
    // End:0x2E
    if(UI_Reticle_VS != none)
    {
        UI_Reticle_VS.SetVSReticleQuickGrab();
    }
    //return;    
}

function CreateDrillVolumeReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];

    // End:0x38
    if(UI_VSDrillPointManager != none)
    {
        UI_VSDrillPointManager.AddElementForActor(DrillVolume);
    }
    //return;    
}

function SetDrillVolumeLockedOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLockedOn[8388609];

    // End:0x41
    if(UI_VSDrillPointManager != none)
    {
        UI_VSDrillPointManager.SetDrillVolumeLockedOnForActor(DrillVolume, bLockedOn);
    }
    //return;    
}

function GetDrillVolumeLockedOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(UI_VSDrillPointManager != none)
    {
        return UI_VSDrillPointManager.GetDrillVolumeLockedOnForActor(DrillVolume);
    }
    return false;
    //return ReturnValue;    
}

function StopDrillVolumeReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];

    // End:0x3A
    if(UI_VSDrillPointManager != none)
    {
        UI_VSDrillPointManager.SetElementActiveForActor(DrillVolume, false, false);
    }
    //return;    
}

function RemoveAllDrillPoints()
{
    // End:0x2E
    if(UI_VSDrillPointManager != none)
    {
        UI_VSDrillPointManager.RemoveAll();
    }
    //return;    
}

function NotifyVSReticleOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string OutroName[8388609];

    // End:0x14
    if(OutroName != "grab")
    {
    }
    //return;    
}

function WelderReticleOutroComplete()
{
    SetVSReticle("grab");
    //return;    
}

function NotifyVSGrabReticleIntroComplete()
{
    //return;    
}

function NotifyVSWelderReticleIntroComplete()
{
    SetVSReticleWelderState(true);
    //return;    
}

function NotifyVSDrillReticleIntroComplete()
{
    SetVSReticleDrillSpeed("slow");
    //return;    
}

function NotifyWaypointActivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];

    // End:0x37
    if(UI_WaypointManager != none)
    {
        UI_WaypointManager.NotifyWaypointActivated(WaypointMarker);
    }
    //return;    
}

function NotifyWaypointDeactivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];

    // End:0x37
    if(UI_WaypointManager != none)
    {
        UI_WaypointManager.NotifyWaypointDeactivated(WaypointMarker);
    }
    //return;    
}

function CreateInteractionReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x38
    if(UI_VSInteractionPointManager != none)
    {
        UI_VSInteractionPointManager.AddElementForActor(InteractionPoint);
    }
    //return;    
}

function StopInteractionReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x3A
    if(UI_VSInteractionPointManager != none)
    {
        UI_VSInteractionPointManager.SetElementActiveForActor(InteractionPoint, false, false);
    }
    //return;    
}

function RemoveAllInteractionPoints()
{
    // End:0x2E
    if(UI_VSInteractionPointManager != none)
    {
        UI_VSInteractionPointManager.RemoveAll();
    }
    //return;    
}

function CreateWeldReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x38
    if(UI_VSWeldPointManager != none)
    {
        UI_VSWeldPointManager.AddElementForActor(InteractionPoint);
    }
    //return;    
}

function StopWeldReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x3A
    if(UI_VSWeldPointManager != none)
    {
        UI_VSWeldPointManager.SetElementActiveForActor(InteractionPoint, false, false);
    }
    //return;    
}

function RemoveAllWeldPoints()
{
    // End:0x2E
    if(UI_VSWeldPointManager != none)
    {
        UI_VSWeldPointManager.RemoveAll();
    }
    //return;    
}

function CreateTaserReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x38
    if(UI_VSTaserPointManager != none)
    {
        UI_VSTaserPointManager.AddElementForActor(InteractionPoint);
    }
    //return;    
}

function StopTaserReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0x3A
    if(UI_VSTaserPointManager != none)
    {
        UI_VSTaserPointManager.SetElementActiveForActor(InteractionPoint, false, false);
    }
    //return;    
}

function RemoveAllTaserPoints()
{
    // End:0x2E
    if(UI_VSTaserPointManager != none)
    {
        UI_VSTaserPointManager.RemoveAll();
    }
    //return;    
}

function PickedUpThermalEnergy()
{
    // End:0x2E
    if(UI_WeaponInfoCluster != none)
    {
        UI_WeaponInfoCluster.PickedUpThermalEnergy();
    }
    //return;    
}

function CreateTENGPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609];

    UI_TENGPointManager.AddElementForActor(TEP);
    //return;    
}

function StopTENGPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609];

    UI_TENGPointManager.SetElementActiveForActor(TEP, false, false);
    //return;    
}

function RemoveAllTENGPoints()
{
    UI_TENGPointManager.RemoveAll();
    //return;    
}

function TENGPostTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;

    UI_TENGPointManager.TENGPostTookDamage(TEP, Post);
    //return;    
}

function TENGPostChangedOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    UI_TENGPointManager.TENGPostChangedOwner(TEP, Post, OwningTeam);
    //return;    
}

function TENGPostDeploying()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    UI_TENGPointManager.TENGPostChangedOwner(TEP, Post, OwningTeam);
    //return;    
}

function TENGPostRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    UI_TENGPointManager.TENGPostChangedOwner(TEP, Post, OwningTeam);
    //return;    
}

function CreateDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];

    UI_DNATagManager.AddElementForActor(A);
    //return;    
}

function StopDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];

    UI_DNATagManager.SetElementActiveForActor(A, false, false);
    //return;    
}

function RemoveAllDNATags()
{
    // End:0x2E
    if(UI_DNATagManager != none)
    {
        UI_DNATagManager.RemoveAll();
    }
    //return;    
}

function CreateMunitionsLockerIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL MunitionsLocker[8388609];

    // End:0x38
    if(UI_MunitionsLockerManager != none)
    {
        UI_MunitionsLockerManager.AddElementForActor(MunitionsLocker);
    }
    //return;    
}

function StopMunitionsLockerIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL MunitionsLocker[8388609];

    // End:0x3A
    if(UI_MunitionsLockerManager != none)
    {
        UI_MunitionsLockerManager.SetElementActiveForActor(MunitionsLocker, false, false);
    }
    //return;    
}

function RemoveAllMunitionsLockerIcons()
{
    // End:0x2E
    if(UI_MunitionsLockerManager != none)
    {
        UI_MunitionsLockerManager.RemoveAll();
    }
    //return;    
}

function CreateGrenadeWarning()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade[8388609];

    // End:0x38
    if(UI_GrenadeWarningManager != none)
    {
        UI_GrenadeWarningManager.AddElementForActor(Grenade);
    }
    //return;    
}

function StopGrenadeWarning()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade[8388609];

    // End:0x3A
    if(UI_GrenadeWarningManager != none)
    {
        UI_GrenadeWarningManager.SetElementActiveForActor(Grenade, false, false);
    }
    //return;    
}

function RemoveExpiredGrenadeWarnings()
{
    // End:0x2E
    if(UI_GrenadeWarningManager != none)
    {
        UI_GrenadeWarningManager.RemoveUnusedElements();
    }
    //return;    
}

function RemoveAllGrenadeWarnings()
{
    // End:0x2E
    if(UI_GrenadeWarningManager != none)
    {
        UI_GrenadeWarningManager.RemoveAll();
    }
    //return;    
}

function CreateCourierIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x38
    if(UI_CourierItemManager != none)
    {
        UI_CourierItemManager.AddElementForActor(CourierItem);
    }
    //return;    
}

function StopCourierIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x3A
    if(UI_CourierItemManager != none)
    {
        UI_CourierItemManager.SetElementActiveForActor(CourierItem, false, false);
    }
    //return;    
}

function CourierItemChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x38
    if(UI_CourierItemManager != none)
    {
        UI_CourierItemManager.ObjectiveChangedState(CourierItem);
    }
    //return;    
}

function RemoveAllCourierIcons()
{
    // End:0x2E
    if(UI_CourierItemManager != none)
    {
        UI_CourierItemManager.RemoveAll();
    }
    //return;    
}

function CreateSeizeControlPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x38
    if(UI_SeizeControlPointManager != none)
    {
        UI_SeizeControlPointManager.AddElementForActor(SCObjective);
    }
    //return;    
}

function StopSeizeControlPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x3A
    if(UI_SeizeControlPointManager != none)
    {
        UI_SeizeControlPointManager.SetElementActiveForActor(SCObjective, false, false);
    }
    //return;    
}

function SeizeControlPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x38
    if(UI_SeizeControlPointManager != none)
    {
        UI_SeizeControlPointManager.ObjectiveChangedState(SCObjective);
    }
    //return;    
}

function SeizeControlPointChangedTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];

    // End:0x42
    if(UI_SeizeControlPointManager != none)
    {
        UI_SeizeControlPointManager.ObjectiveChangedTouch(SCObjective, bIsTouching);
    }
    //return;    
}

function RemoveAllSeizeControlPoints()
{
    // End:0x2E
    if(UI_SeizeControlPointManager != none)
    {
        UI_SeizeControlPointManager.RemoveAll();
    }
    //return;    
}

function CreateDisableRepairPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x38
    if(UI_DisableRepairPointManager != none)
    {
        UI_DisableRepairPointManager.AddElementForActor(DRObjective);
    }
    //return;    
}

function StopDisableRepairPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x3A
    if(UI_DisableRepairPointManager != none)
    {
        UI_DisableRepairPointManager.SetElementActiveForActor(DRObjective, false, false);
    }
    //return;    
}

function DisableRepairPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x38
    if(UI_DisableRepairPointManager != none)
    {
        UI_DisableRepairPointManager.ObjectiveChangedState(DRObjective);
    }
    //return;    
}

function RemoveAllDisableRepairPoints()
{
    // End:0x2E
    if(UI_DisableRepairPointManager != none)
    {
        UI_DisableRepairPointManager.RemoveAll();
    }
    //return;    
}

function CreateKillObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillObjective[8388609];

    // End:0x38
    if(UI_KillObjectiveManager != none)
    {
        UI_KillObjectiveManager.AddElementForActor(KillObjective);
    }
    //return;    
}

function StopKillObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillObjective[8388609];

    // End:0x3A
    if(UI_KillObjectiveManager != none)
    {
        UI_KillObjectiveManager.SetElementActiveForActor(KillObjective, false, false);
    }
    //return;    
}

function RemoveAllKillObjectives()
{
    // End:0x2E
    if(UI_KillObjectiveManager != none)
    {
        UI_KillObjectiveManager.RemoveAll();
    }
    //return;    
}

function CreateBombPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x38
    if(UI_BombPointManager != none)
    {
        UI_BombPointManager.AddElementForActor(BombActor);
    }
    //return;    
}

function StopBombPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x3A
    if(UI_BombPointManager != none)
    {
        UI_BombPointManager.SetElementActiveForActor(BombActor, false, false);
    }
    //return;    
}

function BombPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x38
    if(UI_BombPointManager != none)
    {
        UI_BombPointManager.ObjectiveChangedState(BombActor);
    }
    //return;    
}

function RemoveAllBombPoints()
{
    // End:0x2E
    if(UI_BombPointManager != none)
    {
        UI_BombPointManager.RemoveAll();
    }
    //return;    
}

function CreateSnowcatPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x38
    if(UI_SnowcatPointManager != none)
    {
        UI_SnowcatPointManager.AddElementForActor(SCObjective);
    }
    //return;    
}

function StopSnowcatPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x3A
    if(UI_SnowcatPointManager != none)
    {
        UI_SnowcatPointManager.SetElementActiveForActor(SCObjective, false, false);
    }
    //return;    
}

function SnowcatPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x38
    if(UI_SnowcatPointManager != none)
    {
        UI_SnowcatPointManager.ObjectiveChangedState(SCObjective);
    }
    //return;    
}

function RemoveAllSnowcatPoints()
{
    // End:0x2E
    if(UI_SnowcatPointManager != none)
    {
        UI_SnowcatPointManager.RemoveAll();
    }
    //return;    
}

function CreateCreditsForDamagePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsKillShot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Element;

    // End:0xFE
    if(UI_CreditsForDamageManager != none)
    {
        Element = UI_CreditsForDamageManager.GetUIElementForActor(DamagedActor);
        // End:0xCC
        if(Element == none)
        {
            UI_CreditsForDamageManager.CleanupOrphans();
            UI_CreditsForDamageManager.AddElementForActor(DamagedActor);
            Element = UI_CreditsForDamageManager.GetUIElementForActor(DamagedActor);
        }
        Element.AddCreditAmount(CreditAmount, bIsKillShot);
    }
    //return;    
}

function StopCreditsForDamagePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];

    // End:0x3A
    if(UI_CreditsForDamageManager != none)
    {
        UI_CreditsForDamageManager.SetElementActiveForActor(DamagedActor, false, false);
    }
    //return;    
}

function RemoveAllCreditsForDamagePoints()
{
    // End:0x2E
    if(UI_CreditsForDamageManager != none)
    {
        UI_CreditsForDamageManager.RemoveAll();
    }
    //return;    
}

function CreateEnhancedRepairBar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RepairActor[8388609];

    // End:0x38
    if(UI_EnhancedRepairManager != none)
    {
        UI_EnhancedRepairManager.AddElementForActor(RepairActor);
    }
    //return;    
}

function StopEnhancedRepairBar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RepairActor[8388609];

    // End:0x3A
    if(UI_EnhancedRepairManager != none)
    {
        UI_EnhancedRepairManager.SetElementActiveForActor(RepairActor, false, false);
    }
    //return;    
}

function RemoveEnhancedRepairBar()
{
    // End:0x2E
    if(UI_EnhancedRepairManager != none)
    {
        UI_EnhancedRepairManager.RemoveAll();
    }
    //return;    
}

function SetSixthSenseWarning()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    // End:0x37
    if(UI_SixthSense != none)
    {
        UI_SixthSense.SetSixthSenseWarning(AngleInDegrees);
    }
    //return;    
}

function ShowMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell[8388609];
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];

    // End:0x40
    if(UI_MetagameTracker != none)
    {
        UI_MetagameTracker.ShowMetagameTracker(Cell, Progress);
    }
    //return;    
}

function SetMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CellTitle[8388609], SubHeading, UnlockType, RewardType;
    local /*0x97E50000-0x00000000*/ private float Progress[8388609], ProgressNeeded;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TrackingMessage[9437185];

    ""
    // End:0x73
    if(UI_MetagameTracker != none)
    {
        UI_MetagameTracker.SetMetagameTracker(CellTitle, SubHeading, UnlockType, RewardType, Progress, ProgressNeeded, TrackingMessage);
    }
    //return;    
}

function HideMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediate[9437185];

    false
    // End:0x3D
    if(UI_MetagameTracker != none)
    {
        UI_MetagameTracker.HideMetagameTracker(bImmediate);
    }
    //return;    
}

function NotifyMetagameTrackerOutroComplete()
{
    // End:0x2E
    if(UI_MetagameTracker != none)
    {
        UI_MetagameTracker.NextNotification();
    }
    //return;    
}

function NotifyMetagameTrackerAwardComplete()
{
    // End:0x2E
    if(UI_MetagameTracker != none)
    {
        UI_MetagameTracker.NotifyAwardFinished();
    }
    //return;    
}

function ShowWinLossSplashScreen()
{
    // End:0x44
    if(UI_WinLossSplash != none)
    {
        UIElements[35] = UI_WinLossSplash;
        UI_WinLossSplash.ShowWinLossSplashScreen();
    }
    //return;    
}

function NotifyWinLossSplashComplete()
{
    LPHUD(myHUD).NotifyWinLossSplashComplete();
    //return;    
}

function DisplayMPObjective()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo[8388609];

    // End:0x99
    if(!MessageInfo.bPrimary)
    {
        // End:0x81
        if(MPObjectiveQueue.Length > 0)
        {
            // End:0x7C
            if(MPObjectiveQueue[MPObjectiveQueue.Length - 1] != MessageInfo)
            {
                MPObjectiveQueue[MPObjectiveQueue.Length] = MessageInfo;
            }
            return;            
        }
        else
        {
            MPObjectiveQueue[0] = MessageInfo;
        }        
    }
    else
    {
        MPObjectiveQueue.Length = 0;
        bMPObjectiveActive = true;
    }
    SetMPObjective(MessageInfo);
    //return;    
}

function SetMPObjective()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[9437185];

    true
    switch(byte(MessageInfo.ObjectiveType))
    {
        // End:0x4B
        case 3:
            SetMPObjectiveType("MPOBJ_bomb");
            // End:0x14D
            break;
        // End:0x6C
        case 4:
            SetMPObjectiveType("MPOBJ_courier");
            // End:0x14D
            break;
        // End:0x8C
        case 5:
            SetMPObjectiveType("MPOBJ_repair");
            // End:0x14D
            break;
        // End:0xAB
        case 6:
            SetMPObjectiveType("MPOBJ_seize");
            // End:0x14D
            break;
        // End:0xCB
        case 7:
            SetMPObjectiveType("MPOBJ_escort");
            // End:0x14D
            break;
        // End:0xEA
        case 8:
            SetMPObjectiveType("MPOBJ_akrid");
            // End:0x14D
            break;
        // End:0x106
        case 1:
            SetMPObjectiveType("MPOBJ_TE");
            // End:0x14D
            break;
        // End:0x128
        case 9:
            SetMPObjectiveType("MPOBJ_survival");
            // End:0x14D
            break;
        // End:0x12D
        case 2:
        // End:0x14A
        case 0:
            SetMPObjectiveType("MPOBJ_TDM");
            // End:0x14D
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetMPObjectiveText(MessageInfo.MessageTitle, MessageInfo.MessageBody);
    // End:0x20B
    if(bShow)
    {
        ShowMPObjective(true);
        // End:0x20B
        if(MessageInfo.DisplayTime > float(0))
        {
            GetPC().SetTimer(MessageInfo.DisplayTime, false, 'ClearMPObjective', self);
        }
    }
    //return;    
}

function ClearMPObjective()
{
    ShowMPObjective(false);
    // End:0x28
    if(MPObjectiveQueue.Length > 0)
    {
        MPObjectiveQueue.Remove(0, 1);        
    }
    GetPC().SetTimer(0.5000000, false, 'NextMPObjective', self);
    //return;    
}

function NextMPObjective()
{
    // End:0x32
    if(MPObjectiveQueue.Length > 0)
    {
        SetMPObjective(MPObjectiveQueue[0], ShouldShowMPObjective());        
    }
    else
    {
        DisplayActiveMPObjective();
    }
    //return;    
}

function SetMPObjectiveType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveType[8388609];

    MPHUD_Container.ActionScriptVoid("setGSUIObjectiveType");
    //return;    
}

function SetMPObjectiveText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryText[8388609], SecondaryText;

    MPHUD_Container.ActionScriptVoid("setMPObjectiveMessageData");
    //return;    
}

function ShowMPObjective()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x88
    if(bMPObjectiveVisible != bShow)
    {
        bMPObjectiveVisible = bShow;
        MPHUD_Container.ActionScriptVoid("showMPObjectiveMessage");
        // End:0x88
        if(!bShow)
        {
            ShowMPSubObjective(bShow);
        }
    }
    //return;    
}

function DisplayActiveMPObjective()
{
    local /*0x97E50000-0x00000000*/ private float DisplayTime[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo;

    -1.0000000
    // End:0x88
    if(Class'LPGRI_Base_MP'.static.ConstructActiveObjectiveMessage(MessageInfo, int(GetPC().GetTeamNum()), DisplayTime))
    {
        SetMPObjective(MessageInfo, ShouldShowMPObjective());
        bMPObjectiveActive = true;
    }
    //return;    
}

function UpdateMPObjective()
{
    // End:0x21
    if(bMPObjectiveActive)
    {
        ShowMPObjective(ShouldShowMPObjective());
    }
    //return;    
}

function ShouldShowMPObjective()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MPTeamScores.bVisible && !GetPC().IsInState('RoundEnded');
    //return ReturnValue;    
}

function ShowMPSubObjective()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x66
    if(bMPSubObjectiveVisible != bShow)
    {
        bMPSubObjectiveVisible = bShow;
        MPHUD_Container.ActionScriptVoid("showSubObjectiveMessage");
    }
    //return;    
}

function SetMPSubObjectiveDangerMode()
{
    local /*0x97E50000-0x00000000*/ private bool bDangerMode[8388609];

    MPHUD_Container.ActionScriptVoid("setSubObjectiveDangerMode");
    //return;    
}

function SetMPSubObjectiveType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609];

    MPHUD_Container.ActionScriptVoid("setSubObjectiveMessageType");
    //return;    
}

function SetMPSubObjectiveBattlecatMoving()
{
    local /*0x97E50000-0x00000000*/ private bool bMoving[8388609];

    MPHUD_Container.ActionScriptVoid("setSubObjectiveBattlecatMovement");
    //return;    
}

function SetMPSubObjectiveTimer()
{
    local /*0x97E50000-0x00000000*/ private int Seconds[8388609];

    MPHUD_Container.ActionScriptVoid("setSubObjectiveMessageTimer");
    //return;    
}

function SetMPSubObjectiveTimerPunctuation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Seperator[8388609], Decimal;

    MPHUD_Container.ActionScriptVoid("setSubObjectiveMessageTimerPunctuation");
    //return;    
}

function SetMPSubObjectiveText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string SubObjectiveText[8388609];

    MPHUD_Container.ActionScriptVoid("setSubObjectiveMessageData");
    //return;    
}

function SetCrosshairColor()
{
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;

    UI_Reticle_Hex.SetColor(R, G, B);
    //return;    
}

function SetMovieClipColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;

    ActionScriptVoid("setMovieClipColor");
    //return;    
}

function ResetMovieClipColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    ActionScriptVoid("resetMovieClipColor");
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private int ShouldShowReticle;
    local /*0x97E50000-0x00000000*/ private bool bReticleShouldBeVisible;

    super.Update(DeltaTime);
    PC = GetPC();
    // End:0xBC
    if(PC != none)
    {
        // End:0xBC
        if(int(PC.WorldInfo.NetMode) != int(NM_Standalone))
        {
            MPNotifications.Update();
            MPTeamScores.Update();
            UpdateMPObjective();
        }
    }
    // End:0x171
    if(CurrentReticle != none)
    {
        bReticleShouldBeVisible = CurrentReticle.ShouldBeVisible();
        // End:0x110
        if(bReticleShouldBeVisible)
        {
            ShouldShowReticle = 1;            
        }
        else
        {
            ShouldShowReticle = 0;
        }
        // End:0x171
        if((LastReticleShow == -1) || LastReticleShow != ShouldShowReticle)
        {
            HideCrosshair(!bReticleShouldBeVisible);
            LastReticleShow = ShouldShowReticle;
        }
    }
    // End:0x1B2
    if(ShowReticleInNUpdates > 0)
    {
        ShowReticleInNUpdates--;
        // End:0x1B2
        if(ShowReticleInNUpdates == 0)
        {
            SetCrosshairActive(true, true);
            HideCrosshair(false, true);
        }
    }
    // End:0x1E9
    if(MyLPGFxMovie_JobLog != none)
    {
        MyLPGFxMovie_JobLog.Update(DeltaTime);
    }
    //return;    
}

function SetHidden()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    super(SPGFxMoviePlayer).SetHidden(bSet);
    HideCrosshair(bSet);
    //return;    
}

// Export ULPGFxMoviePlayerHUD::execAmmoClusterShouldDisplay(FFrame&, void* const)
native function AmmoClusterShouldDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function WeaponClusterShouldDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P, LPPC;

    LPPC = LPPlayerController(GetPC());
    P = LPPC.Pawn;
    // End:0x67
    if((P == none) || myHUD == none)
    {
        return false;
    }
    // End:0x8D
    if(!P.IsAliveAndWell())
    {
        return false;
    }
    // End:0xBD
    if(LPHUD(myHUD).ShouldDisplayWeaponInfoCluster() == false)
    {
        return false;
    }
    // End:0x109
    if(!LPPC.bIsInVitalSuit && P.Weapon == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function HealthClusterShouldDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P, HUD, LPPC;

    LPPC = LPPlayerController(GetPC());
    P = SPGFPawn(LPPC.Pawn);
    HUD = LPHUD(myHUD);
    // End:0x8C
    if((P == none) || HUD == none)
    {
        return false;
    }
    // End:0xD3
    if((LPBasePlayerPawn(P) != none) && LPBasePlayerPawn(P).bIncapacitated)
    {
        return false;
    }
    // End:0xFA
    if(HUD.ShouldDisplayHealthInfoCluster() == false)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

// Export ULPGFxMoviePlayerHUD::execGetCurrentWeapon(FFrame&, void* const)
native function GetCurrentWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function RefreshLoadoutUI()
{
    RefreshHUDAmmoCount();
    CurrentReticle.RefreshReticleType();
    UI_WeaponInfoCluster.Refresh();
    //return;    
}

function RefreshHUDAmmoCount()
{
    UI_Reticle_Hex.RefreshHUDAmmoCount();
    //return;    
}

function SetDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x30
    if(UI_SixthSense != none)
    {
        UI_SixthSense.SetActive(false, true);
    }
    LPPC = LPPlayerController(GetPC());
    // End:0xF2
    if(LPPC.bIsInVitalSuit)
    {
        // End:0xC7
        if(LPVSFuturePlayerPawn(LPPC.Pawn) != none)
        {
            UI_DirectionalDamageFutureVS.SetDirectionalDamage(AngleInDegrees);            
        }
        else
        {
            UI_DirectionalDamageVS.SetDirectionalDamage(AngleInDegrees);
        }        
    }
    else
    {
        UI_DirectionalDamage.SetDirectionalDamage(AngleInDegrees);
    }
    SetVSReticleDamage();
    //return;    
}

function SetVSReticleDamage()
{
    // End:0x53
    if((CurrentReticle == UI_Reticle_VS) && CurrentReticle.IsActive())
    {
        ActionScriptVoid("playVSDamage");
    }
    //return;    
}

function ClearDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0xB0
    if(LPPC.bIsInVitalSuit)
    {
        // End:0x8E
        if(LPVSFuturePlayerPawn(LPPC.Pawn) != none)
        {
            UI_DirectionalDamageFutureVS.ClearDirectionalDamage();            
        }
        else
        {
            UI_DirectionalDamageVS.ClearDirectionalDamage();
        }        
    }
    else
    {
        UI_DirectionalDamage.ClearDirectionalDamage();
    }
    //return;    
}

function SetCountdownTime()
{
    local /*0x97E50000-0x00000000*/ private int CountdownTime[8388609];

    // End:0x73
    if(MPHUD_Container != none)
    {
        // End:0x73
        if(CountdownTimeRemaining != CountdownTime)
        {
            MPHUD_Container.ActionScriptVoid("setInvulnerabilitySeconds");
            CountdownTimeRemaining = CountdownTime;
        }
    }
    //return;    
}

function ShowCountdown()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x77
    if(MPHUD_Container != none)
    {
        // End:0x77
        if(bCountdownVisible != bShow)
        {
            MPHUD_Container.ActionScriptVoid("bShowSpawnInvulnerability");
            bCountdownVisible = bShow;
        }
    }
    //return;    
}

function SetCountdownTextMarkUp()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TextMarkUp[8388609];

    // End:0x47
    if(CountdownTextMarkUp != TextMarkUp)
    {
        SetCountdownText(GetLocalizedString(TextMarkUp));
        CountdownTextMarkUp = TextMarkUp;
    }
    //return;    
}

function SetCountdownText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CountdownText[8388609];

    // End:0x47
    if(MPHUD_Container != none)
    {
        MPHUD_Container.ActionScriptVoid("setInvulnerabilityTitle");
    }
    //return;    
}

function registerMiniMapView()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string clipName[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609];

    // End:0xD1
    if(int(GetPC().WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xD1
        if(clipName == "minimap")
        {
            LPGFxUIElementMinimap(UIElements[0]).registerMiniMapView(MC, R);
            UI_Minimap = LPGFxUIElementMinimap(UIElements[0]);
            UI_Minimap.SetActive(false, true);
        }
    }
    //return;    
}

function MinimapOutroComplete()
{
    //return;    
}

function WeaponInfoClusterOutroComplete()
{
    //return;    
}

function MinimapZoomOut()
{
    // End:0x2E
    if(UI_Minimap != none)
    {
        UI_Minimap.MinimapZoomOut();
    }
    //return;    
}

function MinimapZoomIn()
{
    // End:0x2E
    if(UI_Minimap != none)
    {
        UI_Minimap.MinimapZoomIn();
    }
    //return;    
}

function SetUmbilicalRangeDisplayState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609], OldState;
    local /*0x97E50000-0x00000000*/ private bool bEMPOverride[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL P, HUD;

    HUD = LPHUD(myHUD);
    P = GetPC().Pawn;
    switch(NewState)
    {
        // End:0x1F2
        case 2:
            // End:0x95
            if(UI_Minimap != none)
            {
                UI_Minimap.SetUmbilicalState(NewState);
            }
            // End:0xCC
            if(UI_WaypointManager != none)
            {
                UI_WaypointManager.SetUmbilicalState(NewState);
            }
            ChangedWeapon(LPWeapon(P.Weapon));
            // End:0x174
            if(!bEMPOverride)
            {
                UI_WeaponInfoCluster.PostStatusMessage("<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_EstablishUmbilical>");
            }
            // End:0x1C1
            if((P != none) && EnterUmbilicalRangeSound != none)
            {
                P.PlaySound(EnterUmbilicalRangeSound);
            }
            // End:0x1EF
            if(LoopingUmbilicalAC != none)
            {
                LoopingUmbilicalAC.Stop();
            }
            // End:0x4DD
            break;
        // End:0x3C1
        case 3:
            // End:0x22E
            if(UI_Minimap != none)
            {
                UI_Minimap.SetUmbilicalState(NewState);
            }
            // End:0x265
            if(UI_WaypointManager != none)
            {
                UI_WaypointManager.SetUmbilicalState(NewState);
            }
            UI_WeaponInfoCluster.SetUmbilicalState(NewState);
            // End:0x2A6
            if(LoopingUmbilicalAC == none)
            {
                CreateLoopingUmbilicalAC();
            }
            // End:0x2D4
            if(LoopingUmbilicalAC != none)
            {
                LoopingUmbilicalAC.Play();
            }
            // End:0x35D
            if(!bEMPOverride)
            {
                // End:0x35A
                if(int(OldState) != int(4))
                {
                    UI_WeaponInfoCluster.PostStatusMessage("<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_WeakUmbilical>");
                }                
            }
            else
            {
                UI_WeaponInfoCluster.PostStatusMessage("<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_EMPDetected>");
            }
            // End:0x4DD
            break;
        // End:0x4DA
        case 4:
            // End:0x3FD
            if(UI_Minimap != none)
            {
                UI_Minimap.SetUmbilicalState(NewState);
            }
            // End:0x434
            if(UI_WaypointManager != none)
            {
                UI_WaypointManager.SetUmbilicalState(NewState);
            }
            UI_WeaponInfoCluster.SetUmbilicalState(NewState);
            // End:0x4A9
            if((P != none) && ExitUmbilicalRangeSound != none)
            {
                P.PlaySound(ExitUmbilicalRangeSound);
            }
            // End:0x4D7
            if(LoopingUmbilicalAC != none)
            {
                LoopingUmbilicalAC.Stop();
            }
            // End:0x4DD
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x56D
    if(int(P.WorldInfo.NetMode) == int(NM_Standalone))
    {
        ShowWeaponCluster(HUD.ShouldDisplayWeaponInfoCluster());
        ShowHealthCluster(HUD.ShouldDisplayHealthInfoCluster());
    }
    //return;    
}

function SetMasterDisplaySwitchRadar()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    bMasterSwitchRadar = bEnable;
    //return;    
}

function SetMasterDisplaySwitchHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    bMasterSwitchHUD = bEnable;
    //return;    
}

function SetMasterDisplaySwitchReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    bMasterSwitchReticle = bEnable;
    //return;    
}

function SetMasterDisplaySwitchDPAD()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    bMasterSwitchDPAD = bEnable;
    //return;    
}

function SetMasterDisplaySwitchWeaponsCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    bMasterSwitchWeaponsCluster = bEnable;
    //return;    
}

function ShowRadar()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x1C
    if(bMasterSwitchRadar == false)
    {
        bShow = false;
    }
    // End:0x55
    if(UI_Minimap != none)
    {
        UI_Minimap.SetActive(bShow);
    }
    //return;    
}

function ShowSaveWheel()
{
    local /*0x97E50000-0x00000000*/ private float MinDisplayTime[8388609];

    ActionScriptVoid("ShowSaveWheel");
    //return;    
}

function HideSaveWheel()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediate[8388609];

    ActionScriptVoid("HideSaveWheel");
    //return;    
}

function HideCrosshair()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609], forceImmediate;

    false
    // End:0xAA
    if(CurrentReticle != none)
    {
        // End:0x66
        if((bHide == false) && forceImmediate == false)
        {
            // End:0x63
            if((ShowReticleInNUpdates == 0) || ShowReticleInNUpdates > 2)
            {
                ShowReticleInNUpdates = 2;
            }            
        }
        else
        {
            ShowReticleInNUpdates = 0;
        }
        // End:0xAA
        if(ShowReticleInNUpdates <= 0)
        {
            CurrentReticle.hide(bHide);
        }
    }
    //return;    
}

function SetCrosshairActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], forceImmediate;

    false
    // End:0x21
    if(bMasterSwitchReticle == false)
    {
        bShow = false;
    }
    // End:0xA0
    if(bShow == true)
    {
        // End:0x70
        if(forceImmediate == true)
        {
            CurrentReticle.SetActive(true);
            ShowReticleInNUpdates = 0;            
        }
        else
        {
            // End:0x9D
            if((ShowReticleInNUpdates == 0) || ShowReticleInNUpdates > 2)
            {
                ShowReticleInNUpdates = 2;
            }
        }        
    }
    else
    {
        CurrentReticle.SetActive(false);
        ShowReticleInNUpdates = 0;
    }
    //return;    
}

function IsCrosshairShown()
{
    local /*0x97E50000-0x00000000*/ private bool considerCrosshairAboutToBeShownAsShown[9437185], ReturnValue, bReticleIsActive, bReticleIsHidden, bAboutToBeShown, bRetval;

    true
    bReticleIsActive = CurrentReticle.IsActive();
    bReticleIsHidden = CurrentReticle.IsHidden();
    bAboutToBeShown = (considerCrosshairAboutToBeShownAsShown == true) && ShowReticleInNUpdates > 0;
    bRetval = (bReticleIsActive && bReticleIsHidden == false) || bAboutToBeShown;
    return bRetval;
    //return ReturnValue;    
}

function ShowWeaponCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x1C
    if(bMasterSwitchWeaponsCluster == false)
    {
        bShow = false;
    }
    UI_WeaponInfoCluster.SetActive(bShow);
    //return;    
}

function ShowHealthCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x39
    if(UI_HealthInfoCluster != none)
    {
        UI_HealthInfoCluster.SetActive(bShow);
    }
    //return;    
}

function WeaponIconSwitch()
{
    local /*0x97E50000-0x00000000*/ private int stage[8388609];

    UI_WeaponInfoCluster.WeaponIconSwitch(stage);
    //return;    
}

function IsWeaponClusterVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return UI_WeaponInfoCluster.IsVisible();
    //return ReturnValue;    
}

function IsDPADClusterVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return UI_DPadCluster.IsVisible();
    //return ReturnValue;    
}

function ShowDPadCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    UI_DPadCluster.ShowDPadCluster(bShow);
    //return;    
}

function SetDPadClusterPerkState()
{
    local /*0x97E50000-0x00000000*/ private byte PerkStatus[8388609];
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];

    UI_DPadCluster.SetDPadClusterPerkState(PerkStatus, PerkNum);
    //return;    
}

function ForceDPadClusterUpdate()
{
    // End:0x2E
    if(UI_DPadCluster != none)
    {
        UI_DPadCluster.ForceUpdate();
    }
    //return;    
}

function ShowMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private int dpadButtonIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185], bSongInfoOnly;

    -1
    false
    false
    UI_MusicPlayer.ShowMusicPlayer(bShow, dpadButtonIndex, bIsNotAllowed, bSongInfoOnly);
    //return;    
}

function ShowPlatformMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL inExtractPocket[9437185], InVsPawn;

    UI_PlatformMeter.ShowPlatformMeter(bShow, inExtractPocket, InVsPawn);
    //return;    
}

function AddAwardToQueue()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];
    local /*0x97E50000-0x00000000*/ private int CreditsAwarded[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int BestIdx, I;
    local /*0x97E50000-0x00000000*/ private @NULL QueuedAward;

    BestIdx = 0;
    I = 0;
    J0x16:

    // End:0xEC [Loop If]
    if(I < AwardDisplayQueue.Length)
    {
        QueuedAward = AwardDisplayQueue[I].Award;
        // End:0x70
        if(QueuedAward == none)
        {            
        }
        else
        {
            // End:0xD3
            if(Award.GetPriority() <= AwardDisplayQueue[I].Award.GetPriority())
            {
                // [Explicit Break]
                goto J0xEC;
            }
            BestIdx++;
        }
        I++;
        // [Loop Continue]
        goto J0x16;
    }
    J0xEC:

    AwardDisplayQueue.Insert(BestIdx, 1);    
    AwardDisplayQueue[BestIdx].Award = Award;
    AwardDisplayQueue[BestIdx].CreditsAwarded = CreditsAwarded;
    return true;
    //return ReturnValue;    
}

function RemoveAwardFromQueue()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x7C [Loop If]
    if(I < AwardDisplayQueue.Length)
    {
        // End:0x6E
        if(AwardDisplayQueue[I].Award == Award)
        {
            AwardDisplayQueue.Remove(I, 1);            
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function NotifyAwardIntroComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];

    LPHUD(myHUD).NotifyAwardIntroComplete(Award);
    //return;    
}

function NotifyAwardDisplayComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];

    //return;    
}

function ShowNextAward()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x59
    if(AwardDisplayQueue.Length > 0)
    {
        ShowAward(true, AwardDisplayQueue[0].Award, AwardDisplayQueue[0].CreditsAwarded);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function @NULL ShowAward()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Award[9437185];
    local /*0x97E50000-0x00000000*/ private int CreditsAwarded[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL OpenSoundAC;

    // End:0x13
    if(UI_Award == none)
    {
        return false;
    }
    // End:0xC9
    if(bShow)
    {
        // End:0x63
        if(UI_Award.IsBusy())
        {
            AddAwardToQueue(Award, CreditsAwarded);
            return true;            
        }
        else
        {
            // End:0xC9
            if((AwardDisplayQueue.Length > 0) && AwardDisplayQueue[0].Award == Award)
            {
                RemoveAwardFromQueue(AwardDisplayQueue[0].Award);
            }
        }
    }
    // End:0x1ED
    if(!UI_Award.IsActive() && bShow)
    {
        UI_Award.ShowAward(bShow, Award, CreditsAwarded);
        // End:0x1EB
        if(((GetPC()) != none) && GetPC().Pawn != none)
        {
            OpenSoundAC = GetPC().Pawn.CreateAudioComponent(AwardOpenSound, true, true);
            // End:0x1EB
            if(OpenSoundAC != none)
            {
                OpenSoundAC.bIsUISound = true;
            }
        }
        return true;
    }
    // End:0x220
    if(!bShow)
    {
        UI_Award.ShowAward(false);
        return false;
    }
    //return ReturnValue;    
}

function NotifyShowAwardComplete()
{
    ShowNextAward();
    // End:0x24
    if(AwardDisplayQueue.Length <= 0)
    {
        NotifyMetagameTrackerAwardComplete();
    }
    //return;    
}

function IsAwardBusy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return UI_Award.IsBusy();
    //return ReturnValue;    
}

function ShowEnemyHitMarker()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    UI_Reticle_Hex.ShowEnemyHitMarker(bShow);
    //return;    
}

event OnClose()
{
    super.OnClose();
    //return;    
}

function OnGiveInventory()
{
    UI_WeaponInfoCluster.OnGiveInventory();
    //return;    
}

function ChangedWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewWeapon[8388609];

    // End:0x25
    if(NewWeapon != none)
    {
        SetCurrentReticle(UI_Reticle_Hex);        
    }
    else
    {
        // End:0x48
        if(CurrentReticle == UI_Reticle_Hex)
        {
            SetCrosshairActive(false);
        }
    }
    // End:0x7D
    if(int(LPHUD(myHUD).GetDisplayState()) == int(3))
    {
        return;
    }
    UI_WeaponInfoCluster.ChangedWeapon(NewWeapon);
    //return;    
}

function SwitchedToNewInventoryPart()
{
    UI_VSWeldPointManager.NotifyChangedVSInventoryPart();
    UI_VSTaserPointManager.NotifyChangedVSInventoryPart();
    UI_VSDrillPointManager.NotifyChangedVSInventoryPart();
    UI_VSWinchPointManager.NotifyChangedVSInventoryPart();
    //return;    
}

function HandlePickup()
{
    local /*0x97E50000-0x00000000*/ private class Inv[8388609];
    local /*0x97E50000-0x00000000*/ private int iCount[8388609], iIndex;

    0
    UI_WeaponInfoCluster.HandlePickup(Inv, iCount, iIndex);
    // End:0x8A
    if(!ClassIsChildOf(Inv, Class'LPWeaponGrenade'))
    {
        UI_Reticle_Hex.HandlePickup(Inv, iCount);
    }
    //return;    
}

function PostStatusMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InMessageString[8388609];

    UI_WeaponInfoCluster.PostStatusMessage(InMessageString);
    //return;    
}

function ShowHullIntegrity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    //return;    
}

function ShowVSDash()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    //return;    
}

function EnableMPTeamScores()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    // End:0x3D
    if(MPTeamScores != none)
    {
        MPTeamScores.EnableHUDTeamScores(bEnable);
    }
    //return;    
}

function ShowStruggleReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    UI_Reticle_LeechStruggle.TurnOffStruggleDisplayState();
    // End:0xB7
    if(!bShow)
    {
        SetCurrentReticle(((NonStruggleReticle == none) ? UI_Reticle_Hex : NonStruggleReticle));
        UI_Reticle_LeechStruggle.StruggleReticleInRange = -1;
        UI_Reticle_LeechStruggle.StopTargeting();
        TurnOffStruggleDisplayState();
        NonStruggleReticle = none;        
    }
    else
    {
        NonStruggleReticle = CurrentReticle;
        SetCurrentReticle(UI_Reticle_LeechStruggle);
        TurnOffStruggleDisplayState();
    }
    //return;    
}

function TurnOnStruggleDisplayState()
{
    SetCurrentReticle(UI_Reticle_LeechStruggle);
    UI_Reticle_LeechStruggle.TurnOnStruggleDisplayState();
    //return;    
}

function TurnOffStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bResetReticle[9437185];

    UI_Reticle_LeechStruggle.TurnOffStruggleDisplayState();
    // End:0x64
    if(bResetReticle)
    {
        SetCurrentReticle(UI_Reticle_Hex);
        UI_Reticle_LeechStruggle.StruggleReticleInRange = -1;
    }
    //return;    
}

function ScaleformLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

event OnCleanup()
{
    super(GFxMoviePlayer).OnCleanup();
    // End:0x38
    if(LoopingUmbilicalAC != none)
    {
        LoopingUmbilicalAC.Stop();
    }
    //return;    
}

function SetPOFMinimapZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    // End:0x37
    if(UI_Minimap != none)
    {
        UI_Minimap.SetZoom(zoom);
    }
    //return;    
}

function NotifyThermalEnergyChanged()
{
    // End:0x2E
    if(UI_DPadCluster != none)
    {
        UI_DPadCluster.NotifyThermalEnergyChanged();
    }
    //return;    
}

function NotifyPerkInventoryChanged()
{
    // End:0x2E
    if(UI_DPadCluster != none)
    {
        UI_DPadCluster.NotifyPerkInventoryChanged();
    }
    //return;    
}

function NotifyDeploymentModeChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bDeploymentModeActive[8388609];

    // End:0x38
    if(UI_DPadCluster != none)
    {
        UI_DPadCluster.NotifyDeploymentModeChanged(bDeploymentModeActive);
    }
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    UI_Minimap.SetCurrentMapDisplayIndex(Index);
    //return;    
}

function IsRadarShowingEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return UI_Minimap.Minimap.IsShowingEnemies();
    //return ReturnValue;    
}

defaultproperties
{
    bMasterSwitchRadar=true
    bMasterSwitchHUD=true
    bMasterSwitchReticle=true
    bMasterSwitchDPAD=true
    bMasterSwitchWeaponsCluster=true
    // Reference: LPHUDNotifications_MP'Default__LPGFxMoviePlayerHUD.MPNotifier'
    begin object name=MPNotifier class=Class'LPHUDNotifications_MP'
    end object
    MPNotifications=MPNotifier
    // Reference: LPHUDTeamScores'Default__LPGFxMoviePlayerHUD.MPHUDTeamScore'
    begin object name=MPHUDTeamScore class=Class'LPHUDTeamScores'
    end object
    MPTeamScores=MPHUDTeamScore
    MessageSubstitutions=/* Array type was not detected. */
    ImageSubstitutions=/* Array type was not detected. */
    UIElements=/* Array type was not detected. */
    bAllowInput=true
}