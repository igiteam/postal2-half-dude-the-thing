class LPGFxUIElementReticle_Hex extends LPGFxUIElementReticle
    config(UI);

enum CrosshairRequestState
{
    eCrosshairRequestState_None,    // 0
    eCrosshairRequestState_ON,      // 1
    eCrosshairRequestState_OFF,     // 2
    eCrosshairRequestState_MAX      // 3
};

enum CrosshairAmmoMode
{
    eCrosshairAmmoMode_Primary,     // 0
    eCrosshairAmmoMode_Secondary,   // 1
    eCrosshairAmmoMode_Custom,      // 2
    eCrosshairAmmoMode_MAX          // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReticuleMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrosshairMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReticleAmmoCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AmmoClip;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TotalAmmo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyHitMarkerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ShowEnemyHitMarkerTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ShowEnemyHitMarkerDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentReticleName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LastReticleName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentReticleFireFunction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastAccuracyPercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CachedAmmoPercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CachedCurrentAmmo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastShowAmmoCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseCustomAmmoMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ReticleAmmoMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte RequestShow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondaryAmmoCounterColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CustomAmmoCounterAddColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedAmmoCounterAddColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CustomAmmoCounterMultiplyColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedAmmoCounterMultiplyColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReticleFadeRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReticleAlpha;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultReticleFadeTime;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], DI;

    super.Init(MP);
    // End:0x386
    if((MoviePlayer != none) && MoviePlayer.GetPC() != none)
    {
        ReticleRoot = "_root.stagePanel.panel_reticle";
        ReticuleMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle");
        AimHalfWidth = ReticuleMC.GetFloat("_width") / float(2);
        AimHalfHeight = ReticuleMC.GetFloat("_height") / float(2);
        CrosshairMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.reticle");
        EnemyHitMarkerMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.hitXReticleB");
        ShowEnemyHitMarker(false);
        LastAccuracyPercent = -1.0000000;
        UpdateCrosshairSpread(LastAccuracyPercent);
        LastReticleName = "none";
        ReticleAmmoCluster = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay");
        DI = ReticleAmmoCluster.GetDisplayInfo();
        DI.Visible = false;
        ReticleAmmoCluster.SetDisplayInfo(DI);
        bLastShowAmmoCluster = true;
        ShowAmmoCluster(bLastShowAmmoCluster);
        AmmoClip = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.clipAnimation");
        TotalAmmo = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.totalAmmo");
        SetClipMaxAmmo(100);
    }
    RequestShow = 0;
    //return;    
}

function NotifyShoulderAimCameraActive()
{
    //return;    
}

function NotifyShoulderAimCameraInactive()
{
    //return;    
}

// Export ULPGFxUIElementReticle_Hex::execReticleHexNativeUpdate(FFrame&, void* const)
native function ReticleHexNativeUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super.Update(DeltaTime);
    // End:0x3E
    if(bShouldBeActive)
    {
        ReticleHexNativeUpdate(DeltaTime);
    }
    // End:0x6E
    if(int(RequestShow) != int(0))
    {
        Show(int(RequestShow) == int(1));
    }
    TickEnemyHitMarker();
    return bShouldBeActive;
    //return ReturnValue;    
}

function RefreshReticleType()
{
    CurrentReticleName = "";
    //return;    
}

event RefreshHUDAmmoCount()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, W, DI;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x1E3
    if(LPMPHUD != none)
    {
        W = LPMPHUD.GetCurrentWeapon();
        // End:0x1E3
        if(W != none)
        {
            DI = ReticleAmmoCluster.GetDisplayInfo();
            // End:0xF5
            if(!DI.Visible)
            {
                DI.Visible = true;
                ReticleAmmoCluster.SetDisplayInfo(DI);
            }
            SetTotalAmmoPercent(W.GetWeaponAmmoFillPercent() * 0.0100000);
            SetClipCurrentAmmo(int(W.GetMagazineFillPercent()));
            // End:0x16C
            if(bUseCustomAmmoMode)
            {
                SetReticleAmmoMode(2);                
            }
            else
            {
                // End:0x1D8
                if((W.AmmoTypeInfo.CurrentAmmoMode == 1) && W.HUDReticleName_SecondaryAmmomode != "")
                {
                    SetReticleAmmoMode(1);                    
                }
                else
                {
                    SetReticleAmmoMode(0);
                }
            }
        }
    }
    //return;    
}

// Export ULPGFxUIElementReticle_Hex::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[8388609], PosY;


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI, W, LPMPHUD;

    RequestShow = ((bShow) ? 1 : 2);
    // End:0x3F
    if(bShow && CurrentReticleName == "")
    {
        return;
    }
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x93
    if(LPMPHUD != none)
    {
        W = LPMPHUD.GetCurrentWeapon();
    }
    // End:0x249
    if((bShow && W != none) || !bShow)
    {
        // End:0x228
        if(bImmediate || !IsActive())
        {
            DI = ReticuleMC.GetDisplayInfo();
            DI.Visible = bShow;
            DI.Alpha = 100.0000000;
            ReticuleMC.SetDisplayInfo(DI);
            DI = ReticleAmmoCluster.GetDisplayInfo();
            DI.Visible = bShow;
            DI.Alpha = 100.0000000;
            ReticleAmmoCluster.SetDisplayInfo(DI);
            ReticleFadeRate = 0.0000000;            
        }
        else
        {
            Fade(bShow);
        }
        RequestShow = 0;
    }
    //return;    
}

// Export ULPGFxUIElementReticle_Hex::execShowAmmoCluster(FFrame&, void* const)
native function ShowAmmoCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];


}

function Fade()
{
    local /*0x97E50000-0x00000000*/ private bool bFadeIn[8388609];
    local /*0x97E50000-0x00000000*/ private float FadeTime[9437185];

    -1.0000000
    FadeTime = ((FadeTime <= float(0)) ? DefaultReticleFadeTime : FadeTime);
    ReticleFadeRate = (((bFadeIn) ? 1.0000000 : -1.0000000) * 100.0000000) / FadeTime;
    //return;    
}

event UpdateCrosshairType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDReticleName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, W, LPW;

    // End:0x163
    if(HUDReticleName != CurrentReticleName)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        W = LPMPHUD.GetCurrentWeapon();
        // End:0x6D
        if(W == none)
        {
            return;
        }
        MoviePlayer.ActionScriptVoid("setReticleType");
        // End:0xC2
        if(LPMPHUD != none)
        {
            SetCustomAmmoMode(false);
            RefreshHUDAmmoCount();
        }
        LPW = LPWeapon(W);
        CurrentReticleName = HUDReticleName;
        CurrentReticleFireFunction = ((LPW == none) ? default.CurrentReticleFireFunction : LPW.HUDReticleFiringFunction);
        // End:0x163
        if(int(RequestShow) != int(0))
        {
            Show(int(RequestShow) == int(1));
        }
    }
    //return;    
}

event UpdateCrosshairSpread()
{
    local /*0x97E50000-0x00000000*/ private float spreadValue[8388609];

    MoviePlayer.ActionScriptVoid("setReticleSpread");
    //return;    
}

function NotifyWeaponFired()
{
    MoviePlayer.ActionScriptVoid(CurrentReticleFireFunction);
    //return;    
}

// Export ULPGFxUIElementReticle_Hex::execTickEnemyHitMarker(FFrame&, void* const)
native function TickEnemyHitMarker();

// Export ULPGFxUIElementReticle_Hex::execShowEnemyHitMarker(FFrame&, void* const)
native function ShowEnemyHitMarker()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];


}

function HandlePickup()
{
    local /*0x97E50000-0x00000000*/ private class Inv[8388609];
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    // End:0x19
    if(ReticuleMC != none)
    {
        GoToPickup();
    }
    //return;    
}

function SetWeaponReticleMode()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewReticleMode[8388609];

    //return;    
}

function SetHalberdChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    MoviePlayer.ActionScriptVoid("HalberdChargeAmount");
    //return;    
}

function SetCrossbowChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    MoviePlayer.ActionScriptVoid("CrossbowChargeAmount");
    //return;    
}

function InitAmmoClip()
{
    AmmoClip = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.clipAnimation");
    //return;    
}

function SetClipFull()
{
    // End:0x19
    if(AmmoClip == none)
    {
        InitAmmoClip();
    }
    // End:0x58
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetClipFullAmmo");
    }
    //return;    
}

function SetClipMaxAmmo()
{
    local /*0x97E50000-0x00000000*/ private int MaxAmmo[8388609];

    // End:0x19
    if(AmmoClip == none)
    {
        InitAmmoClip();
    }
    // End:0x57
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetClipMaxAmmo");
    }
    //return;    
}

function SetClipCurrentAmmo()
{
    local /*0x97E50000-0x00000000*/ private int CurrentAmmo[8388609];

    // End:0x19
    if(CachedCurrentAmmo == CurrentAmmo)
    {
        return;
    }
    CachedCurrentAmmo = CurrentAmmo;
    // End:0x45
    if(AmmoClip == none)
    {
        InitAmmoClip();
    }
    // End:0x87
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetClipCurrentAmmo");
    }
    //return;    
}

function SetTotalAmmoPercent()
{
    local /*0x97E50000-0x00000000*/ private float AmmoPercent[8388609];

    // End:0x19
    if(AmmoPercent == CachedAmmoPercent)
    {
        return;
    }
    CachedAmmoPercent = AmmoPercent;
    // End:0x90
    if(TotalAmmo == none)
    {
        TotalAmmo = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.totalAmmo");
    }
    // End:0xD3
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetTotalAmmoPercent");
    }
    //return;    
}

function SetClipDepletionPercent()
{
    local /*0x97E50000-0x00000000*/ private float clipPercent[8388609];

    // End:0x68
    if(AmmoClip == none)
    {
        AmmoClip = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.clipAnimation");
    }
    MoviePlayer.ActionScriptVoid("SetClipDepletionPercent");
    //return;    
}

function SetClipReloadPercent()
{
    local /*0x97E50000-0x00000000*/ private float clipPercent[8388609];

    // End:0x68
    if(AmmoClip == none)
    {
        AmmoClip = MoviePlayer.GetVariableObject(ReticleRoot $ ".reticle.ammoDisplay.clipAnimation");
    }
    MoviePlayer.ActionScriptVoid("SetClipReloadPercent");
    //return;    
}

function GoToPickup()
{
    ReticuleMC.ActionScriptVoid("GoToPickup");
    //return;    
}

function SetCustomAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private bool bUseCustomMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CustomAddColor[9437185], CustomMultiplyColor;

    // End:0x7C
    if(bUseCustomMode || bUseCustomAmmoMode != bUseCustomMode)
    {
        // End:0x5D
        if(bUseCustomMode)
        {
            CustomAmmoCounterAddColor = CustomAddColor;
            CustomAmmoCounterMultiplyColor = CustomMultiplyColor;
        }
        bUseCustomAmmoMode = bUseCustomMode;
        RefreshHUDAmmoCount();
    }
    //return;    
}

// Export ULPGFxUIElementReticle_Hex::execSetReticleAmmoMode(FFrame&, void* const)
native function SetReticleAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private int NewAmmoMode[8388609];


}

event SetColor()
{
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;
    local /*0x97E50000-0x00000000*/ private @NULL cxform;

    // End:0xD3
    if(((R == 0) && G == 0) && B == 0)
    {
        cxform.Multiply.R = 1.0000000;
        cxform.Multiply.G = 1.0000000;
        cxform.Multiply.B = 1.0000000;        
    }
    else
    {
        cxform.Multiply.R = 0.0000000;
        cxform.Multiply.G = 0.0000000;
        cxform.Multiply.B = 0.0000000;
    }
    cxform.Add.R = float(R);
    cxform.Add.G = float(G);
    cxform.Add.B = float(B);
    CrosshairMC.SetColorTransform(cxform);
    //return;    
}

defaultproperties
{
    ShowEnemyHitMarkerDuration=0.5000000
    CurrentReticleFireFunction="ShotgunAttack"
    CachedAmmoPercent=-1.0000000
    CachedCurrentAmmo=-1
    SecondaryAmmoCounterColor=(R=214,G=222,B=35,A=255)
    CustomAmmoCounterMultiplyColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    CachedAmmoCounterMultiplyColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    DefaultReticleFadeTime=0.1000000
}