class ParticleModuleUberLTISIVCL extends ParticleModuleUberBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x2E920000-0x00000200*/ private editfixedsize export @NULL Lifetime[589825];
var(*) /*0x47600000-0x00000200*/ private editfixedsize export @NULL StartSize[589825];
var(*) /*0x4F6F0000-0x00000200*/ private editfixedsize export @NULL StartVelocity[589825];
var(*) /*0x4F6F0000-0x00000200*/ private editfixedsize export @NULL StartVelocityRadial[589825];
var(*) /*0x13860000-0x00000200*/ private editfixedsize export @NULL ColorOverLife[589825];
var(*) /*0x13860000-0x00000200*/ private editfixedsize export @NULL AlphaOverLife[589825];

defaultproperties
{
    Lifetime=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberLTISIVCL.DistributionLifetime'
    begin object name=DistributionLifetime class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionLifetime,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartSize=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberLTISIVCL.DistributionStartSize'
    begin object name=DistributionStartSize class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartSize,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartVelocity=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberLTISIVCL.DistributionStartVelocity'
    begin object name=DistributionStartVelocity class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartVelocity,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartVelocityRadial=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberLTISIVCL.DistributionStartVelocityRadial'
    begin object name=DistributionStartVelocityRadial class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionStartVelocityRadial,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ColorOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleUberLTISIVCL.DistributionColorOverLife'
    begin object name=DistributionColorOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberLTISIVCL.DistributionAlphaOverLife'
    begin object name=DistributionAlphaOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RequiredModules=/* Array type was not detected. */
    bSpawnModule=true
    bUpdateModule=true
}