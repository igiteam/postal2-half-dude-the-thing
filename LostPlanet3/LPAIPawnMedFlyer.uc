class LPAIPawnMedFlyer extends LPAIPawnAkrid
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native LegDismembermentStatus
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DismembermentInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDismembered;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHiden;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeDismembered;

    structdefaultproperties
    {
        DismembermentInfo=(HealthPercentToDismemberAt=0.0000000,BoneName="None",ParticleEffectEventName="None",LifeSpawnAfterDismemberment=1.0000000)
        bIsDismembered=false
        bIsHiden=false
        TimeDismembered=-1.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataMedFlyer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyMedFlyerController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RangedIndirectFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RangedStrightLineLobFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DismembermentStatusForLegs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightEndOfStalkZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftEndOfStalkZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationOfStalkZoneBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToPerformOpenAreaStalk[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeDeath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeOfCheckForTightFlyMovement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadiusOfCheckForTightFlyMovement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActorsForTightFlyMovementCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActorsClassesForTightFlyMovementCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel KnockDownMeleeParams KnockBackMeleeInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeDied[536870913];

// Export ULPAIPawnMedFlyer::execGetWorldAimDir(FFrame&, void* const)
native simulated event GetWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawnMedFlyer::execShouldPlayAkridProceduralMovementAudio(FFrame&, void* const)
native simulated function ShouldPlayAkridProceduralMovementAudio()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super(LPAIPawn).PostBeginPlay();
    SetPhysics(4);
    bAbleToPerformOpenAreaStalk = false;
    bMeleeDeath = false;
    bDoneBlowingUpWhileDying = false;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int iterDis;

    TuneDataMedFlyer = LPTuneDataMedFlyer(TuneData);
    super.InitTuneData(TuneData);
    TuneDataPawn.bDropTEnergyOnDeath = false;
    TuneDataPawn.bDropTEnergyOnFreeze = false;
    bMeleeDeath = false;
    HorizontalDirectFireSpread = TuneDataMedFlyer.DirectFireProjectileSpreadHorizontal;
    VerticalDirectFireSpread = TuneDataMedFlyer.DirectFireProjectileSpreadVertical;
    RangeOfCheckForTightFlyMovement = TuneDataMedFlyer.RangeOfCheckForTightFlyMovement.GetValue();
    RadiusOfCheckForTightFlyMovement = TuneDataMedFlyer.RadiusOfCheckForTightFlyMovement.GetValue();
    DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior = TuneDataMedFlyer.DelayAfterReachingOrbitSlotToStartCaringAboutNoAggressiveBehavior.GetValue();
    WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke = TuneDataMedFlyer.WhenOrbitStalkingMaxTimeWithNoAggressiveBehaviorBeforeFormationPoke.GetValue();
    MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging = TuneDataMedFlyer.MinTimeBetweenOrbitFormationInvalidationsWithoutAggressiveFlagging.GetValue();
    MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown = int(TuneDataMedFlyer.MaxNumberOfHighRateFormationInvalidationsBeforeBringingTheHammerDown.GetValue());
    FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer = TuneDataMedFlyer.FrontalAngleInDegreesForCountingFormationInvalidationTowardsHammer.GetValue();
    IgnoreActorsForTightFlyMovementCheck.AddItem(self);    
    IgnoreActorsClassesForTightFlyMovementCheck.AddItem(Class'LPAIPawnMedFlyer');    
    // End:0x356
    if(TuneDataMedFlyer.bHideWingsOnSpawn)
    {
        iterDis = 0;
        J0x2D2:

        // End:0x356 [Loop If]
        if(iterDis < TuneDataMedFlyer.WingNamesToHideOnSpawn.Length)
        {
            Mesh.HideBoneByName(TuneDataMedFlyer.WingNamesToHideOnSpawn[iterDis], 1);
            ++iterDis;
            // [Loop Continue]
            goto J0x2D2;
        }
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIPawn).PossessedBy(C, bVehicleTransition);
    MyMedFlyerController = LPAIControllerMedFlyer(C);
    //return;    
}

function UnPossessed()
{
    super(LPAIPawn).UnPossessed();
    MyMedFlyerController = none;
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(4);
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function EnableAnnounceGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableStingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableStruggleAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableAggressiveGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableRangedBodyAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableRangedWingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

simulated function NotifyStartOfRangedLobFire()
{
    // End:0x1C
    if(Health > 0)
    {
        StartOfRangedLobFire();        
    }
    //return;    
}

simulated function GetProjectileForThisLob()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x3B
    if(((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0) && RangedLobStrikeZonesAtlArcForCurrentAttack < 0)
    {
        return RangedStrightLineLobFireProjtileClass;
    }
    return RangedIndirectFireProjtileClass;
    //return ReturnValue;    
}

simulated function ProjectileValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewProjectile[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFireSolotionPossible[8388609], ReturnValue;

    // End:0x11
    if(NewProjectile == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function ShouldFireLobProjectileEvenWithNoValidFireSolution()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPositionForLob[25296897], LobFireLocOfBlockage;
    local /*0x97E50000-0x00000000*/ private bool bIntentionallyMissing[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float distanceFromPawnToBlockage, distanceFromTargetToBlockage, distanceFromPawnToBlockageThatMustBeGreaterThan, distanceFromTargetToBlockageThatMustBeLessThan;

    distanceFromPawnToBlockage = VSize(Location - LobFireLocOfBlockage);
    distanceFromPawnToBlockageThatMustBeGreaterThan = TuneDataMedFlyer.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch.GetValue();
    // End:0xF2
    if(distanceFromPawnToBlockage >= distanceFromPawnToBlockageThatMustBeGreaterThan)
    {
        distanceFromTargetToBlockage = VSize(AimPositionForLob - LobFireLocOfBlockage);
        distanceFromTargetToBlockageThatMustBeLessThan = TuneDataMedFlyer.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch.GetValue();
        // End:0xEF
        if(distanceFromTargetToBlockage <= distanceFromTargetToBlockageThatMustBeLessThan)
        {
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function GetRangedBurstFireVelocity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataMedFlyer.DirectFireLaunchVelocityMin.GetValue(), TuneDataMedFlyer.DirectFireLaunchVelocityMax.GetValue());
    //return ReturnValue;    
}

function StartOfRangedDirectFire()
{
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL projDir, projDirWithError, projRot, projRotWithError, SpawnedProjectile, aimPositionForThisStrike,
	    fireVel;

    local /*0x97E50000-0x00000000*/ private float projectileSpeed, travelDist;
    local /*0x97E50000-0x00000000*/ private @NULL TargetVel, projLoc, EnemyPawn;

    false
    GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
    projectileSpeed = GetRangedBurstFireVelocity();
    // End:0x143
    if(TuneDataMedFlyer.bUseTargetsCurrentLocAtLobRelease)
    {
        aimPositionForThisStrike = AimTargetActorForDirectFireStrike.Location;
        EnemyPawn = LPPawn(AimTargetActorForDirectFireStrike);
        // End:0x104
        if((EnemyPawn != none) && EnemyPawn.IsInCover())
        {
            aimPositionForThisStrike = EnemyPawn.GetProjectileTargetPosition(self);            
        }
        else
        {
            aimPositionForThisStrike.Z += TuneDataMedFlyer.HieghtOffTargetPointForDirectFire;
        }        
    }
    else
    {
        aimPositionForThisStrike = AimTargetPositionForDirectFireStrike;
    }
    // End:0x238
    if(bUseDeadReckoning && AimTargetActorForDirectFireStrike != none)
    {
        // End:0x238
        if(VSize(AimTargetActorForDirectFireStrike.Velocity) > float(1))
        {
            travelDist = VSize2D(aimPositionForThisStrike - projLoc);
            TargetVel = AimTargetActorForDirectFireStrike.Velocity;
            TargetVel.Z = 0.0000000;
            aimPositionForThisStrike += ((travelDist / projectileSpeed) * TargetVel);
        }
    }
    projDir = aimPositionForThisStrike - projLoc;
    projDir = Normal(projDir);
    projRot = Rotator(projDir);
    projRotWithError = GetDirectFireStartRoationWithError(projRot);
    projDirWithError = Vector(projRotWithError);
    fireVel = projDirWithError * projectileSpeed;
    SpawnedProjectile = Spawn(RangedDirectFireProjtileClass, self,, projLoc, projRotWithError);
    // End:0x3B1
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        SpawnedProjectile.Init(projDirWithError);
        SpawnedProjectile.Velocity = fireVel;
        DirectFireProjStartLocation = SpawnedProjectile.Location;
    }
    //return;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation('LobFire', out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function TestForNonDirectCoreHitDismemberment()
{
    //return;    
}

simulated function TestForNonDirectCoreHitDamageGibbing()
{
    //return;    
}

function DrawShowLobFireAttackDebug()
{
    //return;    
}

final function StartProcessDismemberedPartMonitorTimer()
{
    // End:0x22
    if(!IsProcessDismemberedPartMonitorTimerActive())
    {
        SetTimer(0.1000000, true, 'ProcessDismemberedPartMonitorTimer', self);
    }
    //return;    
}

final function StopProcessDismemberedPartMonitorTimer()
{
    ClearTimer('ProcessDismemberedPartMonitorTimer', self);
    //return;    
}

function PauseProcessDismemberedPartMonitorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessDismemberedPartMonitorTimer();        
    }
    else
    {
        StartProcessDismemberedPartMonitorTimer();
    }
    //return;    
}

final function IsProcessDismemberedPartMonitorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsTimerActive('ProcessDismemberedPartMonitorTimer', self);
    //return ReturnValue;    
}

private final function ProcessDismemberedPartMonitorTimer()
{
    ProcessDismemberedPartMonitor();
    //return;    
}

function ProcessDismemberedPartMonitor()
{
    local /*0x97E50000-0x00000000*/ private int iterDis;
    local /*0x97E50000-0x00000000*/ private float deltaSinceDismemberment;
    local /*0x97E50000-0x00000000*/ private bool bmoreBonesWaitingToBeHidden;

    bmoreBonesWaitingToBeHidden = false;
    iterDis = 0;
    J0x17:

    // End:0x1BE [Loop If]
    if(iterDis < DismembermentStatusForLegs.Length)
    {
        // End:0x1B0
        if(DismembermentStatusForLegs[iterDis].bIsDismembered && !DismembermentStatusForLegs[iterDis].bIsHiden)
        {
            deltaSinceDismemberment = WorldInfo.TimeSeconds - DismembermentStatusForLegs[iterDis].TimeDismembered;
            // End:0x1A4
            if(deltaSinceDismemberment >= DismembermentStatusForLegs[iterDis].DismembermentInfo.LifeSpawnAfterDismemberment)
            {
                Mesh.HideBoneByName(DismembermentStatusForLegs[iterDis].DismembermentInfo.BoneName, 1);
                DismembermentStatusForLegs[iterDis].bIsHiden = true;                
            }
            else
            {
                bmoreBonesWaitingToBeHidden = true;
            }
        }
        ++iterDis;
        // [Loop Continue]
        goto J0x17;
    }
    // End:0x1D7
    if(!bmoreBonesWaitingToBeHidden)
    {
        StopProcessDismemberedPartMonitorTimer();
    }
    //return;    
}

function GetMeleeHitReactionImpulse()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitImpulseForce[25165825], HitDirection, CombinedImpulse;
    local /*0x97E50000-0x00000000*/ private float MeleeHitHorizantalImpulse, MeleeHitUpwardImpulse;

    MeleeHitHorizantalImpulse = TuneDataMedFlyer.MeleeHitHorizontalImpulse.GetValue();
    MeleeHitUpwardImpulse = TuneDataMedFlyer.MeleeHitUpwardImpulse.GetValue();
    HitDirection = Location - TakeDamageParams.DamageCauser.Location;
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * MeleeHitHorizantalImpulse;
    CombinedImpulse.Z = MeleeHitUpwardImpulse;
    HitImpulseForce = CombinedImpulse * TuneDataMedFlyer.MeleeHitImpulseSizeFactor.GetValue();
    //return;    
}

reliable server function ServerKillMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation, HitImpulseForce;

    GetMeleeHitReactionImpulse(HitImpulseForce);
    KnockBackMeleeInfo.bActive = true;
    KnockBackMeleeInfo.ImpulseLocation = ImpactLocation;
    KnockBackMeleeInfo.ImpulseSize = VSize(HitImpulseForce);
    KnockBackMeleeInfo.ReplicateMe++;
    bMeleeDeath = true;
    TakeDamage(Health + 1000, PlayerPawn.Controller, ImpactLocation, HitImpulseForce * 0.0000000, Class'LPDamageTypeMelee');
    //return;    
}

simulated function ApplyFlyBackImpulse()
{
    // End:0x11
    if(!bMeleeDeath)
    {
        return;
    }
    ZeroMovementVariables();
    Mesh.AddRadialImpulse(KnockBackMeleeInfo.ImpulseLocation, 5000.0000000, KnockBackMeleeInfo.ImpulseSize, 1, true);
    //return;    
}

function StartDeathSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609], dirToHitLoc;
    local /*0x97E50000-0x00000000*/ private float yawToHitLocation, flyersYaw;

    // End:0x25C
    if(TuneDataMedFlyer.bPlayDeathSpecialMove.GetValue() != float(0))
    {
        dirToHitLoc = HitLoc - Location;
        // End:0xA0
        if(!IsZero(dirToHitLoc))
        {
            yawToHitLocation = Class'SPEngine.SPUtil'.static.GetYaw(dirToHitLoc);            
        }
        else
        {
            yawToHitLocation = 0.0000000;
        }
        flyersYaw = Class'SPEngine.SPUtil'.static.GetYaw(Vector(Rotation));
        yawToHitLocation = yawToHitLocation - flyersYaw;
        // End:0x12D
        if(TakeDamageParams.DamageType == Class'LPDamageTypeForced')
        {
            return;
        }
        // End:0x173
        if(yawToHitLocation > TuneDataMedFlyer.PlayFrontHitDeathIfAngleInDegreesGreaterThen)
        {
            DoSpecialMove(Class'LPSM_MedFlyerDie', true);            
        }
        else
        {
            // End:0x1B9
            if(yawToHitLocation > TuneDataMedFlyer.PlayLeftHitDeathIfAngleInDegreesGreaterThen)
            {
                DoSpecialMove(Class'LPSM_MedFlyerDieLeft', true);                
            }
            else
            {
                // End:0x1FF
                if(yawToHitLocation > TuneDataMedFlyer.PlayLeftHitDeathIfAngleInDegreesGreaterThen)
                {
                    DoSpecialMove(Class'LPSM_MedFlyerDieBack', true);                    
                }
                else
                {
                    // End:0x245
                    if(yawToHitLocation > TuneDataMedFlyer.PlayRightHitDeathIfAngleInDegreesGreaterThen)
                    {
                        DoSpecialMove(Class'LPSM_MedFlyerDieRight', true);                        
                    }
                    else
                    {
                        DoSpecialMove(Class'LPSM_MedFlyerDie', true);
                    }
                }
            }
        }
    }
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];
    local /*0x97E50000-0x00000000*/ private int iterDis;

    iterDis = 0;
    J0x0B:

    // End:0x8F [Loop If]
    if(iterDis < TuneDataMedFlyer.CardWingNamesToHideOnDeath.Length)
    {
        Mesh.HideBoneByName(TuneDataMedFlyer.CardWingNamesToHideOnDeath[iterDis], 1);
        ++iterDis;
        // [Loop Continue]
        goto J0x0B;
    }
    TestForNonDirectCoreHitDismemberment();
    TestForNonDirectCoreHitDamageGibbing();
    // End:0xBC
    if(AkridProceduralMovementAudioComponent != none)
    {
        TurnOffAkridProceduralMovementAudioComponent();
    }
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('NormalDeath', 'None', self, none, none);
    TimeDied = WorldInfo.TimeSeconds;
    bDirectHitWall = true;
    // End:0x14B
    if(!bShouldRagdoll && !bMeleeDeath)
    {
        Destroy();        
    }
    else
    {
        StartDeathSpecialMove(DamageType, HitLoc);
        super(LPAIPawn).StartDie(DamageType, HitLoc);
    }
    //return;    
}

simulated function @NULL IsOtherAValidExplodeAgainstTarget()
{
    local /*0x97E50000-0x00000400*/ private @NULL OtherComponent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF4
    if((OtherComponent != none) && OtherComponent.Owner != none)
    {
        // End:0x5B
        if(OtherComponent.Owner == self)
        {
            return false;
        }
        // End:0x94
        if(OtherComponent.Owner.bHidden)
        {
            return false;
        }
        // End:0xC3
        if(LPAIPawnMedFlyer(OtherComponent.Owner) != none)
        {
            return false;
        }
        // End:0xF2
        if(LPThermalEnergyPickup(OtherComponent.Owner) != none)
        {
            return false;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function StartBlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[9437185];

    Class'LPDamageType'
    Location
    // End:0xAD
    if(!bDoneBlowingUpWhileDying)
    {
        // End:0x7E
        if(TuneDataMedFlyer.bDoFrozenDeathExplode)
        {
            TuneDataPawnFXEventBindings.PlayEventFX('FrozenDeathExplode', self, Mesh, none);
        }
        // End:0xA1
        if(int(Role) == int(ROLE_Authority))
        {
            DropThermalEnergy();
        }
        bDoneBlowingUpWhileDying = true;
    }
    //return;    
}

simulated function ShouldPlayHitReactAnim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x84
    if(((TakeDamageParams.DamageType == Class'LPDamageTypeVSWelderDOT') || TakeDamageParams.DamageType == Class'LPDamageTypeARIncendiaryDOT') || TakeDamageParams.DamageType == Class'LPDamageTypeElectricDOT')
    {
        return true;
    }
    return super(SPPawn).ShouldPlayHitReactAnim();
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x36
    if(ClassIsChildOf(DamageType, Class'Engine.DmgType_Crushed') && PlayerController(EventInstigator) != none)
    {
        return;
    }
    super(LPAIPawn).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated state Dying
{
    ignores EndState, EncroachedBy, Timer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function HasFreezeFXAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StartFreezePawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        StartBlowMeUpWhileDying();
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x97
        if(((((!bDoneBlowingUpWhileDying && Other != none) && !Other.bHidden) && LPAIPawnMedFlyer(Other) == none) && LPThermalEnergyPickup(Other) == none) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    simulated function @NULL HitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    event Landed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.Landed(HitNormal, FloorActor);
        //return;        
    }

    simulated event @NULL RigidBodyCollision()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
        local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

        // End:0x5D
        if(((!bDoneBlowingUpWhileDying && OtherComponent != HitComponent) && IsOtherAValidExplodeAgainstTarget(OtherComponent)) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
        //return;        
    }

    function IsItTimeToDestoryPawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeSinceDeath;

        // End:0x0F
        if(bDoneBlowingUpWhileDying)
        {
            return true;
        }
        timeSinceDeath = WorldInfo.TimeSeconds - TimeDied;
        // End:0x93
        if(bMeleeDeath)
        {
            // End:0x93
            if(timeSinceDeath > TuneDataMedFlyer.MeleeHitTimeAfterHitBeforeDestory.GetValue())
            {
                return true;
            }
        }
        // End:0xC1
        if(timeSinceDeath > TuneDataAIPawn.TimeBetweenDeathAndDelete)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x5F [Loop If]
    if((IsDoingASpecialMove() && Mesh != none) && !Mesh.bPauseAnims)
    {
        // End:0x54
        if(DontWaitForSpecialMoveToFinish())
        {
            // [Explicit Break]
            goto J0x5F;
        }
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    J0x5F:

    // End:0x9E
    if(!DontWaitForSpecialMoveToFinish() || bGibbed)
    {
        Mesh.bPauseAnims = true;
    }
    // End:0xB9
    if(bMeleeDeath)
    {
        OnPlayRagDollDeath();        
    }
    else
    {
        SetPhysics(2);
    }
    SetLifeCycleState(2);
    J0xCA:

    // End:0xE4 [Loop If]
    if(!IsItTimeToDestoryPawn())
    {
        Sleep(0.0300000);
        // [Loop Continue]
        goto J0xCA;
    }
    // End:0xFF
    if(!bDoneBlowingUpWhileDying)
    {
        StartBlowMeUpWhileDying();
    }
    Mesh.SetHidden(true);
    Sleep(TuneDataMedFlyer.TimeAfterDeathExplosionBeforeDestory.GetValue());
    Destroy();
    stop;            
}

defaultproperties
{
    bUsesAkridProceduralMovementSounds=true
    bShouldRagdoll=true
    bAlwaysValidTargetForWinchAssist=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnMedFlyer.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnMedFlyer.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnMedFlyer.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnMedFlyer.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnMedFlyer.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnMedFlyer.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnMedFlyer.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bCanFly=true
    // Reference: SkeletalMeshComponent'Default__LPAIPawnMedFlyer.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnMedFlyer.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnMedFlyer.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    Components[9]=FXActionManagerDefObj0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnMedFlyer.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}