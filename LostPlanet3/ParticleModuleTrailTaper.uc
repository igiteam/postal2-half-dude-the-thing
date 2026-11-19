class ParticleModuleTrailTaper extends ParticleModuleTrailBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

enum ETrailTaperMethod
{
    PETTM_None,                     // 0
    PETTM_Full,                     // 1
    PETTM_Partial,                  // 2
    PETTM_MAX                       // 3
};

var(*) /*0x4B530000-0x00000000*/ private byte TaperMethod[65537];
var(*) /*0x4B530000-0x00000000*/ private editfixedsize export @NULL TaperFactor[65537];

defaultproperties
{
    TaperFactor=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTrailTaper.DistributionTaperFactor'
    begin object name=DistributionTaperFactor class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTaperFactor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}