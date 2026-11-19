class ParticleModuleLocationDirect extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL Location[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL LocationOffset[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL ScaleFactor[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL Direction[65537];

defaultproperties
{
    Location=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleLocationDirect.DistributionLocation'
    begin object name=DistributionLocation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionLocation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    LocationOffset=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationDirect.DistributionLocationOffset'
    begin object name=DistributionLocationOffset class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLocationOffset,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ScaleFactor=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationDirect.DistributionScaleFactor'
    begin object name=DistributionScaleFactor class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionScaleFactor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Direction=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleLocationDirect.DistributionDirection'
    begin object name=DistributionDirection class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionDirection,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}