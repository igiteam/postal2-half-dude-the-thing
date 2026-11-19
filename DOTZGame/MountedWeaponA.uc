/*****************************************************************
 * MountedWeaponA -
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class MountedWeaponA extends DOTZFixedWeapon
    config(user);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    TraceEmitterClass=Class'BBParticles.BBPMediumTracer'
    MuzzleFlashEmitterClass=Class'BBParticles.BBPMountedMuzzleFlash'
    bInfiniteAmmo=true
    EffectiveRange=3000
    HitSpread=192.0000000
    AimedOffset=(X=-9.0000000,Y=-8.0000000,Z=-1.0000000)
    AimedFOV=30
    OfficialName="50-Cal."
    AmmoName=Class'MountedWeaponAmmunitionA'
    AttachmentClass=Class'MountedWeaponAttachmentA'
    ItemName="MountedWeaponA"
    Mesh=SkeletalMesh'DOTZAWeapons.MountedGun'
}