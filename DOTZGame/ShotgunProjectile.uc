/**
 * ShotgunProjectile -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Nov 2003
 */
class ShotgunProjectile extends DOTZProjectileBase;


/*****************************************************************
 * PostBeginPlay
 * Give your newly spawned projectile a velocity
 *****************************************************************
 */
function PostBeginPlay()
{
   local vector Dir;

   //Give your projectile a velocity
   Dir = vector(Rotation);
   velocity += speed * Dir;
   Super.PostBeginPlay();
}

/*****************************************************************
 * Landed
 *****************************************************************
 */
simulated function Landed( vector HitNormal ){
   HitWall( HitNormal, None );
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ExplosionEmitter=Class'BBParticles.BBPBulletBasicTank'
    BloodEmitter=Class'BBParticles.BBPImpactFlesh'
    Speed=25000.0000000
    TossZ=20.0000000
    Damage=70.0000000
    DamageRadius=50.0000000
    MomentumTransfer=10000.0000000
    DrawType=8
    LifeSpan=0.4000000
    DrawScale=0.5000000
}