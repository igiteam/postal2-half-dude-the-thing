class LPProj_ISSRocketPack extends LPProj_ISSRocket
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumProjectilesToSpawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ProjectileToSpawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ProjectileTrackingStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpeedProjectile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RingRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightSeekTargetPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnMinDistanceFromStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnDistanceToTargetPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnDelayBetweenProjectiles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampLastSpawnedProjectile[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpawningProjectiles[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumProjectilesSpawned[536870913];

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MissileLauncher, SpawnedProjectile, CenterPosition, NewRocketDirection, NewRocketSeekPosition, Rot;

    local /*0x97E50000-0x00000000*/ private float PieceOfPieAngle;
    local /*0x97E50000-0x00000000*/ private int NumProjectilesToSpawnThisFrame;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget, DistanceToMe;

    super.Tick(DeltaTime);
    // End:0x9E
    if(!bSpawningProjectiles)
    {
        DistanceToTarget = VSize(SeekPosition - Location);
        DistanceToMe = VSize(Location - StartPosition);
        // End:0x9E
        if((DistanceToTarget < SpawnDistanceToTargetPos) && DistanceToMe > SpawnMinDistanceFromStart)
        {
            bSpawningProjectiles = true;
        }
    }
    // End:0x3E6
    if(bSpawningProjectiles)
    {
        // End:0x111
        if(SpawnDelayBetweenProjectiles > 0.0000000)
        {
            // End:0x103
            if((WorldInfo.TimeSeconds - TimeStampLastSpawnedProjectile) > SpawnDelayBetweenProjectiles)
            {
                NumProjectilesToSpawnThisFrame = 1;                
            }
            else
            {
                NumProjectilesToSpawnThisFrame = 0;
            }            
        }
        else
        {
            NumProjectilesToSpawnThisFrame = NumProjectilesToSpawn;
        }
        // End:0x3E6
        if(float(NumProjectilesToSpawnThisFrame) > 0.0000000)
        {
            CenterPosition = SeekPosition;
            CenterPosition.Z -= HeightSeekTargetPos;
            PieceOfPieAngle = ((3.1415930 * 2.0000000) * 10430.3800000) / float(NumProjectilesToSpawn);
            MissileLauncher = LPWeaponVSISSMissileLauncher(Owner);
            J0x1B9:

            // End:0x3CC [Loop If]
            if(NumProjectilesToSpawnThisFrame > 0)
            {
                Rot.Yaw = int(float(NumProjectilesSpawned) * PieceOfPieAngle);
                NewRocketDirection = Vector(Rot);
                SpawnedProjectile = LPProj_ISSRocket(Spawn(ProjectileToSpawn, self,, Location));
                MissileLauncher.SpawnedProjectiles.AddItem(SpawnedProjectile);                
                SpawnedProjectile.TrackingStrength = ProjectileTrackingStrength;
                SpawnedProjectile.Init(NewRocketDirection);
                SpawnedProjectile.Velocity = SpeedProjectile * NewRocketDirection;
                SpawnedProjectile.GravityZ = 0.0000000;
                SpawnedProjectile.bAlwaysMoveDown = true;
                NewRocketSeekPosition = CenterPosition + (NewRocketDirection * RingRadius);
                SpawnedProjectile.SetSeekPosition(NewRocketSeekPosition);
                NumProjectilesToSpawnThisFrame--;
                NumProjectilesSpawned++;
                TimeStampLastSpawnedProjectile = WorldInfo.TimeSeconds;
                // [Loop Continue]
                goto J0x1B9;
            }
            // End:0x3E6
            if(NumProjectilesSpawned >= NumProjectilesToSpawn)
            {
                Destroy();
            }
        }
    }
    //return;    
}

defaultproperties
{
    ProjectileTrackingStrength=5.0000000
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_ISSRocketPack.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_ISSRocketPack.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}