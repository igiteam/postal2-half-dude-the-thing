class LPFXAction_SpitterAcidVS extends LPFXActionBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumActiveParticleSystems;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PSC[524291];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OldParticleSystemFinishedDelegate__Delegate;

// Export ULPFXAction_SpitterAcidVS::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_SpitterAcidVS::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_SpitterAcidVS::execEnd(FFrame&, void* const)
native event End();

delegate @NULL OldParticleSystemFinishedDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSystem[8388609];

    //return;    
}

function Init()
{
    super(SPFXActionBase).Init();
    MyVSPawn = LPBaseVSPlayerPawn(FXActionManager().Owner);
    NumActiveParticleSystems = 0;
    //return;    
}

function Begin()
{
    MyVSPawn = LPBaseVSPlayerPawn(FXActionManager().Owner);
    // End:0x4B
    if(NumActiveParticleSystems <= 0)
    {
        StartPs();
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function SetSpitterPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    SpitterPawn = inPawn;
    //return;    
}

function StartPs()
{
    // End:0x1F6
    if(SpitterPawn != none)
    {
        PSC[0] = ParticleCreateSystem(SpitterPawn.TuneDataSpitter.RightAcidSocket.ParticleSystem, SpitterPawn.TuneDataSpitter.RightAcidSocket.SocketName);
        PSC[1] = ParticleCreateSystem(SpitterPawn.TuneDataSpitter.CenterAcidSocket.ParticleSystem, SpitterPawn.TuneDataSpitter.CenterAcidSocket.SocketName);
        PSC[2] = ParticleCreateSystem(SpitterPawn.TuneDataSpitter.LeftAcidSocket.ParticleSystem, SpitterPawn.TuneDataSpitter.LeftAcidSocket.SocketName);
    }
    //return;    
}

simulated event @NULL ParticleCreateSystem()
{
    local /*0x97E50000-0x00000000*/ private @NULL PS[8388609];
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], ThePool, PSComp;
    local /*0x97E50000-0x00000000*/ private int I;

    PSComp = none;
    // End:0x1E9
    if(PS != none)
    {
        ThePool = SPEmitterPool(MyVSPawn.WorldInfo.MyEmitterPool);
        PSComp = ThePool.SPSpawnEmitterMeshAttachment(PS, MyVSPawn.Mesh, SocketName, true);
        // End:0xF6
        if(PSComp != none)
        {
            PSComp.ActivateSystem();
            ++NumActiveParticleSystems;
        }
        // End:0x14A
        if(PSComp.__OnSystemFinished__Delegate != none)
        {
            __OldParticleSystemFinishedDelegate__Delegate = PSComp.OnSystemFinished;
        }
        PSComp.__OnSystemFinished__Delegate = CleanUpParticleSystem;
        I = 0;
        J0x185:

        // End:0x1E9 [Loop If]
        if(I < PSComp.EmitterInstances.Length)
        {
            PSComp.SetKillOnDeactivate(I, true);
            ++I;
            // [Loop Continue]
            goto J0x185;
        }
    }
    return PSComp;
    //return ReturnValue;    
}

simulated event @NULL CleanUpParticleSystem()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSComp[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xDA
    if(PSComp != none)
    {
        PSComp.__OnSystemFinished__Delegate = OldParticleSystemFinishedDelegate;
        PSComp.OnSystemFinished(PSComp);
        I = 0;
        J0x7B:

        // End:0xDA [Loop If]
        if(I < 3)
        {
            // End:0xCC
            if(PSC[I] == PSComp)
            {
                PSC[I] = none;
                --NumActiveParticleSystems;
            }
            ++I;
            // [Loop Continue]
            goto J0x7B;
        }
    }
    //return;    
}

defaultproperties
{
    bIsTickable=true
}