class AudioDevice extends Subsystem
    transient
    config(Engine);

enum ESoundClassName
{
    Master,                         // 0
    ESoundClassName_MAX             // 1
};

enum EDebugState
{
    DEBUGSTATE_None,                // 0
    DEBUGSTATE_IsolateDryAudio,     // 1
    DEBUGSTATE_IsolateReverb,       // 2
    DEBUGSTATE_TestLPF,             // 3
    DEBUGSTATE_TestStereoBleed,     // 4
    DEBUGSTATE_TestLFEBleed,        // 5
    DEBUGSTATE_DisableLPF,          // 6
    DEBUGSTATE_DisableRadio,        // 7
    DEBUGSTATE_MAX                  // 8
};

enum ETTSSpeaker
{
    TTSSPEAKER_Paul,                // 0
    TTSSPEAKER_Harry,               // 1
    TTSSPEAKER_Frank,               // 2
    TTSSPEAKER_Dennis,              // 3
    TTSSPEAKER_Kit,                 // 4
    TTSSPEAKER_Betty,               // 5
    TTSSPEAKER_Ursula,              // 6
    TTSSPEAKER_Rita,                // 7
    TTSSPEAKER_Wendy,               // 8
    TTSSPEAKER_MAX                  // 9
};

struct native Listener
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PortalVolume[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Up;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Right;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Front;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity;

    structdefaultproperties
    {
        PortalVolume=none
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Up=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Right=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Front=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native AudioClassInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private int NumResident[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int SizeResident[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int NumRealTime[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int SizeRealTime[131073];

    structdefaultproperties
    {
        NumResident=0
        SizeResident=0
        NumRealTime=0
        SizeRealTime=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private int MaxChannels[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private int CommonAudioPoolSize[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float LowPassFilterResonance[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float MinCompressedDurationEditor[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float MinCompressedDurationGame[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ChirpInSoundNodeWaveName[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ChirpInSoundNodeWave[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ChirpOutSoundNodeWaveName[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ChirpOutSoundNodeWave[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CommonAudioPool[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int CommonAudioPoolFreeBytes[268566529];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array AudioComponents[537526273];
var(*) /*0x35EA0000-0x00000000*/ private array Sources[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array FreeSources[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} WaveInstanceSourceMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bGameWasTicking[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bSoundSpawningEnabled[536870913];
var(*) /*0x35EA0000-0x00000000*/ private array Listeners[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentTick[268566529];
var(*) /*0x03CE0000-0x00000000*/ private editfixedsize map{VOID,VOID} SoundClasses[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize map{VOID,VOID} SourceSoundClasses;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize map{VOID,VOID} CurrentSoundClasses;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize map{VOID,VOID} DestinationSoundClasses;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize map{VOID,VOID} SoundClassesVolumeAdjustments;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SoundModes[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Effects[268566529];
var(*) /*0x35EA0000-0x00000000*/ private name BaseSoundModeName[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentMode[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoundModeStartTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoundModeFadeInStartTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoundModeFadeInEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SoundModeEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int ListenerVolumeIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ListenerInteriorSettings[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InteriorStartTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InteriorEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExteriorEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InteriorLPFEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExteriorLPFEndTime[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float InteriorVolumeInterp[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float InteriorLPFInterp[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float ExteriorVolumeInterp[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float ExteriorLPFInterp[268566529];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL TestAudioComponent[655361];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TextToSpeech[268566529];
var(*) /*0x35EA0000-0x00000000*/ private byte DebugState[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float TransientMasterVolume[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float LastUpdateTime[536870913];

// Export UAudioDevice::execSetSoundMode(FFrame&, void* const)
native final function SetSoundMode()
{
    local /*0x35EA0000-0x00000000*/ private name NewMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UAudioDevice::execFindSoundClass(FFrame&, void* const)
native final function FindSoundClass()
{
    local /*0x35EA0000-0x00000000*/ private name SoundClassName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    TransientMasterVolume=1.0000000
}