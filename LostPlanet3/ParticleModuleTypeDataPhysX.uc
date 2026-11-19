class ParticleModuleTypeDataPhysX extends ParticleModuleTypeDataBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

struct native PhysXEmitterVerticalLodProperties
{
    var(*) /*0x3C630000-0x00000000*/ private float WeightForFifo[65537];
    var(*) /*0x3C630000-0x00000000*/ private float WeightForSpawnLod[65537];
    var(*) /*0x3C630000-0x00000000*/ private float SpawnLodRateVsLifeBias[65537];
    var(*) /*0x3C630000-0x00000000*/ private float RelativeFadeoutTime[65537];

    structdefaultproperties
    {
        WeightForFifo=1.0000000
        WeightForSpawnLod=1.0000000
        SpawnLodRateVsLifeBias=1.0000000
        RelativeFadeoutTime=0.0000000
    }
};

var(*) /*0x3C620000-0x00000000*/ private @NULL PhysXParSys[65537];
var(*) /*0x3C620000-0x00000000*/ private @NULL VerticalLod[65537];

defaultproperties
{
    VerticalLod=(WeightForFifo=1.0000000,WeightForSpawnLod=1.0000000,SpawnLodRateVsLifeBias=1.0000000,RelativeFadeoutTime=0.0000000)
}