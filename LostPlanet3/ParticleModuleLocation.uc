class ParticleModuleLocation extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL StartLocation[65537];
var(*) /*0x2F690000-0x00000000*/ private float DistributeOverNPoints[65537];
var(*) /*0x2F690000-0x00000000*/ private float DistributeThreshold[65537];

defaultproperties
{
    StartLocation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleLocation.DistributionStartLocation'
    begin object name=DistributionStartLocation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartLocation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bSupported3DDrawMode=true
}