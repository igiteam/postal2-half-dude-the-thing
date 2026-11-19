class LPTuneDataAmmoParticleThrower extends LPTuneDataAmmoDefault
    hidecategories(Object,Object,VSAmmoReplenishment,AmmoPackReplenishment,AmmoCapacity,InstantFireParams,ProjectileFireParams);

var(0.25_Pct) /*0x25980000-0x00000000*/ private @NULL BeamColorVector[65537];
var(0.25_Pct) /*0x07060000-0x00000000*/ private bool bAmmoTypeDoesArc[65537];
var(0.25_Pct) /*0x07060000-0x00000000*/ private int MaxNumberOfTargetsToArcTo[65537];
var(0.25_Pct) /*0x07060000-0x00000000*/ private float ArcDamageReductionMultiplier[65537];
var(0.25_Pct) /*0x07060000-0x00000000*/ private float ArcSearchRadius[65537];
var(0.25_Pct) /*0x07060000-0x00000000*/ private float ArcDelay[65537];

defaultproperties
{
    BeamColorVector=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    ArcDelay=1.0000000
    AmmoContainerClass=Class'LPAmmoTypeParticleThrower'
    MaxAmmoForWeapon=-1
    AmmoPerMagazine=-1
    LocationalDamageParts=/* Array type was not detected. */
}