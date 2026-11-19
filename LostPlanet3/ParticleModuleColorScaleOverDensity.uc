class ParticleModuleColorScaleOverDensity extends ParticleModuleColorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL ColorScaleOverDensity[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL AlphaScaleOverDensity[65537];

defaultproperties
{
    ColorScaleOverDensity=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleColorScaleOverDensity.DistributionColorScaleOverDensity'
    begin object name=DistributionColorScaleOverDensity class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorScaleOverDensity,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaScaleOverDensity=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleColorScaleOverDensity.DistributionAlphaScaleOverDensity'
    begin object name=DistributionAlphaScaleOverDensity class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaScaleOverDensity,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}