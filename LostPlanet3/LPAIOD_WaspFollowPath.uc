class LPAIOD_WaspFollowPath extends LPAIOD_FollowPath
    editinlinenew
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A500000-0x00000000*/ private float MaxAngleToEnemyToFireAt[65537];
var(0.25_Pct) /*0x7A500000-0x00000000*/ private float MaxDistToEnemyToFireAt[65537];
var(0.25_Pct) /*0x7A500000-0x00000000*/ private float MinTimeBetweenProjectileAttacks[65537];
var(0.25_Pct) /*0x7A500000-0x00000000*/ private int MaxNumOfAttackers[65537];
var(0.25_Pct) /*0x7A500000-0x00000000*/ private bool bUseSwoopFlyAnimation[65537];

defaultproperties
{
    MaxAngleToEnemyToFireAt=45.0000000
    MaxDistToEnemyToFireAt=4000.0000000
    MinTimeBetweenProjectileAttacks=1.0000000
    MaxNumOfAttackers=2
    bUseSwoopFlyAnimation=true
    AllowedControllerClasses=/* Array type was not detected. */
}