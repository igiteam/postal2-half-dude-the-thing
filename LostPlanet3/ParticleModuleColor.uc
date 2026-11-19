class ParticleModuleColor extends ParticleModuleColorBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL StartColor[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL StartAlpha[65537];
var(*) /*0x13860000-0x00000000*/ private bool bClampAlpha[65537];

defaultproperties
{
    StartColor=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleColor.DistributionStartColor'
    begin object name=DistributionStartColor class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionStartColor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartAlpha=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleColor.DistributionStartAlpha'
    begin object name=DistributionStartAlpha class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStartAlpha,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bClampAlpha=true
    bSpawnModule=true
    bCurvesAsColor=true
}