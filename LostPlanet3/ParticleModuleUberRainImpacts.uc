class ParticleModuleUberRainImpacts extends ParticleModuleUberBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x2E920000-0x00000000*/ private editfixedsize export @NULL Lifetime[65537];
var(*) /*0x47600000-0x00000000*/ private editfixedsize export @NULL StartSize[65537];
var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL StartRotation[65537];
var(*) /*0x42510000-0x00000000*/ private bool bInheritParent[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyX[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyY[65537];
var(*) /*0x47600000-0x00000000*/ private bool MultiplyZ[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bIsUsingCylinder[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bSurfaceOnly[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bVelocity[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bRadialVelocity[65537];
var(*) /*0x47600000-0x00000000*/ private editfixedsize export @NULL LifeMultiplier[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL PC_VelocityScale[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL PC_StartLocation[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL PC_StartRadius[65537];
var(*) /*0x2F690000-0x00000000*/ private editfixedsize export @NULL PC_StartHeight[65537];
var(*) /*0x2F690000-0x00000000*/ private byte PC_HeightAxis[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL ColorOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL AlphaOverLife[65537];

defaultproperties
{
    Lifetime=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberRainImpacts.DistributionLifetime'
    begin object name=DistributionLifetime class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionLifetime,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartSize=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberRainImpacts.DistributionStartSize'
    begin object name=DistributionStartSize class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartSize,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartRotation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberRainImpacts.DistributionStartRotation'
    begin object name=DistributionStartRotation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartRotation,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MultiplyX=true
    MultiplyY=true
    MultiplyZ=true
    bIsUsingCylinder=true
    bPositive_X=true
    bPositive_Y=true
    bPositive_Z=true
    bNegative_X=true
    bNegative_Y=true
    bNegative_Z=true
    bRadialVelocity=true
    LifeMultiplier=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleUberRainImpacts.DistributionLifeMultiplier'
    begin object name=DistributionLifeMultiplier class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLifeMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    PC_VelocityScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberRainImpacts.DistributionPC_VelocityScale'
    begin object name=DistributionPC_VelocityScale class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionPC_VelocityScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    PC_StartLocation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleUberRainImpacts.DistributionPC_StartLocation'
    begin object name=DistributionPC_StartLocation class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionPC_StartLocation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    PC_StartRadius=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberRainImpacts.DistributionPC_StartRadius'
    begin object name=DistributionPC_StartRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionPC_StartRadius,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    PC_StartHeight=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberRainImpacts.DistributionPC_StartHeight'
    begin object name=DistributionPC_StartHeight class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionPC_StartHeight,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    PC_HeightAxis=CylinderHeightAxis.PMLPC_HEIGHTAXIS_Z
    ColorOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleUberRainImpacts.DistributionColorOverLife'
    begin object name=DistributionColorOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberRainImpacts.DistributionAlphaOverLife'
    begin object name=DistributionAlphaOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
    bSupported3DDrawMode=true
}