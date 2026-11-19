class ParticleModulePhysicsVolumes extends ParticleModuleWorldForcesBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EParticleLevelInfluenceType
{
    LIT_Never,                      // 0
    LIT_OutsidePhysicsVolumes,      // 1
    LIT_Always,                     // 2
    LIT_MAX                         // 3
};

var(*) /*0x3AA50000-0x00000000*/ private editfixedsize export @NULL GlobalInfluence[65537];
var(*) /*0x3AA50000-0x00000000*/ private byte LevelInfluenceType[65537];

defaultproperties
{
    GlobalInfluence=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModulePhysicsVolumes.DistributionInfluence'
    begin object name=DistributionInfluence class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionInfluence,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bUpdateModule=true
}