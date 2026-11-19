class LPAmmoTypeParticleThrower extends LPAmmoTypeDefault;

function SynchronizeTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], AmmoTypeTuneData, LPTDAPT, LPWPT;

    super.SynchronizeTo(OwnerWeapon, AmmoTypeTuneData);
    LPTDAPT = LPTuneDataAmmoParticleThrower(AmmoTypeTuneData);
    LPWPT = LPWeaponParticleThrower(OwnerWeapon);
    LPWPT.ArcDelay = LPTDAPT.ArcDelay;
    LPWPT.ArcRadius = 512.0000000;
    LPWPT.ArcDamageReduction = 0.5000000;
    LPWPT.ArcTargets = LPTDAPT.MaxNumberOfTargetsToArcTo;
    LPWPT.SetBeamColorVector(LPTDAPT.BeamColorVector);
    LPWPT.ArcTargetInfos.Insert(0, LPWPT.ArcTargets);    
    LPWPT.InstantHitDamage[0] = float(((LPWPT.IsPreOrderWeapon()) ? 40 : 35));
    //return;    
}
