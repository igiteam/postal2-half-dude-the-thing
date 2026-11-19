class LPFXAction_StrugglePostProcess extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PPE;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectSavedMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatEffectMatInstance;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeInTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeIn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHoldUntilCleared;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HoldTime;

// Export ULPFXAction_StrugglePostProcess::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_StrugglePostProcess::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_StrugglePostProcess::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_StrugglePostProcess::execClearOut(FFrame&, void* const)
native final function ClearOut();

function Init()
{
    super(SPFXActionBase).Init();
    // End:0x62
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        bEnableHold = true;
        bHoldUntilCleared = true;
    }
    //return;    
}

function @NULL Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPP, LocalPlayer, PPC, FXAManager, PCIter;

    // End:0x3B5
    if(!IsActive())
    {
        FXAManager = FXActionManager();
        // End:0x63
        if(FXAManager != none)
        {
            LPPP = LPPlayerPawn(FXAManager.Owner);
        }
        FadeInTime = 5.0000000;
        FadeIn = FadeInTime;
        Hold = HoldTime;
        LPPC = LPPlayerController(LPPP.Controller);
        // End:0x199
        if((int(LPPP.WorldInfo.NetMode) != int(NM_Standalone)) && LPPC == none)
        {
            // End:0x198
            foreach LPPP.LocalPlayerControllers(Class'Engine.PlayerController', PCIter)
            {
                // End:0x197
                if(PCIter.ViewTarget == LPPP)
                {
                    LPPC = LPPlayerController(PCIter);
                    // End:0x198
                    break;
                }                
            }            
        }
        LocalPlayer = LocalPlayer(LPPC.Player);
        // End:0x3B5
        if(LocalPlayer != none)
        {
            PPC = LocalPlayer.PlayerPostProcess;
            PPE = LPMaterialEffect(PPC.FindPostProcessEffect(name("HealthEffect")));
            // End:0x3B5
            if(PPE != none)
            {
                // End:0x312
                if(MatEffectMatInstance == none)
                {
                    MatEffectSavedMaterial = PPE.Material;
                    // End:0x2D2
                    if(MaterialInstanceConstant(MatEffectSavedMaterial) != none)
                    {
                        MatEffectSavedMaterial = MaterialInstanceConstant(MatEffectSavedMaterial).Parent;
                    }
                    MatEffectMatInstance = new (self) Class'Engine.MaterialInstanceConstant';
                    MatEffectMatInstance.SetParent(MatEffectMaterial);
                }
                MatEffectMatInstance.SetScalarParameterValue('Strength', 1.0000000);
                MatEffectMatInstance.SetScalarParameterValue('Alpha', 1.0000000);
                PPE.Material = MatEffectMatInstance;
                PPE.bShowInGame = true;
            }
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

defaultproperties
{
    bIsTickable=true
}