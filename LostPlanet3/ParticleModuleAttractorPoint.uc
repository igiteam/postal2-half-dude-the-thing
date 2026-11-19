class ParticleModuleAttractorPoint extends ParticleModuleAttractorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Position[65537];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Range[65537];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Strength[65537];
var(*) /*0x03C00000-0x00000000*/ private bool StrengthByDistance[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bAffectBaseVelocity[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bOverrideVelocity[65537];
var(*) /*0x03C00000-0x00000000*/ private bool bUseWorldSpacePosition[65537];

defaultproperties
{
    Position=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleAttractorPoint.DistributionPosition'
    begin object name=DistributionPosition class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionPosition,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorPoint.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorPoint.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StrengthByDistance=true
    bUpdateModule=true
    bSupported3DDrawMode=true
}