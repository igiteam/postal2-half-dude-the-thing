class LPFXAction_VS extends LPFXActionBase;

enum EVSSoundRotationState
{
    ESRS_None,                      // 0
    ESRS_Rotating,                  // 1
    ESRS_StoppedRotating,           // 2
    ESRS_MAX                        // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ShutdownEngineLoopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL FunctionalEngineLoopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LowHealthWarningSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RotationLoopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RotationStopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte RotationState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RotationSoundTimeMark;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PFLowHealthTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PFLastTimerHealth;

// Export ULPFXAction_VS::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_VS::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_VS::execCleanupAudioComponent(FFrame&, void* const)
native final function @NULL CleanupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];


}

function Init()
{
    super(SPFXActionBase).Init();
    MyVSPawn = LPBaseVSPlayerPawn(FXActionManager().Owner);
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    ShutdownEngineLoopSound = AkComponent(MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSShutdownEngineLoop', 'None', MyVSPawn, none, MaxDistancePlaybackOverride));
    SetupAkComponent(ShutdownEngineLoopSound, 'JO_Torso');
    FunctionalEngineLoopSound = AkComponent(MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSFunctionalEngineLoop', 'None', MyVSPawn, none, MaxDistancePlaybackOverride));
    SetupAkComponent(FunctionalEngineLoopSound, 'JO_Torso');
    LowHealthWarningSound = AudioComponent(MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSLowHealthWarningLoop', 'None', MyVSPawn, none, MaxDistancePlaybackOverride));
    SetupAudioComponent(LowHealthWarningSound);
    RotationLoopSound = AudioComponent(MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSRotationLoop', 'None', MyVSPawn, none, MaxDistancePlaybackOverride));
    SetupAudioComponent(RotationLoopSound);
    RotationStopSound = AudioComponent(MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSRotationStopped', 'None', MyVSPawn, none, MaxDistancePlaybackOverride));
    SetupAudioComponent(RotationStopSound);
    RotationState = 0;
    //return;    
}

function @NULL SetupAkComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609];

    // End:0x98
    if(C != none)
    {
        C.bAutoDestroy = false;
        C.bUseLocation = false;
        C.BoneName = BoneName;
        C.Stop();
    }
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

final event @NULL ScriptTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bPlayLowHealth, bPlayFunctional, bPlayShutdown, bIsPossessedByLocalPlayer;

    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private bool bRotationStateUpdated;
    local /*0x97E50000-0x00000000*/ private float VSHealthPerc;
    local /*0x97E50000-0x00000000*/ private name FXName;
    local /*0x97E50000-0x00000400*/ private @NULL PComp, NewParticleInfo;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    bIsPossessedByLocalPlayer = MyVSPawn.IsLocallyControlled() && MyVSPawn.bIsPossessedByPlayer;
    // End:0x62A
    if(MyVSPawn.bIsPlatformMode && MyVSPawn.TuneDataVSPlayerPawn.DamageEvent.Length > 0)
    {
        PFLowHealthTimer -= DeltaTime;
        // End:0xE2
        if(PFLowHealthTimer < 0.0000000)
        {
            PFLowHealthTimer = 0.0000000;
        }
        vsPawn = LPVSPlayerPawn(MyVSPawn);
        VSHealthPerc = (float(MyVSPawn.Health) / float(MyVSPawn.HealthMax)) * 100.0000000;
        // End:0x17F
        if(VSHealthPerc > float(PFLastTimerHealth))
        {
            PFLastTimerHealth = int(VSHealthPerc);
        }
        I = 0;
        J0x18A:

        // End:0x4CA [Loop If]
        if(I < MyVSPawn.TuneDataVSPlayerPawn.DamageEvent.Length)
        {
            // End:0x4BC
            if(VSHealthPerc < MyVSPawn.TuneDataVSPlayerPawn.DamageEvent[I].HealthPercent)
            {
                // End:0x4BC
                if(float(PFLastTimerHealth) > MyVSPawn.TuneDataVSPlayerPawn.DamageEvent[I].HealthPercent)
                {
                    PFLastTimerHealth = int(VSHealthPerc);
                    PFLowHealthTimer = MyVSPawn.TuneDataVSPlayerPawn.DamageEvent[I].AlarmDuration;
                    FXName = MyVSPawn.TuneDataVSPlayerPawn.DamageEvent[I].FXEVent;
                    // End:0x4BC
                    if(FXName != 'None')
                    {
                        PComp = MyVSPawn.TuneDataPawnFXEventBindings.PlayEventFX(FXName, none, LPVSPlayerPawn(MyVSPawn).ExtractPocket.Mesh, none);
                        // End:0x4BC
                        if(PComp != none)
                        {
                            NewParticleInfo.ParticleComponent = PComp;
                            NewParticleInfo.HealthPercent = MyVSPawn.TuneDataVSPlayerPawn.DamageEvent[I].HealthPercent;
                            vsPawn.PlatformParticles.AddItem(NewParticleInfo);                            
                        }
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0x18A;
        }
        I = vsPawn.PlatformParticles.Length - 1;
        J0x4F6:

        // End:0x62A [Loop If]
        if(I >= 0)
        {
            // End:0x61C
            if(VSHealthPerc > vsPawn.PlatformParticles[I].HealthPercent)
            {
                vsPawn.PlatformParticles[I].ParticleComponent.SetActive(false);
                vsPawn.PlatformParticles[I].ParticleComponent.DetachFromAny();
                vsPawn.PlatformParticles.Remove(I, 1);                
            }
            I--;
            // [Loop Continue]
            goto J0x4F6;
        }
    }
    // End:0x65E
    if(MyVSPawn.IsInState('VSShutdown'))
    {
        bPlayShutdown = true;        
    }
    else
    {
        bPlayFunctional = true;
        bPlayLowHealth = bIsPossessedByLocalPlayer && MyVSPawn.Health < MyVSPawn.TuneDataVSPlayerPawn.MaxHealthForLowHealthWarning;
        // End:0x6F4
        if(PFLowHealthTimer > float(0))
        {
            bPlayLowHealth = true;
        }
    }
    // End:0x7F2
    if(FunctionalEngineLoopSound != none)
    {
        // End:0x7A0
        if(bPlayFunctional && !FunctionalEngineLoopSound.IsPlaying())
        {
            FunctionalEngineLoopSound.Play();
            FunctionalEngineLoopSound.SetRTPCValue("PlayerOccupied", ((bIsPossessedByLocalPlayer) ? 1.0000000 : 0.0000000));            
        }
        else
        {
            // End:0x7F2
            if(!bPlayFunctional && FunctionalEngineLoopSound.IsPlaying())
            {
                FunctionalEngineLoopSound.Stop();
            }
        }
    }
    // End:0x8A8
    if(ShutdownEngineLoopSound != none)
    {
        // End:0x856
        if(bPlayShutdown && !ShutdownEngineLoopSound.IsPlaying())
        {
            ShutdownEngineLoopSound.Play();            
        }
        else
        {
            // End:0x8A8
            if(!bPlayShutdown && ShutdownEngineLoopSound.IsPlaying())
            {
                ShutdownEngineLoopSound.Stop();
            }
        }
    }
    // End:0x95E
    if(LowHealthWarningSound != none)
    {
        // End:0x90C
        if(bPlayLowHealth && !LowHealthWarningSound.IsPlaying())
        {
            LowHealthWarningSound.Play();            
        }
        else
        {
            // End:0x95E
            if(!bPlayLowHealth && LowHealthWarningSound.IsPlaying())
            {
                LowHealthWarningSound.Stop();
            }
        }
    }
    // End:0xA94
    if(bIsPossessedByLocalPlayer)
    {
        LPC = LPPlayerController(MyVSPawn.Controller);
        // End:0xA94
        if(LPC != none)
        {
            // End:0xA94
            if((LPC.IsInState('PlayerWalking') && int(MyVSPawn.Physics) == int(1)) && !LPC.bCinematicMode)
            {
                bRotationStateUpdated = true;
                switch(RotationState)
                {
                    // End:0xA5B
                    case 0:
                        UpdateRotationState_None(LPC);
                        // End:0xA94
                        break;
                    // End:0xA76
                    case 1:
                        UpdateRotationState_Rotating(LPC);
                        // End:0xA94
                        break;
                    // End:0xA91
                    case 2:
                        UpdateRotationState_StoppedRotating(LPC);
                        // End:0xA94
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0xA94! */
        }
        // End:0xAAD
        if(!bRotationStateUpdated)
        {
            StartRotationState_None();
        }
        return true;
        //return ReturnValue;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x95E! */
}

function IsStickOutsideRegion()
{
    local /*0x97E50000-0x00000000*/ private @NULL PInput[8388609];
    local /*0x97E50000-0x00000000*/ private float TestedStickRadius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ActualStickRadius;

    // End:0x60
    if(MyVSPawn.IsPitchControllerAtExtreme())
    {
        ActualStickRadius = PInput.UnfilteredRotationStick.X;        
    }
    else
    {
        ActualStickRadius = PInput.UnfilteredRotationStickRadius;
    }
    return ActualStickRadius >= TestedStickRadius;
    //return ReturnValue;    
}

function StartRotationState_None()
{
    // End:0x52
    if((RotationLoopSound != none) && RotationLoopSound.IsPlaying())
    {
        RotationLoopSound.Stop();
    }
    RotationState = 0;
    RotationSoundTimeMark = -1.0000000;
    //return;    
}

function UpdateRotationState_None()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], PInput;

    PInput = LPPlayerInput(LPC.PlayerInput);
    // End:0x90
    if(!IsStickOutsideRegion(PInput, MyVSPawn.TuneDataVSPlayerPawn.ThresholdToStartRotationSound))
    {
        RotationSoundTimeMark = -1.0000000;
        return;        
    }
    else
    {
        // End:0xE0
        if(RotationSoundTimeMark < 0.0000000)
        {
            RotationSoundTimeMark = MyVSPawn.WorldInfo.TimeSeconds;
        }
    }
    // End:0x158
    if((MyVSPawn.WorldInfo.TimeSeconds - RotationSoundTimeMark) < MyVSPawn.TuneDataVSPlayerPawn.TimeInPlayingRegionToStartSound)
    {
        return;
    }
    StartRotationState_Rotating();
    //return;    
}

function StartRotationState_Rotating()
{
    // End:0xB6
    if((RotationLoopSound != none) && !RotationLoopSound.IsPlaying() || RotationLoopSound.FadeOutTargetVolume == 0.0000000)
    {
        RotationLoopSound.FadeIn(MyVSPawn.TuneDataVSPlayerPawn.RotationLoopSoundFadeInTime, 1.0000000);
    }
    RotationState = 1;
    RotationSoundTimeMark = -1.0000000;
    //return;    
}

function UpdateRotationState_Rotating()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], PInput;

    PInput = LPPlayerInput(LPC.PlayerInput);
    // End:0x8E
    if(IsStickOutsideRegion(PInput, MyVSPawn.TuneDataVSPlayerPawn.ThresholdToStopRotationSound))
    {
        RotationSoundTimeMark = -1.0000000;
        return;        
    }
    else
    {
        // End:0xDE
        if(RotationSoundTimeMark < 0.0000000)
        {
            RotationSoundTimeMark = MyVSPawn.WorldInfo.TimeSeconds;
        }
    }
    // End:0x156
    if((MyVSPawn.WorldInfo.TimeSeconds - RotationSoundTimeMark) < MyVSPawn.TuneDataVSPlayerPawn.TimeInStoppedRegionToStopSound)
    {
        return;
    }
    StartRotationState_StoppedRotating();
    //return;    
}

function StartRotationState_StoppedRotating()
{
    // End:0x8A
    if((RotationLoopSound != none) && RotationLoopSound.IsPlaying())
    {
        RotationLoopSound.FadeOut(MyVSPawn.TuneDataVSPlayerPawn.RotationLoopSoundFadeOutTime, 0.0000000);
    }
    // End:0xD7
    if(RotationStopSound != none)
    {
        RotationStopSound.Stop();
        RotationStopSound.Play();
    }
    RotationState = 2;
    RotationSoundTimeMark = -1.0000000;
    //return;    
}

function UpdateRotationState_StoppedRotating()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    UpdateRotationState_None(LPC);
    //return;    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPFXAction_VS.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    bIsTickable=true
}