class ParticleModuleAttractorLine extends ParticleModuleAttractorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x03C00000-0x00000000*/ private @NULL EndPoint0[65537];
var(*) /*0x03C00000-0x00000000*/ private @NULL EndPoint1[65537];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Range[65537];
var(*) /*0x03C00000-0x00000000*/ private editfixedsize export @NULL Strength[65537];

defaultproperties
{
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorLine.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleAttractorLine.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bUpdateModule=true
    bSupported3DDrawMode=true
}