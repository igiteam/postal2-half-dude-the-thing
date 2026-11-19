class ParticleModuleSubUVDirect extends ParticleModuleSubUVBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4AE90000-0x00000000*/ private editfixedsize export @NULL SubUVPosition[65537];
var(*) /*0x4AE90000-0x00000000*/ private editfixedsize export @NULL SubUVSize[65537];

defaultproperties
{
    SubUVPosition=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleSubUVDirect.DistributionSubImagePosition'
    begin object name=DistributionSubImagePosition class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionSubImagePosition,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SubUVSize=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleSubUVDirect.DistributionSubImageSize'
    begin object name=DistributionSubImageSize class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionSubImageSize,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bUpdateModule=true
}