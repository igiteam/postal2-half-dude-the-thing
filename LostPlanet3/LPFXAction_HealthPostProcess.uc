class LPFXAction_HealthPostProcess extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentPoisoned[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PPE;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectSavedMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectMatInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrengthImpulse;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrengthImpulseFadeDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrengthImpulseFadeSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL lpPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BeatTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PoisonBlendAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentStrength;
var(0.25_Pct) /*0x661F0000-0x00000000*/ private @NULL HealthPostProcessData[65537];

// Export ULPFXAction_HealthPostProcess::execInitNative(FFrame&, void* const)
native function InitNative();

// Export ULPFXAction_HealthPostProcess::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_HealthPostProcess::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_HealthPostProcess::execEnd(FFrame&, void* const)
native event End();

function Init()
{
    super(SPFXActionBase).Init();
    InitNative();
    // End:0x769
    if(HasPlayer())
    {
        HealthPostProcessData.InitialStrengthDecayRate = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.InitialStrengthDecayRate : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.InitialStrengthDecayRate);
        HealthPostProcessData.MinStrengthForAnyHit = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.MinStrengthForAnyHit : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.MinStrengthForAnyHit);
        HealthPostProcessData.MinDesaturation = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.MinDesaturation : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.MinDesaturation);
        HealthPostProcessData.MaxDesaturation = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.MaxDesaturation : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.MaxDesaturation);
        HealthPostProcessData.ThersholdForTriggeringDesaturation = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.ThersholdForTriggeringDesaturation : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.ThersholdForTriggeringDesaturation);
        HealthPostProcessData.HealthInterpSpeed = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.HealthInterpSpeed : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.HealthInterpSpeed);
        HealthPostProcessData.HealthMinThreshold = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.HealthMinThreshold : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.HealthMinThreshold);
        HealthPostProcessData.CurrentStrengthBlendFactor = ((int(lpPlayer.WorldInfo.NetMode) == int(NM_Standalone)) ? lpPlayer.TuneDataPlayerPawn.SPHealthPostProcess.CurrentStrengthBlendFactor : lpPlayer.TuneDataPlayerPawn.MPHealthPostProcess.CurrentStrengthBlendFactor);
    }
    //return;    
}

function Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL PPC, LocalPlayer;

    // End:0x347
    if(!IsActive() && HasPlayer())
    {
        CurrentStrength = 0.0000000;
        ApplyImpulse(HealthPostProcessData.MinStrengthForAnyHit, HealthPostProcessData.InitialStrengthDecayRate);
        LocalPlayer = LocalPlayer(LPPC.Player);
        // End:0x347
        if(LocalPlayer != none)
        {
            PPC = LocalPlayer.PlayerPostProcess;
            PPE = LPMaterialEffect(PPC.FindPostProcessEffect(name("HealthEffect")));
            // End:0x347
            if(PPE != none)
            {
                // End:0x14F
                if(MatEffectMatInstance == none)
                {
                    MatEffectMatInstance = new (self) Class'Engine.MaterialInstanceConstant';
                }
                MatEffectSavedMaterial = PPE.Material;
                MatEffectMatInstance.SetParent(PPE.Material);
                MatEffectMatInstance.SetScalarParameterValue('Strength', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Alpha', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Desaturation', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Poison_Strength', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Poison_Alpha', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Poison_Desaturation', 0.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Blend_State', 0.0000000);
                PPE.Material = MatEffectMatInstance;
                PPE.bShowInGame = true;
                PoisonBlendAmount = 0.0000000;
            }
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function ShouldActivate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6E
    if(HasPlayer())
    {
        return (float(lpPlayer.Health) + HealthPostProcessData.HealthMinThreshold) <= float(lpPlayer.HealthMax);
    }
    //return ReturnValue;    
}

function @NULL HasPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL FXAManager;

    // End:0x114
    if((lpPlayer == none) || LPPC == none)
    {
        FXAManager = FXActionManager();
        // End:0x114
        if(FXAManager != none)
        {
            lpPlayer = LPPlayerPawn(FXAManager.Owner);
            LPPC = LPPlayerController(Pawn(FXAManager.Owner).Controller);
            // End:0x114
            if((lpPlayer == none) && LPPC != none)
            {
                lpPlayer = LPPlayerPawn(LPPC.HumanPlayerPawn);
            }
        }
    }
    return lpPlayer != none;
    //return ReturnValue;    
}

function ApplyImpulse()
{
    local /*0x97E50000-0x00000000*/ private float Duration[8388609], FadeTime;

    StrengthImpulse = 0.0000000;
    StrengthImpulseFadeDelay = Duration;
    StrengthImpulseFadeSpeed = 1.0000000 / FadeTime;
    //return;    
}

defaultproperties
{
    HealthPostProcessData=(InitialStrengthDecayRate=1.0000000,MinStrengthForAnyHit=0.5000000,MinDesaturation=0.2500000,MaxDesaturation=0.7500000,ThersholdForTriggeringDesaturation=0.2500000,StrengthInterpSpeed=0.0000000,StrengthScaling=0.0000000,HealthInterpSpeed=4.0000000,HealthMinThreshold=0.3000000,CurrentStrengthBlendFactor=4.0000000)
    bIsTickable=true
}