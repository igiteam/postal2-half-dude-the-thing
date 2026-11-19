class ZoneInfo extends Info
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x515B0000-0x00000000*/ private float KillZ[65537];
var(*) /*0x515B0000-0x00000000*/ private float SoftKill[65537];
var(*) /*0x515B0000-0x00000000*/ private class KillZDamageType[65537];
var(*) /*0x515B0000-0x00000000*/ private bool bSoftKillZ[65537];

defaultproperties
{
    KillZ=-262143.0000000
    SoftKill=2500.0000000
    KillZDamageType=Class'KillZDamageType'
    bStatic=true
    bNoDelete=true
    bGameRelevant=true
}