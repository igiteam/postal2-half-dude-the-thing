/*****************************************************************
 * ShotgunWeapon -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class ShotgunWeapon extends DOTZGunWeapon
    config(user);

/*****************************************************************
 *
 *****************************************************************
 */
function ProjectileFire(){
    local Vector Start, X,Y,Z;
    local Actor HitActor;
    local vector HitLocation, HitNormal;

    Owner.MakeNoise(1.0);
    GetAxes(Instigator.GetViewRotation(),X,Y,Z);
    Start = GetFireStart(X,Y,Z);
    AdjustedAim = Instigator.AdjustAim(AmmoType, Start, AimError);
    //added some effects nonsense here
    DrawTraceEffect(vect(0,0,0));

    //special case (if the guy is right in front of you!)
    HitActor = Trace(HitLocation,HitNormal,Start*150, Start,true);
    if (HitActor !=None && Pawn(HitActor) != None){
       HitActor.TakeDamage(1000,instigator,HitLocation,X*1000,none);
    }

    AdvancedAmmunition(AmmoType).SpawnProjectileEx(Start,AdjustedAim, instigator);
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PawnAnimationPackage="DOTZAHumans.3PShotgun"
    FireAnimName="ShotgunFire"
    StandIdleAnimName="ShotgunStandIdle"
    CrouchIdleAnimName="ShotgunCrouchIdle"
    HitAnimName="ShotgunHit"
    WeaponMode=1
    MuzzleFlashEmitterClass=Class'BBParticles.BBPShotgunMuzzleFlash'
    iMinInaccuracy=1.0000000
    AimedOffset=(X=-9.0000000,Y=-3.0000000,Z=-1.0000000)
    OfficialName="Shotgun"
    AmmoName=Class'ShotGunAmmunition'
    PickupAmmoCount=4
    ReloadCount=4
    AutoSwitchPriority=6
    FireOffset=(X=23.0000000,Y=4.0000000,Z=0.0000000)
    InventoryGroup=6
    PickupClass=Class'ShotgunPickup'
    AttachmentClass=Class'ShotgunAttachment'
    ItemName="Shotgun"
    Mesh=SkeletalMesh'DOTZAWeapons.shotgun'
}