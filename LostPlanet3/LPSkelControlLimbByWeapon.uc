class LPSkelControlLimbByWeapon extends LPSkelControlLimb
    hidecategories(Object,Object);

struct native PerWeaponEffectorLocationInfo
{
    var(0.25_Pct) /*0xA22D0000-0x00000000*/ private class WeaponClass[65537];
    var(0.25_Pct) /*0xA22D0000-0x00000000*/ private @NULL EffectorLocation[65537];

    structdefaultproperties
    {
        WeaponClass=none
        EffectorLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(0.25_Pct) /*0x84520000-0x00000000*/ private editfixedsize array PerWeaponEffectorLocation[65537];
var(0.25_Pct) /*0x84520000-0x00000000*/ private int CopyEffectorToPerWeaponIndex[65537];
