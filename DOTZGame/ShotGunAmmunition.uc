/*****************************************************************
 * ShotGunAmmunition -
 *
 * @version 1.0
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class ShotGunAmmunition extends DOTZAmmunitionBase;

var int sprayrange;

function SpawnProjectileEx(vector Start, rotator Dir, Actor OwnedBy){
   local Projectile newProj;
   local int i;
   local rotator newDir;

   if (infinite == false){
      //  AmmoAmount -= 1;
   }

   newDir.Roll = 0;
   for (i = 0; i < 15; i++){

      //bots do less spray than the user, so they don't kill you as much
      if (bUnderBotControl){
         newDir.Pitch = Dir.Pitch + sprayrange/2 * (Frand() - 0.5);
         newDir.Yaw = Dir.Yaw     + sprayrange/2 * (Frand() - 0.5);
      } else {
         newDir.Pitch = Dir.Pitch + sprayrange * (Frand() - 0.5);
         newDir.Yaw = Dir.Yaw     + sprayrange * (Frand() - 0.5);
      }
      newProj = Spawn(ProjectileClass,,,Start, newDir);
      newProj.Instigator = Pawn(OwnedBy);
      if (newProj != none){
        newProj.Velocity += OwnedBy.Velocity;
        newProj.Acceleration += OwnedBy.Acceleration;
      }
   }
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    sprayrange=4000
    MaxAmmo=32
    ProjectileClass=Class'ShotgunProjectile'
    MyDamageType=Class'DOTZEngine.DOTZBigBulletDamage'
}