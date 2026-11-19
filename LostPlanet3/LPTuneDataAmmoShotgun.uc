class LPTuneDataAmmoShotgun extends LPTuneDataAmmoDefault
    hidecategories(Object,Object);

var(0.25_Pct) /*0xB80F0000-0x00000000*/ private byte NumPellets[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float SpreadMultiplierADSStandingStill[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float SpreadMultiplierADSMoving[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float SpreadMultiplierStandingStill[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float PelletSpreadHorizontal[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float PelletSpreadVertical[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float PelletLifetime[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private int PelletMaxBounces[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float BounceDamageMultiplier[65537];
var(0.25_Pct) /*0xB80F0000-0x00000000*/ private float PerBounceDamageMultiplier[65537];

defaultproperties
{
    NumPellets=8
    SpreadMultiplierADSStandingStill=0.5000000
    SpreadMultiplierADSMoving=0.6000000
    SpreadMultiplierStandingStill=0.8000000
    PelletSpreadHorizontal=1600.0000000
    PelletSpreadVertical=1500.0000000
    PelletLifetime=0.5000000
    PelletMaxBounces=2
    BounceDamageMultiplier=1.0000000
    PerBounceDamageMultiplier=1.0000000
    AmmoContainerClass=Class'LPAmmoTypeShotgun'
    LocationalDamageParts=/* Array type was not detected. */
}