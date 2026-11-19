class ParticleModuleCameraOffset extends ParticleModuleCameraBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EParticleCameraOffsetUpdateMethod
{
    EPCOUM_DirectSet,               // 0
    EPCOUM_Additive,                // 1
    EPCOUM_Scalar,                  // 2
    EPCOUM_MAX                      // 3
};

var(*) /*0x10A20000-0x00000000*/ private editfixedsize export @NULL CameraOffset[65537];
var(*) /*0x10A20000-0x00000000*/ private bool bSpawnTimeOnly[65537];
var(*) /*0x10A20000-0x00000000*/ private byte UpdateMethod[65537];

defaultproperties
{
    CameraOffset=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleCameraOffset.DistributionCameraOffset'
    begin object name=DistributionCameraOffset class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionCameraOffset,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}