class ParticleModuleUberRainSplashA extends ParticleModuleUberBase
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
var(*) /*0x47600000-0x00000000*/ private editfixedsize export @NULL LifeMultiplier[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL ColorOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private editfixedsize export @NULL AlphaOverLife[65537];

defaultproperties
{
    Lifetime=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleUberRainSplashA.DistributionLifetime'
    begin object name=DistributionLifetime class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionLifetime,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartSize=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberRainSplashA.DistributionStartSize'
    begin object name=DistributionStartSize class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartSize,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartRotation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleUberRainSplashA.DistributionStartRotation'
    begin object name=DistributionStartRotation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartRotation,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MultiplyX=true
    MultiplyY=true
    MultiplyZ=true
    LifeMultiplier=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleUberRainSplashA.DistributionLifeMultiplier'
    begin object name=DistributionLifeMultiplier class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLifeMultiplier,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ColorOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleUberRainSplashA.DistributionColorOverLife'
    begin object name=DistributionColorOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionColorOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    AlphaOverLife=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleUberRainSplashA.DistributionAlphaOverLife'
    begin object name=DistributionAlphaOverLife class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionAlphaOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}