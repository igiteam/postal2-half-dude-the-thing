class ParticleModuleEventReceiverSpawn extends ParticleModuleEventReceiverBase
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x48AF0000-0x00000000*/ private editfixedsize export @NULL SpawnCount[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bUseParticleTime[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bUsePSysLocation[65537];
var(*) /*0x4F6F0000-0x00000000*/ private bool bInheritVelocity[65537];
var(*) /*0x4F6F0000-0x00000000*/ private editfixedsize export @NULL InheritVelocityScale[65537];

defaultproperties
{
    SpawnCount=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleEventReceiverSpawn.RequiredDistributionSpawnCount'
    begin object name=RequiredDistributionSpawnCount class=Class'DistributionFloatConstant'
    end object
    Distribution=RequiredDistributionSpawnCount,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    InheritVelocityScale=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleEventReceiverSpawn.RequiredDistributionInheritVelocityScale'
    begin object name=RequiredDistributionInheritVelocityScale class=Class'DistributionVectorConstant'
    end object
    Distribution=RequiredDistributionInheritVelocityScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}