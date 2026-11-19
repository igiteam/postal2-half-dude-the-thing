class ParticleModuleUberLTISIVCLILIRSSBLIRR extends ParticleModuleUberBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x2E920000-0x00000200*/ private editfixedsize export @NULL Lifetime[589825];
var(*) /*0x47600000-0x00000200*/ private editfixedsize export @NULL StartSize[589825];
var(*) /*0x4F6F0000-0x00000200*/ private editfixedsize export @NULL StartVelocity[589825];
var(*) /*0x4F6F0000-0x00000200*/ private editfixedsize export @NULL StartVelocityRadial[589825];
var(*) /*0x13860000-0x00000200*/ private editfixedsize export @NULL ColorOverLife[589825];
var(*) /*0x13860000-0x00000200*/ private editfixedsize export @NULL AlphaOverLife[589825];
var(*) /*0x2F690000-0x00000200*/ private editfixedsize export @NULL StartLocation[589825];
var(*) /*0x42510000-0x00000200*/ private editfixedsize export @NULL StartRotation[589825];
var(*) /*0x47600000-0x00000200*/ private editfixedsize export @NULL SizeLifeMultiplier[589825];
var(*) /*0x47600000-0x00000000*/ private bool SizeMultiplyX[65537];
var(*) /*0x47600000-0x00000000*/ private bool SizeMultiplyY[65537];
var(*) /*0x47600000-0x00000000*/ private bool SizeMultiplyZ[65537];
var(*) /*0x42510000-0x00000200*/ private editfixedsize export @NULL StartRotationRate[589825];

defaultproperties
{
    Lifetime=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionLifetime'
    begin object name=DistributionLifetime class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionLifetime,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartSize=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartSize'
    begin object name=DistributionStartSize class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartSize,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartVelocity=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartVelocity'
    begin object name=DistributionStartVelocity class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartVelocity,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartVelocityRadial=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartVelocityRadial'
    begin object name=DistributionStartVelocityRadial class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionStartVelocityRadial,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ColorOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionColorOverLife'
    begin object name=DistributionColorOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionAlphaOverLife'
    begin object name=DistributionAlphaOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartLocation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartLocation'
    begin object name=DistributionStartLocation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartLocation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartRotation=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartRotation'
    begin object name=DistributionStartRotation class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionStartRotation,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SizeLifeMultiplier=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionLifeMultiplier'
    begin object name=DistributionLifeMultiplier class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLifeMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SizeMultiplyX=true
    SizeMultiplyY=true
    SizeMultiplyZ=true
    StartRotationRate=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberLTISIVCLILIRSSBLIRR.DistributionStartRotationRate'
    begin object name=DistributionStartRotationRate class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStartRotationRate,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RequiredModules=/* Array type was not detected. */
    bSpawnModule=true
    bUpdateModule=true
}