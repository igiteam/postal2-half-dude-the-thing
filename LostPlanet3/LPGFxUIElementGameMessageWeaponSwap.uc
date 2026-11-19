class LPGFxUIElementGameMessageWeaponSwap extends LPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UILoaderMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStatusInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldShowWeaponIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultIconOffSetXScreenWidthPct;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultWeaponIconOffSetXScreenWidthPct;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], containerObj, DI, ScreenPos, HUD;

    local /*0x97E50000-0x00000000*/ private float weaponOffsetX;
    local /*0x97E50000-0x00000000*/ private @NULL SPMPHUD, UILoaderContainerMC;

    super(SPGFxUIElementGameMessage).Init(MP);
    SPMPHUD = SPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x24E
    if(SPMPHUD != none)
    {
        containerObj = SPMPHUD.GetGameMessageUIElementContainerPanel();
        // End:0xE2
        if(bShouldShowWeaponIcon)
        {
            UILoaderContainerMC = containerObj.GetObject("myUILoader");
            UILoaderMC = UILoaderContainerMC.GetObject("UILoaderClip");
        }
        ScreenPos = GetScreenPosition(DefaultOffSetXScreenWidthPct, DefaultOffSetYScreenHeightPct);
        HUD = GetLPPC().myHUD;
        // End:0x173
        if(HUD != none)
        {
            weaponOffsetX = HUD.SizeX * DefaultWeaponIconOffSetXScreenWidthPct;
        }
        // End:0x24E
        if(bShouldShowWeaponIcon)
        {
            DI = UILoaderContainerMC.GetDisplayInfo();
            DI.X = ScreenPos.X + weaponOffsetX;
            DI.Y = ScreenPos.Y;
            UILoaderContainerMC.SetDisplayInfo(DI);
        }
    }
    //return;    
}

function LoadWeaponIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private class SPInvClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponIconName;

    // End:0x11
    if(!bShouldShowWeaponIcon)
    {
        return;
    }
    LPP = LPPlayerPawn(GetLPPC().Pawn);
    // End:0x13E
    if(LPP != none)
    {
        SPInvClass = class<SPInventoryWeapon>(LPP.InventoryWeaponPickupNotification.ItemClass);
        // End:0xEC
        if(SPInvClass != none)
        {
            WeaponIconName = MoviePlayer.GetUILoaderPathForTexture(SPInvClass.default.HUDIconTexture);
        }
        // End:0x13E
        if((WeaponIconName != "") && UILoaderMC != none)
        {
            UILoaderMC.SetString("source", WeaponIconName);
        }
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x5A
    if(bShouldBeActive)
    {
        // End:0x5A
        if(!bUseStatusInitialized)
        {
            InitButtonPrompt();
            LoadWeaponIcon();
            bUseStatusInitialized = true;
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    // End:0x3F
    if(bShouldShowWeaponIcon)
    {
        UILoaderMC.ActionScriptVoid("unload");
        UILoaderMC = none;
    }
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    bShouldShowWeaponIcon=true
    DefaultIconOffSetXScreenWidthPct=0.1000000
    useStatusModeFrameName="normal"
    DefaultOffSetYScreenHeightPct=0.1000000
}