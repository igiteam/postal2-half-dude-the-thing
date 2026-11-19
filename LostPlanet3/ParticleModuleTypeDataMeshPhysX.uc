class ParticleModuleTypeDataMeshPhysX extends ParticleModuleTypeDataMesh
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object,Object);

enum EPhysXMeshRotationMethod
{
    PMRM_Disabled,                  // 0
    PMRM_Spherical,                 // 1
    PMRM_Box,                       // 2
    PMRM_LongBox,                   // 3
    PMRM_FlatBox,                   // 4
    PMRM_Velocity,                  // 5
    PMRM_MAX                        // 6
};

var(*) /*0x3C620000-0x00000000*/ private @NULL PhysXParSys[65537];
var(*) /*0x3C620000-0x00000000*/ private byte PhysXRotationMethod[65537];
var(*) /*0x3C620000-0x00000000*/ private float FluidRotationCoefficient[65537];
var(*) /*0x3C620000-0x00000000*/ private @NULL VerticalLod[65537];
var(*) /*0x3C620000-0x00000000*/ private float ZOffset[65537];

defaultproperties
{
    PhysXRotationMethod=EPhysXMeshRotationMethod.PMRM_Spherical
    FluidRotationCoefficient=5.0000000
    VerticalLod=(WeightForFifo=1.0000000,WeightForSpawnLod=1.0000000,SpawnLodRateVsLifeBias=1.0000000,RelativeFadeoutTime=0.0000000)
}