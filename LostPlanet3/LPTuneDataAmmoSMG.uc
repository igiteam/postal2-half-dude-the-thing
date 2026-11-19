class LPTuneDataAmmoSMG extends LPTuneDataAmmoDefault
    hidecategories(Object,Object);

var(0.25_Pct) /*0xB04E0000-0x00000000*/ private float SeekAngle[65537];
var(0.25_Pct) /*0xB04E0000-0x00000000*/ private float SeekRange[65537];
var(0.25_Pct) /*0xB04E0000-0x00000000*/ private float SeekMaxAccel[65537];
var(0.25_Pct) /*0xB04E0000-0x00000000*/ private float SeekDelay[65537];
var(0.25_Pct) /*0xB04E0000-0x00000000*/ private float Lifetime[65537];

defaultproperties
{
    SeekAngle=20.0000000
    SeekRange=8000.0000000
    SeekMaxAccel=8000.0000000
    SeekDelay=0.1000000
    Lifetime=3.0000000
    AmmoContainerClass=Class'LPAmmoTypeSMG'
    LocationalDamageParts=/* Array type was not detected. */
}