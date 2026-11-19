class InterpTrackInstFloatMaterialParam extends InterpTrackInst;

struct native FloatMaterialParamMICData
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICs[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICResetFloats[131073];

    structdefaultproperties
    {
        MICs=none
        MICResetFloats=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICInfos;
var(*) /*0x35EA0000-0x00000000*/ private @NULL InstancedTrack;
