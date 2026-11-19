class InterpTrackInstVectorMaterialParam extends InterpTrackInst;

struct native VectorMaterialParamMICData
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICs[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICResetVectors[131073];

    structdefaultproperties
    {
        MICs=none
        MICResetVectors=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MICInfos;
var(*) /*0x35EA0000-0x00000000*/ private @NULL InstancedTrack;
