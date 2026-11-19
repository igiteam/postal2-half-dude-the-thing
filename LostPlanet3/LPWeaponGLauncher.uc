class LPWeaponGLauncher extends LPWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreviewArcActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowDetonation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFireEnded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeProjectile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FireStartTime;

simulated function GetAdjustedAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], ReturnValue, LPPP;

    // End:0x9C
    if(Instigator != none)
    {
        LPPP = LPPlayerPawn(Instigator);
        // End:0x88
        if((LPPP != none) && LPPP.IsAimingDownSight())
        {
            return Instigator.GetAdjustedAimFor(self, StartFireLoc);
        }
        return super(SPInventoryWeapon).GetAdjustedAim(StartFireLoc);
    }
    return rot(0, 0, 0);
    //return ReturnValue;    
}

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, SpawnedProjectile;

    SpawnedProjectile = SPInventoryProjectile(Spawn(GetProjectileClass(), self,, SpawnLoc));
    // End:0x150
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        AimDir *= 0.0100000;
        SpawnedProjectile.Init(AimDir);
        SpawnedProjectile.Velocity = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileVelocity * AimDir;
        GrenadeProjectile = LPProj_GLauncherGrenade(SpawnedProjectile);
        SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    }
    //return;    
}

static function GetDefaultDamageStat()
{
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class GrenadeProjectileClass;

    false
    // End:0x106
    if(bForceMPCheck || int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        // End:0x103
        if(default.TuneDataBaseWeapon_MP != none)
        {
            GrenadeProjectileClass = class<LPProj_GLauncherGrenade>(default.TuneDataBaseWeapon_MP.SupportedAmmoTypes[0].ProjectileClass);
            // End:0x103
            if(GrenadeProjectileClass != none)
            {
                return GrenadeProjectileClass.default.GrenadeTuneData_MP.ExplosionTemplate.Damage;
            }
        }        
    }
    else
    {
        // End:0x1B5
        if(default.TuneDataBaseWeapon != none)
        {
            GrenadeProjectileClass = class<LPProj_GLauncherGrenade>(default.TuneDataBaseWeapon.SupportedAmmoTypes[0].ProjectileClass);
            // End:0x1B5
            if(GrenadeProjectileClass != none)
            {
                return GrenadeProjectileClass.default.GrenadeTuneData.ExplosionTemplate.Damage;
            }
        }
    }
    return super(SPInventoryWeapon).GetDefaultDamageStat(bForceMPCheck);
    //return ReturnValue;    
}

simulated function ShouldDrawProjectilePreviewComponent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPP;

    LPPP = LPPlayerPawn(Instigator);
    return ((((((LPPP != none) && Upgrades.Length > 0) && Upgrades[0].bEnabled) && IsInState('Active')) && LPPP.CanFireWeapon()) && !LPPP.IsDoingASpecialMove()) && LPPP.IsAimingDownSight();
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPInventoryWeapon).Tick(DeltaTime);
    // End:0xD3
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && PreviewComponent != none)
    {
        // End:0x9B
        if(ShouldDrawProjectilePreviewComponent())
        {
            PreviewComponent.UpdatePreview(DeltaTime);
            bPreviewArcActive = true;            
        }
        else
        {
            // End:0xD3
            if(bPreviewArcActive)
            {
                PreviewComponent.StopPreview();
                bPreviewArcActive = false;
            }
        }
    }
    //return;    
}

simulated state WeaponFiringSingle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(WeaponFiring).BeginState(PreviousStateName);
        bAllowDetonation = true;
        bFireEnded = false;
        FireStartTime = WorldInfo.TimeSeconds;
        SetPendingFire(0);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        global.Tick(DeltaTime);
        LPP = LPPlayerPawn(Instigator);
        // End:0xCC
        if(LPP.IsInState('PlayerGrappling') && LPZiplinePoint_Base(LPP.GrappleActor) != none)
        {
            LPPlayerPawn(Instigator).bPendingFire = false;
            ClearPendingFire(int(CurrentFireMode));
            HandleFinishedFiring();
        }
        //return;        
    }

    simulated function RefireCheckTimer()
    {
        // End:0x19
        if(bWeaponPutDown)
        {
            PutDownWeapon();
            return;
        }
        // End:0x3B
        if((StillFiring(0)) && !bFireEnded)
        {
            return;
        }
        HandleFinishedFiring();
        //return;        
    }

    simulated function BeginFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x31
        if(int(FireModeNum) != int(CurrentFireMode))
        {
            super.BeginFire(FireModeNum);            
        }
        else
        {
            bAllowDetonation = false;
        }
        //return;        
    }

    simulated function EndFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
        local /*0x97E50000-0x00000000*/ private float ElapsedFireTime;

        ElapsedFireTime = WorldInfo.TimeSeconds - FireStartTime;
        ClearPendingFire(0);
        // End:0x148
        if(((!bFireEnded && bAllowDetonation) && ElapsedFireTime > 0.2500000) && int(WorldInfo.NetMode) != int(NM_Client))
        {
            // End:0xFB
            if((GrenadeProjectile != none) && !GrenadeProjectile.bExploded)
            {
                GrenadeProjectile.DoExplosion();
                GrenadeProjectile = none;
            }
            // End:0x121
            if(ElapsedFireTime >= FireInterval[0])
            {
                HandleFinishedFiring();                
            }
            else
            {
                SetTimer(FireInterval[0] - ElapsedFireTime, false, 'RefireCheckTimer');
            }            
        }
        else
        {
            SetTimer(FireInterval[0] - ElapsedFireTime, false, 'RefireCheckTimer');
            super(SPInventoryWeapon).EndFire(FireModeNum);
        }
        bFireEnded = true;
        //return;        
    }

    simulated function ShouldRefire()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function IsCharging()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(WeaponFiring).EndState(NextStateName);
        GrenadeProjectile = none;
        //return;        
    }
    stop;    
}

defaultproperties
{
    HUDReticleFiringFunction="GrenadeLauncherAttack"
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGLauncher.PreviewComponentA'
    begin object name=PreviewComponentA class=Class'SPGameFramework.SPGFWeaponArcPreviewComponent'
    end object
    PreviewComponent=PreviewComponentA
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponGLauncher.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGLauncher.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenadeLauncher"
    HUDReticleName="grenadeLauncher"
    HUDReticleName_SecondaryAmmomode="grenadeLauncher"
    FriendlyName="Grenade Launcher"
    Description="Launches timed canister grenades. They can be remotely detonated, otherwise they detonate on a timer."
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponGLauncher.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Grenades"
    // Reference: StaticMeshComponent'Default__LPWeaponGLauncher.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}