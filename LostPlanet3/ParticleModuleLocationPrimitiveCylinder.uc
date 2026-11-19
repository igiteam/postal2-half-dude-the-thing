class ParticleModuleLocationPrimitiveCylinder extends ParticleModuleLocationPrimitiveBase
    editinlinenew
    hidecategories(Object,Object,Object,Object);

enum CylinderHeightAxis
{
    PMLPC_HEIGHTAXIS_X,             // 0
    PMLPC_HEIGHTAXIS_Y,             // 1
    PMLPC_HEIGHTAXIS_Z,             // 2
    PMLPC_HEIGHTAXIS_MAX            // 3
};

var(*) /*0x2F690000-0x00000000*/ private bool RadialVelocity[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bAdjustForWorldSpace[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL StartRadius[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL StartHeight[65537];
var(*) /*0x2F690000-0x00000000*/ private byte HeightAxis[65537];

defaultproperties
{
    RadialVelocity=true
    StartRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveCylinder.DistributionStartRadius'
    begin object name=DistributionStartRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStartRadius,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartHeight=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveCylinder.DistributionStartHeight'
    begin object name=DistributionStartHeight class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStartHeight,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    HeightAxis=CylinderHeightAxis.PMLPC_HEIGHTAXIS_Z
    VelocityScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleLocationPrimitiveCylinder.DistributionVelocityScale'
    begin object name=DistributionVelocityScale
    end object
    Distribution=DistributionVelocityScale)
    StartLocation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleLocationPrimitiveCylinder.DistributionStartLocation'
    begin object name=DistributionStartLocation
    end object
    Distribution=DistributionStartLocation)
    bSupported3DDrawMode=true
}