class LPAIOD_SpitterFollowPath extends LPAIOD_FollowPath
    editinlinenew
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A4E0000-0x00000000*/ private float MaxAngleToEnemyToFireAt[65537];
var(0.25_Pct) /*0x7A4E0000-0x00000000*/ private float MaxDistToEnemyToFireAt[65537];
var(0.25_Pct) /*0x7A4E0000-0x00000000*/ private float MinTimeBetweenProjectileAttacks[65537];
var(0.25_Pct) /*0x7A4E0000-0x00000000*/ private float MinTimeToStayOnOneTarget[65537];
var(0.25_Pct) /*0x7A4E0000-0x00000000*/ private float MaxTimeToStayOnOneTarget[65537];

defaultproperties
{
    MaxAngleToEnemyToFireAt=45.0000000
    MaxDistToEnemyToFireAt=2000.0000000
    MinTimeBetweenProjectileAttacks=1.0000000
    MinTimeToStayOnOneTarget=2.0000000
    MaxTimeToStayOnOneTarget=5.0000000
    AllowedControllerClasses=/* Array type was not detected. */
}