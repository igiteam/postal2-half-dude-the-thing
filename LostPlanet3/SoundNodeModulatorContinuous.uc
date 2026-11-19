class SoundNodeModulatorContinuous extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x486F0000-0x00000000*/ private editfixedsize export @NULL PitchModulation[65537];
var(*) /*0x486F0000-0x00000000*/ private editfixedsize export @NULL VolumeModulation[65537];

defaultproperties
{
    PitchModulation=(Distribution=// Reference: DistributionFloatUniform'Default__SoundNodeModulatorContinuous.DistributionPitch'
    begin object name=DistributionPitch class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionPitch,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    VolumeModulation=(Distribution=// Reference: DistributionFloatUniform'Default__SoundNodeModulatorContinuous.DistributionVolume'
    begin object name=DistributionVolume class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionVolume,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}