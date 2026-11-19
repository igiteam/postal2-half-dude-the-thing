class LPFXAction_Turret extends LPFXActionBase;

enum ETurretRotationSoundState
{
    ETRSS_Starting,                 // 0
    ETRSS_Stopping,                 // 1
    ETRSS_MAX                       // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTurretPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RotationLoopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastAimDir;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAimChangeCosineSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstUpdate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte SoundState;

// Export ULPFXAction_Turret::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_Turret::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_Turret::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_Turret::execCleanupAudioComponent(FFrame&, void* const)
native final function @NULL CleanupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];


}

// Export ULPFXAction_Turret::execUpdateSound(FFrame&, void* const)
native final function UpdateSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL InNewAimDir[25296897];


}

// Export ULPFXAction_Turret::execStartRotationSound(FFrame&, void* const)
native final function StartRotationSound();

// Export ULPFXAction_Turret::execStopRotationSound(FFrame&, void* const)
native final function StopRotationSound();

function Init()
{
    super(SPFXActionBase).Init();
    SoundState = 1;
    bFirstUpdate = true;
    MyTurretPawn = LPAIPawnTurret(FXActionManager().Owner);
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    RotationLoopSound = AudioComponent(MyTurretPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('TurretRotationLoop', 'None', MyTurretPawn, none, MaxDistancePlaybackOverride));
    // End:0x14F
    if(RotationLoopSound != none)
    {
        SetupAudioComponent(RotationLoopSound);
    }
    MinAimChangeCosineSound = Cos(MyTurretPawn.TuneDataTurret.MinAngleChangeForRotationSound * 0.0174533);
    //return;    
}

function @NULL SetupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];

    // End:0x70
    if(C != none)
    {
        C.bAutoDestroy = false;
        C.bUseOwnerLocation = true;
        C.Stop();
    }
    //return;    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPFXAction_Turret.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    bIsTickable=true
}