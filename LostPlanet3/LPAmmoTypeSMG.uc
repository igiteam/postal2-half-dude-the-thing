class LPAmmoTypeSMG extends LPAmmoTypeDefault;

function SynchronizeTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], AmmoTypeTuneData, LPTDAS, LPWS;

    super.SynchronizeTo(OwnerWeapon, AmmoTypeTuneData);
    LPTDAS = LPTuneDataAmmoSMG(AmmoTypeTuneData);
    LPWS = LPWeaponSMG(OwnerWeapon);
    LPWS.SeekRadius = LPTDAS.SeekRange;
    LPWS.SeekRequiredDot = Cos(LPTDAS.SeekAngle * 0.0174533);
    LPWS.SeekerMaxAccel = LPTDAS.SeekMaxAccel;
    LPWS.SeekerSeekDelay = LPTDAS.SeekDelay;
    LPWS.SeekerLifetime = LPTDAS.Lifetime;
    //return;    
}
