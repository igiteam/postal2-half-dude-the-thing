class LPAmmoTypeShotgun extends LPAmmoTypeDefault;

function SynchronizeTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OwnerWeapon[8388609], AmmoTypeTuneData, LPTDAS, LPWS;

    super.SynchronizeTo(OwnerWeapon, AmmoTypeTuneData);
    LPTDAS = LPTuneDataAmmoShotgun(AmmoTypeTuneData);
    LPWS = LPWeaponShotgun(OwnerWeapon);
    LPWS.NumPellets = LPTDAS.NumPellets;
    LPWS.PelletLifetime = LPTDAS.PelletLifetime;
    LPWS.HorizontalPelletSpread = int(LPTDAS.PelletSpreadHorizontal);
    LPWS.VerticalPelletSpread = int(LPTDAS.PelletSpreadVertical);
    LPWS.ADSStandingStillSpreadMultiplier = LPTDAS.SpreadMultiplierADSStandingStill;
    LPWS.ADSMovingSpreadMultiplier = LPTDAS.SpreadMultiplierADSMoving;
    LPWS.StandingStillSpreadMultiplier = LPTDAS.SpreadMultiplierStandingStill;
    LPWS.PelletBounceDamageMultiplier = LPTDAS.BounceDamageMultiplier;
    LPWS.PelletPerBounceDamageMultiplier = LPTDAS.PerBounceDamageMultiplier;
    //return;    
}
