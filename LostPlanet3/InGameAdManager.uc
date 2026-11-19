class InGameAdManager extends PlatformInterfaceBase
    transient;

enum EAdManagerDelegate
{
    AMD_ClickedBanner,              // 0
    AMD_UserClosedAd,               // 1
    AMD_MAX                         // 2
};

var(*) /*0x35EA0000-0x00000000*/ private bool bShouldPauseWhileAdOpen;

// Export UInGameAdManager::execInit(FFrame&, void* const)
native event Init();

// Export UInGameAdManager::execShowBanner(FFrame&, void* const)
native function ShowBanner()
{
    local /*0x35EA0000-0x00000000*/ private bool bShowBottomOfScreen[8388609];


}

// Export UInGameAdManager::execHideBanner(FFrame&, void* const)
native function HideBanner();

// Export UInGameAdManager::execForceCloseAd(FFrame&, void* const)
native function ForceCloseAd();

function SetPauseWhileAdOpen()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldPause[8388609];

    bShouldPauseWhileAdOpen = bShouldPause;
    //return;    
}

defaultproperties
{
    bShouldPauseWhileAdOpen=true
}