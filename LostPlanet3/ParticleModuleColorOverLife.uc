class ParticleModuleColorOverLife extends ParticleModuleColorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL ColorOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL AlphaOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private bool bClampAlpha[65537];

defaultproperties
{
    ColorOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleColorOverLife.DistributionColorOverLife'
    begin object name=DistributionColorOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleColorOverLife.DistributionAlphaOverLife'
    begin object name=DistributionAlphaOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bClampAlpha=true
    bSpawnModule=true
    bUpdateModule=true
    bCurvesAsColor=true
}