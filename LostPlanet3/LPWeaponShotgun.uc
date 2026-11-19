class LPWeaponShotgun extends LPWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NumPellets;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HorizontalPelletSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VerticalPelletSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PelletLifetime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PelletBounceDamageMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PelletPerBounceDamageMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HitPhysMaterials[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ADSStandingStillSpreadMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ADSMovingSpreadMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StandingStillSpreadMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ReloadShellSMComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPendingWantsToFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataShotgun;

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataShotgun = LPTuneDataWeaponShotgun(TuneData);
    //return;    
}

simulated function InstantFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIPawn, StartTrace, EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private @NULL RealImpact, AdjustedAimDir;
    local /*0x97E50000-0x00000000*/ private float ShakeScale;

    // End:0x4E3
    if((int(WorldInfo.NetMode) != int(NM_Client)) || (bClientSideInstantHit && Instigator != none) && Instigator.IsLocallyControlled())
    {
        SPIPawn = SPInventoryPawn(Instigator);
        // End:0x22B
        if(((SPIPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.IsBasedOn(SPIPawn))
        {
            SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.SetTraceBlocking(false, SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.BlockNonZeroExtent);
        }
        StartTrace = Instigator.GetWeaponStartTraceLocation();
        AdjustedAimDir = Vector(GetAdjustedAim(StartTrace));
        EndTrace = StartTrace + (AdjustedAimDir * (GetTraceRange()));
        RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
        // End:0x317
        if((int(Role) == int(ROLE_Authority)) || bClientSideInstantHit)
        {
            SetFlashLocation(RealImpact.HitLocation);
        }
        FireAllPellets(StartTrace, Rotator(AdjustedAimDir), CurrentFireMode);
        // End:0x4E0
        if(((SPIPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.IsBasedOn(SPIPawn))
        {
            SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.SetTraceBlocking(true, SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.BlockNonZeroExtent);
        }        
    }
    else
    {
        // End:0x52B
        if((Instigator != none) && Instigator.IsLocallyControlled())
        {
            WeaponFired(CurrentFireMode);
        }
    }
    // End:0x616
    if((Instigator.IsLocallyControlled() && Instigator.IsHumanControlled()) && CameraShake != none)
    {
        ShakeScale = ((LPPawn(Instigator).IsAimingDownSight()) ? 1.0000000 : 0.4000000);
        PlayerController(Instigator.Controller).ClientPlayCameraShake(CameraShake, ShakeScale, false);
    }
    //return;    
}

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, MyLPPawn, SpawnedProjectile;
    local /*0x97E50000-0x00000000*/ private class ProjectileClass;
    local /*0x97E50000-0x00000000*/ private @NULL TuneDataAmmo, AimRot, NewAimDir;
    local /*0x97E50000-0x00000000*/ private int Number;
    local /*0x97E50000-0x00000000*/ private float SpreadModifier, MovingSpread;

    AimDir *= 0.0100000;
    MyLPPawn = LPPawn(Instigator);
    AbortWeaponReload(true);
    HitPhysMaterials.Length = 0;
    // End:0xC8
    if(int(MyLPPawn.AimState) == int(4))
    {
        // End:0xB2
        if(MyLPPawn.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
        {
            SpreadModifier = ADSMovingSpreadMultiplier;            
        }
        else
        {
            SpreadModifier = ADSStandingStillSpreadMultiplier;
        }        
    }
    else
    {
        MovingSpread = StandingStillSpreadMultiplier + ((1.0000000 - StandingStillSpreadMultiplier) * (VSize(MyLPPawn.Velocity) / MyLPPawn.GroundSpeed));
        SpreadModifier = ((int(MyLPPawn.Physics) == int(1)) ? MovingSpread : 1.0000000);
    }
    ProjectileClass = class<SPEngineProjectile>(GetProjectileClass());
    // End:0x559
    if(ProjectileClass != none)
    {
        TuneDataAmmo = LPTuneDataAmmoShotgun(TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode]);
        Number = 0;
        J0x1F7:

        // End:0x559 [Loop If]
        if(Number < int(NumPellets))
        {
            AimRot = Rotator(AimDir);
            // End:0x2C4
            if(Number != 0)
            {
                AimRot.Yaw += int((float(HorizontalPelletSpread) * (-1.0000000 + (2.0000000 * FRand()))) * SpreadModifier);
                AimRot.Pitch += int((float(VerticalPelletSpread) * (-1.0000000 + (2.0000000 * FRand()))) * SpreadModifier);
            }
            SpawnedProjectile = ((ProjectileClass.default.bUsePooling) ? LPProj_BounceShot(GetPoolManager().SpawnProjectile(ProjectileClass, Instigator, self, SpawnLoc, AimRot, SpawnLoc)) : LPProj_BounceShot(Spawn(ProjectileClass, self,, SpawnLoc)));
            // End:0x54B
            if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
            {
                NewAimDir = Vector(AimRot);
                SpawnedProjectile.Init(NewAimDir);
                SpawnedProjectile.Velocity = TuneDataAmmo.ProjectileVelocity * NewAimDir;
                SpawnedProjectile.GravityZ = TuneDataAmmo.ProjectileGravity;
                SpawnedProjectile.Damage = InstantHitDamage[0];
                SpawnedProjectile.BounceDamageMultiplier = PelletBounceDamageMultiplier;
                SpawnedProjectile.PerBounceDamageMultiplier = PelletPerBounceDamageMultiplier;
                SpawnedProjectile.SetMaxBounceCount(TuneDataAmmo.PelletMaxBounces);
                SpawnedProjectile.SetLifetime(PelletLifetime);
            }
            Number++;
            // [Loop Continue]
            goto J0x1F7;
        }
    }
    SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    //return;    
}

final simulated function FireAllPellets()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLocation[8388609], InAimRot;
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyLPPawn, TracerLoc, TracerDir, EndTrace, AimDir, realTracerEndPoint;

    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private int Number, Idx;
    local /*0x97E50000-0x00000000*/ private @NULL AimRot;
    local /*0x97E50000-0x00000000*/ private float SpreadModifier, MovingSpread;

    MyLPPawn = LPPawn(Instigator);
    AbortWeaponReload(true);
    HitPhysMaterials.Length = 0;
    // End:0xB8
    if(int(MyLPPawn.AimState) == int(4))
    {
        // End:0xA2
        if(MyLPPawn.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
        {
            SpreadModifier = ADSMovingSpreadMultiplier;            
        }
        else
        {
            SpreadModifier = ADSStandingStillSpreadMultiplier;
        }        
    }
    else
    {
        MovingSpread = StandingStillSpreadMultiplier + ((1.0000000 - StandingStillSpreadMultiplier) * (VSize(MyLPPawn.Velocity) / MyLPPawn.GroundSpeed));
        SpreadModifier = ((int(MyLPPawn.Physics) == int(1)) ? MovingSpread : 1.0000000);
    }
    Number = 0;
    J0x16D:

    // End:0x405 [Loop If]
    if(Number < int(NumPellets))
    {
        ImpactList.Length = 0;
        AimRot = InAimRot;
        // End:0x244
        if(Number != 0)
        {
            AimRot.Yaw += int((float(HorizontalPelletSpread) * (-1.0000000 + (2.0000000 * FRand()))) * SpreadModifier);
            AimRot.Pitch += int((float(VerticalPelletSpread) * (-1.0000000 + (2.0000000 * FRand()))) * SpreadModifier);
        }
        AimDir = Vector(AimRot);
        EndTrace = StartLocation + (AimDir * (GetTraceRange()));        
        CalcWeaponFire(StartLocation, EndTrace, ImpactList);
        // End:0x397
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            realTracerEndPoint = ((ImpactList.Length > 0) ? ImpactList[0].HitLocation : EndTrace);
            TracerLoc = GetMuzzleLoc();
            TracerDir = realTracerEndPoint - TracerLoc;
            SpawnTracerEffect(self, Instigator, TracerLoc, Rotator(TracerDir), realTracerEndPoint, VSize(realTracerEndPoint - StartLocation));
        }
        Idx = 0;
        J0x3A2:

        // End:0x3F7 [Loop If]
        if(Idx < ImpactList.Length)
        {
            ProcessInstantHit(CurrentFireMode, ImpactList[Idx], NumInstantHits);
            Idx++;
            // [Loop Continue]
            goto J0x3A2;
        }
        Number++;
        // [Loop Continue]
        goto J0x16D;
    }
    //return;    
}

simulated function CalcRemoteImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GivenHitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace, EndTrace, AimRot;

    // End:0x90
    if(AmmoTypeInfo.CurrentAmmoMode == 0)
    {
        StartTrace = GetMuzzleLoc();
        EndTrace = GivenHitLocation;
        AimRot = Rotator(Normal(EndTrace - StartTrace));
        FireAllPellets(StartTrace, AimRot, FireModeNum);
    }
    //return;    
}

simulated event ShouldPlayImpactSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(HitPhysMaterials.Find(PhysMat) == )
    {        
        HitPhysMaterials.AddItem(PhysMat);        
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function ReloadInterrupted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterruptMove[9437185];

    // End:0x51
    if(MyTuneDataWeapon.bRetryInterruptedManualReload || (AmmoLeftInMagazine == 0) && AmmoLeftForWeapon > 0)
    {
        SetWantsToResumeReloadAfterInterruption();
    }
    StopCustomWeaponAnimation(0.1000000);
    // End:0x7B
    if(LPSM_PlayerMeleeAttack(InterruptMove) != none)
    {        
    }
    else
    {
        // End:0x96
        if(LPSM_GrenadePrime(InterruptMove) != none)
        {            
        }
        else
        {
            // End:0xB1
            if(LPSM_PlayerRollBase(InterruptMove) != none)
            {                
            }
            else
            {
                // End:0xDF
                if(LPPawn(Instigator).HasPendingWeapon())
                {                    
                }
                else
                {
                    // End:0x10B
                    if(TuneDataBaseWeapon.bReloadOnInterrupt)
                    {
                        PerformReload();
                    }
                }
            }
        }
    }
    //return;    
}

function ReloadOrAmmoSwitchEnding()
{
    local /*0x97E50000-0x00000000*/ private bool bCanGoActive;

    // End:0x90
    if(!SPInventoryPawn(Instigator).bWantsToPlaySwitchAmmoSequence && (AmmoLeftInMagazine == (GetMagazineCapacity())) || AmmoLeftForWeapon == 0)
    {
        // End:0x78
        if(!IsInState('Active'))
        {
            GotoState('Active');
        }
        bForceNetUpdate = true;
        bCanGoActive = true;
    }
    ClientPerformReload(bCanGoActive, AmmoLeftInMagazine);
    //return;    
}

function UpdateAmmoAfterReload()
{
    local /*0x97E50000-0x00000000*/ private int AmountToReload;

    // End:0xC9
    if((AmmoLeftInMagazine < (GetMagazineCapacity())) && AmmoLeftForWeapon > 0)
    {
        AmountToReload = 1;
        // End:0x8B
        if(AmmoLeftInMagazine == 0)
        {
            AmountToReload += TuneDataShotgun.NumExtraBulletsToReloadOnEmptyMagazine;
            AmountToReload = Clamp(AmountToReload, 0, AmmoLeftForWeapon);
        }
        AmmoLeftForWeapon -= AmountToReload;
        AmmoLeftInMagazine += AmountToReload;
        bForceNetUpdate = true;
        ReloadOrAmmoSwitchEnding();
    }
    //return;    
}

reliable client simulated function ClientPerformReload()
{
    local /*0x97E50000-0x00000000*/ private bool bCanGoActive[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoLeft[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MySPPawn;

    AmmoLeftInMagazine = AmmoLeft;
    MySPPawn = SPPawn(Instigator);
    // End:0x5D
    if(MySPPawn != none)
    {
        MySPPawn.NotifyAmmoCountUpdated();
    }
    // End:0xB4
    if(((bCanGoActive && !IsInState('Active')) && !IsInState('WeaponPuttingDown')) && !IsInState('Inactive'))
    {
        GotoState('Active');
    }
    //return;    
}

simulated function AttachShellMesh()
{
    // End:0x14B
    if((Instigator.Mesh != none) && !SPPawn(Instigator).IsMirrored())
    {
        // End:0x14B
        if(ReloadShellSMComponent != none)
        {
            ReloadShellSMComponent.SetHidden(false);
            ReloadShellSMComponent.SetShadowParent(Instigator.Mesh);
            ReloadShellSMComponent.SetLightEnvironment(SPPawn(Instigator).LightEnvironment);
            Instigator.Mesh.AttachComponentToSocket(ReloadShellSMComponent, 'ShotgunShellSocket');
        }
    }
    //return;    
}

simulated function DetachShellMesh()
{
    // End:0xF6
    if(((Instigator != none) && Instigator.Mesh != none) && ReloadShellSMComponent.bAttached)
    {
        ReloadShellSMComponent.SetShadowParent(none);
        ReloadShellSMComponent.SetLightEnvironment(none);
        Instigator.Mesh.DetachComponent(ReloadShellSMComponent);
        ReloadShellSMComponent.SetHidden(true);
    }
    //return;    
}

simulated event Destroyed()
{
    HitPhysMaterials.Length = 0;
    DetachShellMesh();
    super.Destroyed();
    //return;    
}

simulated function PlayMuzzleFlashEffect()
{
    super(SPInventoryWeapon).PlayMuzzleFlashEffect();
    SetTimer(0.1000000, false, 'StopMuzzleFlashEffect');
    //return;    
}

simulated event ReceivedNewOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL OldOwner[8388609];

    super(SPWeapon).ReceivedNewOwner(OldOwner);
    StopAttemptingToReload();
    //return;    
}

static function GetDefaultDamageStat()
{
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DefaultTuneDataShotgun, DefaultTuneDataAmmo;

    false
    // End:0x73
    if(bForceMPCheck || int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        DefaultTuneDataShotgun = LPTuneDataWeaponShotgun(default.TuneDataBaseWeapon_MP);        
    }
    else
    {
        DefaultTuneDataShotgun = LPTuneDataWeaponShotgun(default.TuneDataBaseWeapon);
    }
    // End:0x112
    if(DefaultTuneDataShotgun != none)
    {
        DefaultTuneDataAmmo = LPTuneDataAmmoShotgun(DefaultTuneDataShotgun.SupportedAmmoTypes[0]);
        return DefaultTuneDataAmmo.BaseDamage * float(DefaultTuneDataAmmo.NumPellets);
    }
    return super(SPInventoryWeapon).GetDefaultDamageStat(bForceMPCheck);
    //return ReturnValue;    
}

simulated state Active
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPPC;

        super.BeginState(PreviousStateName);
        LPPC = LPPlayerController(Instigator.Controller);
        // End:0x11B
        if(((LPPC != none) && LPPC.IsLocalPlayerController()) && ((PreviousStateName == 'WeaponFiring') || PreviousStateName == 'WeaponFiringSingle') || PreviousStateName == 'WaitForRefire')
        {
            // End:0x11B
            if(PendingFire(int(CurrentFireMode)) && LPPlayerPawn(Instigator).CanFireWeapon(false))
            {
                StartFire(CurrentFireMode);
            }
        }
        //return;        
    }
    stop;    
}

simulated state WeaponFiringSingle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bIsPendingWantsToFire = false;
        StopAttemptingToReload();
        //return;        
    }

    simulated function CheckForAutoReload()
    {
        // End:0x55
        if(AmmoLeftForWeapon > 0)
        {
            // End:0x55
            if(((Instigator.Controller != none) && AmmoLeftForWeapon > 0) && AmmoLeftInMagazine == 0)
            {
            }
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x52
        if(((Instigator.Controller != none) && AmmoLeftForWeapon > 0) && AmmoLeftInMagazine == 0)
        {
            SetWantsToResumeReloadAfterInterruption(true, true);
        }
        super(WeaponFiring).EndState(NextStateName);
        //return;        
    }
    stop;    
}

simulated state WeaponFiring
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        StopAttemptingToReload();
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x52
        if(((Instigator.Controller != none) && AmmoLeftForWeapon > 0) && AmmoLeftInMagazine == 0)
        {
            SetWantsToResumeReloadAfterInterruption(true, true);
        }
        super.EndState(NextStateName);
        // End:0xBD
        if(Instigator.Controller != none)
        {
            Instigator.Controller.StopFiring();
        }
        //return;        
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

    simulated function StartFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x27
        if(int(Role) < int(ROLE_Authority))
        {
            ServerStartFire(FireModeNum);
        }
        BeginFire(FireModeNum);
        //return;        
    }

    simulated event AbortReload()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0xD7
        if((!bDeleteMe && Instigator != none) && (WorldInfo.TimeSeconds - ReloadStartTime) > 0.1000000)
        {
            ReloadStartTime = WorldInfo.TimeSeconds + float(2);
            SPPawn(Instigator).BroadcastSMMessageToAll(1, Class'LPSMMTypes'.default.SMM_ShotgunWantsToFire, Instigator);
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    NumPellets=8
    HorizontalPelletSpread=1000
    VerticalPelletSpread=900
    bAllowTracers=true
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponShotgun.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponShotgun.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="shotgun"
    HUDReticleName="shotgun"
    HUDReticleName_SecondaryAmmomode="shotgun"
    FriendlyName="Shotgun"
    Description="A pump-action shotgun with solid stopping power but limited range. Ideal for close quarters combat."
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponShotgun.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Shotgun Shells"
    // Reference: StaticMeshComponent'Default__LPWeaponShotgun.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}