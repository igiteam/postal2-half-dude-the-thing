class ParticleModuleVelocityCone extends ParticleModuleVelocityBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x13FB0000-0x00000000*/ private editfixedsize export @NULL Angle[65537];
var(*) /*0x13FB0000-0x00000000*/ private editfixedsize export @NULL Velocity[65537];
var(*) /*0x13FB0000-0x00000000*/ private @NULL Direction[65537];

defaultproperties
{
    Angle=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleVelocityCone.DistributionAngle'
    begin object name=DistributionAngle class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionAngle,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Velocity=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleVelocityCone.DistributionVelocity'
    begin object name=DistributionVelocity class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionVelocity,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Direction=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    bSpawnModule=true
    bSupported3DDrawMode=true
}