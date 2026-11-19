class LPPCPendingLevel extends LPPlayerController
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

function NotifyConnectionError()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185], Title;

    Localize("Errors", "ConnectionFailed", "Engine");
    Localize("Errors", "ConnectionFailed_Title", "Engine");
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    // End:0x68
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        Class'LPMultiplayerManager'.static.GetInstance().CancelInfiniteLoadTimeout();
    }
    //return;    
}

auto state PlayerWaiting
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        // End:0x76
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            Class'LPMultiplayerManager'.static.GetInstance().BeginInfiniteLoadTimeout(20.0000000);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x5E
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            Class'LPMultiplayerManager'.static.GetInstance().CancelInfiniteLoadTimeout();
        }
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPFXActionManager'Default__LPPCPendingLevel.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPCameraModeAimControlFirstPersonParam'Default__LPPCPendingLevel.FirstPersonAimCamParamObj'
    begin object name=FirstPersonAimCamParamObj
    end object
    FirstPersonAimCamParams=FirstPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.FirstPersonAimTransitionParamObj'
    begin object name=FirstPersonAimTransitionParamObj
    end object
    FirstPersonAimTransitionParam=FirstPersonAimTransitionParamObj
    // Reference: LPCameraModeAimControlThirdPersonParam'Default__LPPCPendingLevel.ThirdPersonAimCamParamObj'
    begin object name=ThirdPersonAimCamParamObj
    end object
    ThirdPersonAimCamParams=ThirdPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.ThirdPersonAimTransitionParamObj'
    begin object name=ThirdPersonAimTransitionParamObj
    end object
    ThirdPersonAimTransitionParam=ThirdPersonAimTransitionParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.ShoulderAimTransitionParamObj'
    begin object name=ShoulderAimTransitionParamObj
    end object
    ShoulderAimTransitionParam=ShoulderAimTransitionParamObj
    // Reference: LPCameraModeAimControlJobLogParam'Default__LPPCPendingLevel.JobLogCamParamObj'
    begin object name=JobLogCamParamObj
    end object
    JobLogCamParams=JobLogCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.JobLogCamTransitionInParamObj'
    begin object name=JobLogCamTransitionInParamObj
    end object
    JobLogTransitionInParam=JobLogCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.JobLogCamTransitionOutParamObj'
    begin object name=JobLogCamTransitionOutParamObj
    end object
    JobLogTransitionOutParam=JobLogCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlRagdollParam'Default__LPPCPendingLevel.RagdollCamParamObj'
    begin object name=RagdollCamParamObj
    end object
    RagdollCamParams=RagdollCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.RagdollCamTransitionInParamObj'
    begin object name=RagdollCamTransitionInParamObj
    end object
    RagdollTransitionInParam=RagdollCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.RagdollCamTransitionOutParamObj'
    begin object name=RagdollCamTransitionOutParamObj
    end object
    RagdollTransitionOutParam=RagdollCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlGrenadeParam'Default__LPPCPendingLevel.GrenadeAimCamParamObj'
    begin object name=GrenadeAimCamParamObj
    end object
    GrenadeAimCamParams=GrenadeAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.GrenadeAimTransitionParamObj'
    begin object name=GrenadeAimTransitionParamObj
    end object
    GrenadeAimTransitionParam=GrenadeAimTransitionParamObj
    // Reference: LPCameraModeAimControlCrouchParam'Default__LPPCPendingLevel.CrouchAimCamParamObj'
    begin object name=CrouchAimCamParamObj
    end object
    CrouchAimCamParams=CrouchAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.CrouchAimTransitionParamObj'
    begin object name=CrouchAimTransitionParamObj
    end object
    CrouchAimTransitionParam=CrouchAimTransitionParamObj
    // Reference: LPCameraModeVSRepairParam'Default__LPPCPendingLevel.VSRepairCamParamObj'
    begin object name=VSRepairCamParamObj
    end object
    VSRepairCamParams=VSRepairCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPCPendingLevel.VSRepairTransitionParamObj'
    begin object name=VSRepairTransitionParamObj
    end object
    VSRepairTransitionParam=VSRepairTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPCPendingLevel.ThermalPostTransitionParamObj'
    begin object name=ThermalPostTransitionParamObj
    end object
    ThermalPostTransitionParam=ThermalPostTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPCPendingLevel.ReviveIncapacitatedTransitionParamObj'
    begin object name=ReviveIncapacitatedTransitionParamObj
    end object
    ReviveIncapacitatedTransitionParam=ReviveIncapacitatedTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPCPendingLevel.GeneralInteractionObjectTransitionParamObj'
    begin object name=GeneralInteractionObjectTransitionParamObj
    end object
    GeneralInteractionObjectTransitionParam=GeneralInteractionObjectTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPCPendingLevel.HardCutTransitionParamObj'
    begin object name=HardCutTransitionParamObj
    end object
    HardCutTransitionParam=HardCutTransitionParamObj
    // Reference: SPCameraModeZoomToTargetParam'Default__LPPCPendingLevel.DeathCameraZoomCamParamObj'
    begin object name=DeathCameraZoomCamParamObj
    end object
    DeathCameraZoomCamParams=DeathCameraZoomCamParamObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPCPendingLevel.DeathCameraZoomTransitionParamObj'
    begin object name=DeathCameraZoomTransitionParamObj
    end object
    DeathCameraZoomTransitionParam=DeathCameraZoomTransitionParamObj
    // Reference: LPCameraModeIncapacitatedThirdPersonParam'Default__LPPCPendingLevel.IncapacitatedCameraParamsObj'
    begin object name=IncapacitatedCameraParamsObj
    end object
    IncapacitatedCameraParams=IncapacitatedCameraParamsObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPCPendingLevel.IncapacitatedTransitionParamObj'
    begin object name=IncapacitatedTransitionParamObj
    end object
    IncapacitatedTransitionParam=IncapacitatedTransitionParamObj
    // Reference: LPCameraModeAimControlInPlaceRepairParam'Default__LPPCPendingLevel.InPlaceRepairCamParamsObj'
    begin object name=InPlaceRepairCamParamsObj
    end object
    InPlaceRepairCamParams=InPlaceRepairCamParamsObj
    // Reference: LPCameraTransitionCutParam'Default__LPPCPendingLevel.VSCamTransitionInParamObj'
    begin object name=VSCamTransitionInParamObj
    end object
    VSCamTransitionInParam=VSCamTransitionInParamObj
    // Reference: AkComponent'Default__LPPCPendingLevel.MPAnnouncementComponentObj'
    begin object name=MPAnnouncementComponentObj
    end object
    MPAnnouncementComponent=MPAnnouncementComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPCPendingLevel.LPPCSFLoaderDefObj'
    begin object name=LPPCSFLoaderDefObj
    end object
    SeekFreeLoader=LPPCSFLoaderDefObj
    // Reference: LPTVCameraManager'Default__LPPCPendingLevel.TVCameraManager0'
    begin object name=TVCameraManager0
    end object
    TVCameraManager=TVCameraManager0
    // Reference: LPSoundModeManager'Default__LPPCPendingLevel.LPSoundModeManagerA'
    begin object name=LPSoundModeManagerA
    end object
    SoundModeManager=LPSoundModeManagerA
    // Reference: CylinderComponent'Default__LPPCPendingLevel.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=FXActionManagerDefObj0
    Components[2]=MPAnnouncementComponentObj
    CollisionComponent=CollisionCylinder
}