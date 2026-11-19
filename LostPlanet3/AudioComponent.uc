class AudioComponent extends SPAudioComponentBase
    editinlinenew
    collapsecategories
    noexport
    hidecategories(Object,ActorComponent,Object,ActorComponent);

struct native AudioComponentParam
{
    var(*) /*0x03CC0000-0x00000000*/ private name ParamName[65537];
    var(*) /*0x03CC0000-0x00000000*/ private float FloatParam[65537];
    var(*) /*0x03CC0000-0x00000000*/ private @NULL WaveParam[65537];

    structdefaultproperties
    {
        ParamName="None"
        FloatParam=0.0000000
        WaveParam=none
    }
};

var(*) /*0x03C70000-0x00000000*/ private @NULL SoundCue[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CueFirstNode[268566529];
var(*) /*0x03C70000-0x00000400*/ private editfixedsize array InstanceParameters[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseOwnerLocation;
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoPlay;
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoDestroy;
var(*) /*0x35EA0000-0x00000000*/ private bool bStopWhenOwnerDestroyed;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldRemainActiveIfDropped;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasOccluded;
var(*) /*0x35EA0000-0x00000000*/ private bool bSuppressSubtitles[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasPlaying[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowSpatialization;
var(*) /*0x35EA0000-0x00000000*/ private bool bFinished[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bApplyRadioFilter[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bRadioFilterSelected[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPreviewComponent[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreForFlushing[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float StereoBleed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float LFEBleed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bEQFilterApplied[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysPlay[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsUISound[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsMusic[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bReverb[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCenterChannelOnly[536870913];
var(*) /*0x35EA0000-0x00000000*/ private array WaveInstances[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array SoundNodeData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SoundNodeOffsetMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoundNodeResetWaveMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Listener[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float PlaybackTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PortalVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Location[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ComponentLocation[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastOwner[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float SubtitlePriority[268435457];
var(*) /*0x35EA0000-0x00000000*/ private float FadeInStartTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadeInStopTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadeInTargetVolume;
var(*) /*0x35EA0000-0x00000000*/ private float FadeOutStartTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadeOutStopTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadeOutTargetVolume;
var(*) /*0x35EA0000-0x00000000*/ private float AdjustVolumeStartTime;
var(*) /*0x35EA0000-0x00000000*/ private float AdjustVolumeStopTime;
var(*) /*0x35EA0000-0x00000000*/ private float AdjustVolumeTargetVolume;
var(*) /*0x35EA0000-0x00000000*/ private float CurrAdjustVolumeTargetVolume;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentNotifyBufferFinishedHook[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentLocation[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentVelocity[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentPitch[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentHighFrequencyGain[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentUseSpatialization[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentNotifyOnLoop[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float OmniRadius[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentVolumeMultiplier[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentPitchMultiplier[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentHighFrequencyGainMultiplier[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentVoiceCenterChannelVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentRadioFilterVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentRadioFilterVolumeThreshold[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastUpdateTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float SourceInteriorLPF[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorVolume[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentInteriorLPF[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastLocation[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastInteriorSettings[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int LastReverbVolumeIndex[268566529];
var(*) /*0x03C70000-0x00000000*/ private float VolumeMultiplier[65537];
var(*) /*0x03C70000-0x00000000*/ private float PitchMultiplier[65537];
var(*) /*0x03C70000-0x00000000*/ private float HighFrequencyGainMultiplier[65537];
var(*) /*0x35EA0000-0x00000000*/ private float OcclusionCheckInterval;
var(*) /*0x35EA0000-0x00000000*/ private float LastOcclusionCheckTime[536870913];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewSoundRadius[655361];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnAudioFinished__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnQueueSubtitles__Delegate;

// Export UAudioComponent::execPlay(FFrame&, void* const)
native function Play();

// Export UAudioComponent::execStop(FFrame&, void* const)
native function Stop();

// Export UAudioComponent::execPause(FFrame&, void* const)
native function Pause();

// Export UAudioComponent::execResume(FFrame&, void* const)
native function Resume();

// Export UAudioComponent::execIsPlaying(FFrame&, void* const)
native function IsPlaying()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UAudioComponent::execIsPaused(FFrame&, void* const)
native function IsPaused()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UAudioComponent::execIsFadingIn(FFrame&, void* const)
native final function IsFadingIn()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UAudioComponent::execIsFadingOut(FFrame&, void* const)
native final function IsFadingOut()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UAudioComponent::execFadeIn(FFrame&, void* const)
native function FadeIn()
{
    local /*0x35EA0000-0x00000000*/ private float FadeInDuration[8388609], FadeVolumeLevel;


}

// Export UAudioComponent::execFadeOut(FFrame&, void* const)
native function FadeOut()
{
    local /*0x35EA0000-0x00000000*/ private float FadeOutDuration[8388609], FadeVolumeLevel;


}

// Export UAudioComponent::execAdjustVolume(FFrame&, void* const)
native final function AdjustVolume()
{
    local /*0x35EA0000-0x00000000*/ private float AdjustVolumeDuration[8388609], AdjustVolumeLevel;


}

// Export UAudioComponent::execSetFloatParameter(FFrame&, void* const)
native final function SetFloatParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InFloat[8388609];


}

// Export UAudioComponent::execSetWaveParameter(FFrame&, void* const)
native final function SetWaveParameter()
{
    local /*0x35EA0000-0x00000000*/ private name InName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InWave[8388609];


}

// Export UAudioComponent::execResetToDefaults(FFrame&, void* const)
native final function ResetToDefaults();

delegate @NULL OnAudioFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL AC[8388609];

    //return;    
}

delegate OnQueueSubtitles()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Subtitles[8388609];
    local /*0x35EA0000-0x00000000*/ private float CueDuration[8388609];

    //return;    
}

event OcclusionChanged()
{
    local /*0x35EA0000-0x00000000*/ private bool bNowOccluded[8388609];

    VolumeMultiplier *= ((bNowOccluded) ? 0.5000000 : 2.0000000);
    //return;    
}
