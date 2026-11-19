class LPGFxMoviePlayerVSFutureHUD extends LPGFxMoviePlayerVSHUD
    config(UI);

enum EUIElements_VSFuture
{
    EUIElements_VSFutureHUD_VSFutureWeaponCluster,// 0
    EUIElements_VSFutureHUD_HullIntegrity,// 1
    EUIElements_VSFutureHUD_VSFutureDash,// 2
    EUIElements_VSFutureHUD_Minimap,// 3
    EUIElements_VSFutureHUD_MAX     // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_WeaponClusterFutureVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_HullIntegrityFutureVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_DashMeterFutureVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_MinimapFutureVS;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185];

    super.Init(Player);
    UI_WeaponClusterFutureVS = LPGFxUIElementWeaponClusterVSFuture(UIElements[0]);
    UI_WeaponClusterFutureVS.SetActive(true, true);
    UI_HullIntegrityFutureVS = LPGFxUIElementVSFutureHullIntegrity(UIElements[1]);
    UI_HullIntegrityFutureVS.SetActive(true, true);
    UI_DashMeterFutureVS = LPGFxUIElementDashMeterVSFuture(UIElements[2]);
    UI_DashMeterFutureVS.SetActive(false, true);
    //return;    
}

function registerMiniMapView()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string clipName[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609];

    // End:0x9F
    if(clipName == "VSFutureMinimap")
    {
        UI_MinimapFutureVS = new (self) Class'LPGFxUIElementMinimapVSFuture';
        UIElements[3] = UI_MinimapFutureVS;
        UI_MinimapFutureVS.registerMiniMapView(MC, R);
        UI_MinimapFutureVS.SetActive(true, true);
    }
    //return;    
}

function ShowVSDash()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x39
    if(UI_DashMeterFutureVS != none)
    {
        UI_DashMeterFutureVS.SetActive(bShow);
    }
    //return;    
}

function ToggleVSDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bIsInVS[8388609], bFutureVS;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[9437185];

    false
    none
    // End:0x25
    if(!bFutureVS)
    {
        bIsInVS = false;
    }
    // End:0x6D
    if(bFutureVS && UI_WeaponClusterFutureVS != none)
    {
        UI_WeaponClusterFutureVS.SetActive(bIsInVS, true);
    }
    // End:0xB5
    if(bFutureVS && UI_MinimapFutureVS != none)
    {
        UI_MinimapFutureVS.SetActive(bIsInVS, true);
    }
    SetActive(bIsInVS);
    SetPause(!bIsInVS);
    //return;    
}

function ShowHullIntegrity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bRepairing;

    // End:0x39
    if(UI_HullIntegrityFutureVS != none)
    {
        UI_HullIntegrityFutureVS.SetRepairing(bRepairing);
    }
    //return;    
}
