class DamageType extends Object
    abstract;

var(*) /*0x15D90000-0x00000000*/ private bool bArmorStops[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCausedByWorld;
var(*) /*0x35EA0000-0x00000000*/ private bool bExtraMomentumZ;
var(*) /*0x15D90000-0x00000000*/ private bool bCausesFracture[65537];
var(*) /*0x42100000-0x00000000*/ private bool bRadialDamageVelChange[65537];
var(*) /*0x42100000-0x00000000*/ private float KDamageImpulse[65537];
var(*) /*0x42100000-0x00000000*/ private float KDeathVel[65537];
var(*) /*0x42100000-0x00000000*/ private float KDeathUpKick[65537];
var(*) /*0x42100000-0x00000000*/ private float RadialDamageImpulse[65537];
var(*) /*0x35EA0000-0x00000000*/ private float VehicleDamageScaling;
var(*) /*0x35EA0000-0x00000000*/ private float VehicleMomentumScaling;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DamagedFFWaveform;
var(*) /*0x35EA0000-0x00000000*/ private @NULL KilledFFWaveform;
var(*) /*0x35EA0000-0x00000000*/ private float FracturedMeshDamage;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PreventDamageToClassType;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OnlyDoDamageToClassType;

static function VehicleDamageScalingFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return default.VehicleDamageScaling;
    //return ReturnValue;    
}

static function DoesDamageTypeHurtMyClass()
{
    local /*0x35EA0000-0x00000000*/ private class ClassType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x78
    if(default.OnlyDoDamageToClassType.Length > 0)
    {
        // End:0x21
        if(ClassType == none)
        {
            return false;
        }
        I = 0;
        J0x2C:

        // End:0x76 [Loop If]
        if(I < default.OnlyDoDamageToClassType.Length)
        {
            // End:0x68
            if(ClassIsChildOf(ClassType, default.OnlyDoDamageToClassType[I]))
            {
                return true;
            }
            I++;
            // [Loop Continue]
            goto J0x2C;
        }
        return false;
    }
    // End:0xF0
    if(default.PreventDamageToClassType.Length > 0)
    {
        // End:0x99
        if(ClassType == none)
        {
            return true;
        }
        I = 0;
        J0xA4:

        // End:0xEE [Loop If]
        if(I < default.PreventDamageToClassType.Length)
        {
            // End:0xE0
            if(ClassIsChildOf(ClassType, default.PreventDamageToClassType[I]))
            {
                return false;
            }
            I++;
            // [Loop Continue]
            goto J0xA4;
        }
        return true;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bArmorStops=true
    bExtraMomentumZ=true
    KDamageImpulse=800.0000000
    VehicleDamageScaling=1.0000000
    VehicleMomentumScaling=1.0000000
    FracturedMeshDamage=1.0000000
}