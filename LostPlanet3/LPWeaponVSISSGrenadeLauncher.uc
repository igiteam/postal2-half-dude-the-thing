class LPWeaponVSISSGrenadeLauncher extends LPBaseVSISSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataGrenadeLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCharged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadesDontJump[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeShoulderHold[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeShoulderUpAfterFire[536870913];

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
    TuneDataGrenadeLauncher = LPTuneDataWeaponVSISSGrenadeLauncher(TuneData);
    TimeShoulderHold = TuneDataGrenadeLauncher.TimeShoulderHold;
    TimeShoulderUpAfterFire = TuneDataGrenadeLauncher.TimeShoulderUpAfterFire;
    //return;    
}

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, SpawnedProjectile;

    SpawnedProjectile = LPProj_ISSGrenade(Spawn(GetProjectileClass(), self,, SpawnLoc));
    // End:0x1B1
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        AimDir += vect(0.0000000, 0.0000000, 10.0000000);
        AimDir *= 0.0100000;
        SpawnedProjectile.Init(AimDir);
        SpawnedProjectile.bDontJump = bGrenadesDontJump;
        SpawnedProjectile.Velocity = (VSize(SpawnLoc - SPGFCoverAIController(Instigator.Controller).GetAimLocation()) * 1.2000000) * AimDir;
        SpawnedProjectile.AddSpin(-Vector(RotRand(true)) * (float(12) + (FRand() * float(4))));
        SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    }
    //return;    
}

function LeftShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

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
        if((WorldInfo.TimeSeconds - PlayerTargetPawn.TakeDamageParams.Time) < TuneDataGrenadeLauncher.TimePlayerConsideredDamagedRecently)
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

simulated state WeaponFiring
{
    ignores BeginState;

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyVSPawn.PlayShoulderDownAnimation();
        super.EndState(NextStateName);
        //return;        
    }

    function LeftShoulderUpAnimFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
        local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
        local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

        bWaitingForAnim = false;
        //return;        
    }

    simulated function EndFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        super(SPInventoryWeapon).EndFire(FireModeNum);
        HandleFinishedFiring();
        //return;        
    }

    simulated function FireAmmunition()
    {
        super(SPInventoryWeapon).FireAmmunition();
        // End:0x47
        if((float(RemainingBurstFireCount) <= 0.0000000) || AmmoLeftInMagazine <= 0)
        {
            SetTimer(TimeShoulderUpAfterFire, false, 'RefireCheckTimer');
        }
        //return;        
    }

    simulated function ShouldRefire()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x64
        if((RemainingBurstFireCount > 0) && HasBeenPlayerDamaged())
        {
            // End:0x64
            if(float(StartBurstFireCount - RemainingBurstFireCount) >= TuneDataGrenadeLauncher.MinNumberOfGrenades)
            {
                RemainingBurstFireCount = 0;
                return false;
            }
        }
        return global.ShouldRefire();
        //return ReturnValue;        
    }
Begin:

    bWaitingForAnim = true;
    MyVSPawn.PlayShoulderUpAnimation(LeftShoulderUpAnimFinished);
    J0x3C:

    // End:0x54 [Loop If]
    if(bWaitingForAnim)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x3C;
    }
    TimeStartedAnim = WorldInfo.TimeSeconds;
    MyVSPawn.PlayShoulderHoldAnimation();
    J0x9B:

    // End:0xDD [Loop If]
    if((WorldInfo.TimeSeconds - TimeStartedAnim) < TimeShoulderHold)
    {
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x9B;
    }
    // End:0x15E
    if(MyVSPawn.TransitionComponent.IsDoingTransition())
    {
        J0x114:

        // End:0x156 [Loop If]
        if(MyVSPawn.TransitionComponent.IsDoingTransition())
        {
            Sleep(0.0000000);
            // [Loop Continue]
            goto J0x114;
        }
        Sleep(0.5000000);
    }
    FireAmmunition();
    TimeWeaponFiring(CurrentFireMode);
    stop;                    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSGrenadeLauncher.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSGrenadeLauncher.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSISSGrenadeLauncher.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSGrenadeLauncher.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}