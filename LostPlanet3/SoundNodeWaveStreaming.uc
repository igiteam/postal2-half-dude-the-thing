class SoundNodeWaveStreaming extends SoundNodeWave
    perobjectconfig
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array QueuedAudio;
var(*) /*0x35EA0000-0x00000000*/ private float InactiveDuration[131073];

// Export USoundNodeWaveStreaming::execQueueAudio(FFrame&, void* const)
native event QueueAudio()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Data[8388609];


}

// Export USoundNodeWaveStreaming::execQueueSilence(FFrame&, void* const)
native event QueueSilence()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];


}

// Export USoundNodeWaveStreaming::execResetAudio(FFrame&, void* const)
native event ResetAudio();

// Export USoundNodeWaveStreaming::execAvailableAudioBytes(FFrame&, void* const)
native event AvailableAudioBytes()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USoundNodeWaveStreaming::execGeneratePCMData(FFrame&, void* const)
native event GeneratePCMData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Buffer[25165825];
    local /*0x35EA0000-0x00000000*/ private int SamplesNeeded[8388609];


}

defaultproperties
{
    bLoopingSound=false
    bProcedural=true
}