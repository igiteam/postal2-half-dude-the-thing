class SPAudioComponentBase extends ActorComponent
    editinlinenew
    collapsecategories
    noexport
    hidecategories(Object,ActorComponent);

var(*) /*0x35EA0000-0x00000000*/ private bool bPaused[536870913];

// Export USPAudioComponentBase::execPlay(FFrame&, void* const)
native function Play();

// Export USPAudioComponentBase::execStop(FFrame&, void* const)
native function Stop();

// Export USPAudioComponentBase::execPause(FFrame&, void* const)
native function Pause();

// Export USPAudioComponentBase::execResume(FFrame&, void* const)
native function Resume();

// Export USPAudioComponentBase::execIsPlaying(FFrame&, void* const)
native function IsPlaying()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAudioComponentBase::execIsPaused(FFrame&, void* const)
native function IsPaused()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAudioComponentBase::execFadeIn(FFrame&, void* const)
native function FadeIn()
{
    local /*0x35EA0000-0x00000000*/ private float FadeInDuration[8388609], FadeVolumeLevel;


}

// Export USPAudioComponentBase::execFadeOut(FFrame&, void* const)
native function FadeOut()
{
    local /*0x35EA0000-0x00000000*/ private float FadeOutDuration[8388609], FadeVolumeLevel;


}
