class ParticleModuleLocationPrimitiveBase extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x2F690000-0x00000000*/ private bool Positive_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Positive_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Positive_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Negative_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Negative_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Negative_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool SurfaceOnly[65537];
var(*) /*0x2F690000-0x00000000*/ private bool Velocity[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL VelocityScale[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL StartLocation[65537];

defaultproperties
{
    Positive_X=true
    Positive_Y=true
    Positive_Z=true
    Negative_X=true
    Negative_Y=true
    Negative_Z=true
    VelocityScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveBase.DistributionVelocityScale'
    begin object name=DistributionVelocityScale class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionVelocityScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartLocation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationPrimitiveBase.DistributionStartLocation'
    begin object name=DistributionStartLocation class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionStartLocation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
}