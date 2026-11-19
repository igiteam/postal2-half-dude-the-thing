class LPProj_Rocket extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSeeking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLockedSeekPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStopTrackingAfterMovingPassedPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlwaysMoveDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SeekTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SeekPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceCloseEnough;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TrackingStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InitialDir;

// Export ULPProj_Rocket::execSpawnTrail(FFrame&, void* const)
protected native simulated function SpawnTrail();

simulated function PostBeginPlay()
{
    super(SPInventoryProjectile).PostBeginPlay();
    bExploded = false;
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

simulated function HandleProjectileAkridAssist()
{
    //return;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    DoExplosion();
    //return;    
}

simulated function DoExplosion()
{
    // End:0x0F
    if(bExploded)
    {
        return;
    }
    bExploded = true;
    super.DoExplosion();
    StopInFlightAudio();
    StopTrailEmitter();
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_positionTracker');
    //return ReturnValue;    
}

simulated function GetExplosionSpawnLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetVisibleLocation();
    //return ReturnValue;    
}

simulated function GetExplosionSpawnRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1D
    if(IsZero(Velocity))
    {
        return super.GetExplosionSpawnRotation();        
    }
    else
    {
        return Rotator(-Velocity);
    }
    //return ReturnValue;    
}

simulated function InitExplosionActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InExplosion[8388609];

    InExplosion.bNoDecalOnMissingSurface = true;
    InExplosion.ForcedSurfaceCheckDelta = (Velocity * WorldInfo.DeltaSeconds) * 2.0000000;
    // End:0xD2
    if(VSizeSq(InExplosion.ForcedSurfaceCheckDelta) > (200.0000000 * 200.0000000))
    {
        InExplosion.ForcedSurfaceCheckDelta = Normal(Velocity) * 200.0000000;
    }
    //return;    
}

function NotifyShootDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];

    // End:0xB1
    if((WorldInfo.Game != none) && LPGameMP_Base(WorldInfo.Game) != none)
    {
        // End:0xB1
        if(PlayerController(InstigatedBy) != none)
        {
            LPGameMP_Base(WorldInfo.Game).NotifyRocketManAward(InstigatedBy);
        }
    }
    //return;    
}

simulated function SetSeekTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeekTarget[8388609];

    SeekTarget = InSeekTarget;
    bSeeking = SeekTarget != none;
    bLockedSeekPosition = false;
    //return;    
}

simulated function SetSeekPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeekPosition[8388609];

    StartPosition = Location;
    SeekTarget = none;
    SeekPosition = InSeekPosition;
    bSeeking = SeekPosition != vect(0.0000000, 0.0000000, 0.0000000);
    bLockedSeekPosition = false;
    //return;    
}

defaultproperties
{
    DistanceCloseEnough=50.0000000
    MinSpeed=1000.0000000
    TrackingStrength=3.0000000
    bIsGrenade=false
    bWantsMeshUsingPhysX=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_Rocket.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_Rocket.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bBounce=false
    LifeSpan=6.0000000
    CollisionComponent=CollisionCylinder
}