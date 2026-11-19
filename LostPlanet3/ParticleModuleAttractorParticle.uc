class ParticleModuleAttractorParticle extends ParticleModuleAttractorBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EAttractorParticleSelectionMethod
{
    EAPSM_Random,                   // 0
    EAPSM_Sequential,               // 1
    EAPSM_MAX                       // 2
};

var(*) /*0x03C00000-0x00000200*/ private name EmitterName[589825];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Range[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bStrengthByDistance[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bAffectBaseVelocity[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bRenewSource[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bInheritSourceVel[65537];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Strength[65537];
var(*) /*0x2F690000-0x00000000*/ private byte SelectionMethod[65537];
var(*) /*0x35EA0000-0x00000000*/ private int LastSelIndex;

defaultproperties
{
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorParticle.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bStrengthByDistance=true
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorParticle.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}