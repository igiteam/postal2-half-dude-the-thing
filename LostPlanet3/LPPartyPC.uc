class LPPartyPC extends LPMenuGamePC
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

reliable client simulated function ClientTravelToSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x97E50000-0x00000000*/ private bool bIsPartySession[8388609];

    OnlineSub.GameInterface.DestroyOnlineGame(SessionName);
    super(LPPlayerController).ClientTravelToSession(SessionName, SearchClass, PlatformSpecificInfo, bIsPartySession);
    //return;    
}

reliable client simulated function ClientOpenFrontEndContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x35
    if(Action.bIsMPMenu)
    {
        super.ClientOpenFrontEndContent(Action);
    }
    //return;    
}

function OnConnectionStatusChange()
{
    local /*0x97E50000-0x00000000*/ private byte ConnectionStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    super(LPPlayerController).OnConnectionStatusChange(ConnectionStatus);
    switch(ConnectionStatus)
    {
        // End:0x2B
        case 2:
        // End:0x30
        case 3:
        // End:0x35
        case 4:
        // End:0x3A
        case 5:
        // End:0x3A5
        case 6:
            MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
            // End:0x3A5
            if(!MPMgr.CheckIsPlayerOnline(MPMgr.OwningControllerIndex))
            {
                // End:0x1B0
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.PSN_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, ReturnToMainMenuUponAccept);                    
                }
                else
                {
                    // End:0x2BC
                    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
                    {
                        Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.XboxLive_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, ReturnToMainMenuUponAccept);                        
                    }
                    else
                    {
                        Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.Internet_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, ReturnToMainMenuUponAccept);
                    }
                }
            }
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

defaultproperties
{
    // Reference: LPFXActionManager'Default__LPPartyPC.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPCameraModeAimControlFirstPersonParam'Default__LPPartyPC.FirstPersonAimCamParamObj'
    begin object name=FirstPersonAimCamParamObj
    end object
    FirstPersonAimCamParams=FirstPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.FirstPersonAimTransitionParamObj'
    begin object name=FirstPersonAimTransitionParamObj
    end object
    FirstPersonAimTransitionParam=FirstPersonAimTransitionParamObj
    // Reference: LPCameraModeAimControlThirdPersonParam'Default__LPPartyPC.ThirdPersonAimCamParamObj'
    begin object name=ThirdPersonAimCamParamObj
    end object
    ThirdPersonAimCamParams=ThirdPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.ThirdPersonAimTransitionParamObj'
    begin object name=ThirdPersonAimTransitionParamObj
    end object
    ThirdPersonAimTransitionParam=ThirdPersonAimTransitionParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.ShoulderAimTransitionParamObj'
    begin object name=ShoulderAimTransitionParamObj
    end object
    ShoulderAimTransitionParam=ShoulderAimTransitionParamObj
    // Reference: LPCameraModeAimControlJobLogParam'Default__LPPartyPC.JobLogCamParamObj'
    begin object name=JobLogCamParamObj
    end object
    JobLogCamParams=JobLogCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.JobLogCamTransitionInParamObj'
    begin object name=JobLogCamTransitionInParamObj
    end object
    JobLogTransitionInParam=JobLogCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.JobLogCamTransitionOutParamObj'
    begin object name=JobLogCamTransitionOutParamObj
    end object
    JobLogTransitionOutParam=JobLogCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlRagdollParam'Default__LPPartyPC.RagdollCamParamObj'
    begin object name=RagdollCamParamObj
    end object
    RagdollCamParams=RagdollCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.RagdollCamTransitionInParamObj'
    begin object name=RagdollCamTransitionInParamObj
    end object
    RagdollTransitionInParam=RagdollCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.RagdollCamTransitionOutParamObj'
    begin object name=RagdollCamTransitionOutParamObj
    end object
    RagdollTransitionOutParam=RagdollCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlGrenadeParam'Default__LPPartyPC.GrenadeAimCamParamObj'
    begin object name=GrenadeAimCamParamObj
    end object
    GrenadeAimCamParams=GrenadeAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.GrenadeAimTransitionParamObj'
    begin object name=GrenadeAimTransitionParamObj
    end object
    GrenadeAimTransitionParam=GrenadeAimTransitionParamObj
    // Reference: LPCameraModeAimControlCrouchParam'Default__LPPartyPC.CrouchAimCamParamObj'
    begin object name=CrouchAimCamParamObj
    end object
    CrouchAimCamParams=CrouchAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.CrouchAimTransitionParamObj'
    begin object name=CrouchAimTransitionParamObj
    end object
    CrouchAimTransitionParam=CrouchAimTransitionParamObj
    // Reference: LPCameraModeVSRepairParam'Default__LPPartyPC.VSRepairCamParamObj'
    begin object name=VSRepairCamParamObj
    end object
    VSRepairCamParams=VSRepairCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPartyPC.VSRepairTransitionParamObj'
    begin object name=VSRepairTransitionParamObj
    end object
    VSRepairTransitionParam=VSRepairTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPartyPC.ThermalPostTransitionParamObj'
    begin object name=ThermalPostTransitionParamObj
    end object
    ThermalPostTransitionParam=ThermalPostTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPartyPC.ReviveIncapacitatedTransitionParamObj'
    begin object name=ReviveIncapacitatedTransitionParamObj
    end object
    ReviveIncapacitatedTransitionParam=ReviveIncapacitatedTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPartyPC.GeneralInteractionObjectTransitionParamObj'
    begin object name=GeneralInteractionObjectTransitionParamObj
    end object
    GeneralInteractionObjectTransitionParam=GeneralInteractionObjectTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPartyPC.HardCutTransitionParamObj'
    begin object name=HardCutTransitionParamObj
    end object
    HardCutTransitionParam=HardCutTransitionParamObj
    // Reference: SPCameraModeZoomToTargetParam'Default__LPPartyPC.DeathCameraZoomCamParamObj'
    begin object name=DeathCameraZoomCamParamObj
    end object
    DeathCameraZoomCamParams=DeathCameraZoomCamParamObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPartyPC.DeathCameraZoomTransitionParamObj'
    begin object name=DeathCameraZoomTransitionParamObj
    end object
    DeathCameraZoomTransitionParam=DeathCameraZoomTransitionParamObj
    // Reference: LPCameraModeIncapacitatedThirdPersonParam'Default__LPPartyPC.IncapacitatedCameraParamsObj'
    begin object name=IncapacitatedCameraParamsObj
    end object
    IncapacitatedCameraParams=IncapacitatedCameraParamsObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPartyPC.IncapacitatedTransitionParamObj'
    begin object name=IncapacitatedTransitionParamObj
    end object
    IncapacitatedTransitionParam=IncapacitatedTransitionParamObj
    // Reference: LPCameraModeAimControlInPlaceRepairParam'Default__LPPartyPC.InPlaceRepairCamParamsObj'
    begin object name=InPlaceRepairCamParamsObj
    end object
    InPlaceRepairCamParams=InPlaceRepairCamParamsObj
    // Reference: LPCameraTransitionCutParam'Default__LPPartyPC.VSCamTransitionInParamObj'
    begin object name=VSCamTransitionInParamObj
    end object
    VSCamTransitionInParam=VSCamTransitionInParamObj
    // Reference: AkComponent'Default__LPPartyPC.MPAnnouncementComponentObj'
    begin object name=MPAnnouncementComponentObj
    end object
    MPAnnouncementComponent=MPAnnouncementComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPartyPC.LPPCSFLoaderDefObj'
    begin object name=LPPCSFLoaderDefObj
    end object
    SeekFreeLoader=LPPCSFLoaderDefObj
    // Reference: LPTVCameraManager'Default__LPPartyPC.TVCameraManager0'
    begin object name=TVCameraManager0
    end object
    TVCameraManager=TVCameraManager0
    // Reference: LPSoundModeManager'Default__LPPartyPC.LPSoundModeManagerA'
    begin object name=LPSoundModeManagerA
    end object
    SoundModeManager=LPSoundModeManagerA
    // Reference: CylinderComponent'Default__LPPartyPC.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=FXActionManagerDefObj0
    Components[2]=MPAnnouncementComponentObj
    CollisionComponent=CollisionCylinder
}