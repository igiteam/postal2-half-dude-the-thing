class LPFXAction_JobLogPostProcess extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PrevAAType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LPUberPostProcessEffectName[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool GlobalTurnOffHeadTracking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HiddenActors;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HidePawnsRadius[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RefreshHiddenPawnTimeInterval[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RefreshHiddenPawnTime;

// Export ULPFXAction_JobLogPostProcess::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_JobLogPostProcess::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_JobLogPostProcess::execHideNearbyPawns(FFrame&, void* const)
native final function HideNearbyPawns()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];


}

// Export ULPFXAction_JobLogPostProcess::execHideActor(FFrame&, void* const)
native final function HideActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];


}

// Export ULPFXAction_JobLogPostProcess::execUnhideActors(FFrame&, void* const)
native final function UnhideActors();

// Export ULPFXAction_JobLogPostProcess::execSetPawnDPG(FFrame&, void* const)
native final function SetPawnDPG()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private byte NewGroup[8388609];


}

function @NULL Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL PPC, FXAManager, LocalPlayer, LPP, LPUber, relLocation,
	    relRotation;

    relLocation.X = 0.0000000;
    relLocation.Y = -50.0000000;
    relLocation.Z = 100.0000000;
    relRotation.Pitch = 0;
    relRotation.Yaw = 0;
    relRotation.Roll = 0;
    // End:0x4F6
    if(!IsActive())
    {
        FXAManager = FXActionManager();
        // End:0x123
        if(FXAManager != none)
        {
            LPP = LPPlayerPawn(FXAManager.Owner);
        }
        // End:0x4F6
        if(LPP != none)
        {
            SetPawnDPG(LPP, 2);
            // End:0x214
            if((LPP.JobLogLightComponent != none) && !LPP.JobLogLightComponent.bAttached)
            {
                LPP.Mesh.AttachComponent(LPP.JobLogLightComponent, 'JO_hip', relLocation, relRotation);
            }
            // End:0x303
            if((LPP.JobLogProjectionConeComponent != none) && !LPP.JobLogProjectionConeComponent.bAttached)
            {
                LPP.Mesh.AttachComponentToSocket(LPP.JobLogProjectionConeComponent, 'WristPdaCone');
                LPP.JobLogProjectionConeComponent.SetHidden(false);
            }
            GlobalTurnOffHeadTracking = false;
            // End:0x3A8
            if(LPP.HeadTrackComponent != none)
            {
                GlobalTurnOffHeadTracking = LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking;
                LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking = true;
            }
            LocalPlayer = LocalPlayer(PlayerController(LPP.Controller).Player);
            // End:0x4D0
            if(LocalPlayer != none)
            {
                PPC = LocalPlayer.PlayerPostProcess;
                // End:0x4D0
                if(PPC != none)
                {
                    LPUber = LPUberPostProcessEffect(PPC.FindPostProcessEffect(LPUberPostProcessEffectName));
                    // End:0x4D0
                    if(LPUber != none)
                    {
                        PrevAAType = LPUber.PostProcessAAType;
                        LPUber.PostProcessAAType = 0;
                    }
                }
            }
            RefreshHiddenPawnTime = RefreshHiddenPawnTimeInterval;
            HideNearbyPawns(LPP);
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

defaultproperties
{
    LPUberPostProcessEffectName="LPUberPostEffect"
    HidePawnsRadius=300.0000000
    RefreshHiddenPawnTimeInterval=1.0000000
    bIsTickable=true
}