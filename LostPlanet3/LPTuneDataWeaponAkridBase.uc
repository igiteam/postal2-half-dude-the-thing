class LPTuneDataWeaponAkridBase extends SPEngineTuneDataBase
    hidecategories(Object,Object);

struct native AkridBaseProjImpactDamageData
{
    var(0.25_Pct) /*0x04E70000-0x00000000*/ private class PawnTypeAllowedToDamage[65537];
    var(0.25_Pct) /*0x04E70000-0x00000400*/ private editfixedsize @NULL AmmountOfDamageHitPawn[589825];
    var(0.25_Pct) /*0x04E70000-0x00000000*/ private class DamageTypeForImpactHit[65537];

    structdefaultproperties
    {
        PawnTypeAllowedToDamage=none
        AmmountOfDamageHitPawn=none
        DamageTypeForImpactHit=none
    }
};

var(0.25_Pct) /*0x55BF0000-0x00000400*/ private editfixedsize @NULL bExplodeOnImpact[589825];
var(0.25_Pct) /*0x55BF0000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];
var(0.25_Pct) /*0x55BF0000-0x00000000*/ private bool bDrawDebugExplosionRadius[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private bool bAllowedToDestoryOnTakeDamage[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private @NULL InFlightSoundTemplate[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private @NULL TrailTemplate[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private float TrailEmitterLifeSpan[65537];
var(0.25_Pct) /*0x26A10000-0x00000000*/ private editfixedsize array ListOfPawnTypesDamagedOnContact[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private float AkridBaseProjGravityScale[65537];
var(0.25_Pct) /*0x8A710000-0x00000000*/ private int AmountOfDamageToDestroy[65537];

defaultproperties
{
    // Reference: LPExplosion'Default__LPTuneDataWeaponAkridBase.LPExplosion0'
    begin object name=LPExplosion0 class=Class'LPExplosion'
    end object
    ExplosionTemplate=LPExplosion0
    ListOfPawnTypesDamagedOnContact=/* Array type was not detected. */
    AkridBaseProjGravityScale=1.0000000
    AmountOfDamageToDestroy=1
}