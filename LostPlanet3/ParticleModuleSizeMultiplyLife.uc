class ParticleModuleSizeMultiplyLife extends ParticleModuleSizeBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x47600000-0x00000000*/ private editfixedsize export @NULL LifeMultiplier[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyX[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyY[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyZ[65537];

defaultproperties
{
    LifeMultiplier=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleSizeMultiplyLife.DistributionLifeMultiplier'
    begin object name=DistributionLifeMultiplier class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLifeMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MultiplyX=true
    MultiplyY=true
    MultiplyZ=true
    bSpawnModule=true
    bUpdateModule=true
}