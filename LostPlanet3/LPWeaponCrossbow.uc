class LPWeaponCrossbow extends LPWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ReloadShellSMComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArrowSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpreadDamageMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFireButtonReleased;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpreadFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsRepeating;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugOutputInfoToHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMultipleReloadEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HoldTimeUntilSpreadFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ButtonHoldTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReticleChargePercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepeaterClipsLoaded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxRepeaterClipsLoaded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpreadFireNotifyWaveform;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataCrossbow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UnfoldAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UnfoldedIdleAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FoldAnimName;

simulated function GetReloadSpeedMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Multiplier;

    Multiplier = super(SPInventoryWeapon).GetReloadSpeedMultiplier();
    // End:0x5B
    if((AmmoLeftForWeapon > 0) && HasRepeater())
    {
        Multiplier *= TuneDataCrossbow.PreloadSpeedMultiplier;
    }
    return Multiplier;
    //return ReturnValue;    
}

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, OriginalAimDir, X, Y, Z;

    local /*0x97E50000-0x00000000*/ private float ZOffset;

    AimDir *= 0.0100000;
    // End:0x1EB
    if(bSpreadFire && AmmoLeftInMagazine > 0)
    {
        OriginalAimDir = AimDir;
        GetAxes(Rotator(AimDir), X, Y, Z);
        ZOffset = ((AmmoLeftInMagazine > 1) ? 0.5000000 : 0.0000000);
        AimDir = Normal((OriginalAimDir + ((Y * 0.8660000) * ArrowSpread)) - ((Z * ZOffset) * ArrowSpread));
        SpawnCrossbowBolt(SpawnLoc, AimDir);
        AimDir = Normal((OriginalAimDir - ((Y * 0.8660000) * ArrowSpread)) - ((Z * ZOffset) * ArrowSpread));
        SpawnCrossbowBolt(SpawnLoc, AimDir);
        ConsumeAmmo(CurrentFireMode);
        // End:0x1E8
        if(AmmoLeftInMagazine > 0)
        {
            AimDir = Normal(OriginalAimDir + (Z * ArrowSpread));
            SpawnCrossbowBolt(SpawnLoc, AimDir);
            ConsumeAmmo(CurrentFireMode);
        }        
    }
    else
    {
        SpawnCrossbowBolt(SpawnLoc, AimDir);
    }
    SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    //return;    
}

function SpawnCrossbowBolt()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, SpawnedProjectile;
    local /*0x97E50000-0x00000000*/ private class ProjectileClass;

    ProjectileClass = class<SPEngineProjectile>(GetProjectileClass());
    // End:0x27A
    if(ProjectileClass != none)
    {
        // End:0xF4
        if(ProjectileClass.default.bUsePooling)
        {
            SpawnedProjectile = GetPoolManager().SpawnProjectile(ProjectileClass, Instigator, self, SpawnLoc, Rotator(AimDir), SpawnLoc + AimDir);
            SpawnedProjectile.SetLifetime(ProjectileClass.default.LifeSpan);            
        }
        else
        {
            SpawnedProjectile = Spawn(ProjectileClass, self,, SpawnLoc);
            SpawnedProjectile.Init(AimDir);
        }
        SpawnedProjectile.Velocity = TuneDataCrossbow.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileVelocity * AimDir;
        SpawnedProjectile.GravityZ = TuneDataCrossbow.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileGravity;
        SpawnedProjectile.Damage = InstantHitDamage[0] * ((bSpreadFire) ? SpreadDamageMultiplier : 1.0000000);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataCrossbow = LPTuneDataWeaponCrossbow(TuneData);
    ArrowSpread = TuneDataCrossbow.ArrowSpreadMagnitude;
    HoldTimeUntilSpreadFire = TuneDataCrossbow.HoldTimeUntilSpreadFire;
    SpreadFireNotifyWaveform = TuneDataCrossbow.SpreadFireNotification;
    SpreadDamageMultiplier = TuneDataCrossbow.SpreadDamageMultiplier;
    //return;    
}

simulated function GiveAmmoTypeViaUnlockedAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAmmoType[8388609];

    // End:0x44
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        GiveAmmoType(InAmmoType,,,, true);        
    }
    else
    {
        super.GiveAmmoTypeViaUnlockedAmmoTypes(InAmmoType);
    }
    //return;    
}

simulated function GetMagazineCapacity()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return MaxAmmoInMagazine + (MaxAmmoInMagazine * MaxRepeaterClipsLoaded);
    //return ReturnValue;    
}

simulated function GetMaxReloadAmount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x1A
    if(bMultipleReloadEnabled)
    {
        return MaxAmmoInMagazine;        
    }
    else
    {
        return GetMagazineCapacity();
    }
    //return ReturnValue;    
}

function ReloadMagazine()
{
    super(SPInventoryWeapon).ReloadMagazine();
    RepeaterClipsLoaded = AmmoLeftInMagazine / MaxAmmoInMagazine;
    bForceNetUpdate = true;
    //return;    
}

simulated function HasRepeater()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MaxRepeaterClipsLoaded > 0;
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string DebugString;
    local /*0x97E50000-0x00000000*/ private float textHeight, TextWidth, NewChargePercent;

    NewChargePercent = ((AmmoTypeInfo.CurrentAmmoMode == 0) ? FClamp(ReticleChargePercent + 0.1000000, 0.0000000, 1.0000000) : 0.0000000);
    // End:0xAA
    if(ReticleChargePercent != NewChargePercent)
    {
        LPHUD(H).SetCrossbowReticleChargePercent(NewChargePercent);
        ReticleChargePercent = NewChargePercent;
    }
    // End:0xBB
    if(!bDebugOutputInfoToHUD)
    {
        return;
    }
    // End:0x1A7
    if(Instigator != none)
    {
        DebugString = "Crossbow Debug ";
        // End:0x1A7
        if(Instigator.Controller != none)
        {
            DebugString = (DebugString $ " [Button Held Duration] ") $ string(ButtonHoldTime);
            // End:0x1A7
            if(HasRepeater())
            {
                DebugString = (((DebugString $ " [REPEATER Clips loaded] ") $ string(RepeaterClipsLoaded)) $ " [Max] ") $ string(MaxRepeaterClipsLoaded);
            }
        }
    }
    H.Canvas.Font = Class'Engine.HUD'.static.GetFontSizeIndex(2);
    H.Canvas.TextSize(DebugString, TextWidth, textHeight);
    H.Canvas.SetPos((H.Canvas.ClipX * 0.5000000) - (TextWidth * 0.5000000), (H.Canvas.ClipY * 0.9000000) - (textHeight * 1.5000000));
    H.Canvas.DrawText(DebugString);
    //return;    
}

simulated exec function ToggleWeaponDebug()
{
    bDebugOutputInfoToHUD = !bDebugOutputInfoToHUD;
    //return;    
}

static function GetDefaultDamageStat()
{
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class BoltProjectileClass;
    local /*0x97E50000-0x00000000*/ private float DefaultDamage;

    false
    // End:0x168
    if(bForceMPCheck || int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        // End:0x165
        if(default.TuneDataBaseWeapon_MP != none)
        {
            BoltProjectileClass = class<LPProj_Bolt>(default.TuneDataBaseWeapon_MP.SupportedAmmoTypes[0].ProjectileClass);
            // End:0x165
            if(BoltProjectileClass != none)
            {
                DefaultDamage = BoltProjectileClass.default.GrenadeTuneData_MP.ExplosionTemplate.Damage;
                DefaultDamage += default.TuneDataBaseWeapon_MP.SupportedAmmoTypes[0].BaseDamage;
                DefaultDamage *= float(3);
                return DefaultDamage;
            }
        }        
    }
    else
    {
        // End:0x279
        if(default.TuneDataBaseWeapon != none)
        {
            BoltProjectileClass = class<LPProj_Bolt>(default.TuneDataBaseWeapon.SupportedAmmoTypes[0].ProjectileClass);
            // End:0x279
            if(BoltProjectileClass != none)
            {
                DefaultDamage = BoltProjectileClass.default.GrenadeTuneData.ExplosionTemplate.Damage;
                DefaultDamage += default.TuneDataBaseWeapon.SupportedAmmoTypes[0].BaseDamage;
                DefaultDamage *= float(3);
                return DefaultDamage;
            }
        }
    }
    return super(SPInventoryWeapon).GetDefaultDamageStat(bForceMPCheck);
    //return ReturnValue;    
}

simulated function FireModeUpdated()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x9D
    if(int(PreviousFiringMode) == 2)
    {
        // End:0x9D
        if(Instigator.IsLocallyControlled())
        {
            LPPC = LPPlayerController(Instigator.Controller);
            // End:0x9D
            if(LPPC != none)
            {
                NotifyEnteringADS(LPPC.IsAimingDownSight());
            }
        }
    }
    super(SPInventoryWeapon).FireModeUpdated(FiringMode, bViaReplication);
    //return;    
}

simulated state WeaponFiring
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bSpreadFire = AmmoTypeInfo.CurrentAmmoMode == 0;
        super.BeginState(PreviousStateName);
        // End:0x9B
        if(bSpreadFire && int(WorldInfo.NetMode) == int(NM_Client))
        {
            ConsumeAmmo(CurrentFireMode);
            ConsumeAmmo(CurrentFireMode);
        }
        //return;        
    }

    simulated function BeginFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x33
        if(!bDeleteMe && Instigator != none)
        {
            global.BeginFire(FireModeNum);
        }
        //return;        
    }
    stop;    
}

simulated state WeaponFiringBurst
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPPC;

        bIsRepeating = false;
        bFireButtonReleased = false;
        NumBurstShots = 0;
        // End:0xE6
        if(bSpreadFire)
        {
            // End:0xDA
            if(SpreadFireNotifyWaveform != none)
            {
                // End:0xDA
                if((Instigator != none) && Instigator.IsLocallyControlled())
                {
                    LPPC = LPPlayerController(Instigator.Controller);
                    // End:0xDA
                    if(LPPC != none)
                    {
                        LPPC.ClientStopForceFeedbackWaveform(SpreadFireNotifyWaveform);
                    }
                }
            }
            bSpreadFire = false;
        }
        //return;        
    }

    simulated function Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPPC;

        global.Tick(DeltaTime);
        // End:0x245
        if(!bFireButtonReleased)
        {
            ButtonHoldTime += DeltaTime;
            // End:0x1C4
            if(ButtonHoldTime > HoldTimeUntilSpreadFire)
            {
                // End:0x15C
                if(!bSpreadFire)
                {
                    // End:0x15C
                    if(((Instigator != none) && Instigator.Controller != none) && Instigator.IsLocallyControlled())
                    {
                        LPPC = LPPlayerController(Instigator.Controller);
                        // End:0x15C
                        if(LPPC != none)
                        {
                            // End:0x15C
                            if((SpreadFireNotifyWaveform != none) && !LPPC.IsForceFeedbackWaveformPlaying(SpreadFireNotifyWaveform))
                            {
                                LPPC.ClientPlayForceFeedbackWaveform(SpreadFireNotifyWaveform);
                            }
                        }
                    }
                }
                bSpreadFire = true;
                // End:0x19F
                if(RepeaterClipsLoaded > 0)
                {
                    ButtonHoldTime = 0.0000000;
                    bIsRepeating = true;
                    FireShot();                    
                }
                else
                {
                    // End:0x1C4
                    if(bIsRepeating)
                    {
                        bFireButtonReleased = true;
                        StopFire(1);
                    }
                }
            }
            // End:0x245
            if(Instigator.IsLocallyControlled())
            {
                // End:0x245
                if(int(PlayerController(Instigator.Controller).bFire) == int(0))
                {
                    bFireButtonReleased = true;
                    StopFire(1);
                }
            }
        }
        //return;        
    }

    simulated function FireShot()
    {
        FireAmmunition();
        NumBurstShots++;
        // End:0xB2
        if((bSpreadFire || AmmoLeftInMagazine <= 0) || NumBurstShots >= NumberOfShotsToBurst)
        {
            // End:0x66
            if(RepeaterClipsLoaded > 0)
            {
                RepeaterClipsLoaded--;
            }
            ClearPendingFire(1);
            ClearPendingFire(0);
            TimeWeaponFiring(0);
            // End:0xB0
            if(!bIsRepeating || bFireButtonReleased)
            {
                HandleFinishedFiring();
            }
            return;
        }
        // End:0xF1
        if((NumBurstShots < NumberOfShotsToBurst) && AmmoLeftInMagazine > 0)
        {
            SetTimer(BurstInterval, false, 'FireShot');
        }
        //return;        
    }

    simulated function BeginFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x2E
        if(int(FireModeNum) != int(CurrentFireMode))
        {
            super(WeaponFiring).BeginFire(FireModeNum);
        }
        //return;        
    }

    simulated function EndFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x6A
        if((int(CurrentFireMode) == int(0)) && int(FireModeNum) == int(1))
        {
            // End:0x58
            if(Instigator.Controller != none)
            {
                FireShot();
            }
            ButtonHoldTime = 0.0000000;            
        }
        else
        {
            // End:0x91
            if(int(FireModeNum) != int(0))
            {
                super(SPInventoryWeapon).EndFire(FireModeNum);
            }
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPPC;

        ClearTimer('FireShot');
        bFireButtonReleased = false;
        bIsRepeating = false;
        NumBurstShots = 0;
        // End:0xD6
        if(bSpreadFire)
        {
            // End:0xCA
            if(SpreadFireNotifyWaveform != none)
            {
                // End:0xCA
                if(Instigator != none)
                {
                    LPPC = LPPlayerController(Instigator.Controller);
                    // End:0xCA
                    if(LPPC != none)
                    {
                        LPPC.ClientStopForceFeedbackWaveform(SpreadFireNotifyWaveform);
                    }
                }
            }
            bSpreadFire = false;
        }
        ButtonHoldTime = 0.0000000;
        super.EndState(NextStateName);
        //return;        
    }

    simulated event IsFiring()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (bFireButtonReleased || bIsRepeating) || (int(Role) == int(ROLE_Authority)) && !Instigator.IsLocallyControlled();
        //return ReturnValue;        
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        PlayCustomWeaponAnimation(UnfoldAnimName);
        ReticleChargePercent = -1.0000000;
        //return;        
    }
    stop;    
}

simulated state Active
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        PlayCustomWeaponAnimation(UnfoldedIdleAnimName,, 0.2500000,, true);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super.Tick(DeltaTime);
        // End:0x67
        if(!WeaponAnimInfo.AnimNodeSlot.bIsPlayingCustomAnim)
        {
            PlayCustomWeaponAnimation(UnfoldedIdleAnimName,, 0.2500000,, true);
        }
        //return;        
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        PlayCustomWeaponAnimation(FoldAnimName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponCrossbow.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponCrossbow.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="tacticalCrossbow"
    HUDReticleName="tacticalCrossbow"
    HUDReticleName_SecondaryAmmomode="tacticalCrossbow"
    FriendlyName="Valkyrie"
    Description="A weapon that fires 3 bolts in a triangular formation.  Bolts explode when striking enemy targets."
    WeaponFireTypes=/* Array type was not detected. */
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponCrossbow.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Inferno Bolts"
    // Reference: StaticMeshComponent'Default__LPWeaponCrossbow.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}