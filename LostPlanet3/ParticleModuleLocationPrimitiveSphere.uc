class ParticleModuleLocationPrimitiveSphere extends ParticleModuleLocationPrimitiveBase
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL StartRadius[65537];

defaultproperties
{
    StartRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveSphere.DistributionStartRadius'
    begin object name=DistributionStartRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStartRadius,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    VelocityScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveSphere.DistributionVelocityScale'
    begin object name=DistributionVelocityScale
    end object
    Distribution=DistributionVelocityScale)
    StartLocation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationPrimitiveSphere.DistributionStartLocation'
    begin object name=DistributionStartLocation
    end object
    Distribution=DistributionStartLocation)
    bSupported3DDrawMode=true
}