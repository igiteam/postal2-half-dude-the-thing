class ApexDestructibleDamageParameters extends Object
    hidecategories(Object);

enum EDamageParameterOverrideMode
{
    DPOM_Absolute,                  // 0
    DPOM_Multiplier,                // 1
    DPOM_MAX                        // 2
};

struct native DamageParameters
{
    var(*) /*0x15CE0000-0x00000000*/ private byte OverrideMode[65537];
    var(*) /*0x15CE0000-0x00000000*/ private float BaseDamage[65537];
    var(*) /*0x15CE0000-0x00000000*/ private float Radius[65537];
    var(*) /*0x15CE0000-0x00000000*/ private float Momentum[65537];

    structdefaultproperties
    {
        OverrideMode=EDamageParameterOverrideMode.DPOM_Absolute
        BaseDamage=0.0000000
        Radius=0.0000000
        Momentum=0.0000000
    }
};

struct native DamagePair
{
    var(*) /*0x15CD0000-0x00000000*/ private name DamageCauserName[65537];
    var(*) /*0x15CD0000-0x00000000*/ private @NULL Params[65537];

    structdefaultproperties
    {
        DamageCauserName="None"
        Params=(OverrideMode=EDamageParameterOverrideMode.DPOM_Absolute,BaseDamage=0.0000000,Radius=0.0000000,Momentum=0.0000000)
    }
};

var(*) /*0x03380000-0x00000000*/ private editfixedsize array DamageMap[65537];
