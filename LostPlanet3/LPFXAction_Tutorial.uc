class LPFXAction_Tutorial extends LPFXActionBase;

enum ETutorialTimeDilationState
{
    ETTDS_Starting,                 // 0
    ETTDS_Looping,                  // 1
    ETTDS_Stopping,                 // 2
    ETTDS_MAX                       // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte SoundState;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TimeDilationStartSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TimeDilationLoopingSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TimeDilationStartSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TimeDilationLoopingSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TimeDilationEndSound;

// Export ULPFXAction_Tutorial::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_Tutorial::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_Tutorial::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_Tutorial::execSetSounds(FFrame&, void* const)
native final function SetSounds()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartSound[8388609], LoopingSound, EndSound;


}

// Export ULPFXAction_Tutorial::execCleanupAudioComponent(FFrame&, void* const)
native final function @NULL CleanupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];


}

function Init()
{
    super(SPFXActionBase).Init();
    SoundState = 0;
    MyBasePlayerPawn = LPBasePlayerPawn(FXActionManager().Owner);
    //return;    
}

function Begin()
{
    super(SPFXActionBase).Begin();
    SoundState = 0;
    TimeDilationStartSoundComponent = CreateAudioComponent(TimeDilationStartSoundComponent, TimeDilationStartSound);
    TimeDilationLoopingSoundComponent = CreateAudioComponent(TimeDilationLoopingSoundComponent, TimeDilationLoopingSound);
    TimeDilationStartSoundComponent.Play();
    //return;    
}

function @NULL CreateAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609], S, ReturnValue;

    // End:0x11
    if(S == none)
    {
        return none;
    }
    // End:0xB8
    if(C == none)
    {
        C = MyBasePlayerPawn.super(LPFXAction_Tutorial).CreateAudioComponent(S, false, true);
        C.bAutoDestroy = false;
        C.bUseOwnerLocation = true;
        C.Stop();
    }
    return C;
    //return ReturnValue;    
}

defaultproperties
{
    bIsTickable=true
}