class LPAIOD_DongoFollowPath extends LPAIOD_FollowPath
    editinlinenew
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A430000-0x00000000*/ private bool bRollingLocomotion[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowAttackEmptyRig;
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MinTimeBetweenConsecutiveCharges[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MinFollowPathTimeBeforeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MaxFollowPathTimeBeforeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MinDistanceFromVSToChargeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MinDistanceFromPOFToChargeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MinTimeToAttackPOFOnSuccessfulChargeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float MaxTimeToAttackPOFOnSuccessfulChargeAttack[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float ChanceOfTripAfterChargeAttackMiss[65537];
var(0.25_Pct) /*0x7A430000-0x00000000*/ private float PostChargeShakeoffTime[65537];

defaultproperties
{
    bRollingLocomotion=true
    MinTimeBetweenConsecutiveCharges=3.0000000
    MinFollowPathTimeBeforeAttack=7.0000000
    MaxFollowPathTimeBeforeAttack=12.0000000
    MinDistanceFromVSToChargeAttack=3000.0000000
    MinDistanceFromPOFToChargeAttack=1500.0000000
    MinTimeToAttackPOFOnSuccessfulChargeAttack=16.0000000
    MaxTimeToAttackPOFOnSuccessfulChargeAttack=22.0000000
    ChanceOfTripAfterChargeAttackMiss=0.4000000
    AllowedControllerClasses=/* Array type was not detected. */
}