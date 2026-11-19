class LPWeaponVSISSMissileLauncher extends LPBaseVSISSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataMissileLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PitchSpawnMissiles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SpawnedProjectiles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedFireMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInFiringPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBackToIdle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartFireTargetLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyCollisionHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceMissileFromVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TipSocketNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumLastMissilesAtBestAccuracy;

simulated event PostBeginPlay()
{
    super(SPInventoryWeapon).PostBeginPlay();
    MyVSPawn = LPAIPawnVSISS(Owner);
    Mesh = MyVSPawn.Mesh;
    //return;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPBaseVSWeapon).InitTuneData(TuneData);
    TuneDataMissileLauncher = LPTuneDataWeaponVSISSMissileLauncher(TuneData);
    //return;    
}

simulated function SetForcedFireMode()
{
    local /*0x97E50000-0x00000000*/ private byte InFiringModeNum[8388609];

    bForcedFireMode = false;
    // End:0x3A
    if(int(InFiringModeNum) != int(CurrentFireMode))
    {
        SetCurrentFireMode(InFiringModeNum);
    }
    bForcedFireMode = true;
    //return;    
}

simulated function SetCurrentFireMode()
{
    local /*0x97E50000-0x00000000*/ private byte FiringModeNum[8388609];

    // End:0x0F
    if(bForcedFireMode)
    {
        return;
    }
    super(SPGFWeaponStandalone).SetCurrentFireMode(FiringModeNum);
    //return;    
}

simulated function StopFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super(SPGFWeapon).StopFire(FireModeNum);
    SpawnedProjectiles.Remove(0, SpawnedProjectiles.Length);    
    //return;    
}

function SetupWeaponFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super(SPGFWeapon).SetupWeaponFire(FireModeNum);
    NumLastMissilesAtBestAccuracy = int(TuneDataMissileLauncher.NumLastMissilesAtBestAccuraccy.X + float(Rand(int((TuneDataMissileLauncher.NumLastMissilesAtBestAccuraccy.Y - TuneDataMissileLauncher.NumLastMissilesAtBestAccuraccy.X) + float(1)))));
    //return;    
}

simulated function GetAdjustedAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], ReturnValue, adjustedAim;

    adjustedAim = super(SPInventoryWeapon).GetAdjustedAim(StartFireLoc);
    adjustedAim.Pitch = PitchSpawnMissiles;
    return adjustedAim;
    //return ReturnValue;    
}

simulated function GetRandomVectorInSquare()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAccuracy[8388609], ReturnValue, RandomVector;
    local /*0x97E50000-0x00000000*/ private float XCoord, YCoord;

    // End:0x9F
    if(FRand() > 0.5000000)
    {
        XCoord = InAccuracy.X + (FRand() * (InAccuracy.Y - InAccuracy.X));
        YCoord = InAccuracy.Y * FRand();        
    }
    else
    {
        XCoord = InAccuracy.Y * FRand();
        YCoord = InAccuracy.X + (FRand() * (InAccuracy.Y - InAccuracy.X));
    }
    // End:0x14B
    if(FRand() > 0.5000000)
    {
        XCoord *= -1.0000000;
    }
    // End:0x167
    if(FRand() > 0.5000000)
    {
        YCoord *= -1.0000000;
    }
    RandomVector.X = XCoord;
    RandomVector.Y = YCoord;
    return RandomVector;
    //return ReturnValue;    
}

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, SpawnedProjectile, FireTargetLocation, SeekTargetPos, AccuracyRange,
	    MissileAccuracy, AccuraccyFirstMissile, AccuraccyLastMissile, RocketPack, DirToTarget,
	    PerpendicularDir;

    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;
    local /*0x97E50000-0x00000000*/ private int RemainingShots;
    local /*0x97E50000-0x00000000*/ private float PctgAccuracy;

    AimDir = Normal(AimDir);
    SpawnedProjectile = LPProj_ISSRocket(Spawn(GetProjectileClass(), self,, SpawnLoc));
    SpawnedProjectiles.AddItem(SpawnedProjectile);    
    RocketPack = LPProj_ISSRocketPack(SpawnedProjectile);
    // End:0x3B7
    if(RocketPack != none)
    {
        SpawnedProjectile.Init(AimDir);
        SpawnedProjectile.Velocity = TuneDataMissileLauncher.SpeedMissilePack * AimDir;
        SpawnedProjectile.MaxSpeed = TuneDataMissileLauncher.SpeedMissilePack;
        SpawnedProjectile.GravityZ = 0.0000000;
        SeekTargetPos = (GetFireTargetLocation()) + (vect(0.0000000, 0.0000000, 1.0000000) * TuneDataMissileLauncher.HeightMissilePack);
        RocketPack.SpeedProjectile = float(TuneDataMissileLauncher.MiniMissileSpeed);
        RocketPack.RingRadius = TuneDataMissileLauncher.RadiusRing;
        RocketPack.HeightSeekTargetPos = TuneDataMissileLauncher.HeightMissilePack;
        RocketPack.NumProjectilesToSpawn = TuneDataMissileLauncher.NumMiniMissilesPack;
        RocketPack.ProjectileTrackingStrength = float(TuneDataMissileLauncher.MiniMissilesTrackingStrength);
        RocketPack.SpawnMinDistanceFromStart = TuneDataMissileLauncher.SpawnMiniMissilesMinDistanceFromMyself;
        RocketPack.SpawnDistanceToTargetPos = TuneDataMissileLauncher.SpawnMiniMissilesDistanceToTarget;
        RocketPack.SpawnDelayBetweenProjectiles = TuneDataMissileLauncher.SpawnMiniMissilesDelay;
        RocketPack.SetSeekPosition(SeekTargetPos);        
    }
    else
    {
        SpawnedProjectile.Init(AimDir);
        SpawnedProjectile.Velocity = TuneDataMissileLauncher.SpeedMissile * AimDir;
        SpawnedProjectile.MaxSpeed = TuneDataMissileLauncher.SpeedMissile;
        SpawnedProjectile.GravityZ = 0.0000000;
        SpawnedProjectile.bAlwaysMoveDown = true;
        FireTargetLocation = GetFireTargetLocation();
        FireTargetLocation.Z = Owner.Location.Z - MyCollisionHeight;
        DirToTarget = SpawnLoc - FireTargetLocation;
        DirToTarget.Z = 0.0000000;
        DistanceToTarget = VSize2D(DirToTarget);
        DirToTarget = Normal(DirToTarget);
        PerpendicularDir.X = -DirToTarget.Y;
        PerpendicularDir.Y = DirToTarget.X;
        PerpendicularDir.Z = 0.0000000;
        AccuraccyFirstMissile = TuneDataMissileLauncher.AccuracyFirstMissile;
        AccuraccyLastMissile = TuneDataMissileLauncher.AccuracyLastMissile;
        // End:0x6D4
        if(AccuraccyFirstMissile.Y > (DistanceToTarget - MinDistanceMissileFromVSPawn))
        {
            AccuraccyFirstMissile.Y = DistanceToTarget - MinDistanceMissileFromVSPawn;
        }
        AccuracyRange = Subtract_Vector2DVector2D(AccuraccyFirstMissile, AccuraccyLastMissile);
        RemainingShots = Max(0, RemainingBurstFireCount - NumLastMissilesAtBestAccuracy);
        PctgAccuracy = float(RemainingShots) / float(StartBurstFireCount - NumLastMissilesAtBestAccuracy);
        MissileAccuracy = Add_Vector2DVector2D(AccuraccyLastMissile, Multiply_Vector2DFloat(AccuracyRange, PctgAccuracy));
        SeekTargetPos = FireTargetLocation + (DirToTarget * MissileAccuracy.Y);
        // End:0x805
        if((RemainingBurstFireCount % 2) == 1)
        {
            SeekTargetPos += (PerpendicularDir * MissileAccuracy.X);            
        }
        else
        {
            SeekTargetPos -= (PerpendicularDir * MissileAccuracy.X);
        }
        SpawnedProjectile.SetSeekPosition(SeekTargetPos);
    }
    SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    //return;    
}

function HasBeenPlayerDamaged()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerTargetPawn;

    PlayerTargetPawn = LPPlayerPawn(GetTargetPawn());
    // End:0xA2
    if(PlayerTargetPawn != none)
    {
        // End:0xA2
        if((WorldInfo.TimeSeconds - PlayerTargetPawn.TakeDamageParams.Time) < TuneDataMissileLauncher.TimePlayerConsideredDamagedRecently)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetTargetPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PawnISS, ControllerISS, TargetPawn;

    PawnISS = LPAIPawnVSISS(Owner);
    ControllerISS = LPAIControllerVSISS(PawnISS.Controller);
    // End:0x8D
    if(ControllerISS != none)
    {
        TargetPawn = LPPawn(ControllerISS.FireTarget);
    }
    return TargetPawn;
    //return ReturnValue;    
}

function GetFireTargetLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], TargetPawn;

    TargetPawn = GetTargetPawn();
    // End:0x42
    if(TargetPawn != none)
    {
        return TargetPawn.Location;
    }
    return StartFireTargetLocation;
    //return ReturnValue;    
}

function ComputeStartFireTargetLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn, PawnISS;

    PawnISS = LPAIPawnVSISS(Owner);
    MyCollisionHeight = PawnISS.CylinderComponent.CollisionHeight;
    TargetPawn = GetTargetPawn();
    // End:0xA6
    if(TargetPawn != none)
    {
        StartFireTargetLocation = TargetPawn.Location;
        return;
    }
    StartFireTargetLocation = PawnISS.Location + (Vector(PawnISS.Rotation) * 1500.0000000);
    //return;    
}

static simulated function SpawnTracerEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609], InInstigator, SpawnLocation, SpawnRotation, TargetLoc;

    local /*0x97E50000-0x00000000*/ private float HitDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function GetBulletsShotThisBurst()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return StartBurstFireCount - RemainingBurstFireCount;
    //return ReturnValue;    
}

function GetAIAimDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x7C [Loop If]
    if(I < SpawnedProjectiles.Length)
    {
        // End:0x6E
        if(SpawnedProjectiles[I] != none)
        {
            SpawnedProjectiles[I].DrawDebug(InHUD);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

state WeaponFiringBurst
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        MyVSPawn.EnableCoreById(2, true);
        bInFiringPosition = false;
        bBackToIdle = false;
        BurstInterval = 0.0000000;
        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyVSPawn.EnableCoreById(2, false);
        bInFiringPosition = false;
        MyPawn.EndCurrentSpecialMove();
        super.EndState(NextStateName);
        //return;        
    }

    function StartFiring()
    {
        bInFiringPosition = true;
        ComputeStartFireTargetLocation();
        FireAmmunition();
        // End:0x5A
        if(!IsTimerActive('RefireCheckTimer'))
        {
            SetTimer(GetFireInterval(CurrentFireMode), true, 'RefireCheckTimer');
        }
        //return;        
    }

    simulated function TimeWeaponFiring()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        return;
        //return;        
    }

    simulated function ShouldRefire()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x5A
        if((RemainingBurstFireCount > 0) && HasBeenPlayerDamaged())
        {
            // End:0x5A
            if(float(GetBulletsShotThisBurst()) >= TuneDataMissileLauncher.MinNumberOfMissiles)
            {
                RemainingBurstFireCount = 0;
                return false;
            }
        }
        return global.ShouldRefire();
        //return ReturnValue;        
    }

    simulated function ChooseTipSocket()
    {
        local /*0x97E50000-0x00000000*/ private int Idx;
        local /*0x97E50000-0x00000000*/ private name SocketName;

        // End:0x6C
        if(TipSocketNames.Length > 1)
        {
            Idx = (GetBulletsShotThisBurst()) % TipSocketNames.Length;
            SocketName = TipSocketNames[Idx];
            MuzzleFlashSocketName = SocketName;
            bMuzzleFlashSocketChanged = true;
        }
        //return;        
    }

    simulated function FireAmmunition()
    {
        // End:0x11
        if(!bInFiringPosition)
        {
            return;
        }
        ChooseTipSocket();
        super(SPInventoryWeapon).FireAmmunition();
        //return;        
    }

    function OnSpecialMoveFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSM = false;
        //return;        
    }

    simulated function HandleFinishedFiring()
    {
        // End:0x4E
        if(!bBackToIdle)
        {
            // End:0x4E
            if((myAICtrl != none) && myAICtrl.WantsToKeepFiring(self, CurrentFireMode))
            {
                return;
            }
        }
        super(SPInventoryWeapon).HandleFinishedFiring();
        //return;        
    }

    function GetAIAimDelay()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(MyGFTuneDataWeapon.AimDelay.X, MyGFTuneDataWeapon.AimDelay.Y);
        //return ReturnValue;        
    }
Begin:

    Sleep(GetAIAimDelay());
    bWaitingForSM = true;
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceIn', true, false, OnSpecialMoveFinished);
    J0x55:

    // End:0x6D [Loop If]
    if(bWaitingForSM)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x55;
    }
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceLoop', true, false);
    Sleep(TuneDataMissileLauncher.TimeFireInHoldPosition);
    StartFiring();
    J0xC4:

    // End:0xE4 [Loop If]
    if(float(RemainingBurstFireCount) > 0.0000000)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0xC4;
    }
    TimeStartedSM = WorldInfo.TimeSeconds;
    J0x10C:

    // End:0x163 [Loop If]
    if((WorldInfo.TimeSeconds - TimeStartedSM) < TuneDataMissileLauncher.TimeInHoldPosition)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x10C;
    }
    bWaitingForSM = true;
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceOut', true, false, OnSpecialMoveFinished);
    J0x1AB:

    // End:0x1C3 [Loop If]
    if(bWaitingForSM)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x1AB;
    }
    bBackToIdle = true;
    HandleFinishedFiring();
    stop;            
}

state WeaponFiringSingle
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        MyVSPawn.EnableCoreById(2, true);
        bInFiringPosition = false;
        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyVSPawn.EnableCoreById(2, false);
        bInFiringPosition = false;
        MyPawn.EndCurrentSpecialMove();
        ClearTimer('FireAmmunition', self);
        super(WeaponFiring).EndState(NextStateName);
        //return;        
    }

    simulated function TimeWeaponFiring()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        return;
        //return;        
    }

    simulated function FireAmmunition()
    {
        // End:0x11
        if(!bInFiringPosition)
        {
            return;
        }
        super(SPInventoryWeapon).FireAmmunition();
        //return;        
    }

    function OnSpecialMoveFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSM = false;
        //return;        
    }

    function GetAIAimDelay()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(MyGFTuneDataWeapon.AimDelay.X, MyGFTuneDataWeapon.AimDelay.Y);
        //return ReturnValue;        
    }
Begin:

    Sleep(GetAIAimDelay());
    bWaitingForSM = true;
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceIn', true, false, OnSpecialMoveFinished);
    J0x55:

    // End:0x6D [Loop If]
    if(bWaitingForSM)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x55;
    }
    bInFiringPosition = true;
    SetTimer(TuneDataMissileLauncher.TimeFireInHoldPosition, false, 'FireAmmunition', self);
    TimeStartedSM = WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceLoop', true, false);
    J0xF9:

    // End:0x150 [Loop If]
    if((WorldInfo.TimeSeconds - TimeStartedSM) < TuneDataMissileLauncher.TimeInHoldPosition)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0xF9;
    }
    bWaitingForSM = true;
    MyPawn.DoSpecialMove(Class'LPSM_VSISSLowStanceOut', true, false, OnSpecialMoveFinished);
    J0x198:

    // End:0x1B0 [Loop If]
    if(bWaitingForSM)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x198;
    }
    HandleFinishedFiring();
    stop;        
}

defaultproperties
{
    MinDistanceMissileFromVSPawn=300.0000000
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSMissileLauncher.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSMissileLauncher.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSISSMissileLauncher.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSMissileLauncher.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}