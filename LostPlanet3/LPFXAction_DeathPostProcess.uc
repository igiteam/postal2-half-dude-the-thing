class LPFXAction_DeathPostProcess extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PPE;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectSavedMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectMatInstance;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeInTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeIn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPFreezeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FreezeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHoldUntilCleared;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPHoldTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HoldTime;

// Export ULPFXAction_DeathPostProcess::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_DeathPostProcess::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_DeathPostProcess::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_DeathPostProcess::execClearOut(FFrame&, void* const)
native final function ClearOut();

function Init()
{
    super(SPFXActionBase).Init();
    bEnableHold = true;
    // End:0x65
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        bHoldUntilCleared = false;        
    }
    else
    {
        bHoldUntilCleared = true;
    }
    //return;    
}

function @NULL Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPP, LocalPlayer, PPC, FXAManager, PCIter;

    // End:0x523
    if(!IsActive())
    {
        FXAManager = FXActionManager();
        // End:0x63
        if(FXAManager != none)
        {
            LPPP = LPPlayerPawn(FXAManager.Owner);
        }
        // End:0xCC
        if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
        {
            FadeInTime = MPFreezeTime;
            Hold = MPHoldTime;            
        }
        else
        {
            FadeInTime = FreezeTime;
            Hold = HoldTime;
        }
        FadeIn = FadeInTime;
        LPPC = LPPlayerController(LPPP.Controller);
        // End:0x209
        if((int(LPPP.WorldInfo.NetMode) != int(NM_Standalone)) && LPPC == none)
        {
            // End:0x205
            foreach LPPP.LocalPlayerControllers(Class'Engine.PlayerController', PCIter)
            {
                // End:0x204
                if(PCIter.ViewTarget == LPPP)
                {
                    LPPC = LPPlayerController(PCIter);
                    // End:0x205
                    break;
                }                
            }                        
        }
        else
        {
            // End:0x2CF
            if((int(LPPP.WorldInfo.NetMode) == int(NM_Standalone)) && LPPC == none)
            {
                // End:0x2CE
                foreach LPPP.LocalPlayerControllers(Class'Engine.PlayerController', PCIter)
                {
                    // End:0x2CD
                    if(PCIter.IsLocalPlayerController())
                    {
                        LPPC = LPPlayerController(PCIter);
                        // End:0x2CE
                        break;
                    }                    
                }                
            }
        }
        LocalPlayer = LocalPlayer(LPPC.Player);
        // End:0x4BE
        if(LocalPlayer != none)
        {
            PPC = LocalPlayer.PlayerPostProcess;
            PPE = LPMaterialEffect(PPC.FindPostProcessEffect(name("HealthEffect")));
            // End:0x4BE
            if(PPE != none)
            {
                // End:0x448
                if(MatEffectMatInstance == none)
                {
                    MatEffectSavedMaterial = PPE.Material;
                    // End:0x408
                    if(MaterialInstanceConstant(MatEffectSavedMaterial) != none)
                    {
                        MatEffectSavedMaterial = MaterialInstanceConstant(MatEffectSavedMaterial).Parent;
                    }
                    MatEffectMatInstance = new (self) Class'Engine.MaterialInstanceConstant';
                    MatEffectMatInstance.SetParent(MatEffectMaterial);
                }
                MatEffectMatInstance.SetScalarParameterValue('ScreenFreeze', 0.0000000);
                PPE.Material = MatEffectMatInstance;
                PPE.bShowInGame = true;
            }
        }
        SoundComponent = LPPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('DeathFreeze', 'None', LPPP, none, none, SoundComponent);
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function SetFreezeTime()
{
    local /*0x97E50000-0x00000000*/ private float InFreezeTime[8388609];

    FreezeTime = InFreezeTime;
    //return;    
}

defaultproperties
{
    MPFreezeTime=1.5000000
    FreezeTime=5.0000000
    bIsTickable=true
}