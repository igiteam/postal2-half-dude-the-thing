class LPWeapon extends SPGFWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOverwriteTipPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanUseOnZipline;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanPickUpWhileCrouched;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResumeReloadingAfterInterruption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowLinePatternShooting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TipPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneDataWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataUnloadedWeaponInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CameraShake;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScopeCameraShake;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AnimationContext;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumReloadInterrupts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HUDReticleFiringFunction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PoolManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LinePatternStartPctg;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LinePatternEndPctg;

// Export ULPWeapon::execGetPhysicalFireStartLoc(FFrame&, void* const)
native simulated event GetPhysicalFireStartLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimDir[9437185], ReturnValue;


}

// Export ULPWeapon::execCanUseOffHandIKController(FFrame&, void* const)
native simulated function CanUseOffHandIKController()
{
    local /*0x97E50000-0x00000000*/ private byte UsersAimState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function PlayWeaponChargeUpEffect()
{
    //return;    
}

simulated function StopWeaponChargeUpEffect()
{
    local /*0x97E50000-0x00000000*/ private bool StopSound[9437185];

    true
    //return;    
}

simulated function PlayWeaponFullyChargedEffect()
{
    //return;    
}

simulated function StopWeaponFullyChargedEffect()
{
    //return;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    MyTuneDataWeapon = LPTuneDataBaseWeapon(TuneData);
    CameraShake = MyTuneDataWeapon.CameraShake;
    ScopeCameraShake = MyTuneDataWeapon.CameraShake;
    bCanUseOnZipline = MyTuneDataWeapon.bCanUseOnZipline;
    // End:0x144
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(WorldInfo.NetMode) != int(NM_Client)) && WorldInfo.IsConsoleBuild(2))
    {
        MyTuneDataWeapon.bEjectShellOnWeaponFire = false;
    }
    //return;    
}

simulated function InitUpgrades()
{
    // End:0x0F
    if(IsPreOrderWeapon())
    {
        return;
    }
    super(SPInventoryWeapon).InitUpgrades();
    // End:0x50
    if(IsTimerActive('InitUpgrades') && GetRemainingTimeForTimer('InitUpgrades') > float(0))
    {
        return;
    }
    ConditionalLoadScope();
    //return;    
}

simulated function ConditionalLoadScope()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x92
    if((GetScopeTypeString()) != "None")
    {
        LPPC = GetLPPC();
        // End:0x92
        if((LPPC != none) && LPPC.myLPHUD != none)
        {
            LPPC.myLPHUD.InitScope();
        }
    }
    //return;    
}

simulated function RefreshLoadoutUI()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = GetLPPC();
    // End:0x42
    if(LPPC != none)
    {
        LPPC.RefreshLoadoutUI();
    }
    //return;    
}

function AnnounceAmmoPickup()
{
    local /*0x97E50000-0x00000000*/ private int AmmoCount[8388609], AmmoTypeIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = GetLPPC();
    // End:0x5E
    if(LPPC != none)
    {
        LPPC.ClientAddAmmoMessage(Class, AmmoCount, AmmoTypeIndex);
    }
    //return;    
}

simulated function GetLPPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPC;

    LPPC = LPPlayerController(Instigator.Controller);
    // End:0xA2
    if((LPPC == none) && LPPlayerPawn(Instigator) != none)
    {
        LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
    }
    return LPPC;
    //return ReturnValue;    
}

simulated function AddDefaultAmmoType()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super(SPInventoryWeapon).AddDefaultAmmoType();
    // End:0xEC
    if((((int(WorldInfo.NetMode) == int(NM_Standalone)) && LPPlayerPawn(Instigator) != none) && TuneDataBaseWeapon != none) && TuneDataBaseWeapon.SupportedAmmoTypes.Length > 0)
    {
        LPPC = GetLPPC();
        // End:0xEC
        if(LPPC != none)
        {
            LPPC.AddAmmoToMunitionsLocker(string(TuneDataBaseWeapon.SupportedAmmoTypes[0]), 0, 1);
        }
    }
    //return;    
}

simulated function HasAnyAmmo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3C
    if((self.AmmoLeftForWeapon == 0) && self.AmmoLeftInMagazine == 0)
    {
        return false;
    }
    return super.HasAnyAmmo();
    //return ReturnValue;    
}

simulated function OnOutOfAmmo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x66
    if(Instigator.IsLocallyControlled())
    {
        LPPC = GetLPPC();
        // End:0x66
        if(LPPC != none)
        {
            LPPC.ServerBroadcastChatter(17);
        }
    }
    return super(SPInventoryWeapon).OnOutOfAmmo();
    //return ReturnValue;    
}

simulated function RemoveAllAmmo()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x73 [Loop If]
    if(Idx < AmmoTypes.Length)
    {
        // End:0x65
        if(AmmoTypes[Idx] != none)
        {
            AmmoTypes[Idx].RemoveAmmo();
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    AmmoLeftForWeapon = 0;
    AmmoLeftInMagazine = 0;
    //return;    
}

simulated function EnableUpgrade()
{
    local /*0x97E50000-0x00000000*/ private int InUpgradeIndex[8388609];

    // End:0x0F
    if(IsPreOrderWeapon())
    {
        return;
    }
    super(SPInventoryWeapon).EnableUpgrade(InUpgradeIndex);
    ConditionalLoadScope();
    RefreshLoadoutUI();
    //return;    
}

simulated function IsUpgradeUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InUpgrade[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Instigator != none) && LPTuneDataWeaponUpgrade(InUpgrade).IsUnlocked(Instigator.Controller);
    //return ReturnValue;    
}

simulated function IsAmmoUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609], TDAmmo;
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185], ReturnValue;

    // End:0x7A
    if(bForceMPCheck || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return LPPC.IsUnlockedMP(TDAmmo.UnlockName);        
    }
    else
    {
        return LPPC.IsAmmoTypeStringInMunitionsLocker(string(TDAmmo));
    }
    //return ReturnValue;    
}

simulated function AddUnlockedAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[9437185];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PRI, TDAmmo;

    // End:0x41
    if(Instigator != none)
    {
        PRI = LPPRI(Instigator.PlayerReplicationInfo);
    }
    // End:0xB2
    if(((Instigator == none) || TuneDataBaseWeapon == none) || (int(WorldInfo.NetMode) != int(NM_Standalone)) && PRI == none)
    {
        SetTimer(0.0300000, false, 'AddUnlockedAmmoTypes');
        return;
    }
    // End:0x136
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(WorldInfo.NetMode) != int(NM_Client)) && !Instigator.IsLocallyControlled())
    {
        ClientAddUnlockedAmmoTypes();
    }
    // End:0x176
    if(LPPC == none)
    {
        LPPC = LPPlayerController(Instigator.Controller);
    }
    Idx = 0;
    J0x181:

    // End:0x25A [Loop If]
    if(Idx < TuneDataBaseWeapon.SupportedAmmoTypes.Length)
    {
        TDAmmo = LPTuneDataAmmoDefault(TuneDataBaseWeapon.SupportedAmmoTypes[Idx]);
        // End:0x24C
        if((TDAmmo != none) && IsAmmoUnlocked(LPPC, TDAmmo))
        {
            GiveAmmoTypeViaUnlockedAmmoTypes(TuneDataBaseWeapon.SupportedAmmoTypes[Idx]);
        }
        Idx++;
        // [Loop Continue]
        goto J0x181;
    }
    SwitchToAmmoType(0, true);
    //return;    
}

simulated function GiveAmmoType()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAmmoType[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoInMagazine[9437185], AmmoInPool;
    local /*0x97E50000-0x00000000*/ private bool bFromCheckpoint[9437185], bRefillMagazineFromPool, bAnnounce;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], AmmoTypeIndex;

    -1
    -1            
    AmmoTypeIndex = TuneDataBaseWeapon.SupportedAmmoTypes.Find(InAmmoType);    
    // End:0xAE
    if((AmmoTypeIndex == 0) || !IsPreOrderWeapon())
    {
        return super(SPInventoryWeapon).GiveAmmoType(InAmmoType, AmmoInMagazine, AmmoInPool, bFromCheckpoint, bRefillMagazineFromPool, bAnnounce);
    }
    return 0;
    //return ReturnValue;    
}

simulated function GiveAmmoTypeViaUnlockedAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAmmoType[8388609];

    GiveAmmoType(InAmmoType);
    //return;    
}

reliable client simulated function ClientAddUnlockedAmmoTypes()
{
    AddUnlockedAmmoTypes();
    //return;    
}

reliable client simulated function ClientPerformReload()
{
    local /*0x97E50000-0x00000000*/ private bool bCanGoActive[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoLeft[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    super(SPInventoryWeapon).ClientPerformReload(bCanGoActive, AmmoLeft);
    // End:0xBD
    if(Instigator.IsHumanControlled())
    {
        myLPHUD = LPHUD(PlayerController(Instigator.Controller).myHUD);
        // End:0xBD
        if(myLPHUD != none)
        {
            myLPHUD.NotifyWeaponReload();
        }
    }
    //return;    
}

simulated function TimeWeaponPutDown()
{
    super(SPInventoryWeapon).TimeWeaponPutDown();
    ToggleFlashLight(false);
    //return;    
}

simulated event Destroyed()
{
    super(SPInventoryWeapon).Destroyed();
    ToggleFlashLight(false);
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    //return;    
}

simulated function FireAmmunition()
{
    local /*0x97E50000-0x00000000*/ private float ShakeScale;
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD, LPPC;

    super(SPInventoryWeapon).FireAmmunition();
    LPPC = GetLPPC();
    // End:0x1BB
    if(Instigator.IsLocallyControlled())
    {
        // End:0x139
        if((CameraShake != none) && LPPC != none)
        {
            // End:0xC4
            if((IsScopeActive()) && ScopeCameraShake != none)
            {
                ShakeScale = 1.0000000;
                LPPC.ClientPlayCameraShake(ScopeCameraShake, ShakeScale, false);                
            }
            else
            {
                ShakeScale = ((LPPawn(Instigator).IsAimingDownSight()) ? 1.0000000 : 0.4000000);
                LPPC.ClientPlayCameraShake(CameraShake, ShakeScale, false);
            }
        }
        // End:0x1BB
        if(Instigator.IsHumanControlled())
        {
            myLPHUD = LPHUD(LPPC.myHUD);
            // End:0x1BB
            if(myLPHUD != none)
            {
                myLPHUD.NotifyWeaponFired();
            }
        }
    }
    // End:0x1F2
    if(Instigator != none)
    {
        LPPC.IncrementStat('Stat_NumShotsFired');
    }
    //return;    
}

simulated function ProcessInstantHit()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impact[8388609];
    local /*0x97E50000-0x00000000*/ private int NumHits[9437185];

    // End:0xE3
    if((((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled()) && Instigator.Weapon == self)
    {
        LPHUD(PlayerController(Instigator.Controller).myHUD).NotifyInstantHit(Impact);
    }
    super(SPInventoryWeapon).ProcessInstantHit(FiringMode, Impact, NumHits);
    //return;    
}

function DenyPickupQuery()
{
    local /*0x97E50000-0x00000000*/ private class ItemClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ShouldRefire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(Instigator);
    // End:0x66
    if((LPP != none) && LPP.bIncapacitated)
    {
        ClearPendingFire(int(CurrentFireMode));
        return false;
    }
    return super.ShouldRefire();
    //return ReturnValue;    
}

simulated event AbortReload()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ReloadInterrupted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterruptMove[9437185];

    // End:0x108
    if((((LPSM_PlayerMeleeAttack(InterruptMove) != none) || LPSM_GrenadePrime(InterruptMove) != none) || LPSM_PlayerRollBase(InterruptMove) != none) || LPPawn(Instigator).HasPendingWeapon())
    {
        // End:0xF7
        if(!LPPawn(Instigator).HasPendingWeapon())
        {
            // End:0xF7
            if(MyTuneDataWeapon.bRetryInterruptedManualReload || (AmmoLeftInMagazine == 0) && AmmoLeftForWeapon > 0)
            {
                SetWantsToResumeReloadAfterInterruption();
            }
        }
        StopCustomWeaponAnimation(0.1000000);
        return;
    }
    super(SPInventoryWeapon).ReloadInterrupted();
    //return;    
}

simulated function ResumeInterruptedReload()
{
    // End:0x6D
    if(WantsToResumeReloadAfterInterruption())
    {
        // End:0x63
        if((AmmoLeftInMagazine < (GetMagazineCapacity())) && AmmoLeftForWeapon > 0)
        {
            // End:0x60
            if(CanReload())
            {
                EndFire(CurrentFireMode);
                ForceReload();
            }            
        }
        else
        {
            StopAttemptingToReload();
        }
    }
    //return;    
}

simulated function WantsToResumeReloadAfterInterruption()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bResumeReloadingAfterInterruption;
    //return ReturnValue;    
}

simulated function SetWantsToResumeReloadAfterInterruption()
{
    local /*0x97E50000-0x00000000*/ private bool bWantsToResumeReload[9437185], bAutoReloading;

    true
    false
    // End:0x190
    if(MyTuneDataWeapon != none)
    {
        NumReloadInterrupts = ((bAutoReloading || !bWantsToResumeReload) ? 0 : NumReloadInterrupts + 1);
        bResumeReloadingAfterInterruption = bWantsToResumeReload && (MyTuneDataWeapon.MaxAutoReloadInterrupts < 0) || NumReloadInterrupts <= MyTuneDataWeapon.MaxAutoReloadInterrupts;
        // End:0x17C
        if(bResumeReloadingAfterInterruption)
        {
            SetTimer(MyTuneDataWeapon.AutoReloadAttemptFrequency, true, 'ResumeInterruptedReload');
            // End:0x179
            if(((NumReloadInterrupts == 0) && MyTuneDataWeapon.MaxAutoReloadTime > float(0)) && !(AmmoLeftInMagazine == 0) && AmmoLeftForWeapon > 0)
            {
                SetTimer(MyTuneDataWeapon.MaxAutoReloadTime, false, 'StopAttemptingToReload');
            }            
        }
        else
        {
            ClearTimer('ResumeInterruptedReload');
        }
    }
    //return;    
}

simulated function StopAttemptingToReload()
{
    SetWantsToResumeReloadAfterInterruption(false);
    //return;    
}

simulated function PlayFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185], PRI;

    // End:0x89
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        PRI = LPPRI(Instigator.PlayerReplicationInfo);
        // End:0x89
        if(PRI != none)
        {
            PRI.NoteWeaponDischargeTime();
        }
    }
    LPPawn(Instigator).StartAdditiveFireAnimation();
    super(SPInventoryWeapon).PlayFireEffects(FireModeNum, HitLocation);
    //return;    
}

simulated function GetPoolManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x7D
    if(PoolManager == none)
    {
        PoolManager = SPMapInfo(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo(true)).ProjectilePool;
        // End:0x7D
        if(PoolManager == none)
        {
        }
    }
    return PoolManager;
    //return ReturnValue;    
}

simulated function FireRecycledProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL Proj[8388609], SpawnLocation, SpawnRotation, AimDir;

    AimDir = Vector(SpawnRotation);
    Proj.ActivateFromPool(Instigator, self, SpawnLocation, SpawnRotation, SpawnLocation + AimDir, SpawnLocation + AimDir);
    Proj.Velocity = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileVelocity * AimDir;
    Proj.GravityZ = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileGravity;
    //return;    
}

simulated function HasCameraModeOverride()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPInventoryWeapon).HasCameraModeOverride() || LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeCameraParams != none;
    //return ReturnValue;    
}

simulated function GetScopeTypeString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScopeTypeString;

    // End:0xF0
    if(Upgrades.Length > 0)
    {
        Idx = 0;
        J0x1B:

        // End:0xF0 [Loop If]
        if(Idx < Upgrades.Length)
        {
            // End:0x62
            if(!Upgrades[Idx].bEnabled)
            {                
            }
            else
            {
                ScopeTypeString = LPTuneDataWeaponUpgrade(TuneDataBaseWeapon.SupportedUpgrades[Idx]).ScopeTypeString;
                // End:0xE2
                if((ScopeTypeString != "None") && ScopeTypeString != "")
                {
                    return ScopeTypeString;
                }
            }
            Idx++;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    ScopeTypeString = LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeTypeString;
    // End:0x151
    if((ScopeTypeString != "None") && ScopeTypeString != "")
    {
        return ScopeTypeString;
    }
    return "None";
    //return ReturnValue;    
}

simulated event IsScopeActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPInventoryWeapon).IsScopeActive() || (UsesScopeInADS()) && int(ZoomLevel) > int(0);
    //return ReturnValue;    
}

simulated function UsesScopeInADS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPTuneDataBaseWeapon(TuneDataBaseWeapon).bUseScopeInADS;
    //return ReturnValue;    
}

simulated function LogCamParams()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL LogParams;

    LogParams = SPCameraModeAimControlWeaponShoulderParam(TuneDataBaseWeapon.GetADSCameraParamOverride());
    // End:0x41
    if(LogParams != none)
    {
    }
    // End:0x117
    if(Upgrades.Length > 0)
    {
        Idx = 0;
        J0x5C:

        // End:0x117 [Loop If]
        if(Idx < Upgrades.Length)
        {
            // End:0x109
            if(TuneDataBaseWeapon.SupportedUpgrades[Idx].GetADSCameraParamOverride() != none)
            {
                LogParams = SPCameraModeAimControlWeaponShoulderParam(TuneDataBaseWeapon.SupportedUpgrades[Idx].GetADSCameraParamOverride());
            }
            Idx++;
            // [Loop Continue]
            goto J0x5C;
        }
    }
    // End:0x175
    if(LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeCameraParams != none)
    {
        LogParams = LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeCameraParams;
    }
    //return;    
}

simulated event GetADSCameraParamOverride()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x165
    if(int(ZoomLevel) == int(2))
    {
        // End:0x110
        if(Upgrades.Length > 0)
        {
            Idx = 0;
            J0x2F:

            // End:0x110 [Loop If]
            if(Idx < Upgrades.Length)
            {
                // End:0x76
                if(!Upgrades[Idx].bEnabled)
                {                    
                }
                else
                {
                    // End:0x102
                    if(TuneDataBaseWeapon.SupportedUpgrades[Idx].GetADSCameraParamOverride() != none)
                    {
                        return SPCameraModeAimControlWeaponShoulderParam(TuneDataBaseWeapon.SupportedUpgrades[Idx].GetADSCameraParamOverride());
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x2F;
            }
        }
        // End:0x165
        if(LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeCameraParams != none)
        {
            return LPTuneDataBaseWeapon(TuneDataBaseWeapon).ScopeCameraParams;
        }
    }
    return SPCameraModeAimControlWeaponShoulderParam(TuneDataBaseWeapon.GetADSCameraParamOverride());
    //return ReturnValue;    
}

simulated function PutDownWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, GrenadePrime, GrenadeThrow;

    LPP = LPPlayerPawn(Instigator);
    // End:0xEE
    if(LPP != none)
    {
        GrenadePrime = LPSM_GrenadePrime(LPP.GetCurrentSpecialMoveInstance());
        // End:0x8E
        if(GrenadePrime != none)
        {
            GrenadePrime.AbortGrenade();            
        }
        else
        {
            GrenadeThrow = LPSM_GrenadeThrow(LPP.GetCurrentSpecialMoveInstance());
            // End:0xEE
            if(GrenadeThrow != none)
            {
                GrenadeThrow.AbortGrenade();
            }
        }
    }
    StopAttemptingToReload();
    super(SPInventoryWeapon).PutDownWeapon();
    //return;    
}

simulated function ResetOverwriteTipPosition()
{
    bOverwriteTipPosition = false;
    //return;    
}

simulated function OverwriteTipPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPosition[8388609];

    bOverwriteTipPosition = true;
    TipPosition = InPosition;
    LPAIPawnStalker(Owner).WeaponStartTraceLocationCache.bUpToDate = false;
    //return;    
}

static simulated function PassThroughDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4A
    if(HitActor.IsA('LPWaypointMarker') || HitActor.IsA('LPBreadcrumb'))
    {
        return true;
    }
    return super(Weapon).PassThroughDamage(HitActor);
    //return ReturnValue;    
}

simulated function CanSwitchWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !HasAnyAmmo() || !IsFiring() && !IsCharging();
    //return ReturnValue;    
}

simulated function CanSwitchAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function HasBeenActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[8388609];

    super(Weapon).ClientGivenTo(NewOwner, bDoNotActivate);
    DeferredRefreshLoadoutUI();
    ConditionalLoadScope();
    //return;    
}

simulated function DeferredRefreshLoadoutUI()
{
    // End:0x86
    if(Instigator.IsLocallyControlled())
    {
        // End:0x73
        if(Instigator.InvManager.FindInventoryType(Class) != none)
        {
            RefreshLoadoutUI();            
        }
        else
        {
            SetTimer(0.0300000, false, 'DeferredRefreshLoadoutUI');
        }
    }
    //return;    
}

simulated function IsPreOrderWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsPreOrderWeaponClass(Class);
    //return ReturnValue;    
}

static function IsPreOrderWeaponClass()
{
    local /*0x97E50000-0x00000000*/ private class WeaponClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1F
    if(InStr(string(WeaponClass), "DLCPO") >= 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function ShouldCheckNearMisses()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function SetupWeaponFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super.SetupWeaponFire(FireModeNum);
    // End:0x6F
    if(bAllowLinePatternShooting)
    {
        LinePatternStartPctg = FRand();
        // End:0x55
        if(LinePatternStartPctg > 0.5000000)
        {
            LinePatternEndPctg = FRand() / 2.0000000;            
        }
        else
        {
            LinePatternEndPctg = (FRand() / 2.0000000) + 0.5000000;
        }
    }
    //return;    
}

function GetLinePatternPctg()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LinePatternPctg;
    local /*0x97E50000-0x00000000*/ private float PitchPctg, YawPctg;

    PitchPctg = 1.0000000 - (float(RemainingBurstFireCount) / float(StartBurstFireCount));
    YawPctg = LinePatternStartPctg + ((LinePatternEndPctg - LinePatternStartPctg) * YawPctg);
    LinePatternPctg.X = PitchPctg;
    LinePatternPctg.Y = YawPctg;
    return LinePatternPctg;
    //return ReturnValue;    
}

auto state Inactive
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        StopAttemptingToReload();
        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated function HasBeenActivated()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state PendingClientWeaponSet
{
    simulated function HasBeenActivated()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

simulated state Reloading
{
    ignores ResumeInterruptedReload;

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x3B
        if((AmmoLeftInMagazine == (GetMagazineCapacity())) || AmmoLeftInMagazine == AmmoLeftForWeapon)
        {
            StopAttemptingToReload();
        }
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bCanPickUpWhileCrouched=true
    HUDReticleFiringFunction="ShotgunAttack"
    bDoClientSideInstantHitAngleCheck=false
    bDestroyEmptyWeaponWhenTossed=false
    // Reference: StaticMeshComponent'Default__LPWeapon.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeapon.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    ClientSideHitLeeway=2.5000000
    HUDReticleName="assaultRifle"
    FireInterval=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    WeaponRange=22000.0000000
    // Reference: SkeletalMeshComponent'Default__LPWeapon.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    DroppedPickupClass=Class'LPDroppedPickupWeapon'
    // Reference: StaticMeshComponent'Default__LPWeapon.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    NetUpdateFrequency=10.0000000
}