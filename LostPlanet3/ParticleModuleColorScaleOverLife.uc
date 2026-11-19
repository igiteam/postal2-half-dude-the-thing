class ParticleModuleColorScaleOverLife extends ParticleModuleColorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL ColorScaleOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL AlphaScaleOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private bool bEmitterTime[65537];

defaultproperties
{
    ColorScaleOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleColorScaleOverLife.DistributionColorScaleOverLife'
    begin object name=DistributionColorScaleOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorScaleOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaScaleOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleColorScaleOverLife.DistributionAlphaScaleOverLife'
    begin object name=DistributionAlphaScaleOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaScaleOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
    bCurvesAsColor=true
}