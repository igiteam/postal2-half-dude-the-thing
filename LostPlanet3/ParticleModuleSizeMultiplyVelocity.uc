class ParticleModuleSizeMultiplyVelocity extends ParticleModuleSizeBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x47600000-0x00000000*/ private editfixedsize export @NULL VelocityMultiplier[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyX[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyY[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyZ[65537];
var(*) /*0x47600000-0x00000000*/ private @NULL CapMaxSize[65537];
var(*) /*0x47600000-0x00000000*/ private @NULL CapMinSize[65537];

defaultproperties
{
    VelocityMultiplier=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleSizeMultiplyVelocity.DistributionVelocityMultiplier'
    begin object name=DistributionVelocityMultiplier class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionVelocityMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MultiplyX=true
    MultiplyY=true
    MultiplyZ=true
    bSpawnModule=true
    bUpdateModule=true
}