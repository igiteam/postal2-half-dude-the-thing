class ParticleModuleParameterDynamic extends ParticleModuleParameterBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EEmitterDynamicParameterValue
{
    EDPV_UserSet,                   // 0
    EDPV_VelocityX,                 // 1
    EDPV_VelocityY,                 // 2
    EDPV_VelocityZ,                 // 3
    EDPV_VelocityMag,               // 4
    EDPV_MAX                        // 5
};

struct native EmitterDynamicParameter
{
    var(*) /*0x1FB60000-0x00000000*/ private const name ParamName[65537];
    var(*) /*0x1FB60000-0x00000000*/ private bool bUseEmitterTime[65537];
    var(*) /*0x1FB60000-0x00000000*/ private bool bSpawnTimeOnly[65537];
    var(*) /*0x1FB60000-0x00000000*/ private byte ValueMethod[65537];
    var(*) /*0x1FB60000-0x00000000*/ private bool bScaleVelocityByParamValue[65537];
    var(*) /*0x1FB60000-0x00000000*/ private editfixedsize export @NULL ParamValue[65537];

    structdefaultproperties
    {
        ParamName="None"
        bUseEmitterTime=false
        bSpawnTimeOnly=false
        ValueMethod=EEmitterDynamicParameterValue.EDPV_UserSet
        bScaleVelocityByParamValue=false
        ParamValue=(Distribution=none,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    }
};

var(*) /*0x3AA30000-0x00000000*/ private editfixedsize export array DynamicParams[4259841];
var(*) /*0x35EA0000-0x00000000*/ private int UpdateFlags;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsesVelocity;

defaultproperties
{
    DynamicParams=/* Array type was not detected. */
    bSpawnModule=true
    bUpdateModule=true
}