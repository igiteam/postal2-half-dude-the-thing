class ParticleModuleVelocity extends ParticleModuleVelocityBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4F6F0000-0x00000000*/ private editfixedsize export @NULL StartVelocity[65537];
var(*) /*0x4F6F0000-0x00000000*/ private editfixedsize export @NULL StartVelocityRadial[65537];

defaultproperties
{
    StartVelocity=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleVelocity.DistributionStartVelocity'
    begin object name=DistributionStartVelocity class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartVelocity,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartVelocityRadial=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleVelocity.DistributionStartVelocityRadial'
    begin object name=DistributionStartVelocityRadial class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionStartVelocityRadial,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
}