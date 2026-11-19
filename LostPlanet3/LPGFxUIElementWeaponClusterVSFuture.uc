class LPGFxUIElementWeaponClusterVSFuture extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightReloading;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLeftReloading;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RightReloadBeginTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RightReloadDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LeftReloadBeginTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LeftReloadDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL currentVS;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x53
    if(MoviePlayer != none)
    {
        WeaponMC = MoviePlayer.GetVariableObject("_root");
    }
    bRightReloading = false;
    bLeftReloading = false;
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPP;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL W;
    local /*0x97E50000-0x00000000*/ private bool bInitWeaponIcons;

    LPPC = GetLPPC();
    // End:0x4D9
    if(LPPC.bIsInVitalSuit)
    {
        LPP = LPVSFuturePlayerPawn(LPPC.Pawn);
        // End:0x4D9
        if(LPP != none)
        {
            // End:0xAC
            if(currentVS != LPP)
            {
                bInitWeaponIcons = true;
                currentVS = LPP;
            }
            I = 0;
            J0xB7:

            // End:0x4D9 [Loop If]
            if(I < LPP.VSWeapons.Length)
            {
                W = LPP.VSWeapons[I];
                // End:0x2F2
                if(int(W.WeaponSlotID) == int(0))
                {
                    // End:0x174
                    if(bInitWeaponIcons)
                    {
                        SetRightIconType(W.HUDIconName);
                    }
                    // End:0x26E
                    if(W.IsReloading())
                    {
                        // End:0x20C
                        if(bRightReloading == false)
                        {
                            RightReloadDuration = W.GetReloadAnimDuration();
                            RightReloadBeginTime = W.WorldInfo.TimeSeconds;
                        }
                        SetRightAmmoPercent((W.WorldInfo.TimeSeconds - RightReloadBeginTime) / RightReloadDuration);
                        bRightReloading = true;                        
                    }
                    else
                    {
                        bRightReloading = false;
                        SetRightAmmoPercent(float(W.AmmoLeftInMagazine) / float(W.GetMagazineCapacity()));
                    }
                    SetRightAmmoText(W.AmmoLeftInMagazine);                    
                }
                else
                {
                    // End:0x4CB
                    if(int(W.WeaponSlotID) == int(1))
                    {
                        // End:0x350
                        if(bInitWeaponIcons)
                        {
                            SetLeftIconType(W.HUDIconName);
                        }
                        // End:0x44A
                        if(W.IsReloading())
                        {
                            // End:0x3E8
                            if(bLeftReloading == false)
                            {
                                LeftReloadDuration = W.GetReloadAnimDuration();
                                LeftReloadBeginTime = W.WorldInfo.TimeSeconds;
                            }
                            SetLeftAmmoPercent((W.WorldInfo.TimeSeconds - LeftReloadBeginTime) / LeftReloadDuration);
                            bLeftReloading = true;                            
                        }
                        else
                        {
                            bLeftReloading = false;
                            SetLeftAmmoPercent(float(W.AmmoLeftInMagazine) / float(W.GetMagazineCapacity()));
                        }
                        SetLeftAmmoText(W.AmmoLeftInMagazine);
                    }
                }
                I++;
                // [Loop Continue]
                goto J0xB7;
            }
        }
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function SetRightIconType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string IconName[8388609];

    // End:0x40
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetRightIconType");
    }
    //return;    
}

function SetLeftIconType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string IconName[8388609];

    // End:0x3F
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetLeftIconType");
    }
    //return;    
}

function ReloadLeft()
{
    // End:0x3A
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("ReloadLeft");
    }
    //return;    
}

function ReloadRight()
{
    // End:0x3B
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("ReloadRight");
    }
    //return;    
}

function SetLeftAmmoPercent()
{
    local /*0x97E50000-0x00000000*/ private float AmmoPercent[8388609];

    // End:0x42
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetLeftAmmoPercent");
    }
    //return;    
}

function SetRightAmmoPercent()
{
    local /*0x97E50000-0x00000000*/ private float AmmoPercent[8388609];

    // End:0x43
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetRightAmmoPercent");
    }
    //return;    
}

function SetLeftAmmoText()
{
    local /*0x97E50000-0x00000000*/ private int numAmmo[8388609];

    // End:0x3F
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetLeftAmmoText");
    }
    //return;    
}

function SetRightAmmoText()
{
    local /*0x97E50000-0x00000000*/ private int numAmmo[8388609];

    // End:0x40
    if(WeaponMC != none)
    {
        WeaponMC.ActionScriptVoid("SetRightAmmoText");
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(WeaponMC != none)
    {
        DI = WeaponMC.GetDisplayInfo();
        DI.Visible = bShow;
        WeaponMC.SetDisplayInfo(DI);
    }
    //return;    
}
