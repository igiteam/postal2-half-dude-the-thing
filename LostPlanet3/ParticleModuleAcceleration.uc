class ParticleModuleAcceleration extends ParticleModuleAccelerationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x00310000-0x00000000*/ private editfixedsize export @NULL Acceleration[65537];
var(*) /*0x00310000-0x00000000*/ private bool bApplyOwnerScale[65537];

defaultproperties
{
    Acceleration=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleAcceleration.DistributionAcceleration'
    begin object name=DistributionAcceleration class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionAcceleration,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}