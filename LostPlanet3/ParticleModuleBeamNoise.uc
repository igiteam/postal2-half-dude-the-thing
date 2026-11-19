class ParticleModuleBeamNoise extends ParticleModuleBeamBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x30060000-0x00000000*/ private bool bLowFreq_Enabled[65537];
var(*) /*0x30060000-0x00000000*/ private bool bNRScaleEmitterTime[65537];
var(*) /*0x30060000-0x00000000*/ private bool bSmooth[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNoiseLock[131073];
var(*) /*0x30060000-0x00000000*/ private bool bOscillate[65537];
var(*) /*0x30060000-0x00000000*/ private bool bUseNoiseTangents[65537];
var(*) /*0x30060000-0x00000000*/ private bool bTargetNoise[65537];
var(*) /*0x30060000-0x00000000*/ private bool bApplyNoiseScale[65537];
var(*) /*0x30060000-0x00000000*/ private int Frequency[65537];
var(*) /*0x30060000-0x00000000*/ private int Frequency_LowRange[65537];
var(*) /*0x30060000-0x00000000*/ private editfixedsize export @NULL NoiseRange[65537];
var(*) /*0x30060000-0x00000000*/ private editfixedsize export @NULL NoiseRangeScale[65537];
var(*) /*0x30060000-0x00000000*/ private editfixedsize export @NULL NoiseSpeed[65537];
var(*) /*0x30060000-0x00000000*/ private float NoiseLockRadius[65537];
var(*) /*0x30060000-0x00000000*/ private float NoiseLockTime[65537];
var(*) /*0x30060000-0x00000000*/ private float NoiseTension[65537];
var(*) /*0x30060000-0x00000000*/ private editfixedsize export @NULL NoiseTangentStrength[65537];
var(*) /*0x30060000-0x00000000*/ private int NoiseTessellation[65537];
var(*) /*0x30060000-0x00000000*/ private float FrequencyDistance[65537];
var(*) /*0x30060000-0x00000000*/ private editfixedsize export @NULL NoiseScale[65537];

defaultproperties
{
    NoiseRange=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamNoise.DistributionNoiseRange'
    begin object name=DistributionNoiseRange class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionNoiseRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    NoiseRangeScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleBeamNoise.DistributionNoiseRangeScale'
    begin object name=DistributionNoiseRangeScale class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionNoiseRangeScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    NoiseSpeed=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamNoise.DistributionNoiseSpeed'
    begin object name=DistributionNoiseSpeed class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionNoiseSpeed,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    NoiseLockRadius=1.0000000
    NoiseTension=0.5000000
    NoiseTangentStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleBeamNoise.DistributionNoiseTangentStrength'
    begin object name=DistributionNoiseTangentStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionNoiseTangentStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    NoiseTessellation=1
    NoiseScale=(Distribution=// Reference: DistributionFloatConstantCurve'Default__ParticleModuleBeamNoise.DistributionNoiseScale'
    begin object name=DistributionNoiseScale class=Class'DistributionFloatConstantCurve'
    end object
    Distribution=DistributionNoiseScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}