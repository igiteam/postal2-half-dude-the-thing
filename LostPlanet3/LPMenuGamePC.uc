class LPMenuGamePC extends LPPlayerController
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_FrontEnd[536870913];

reliable client simulated event ClientWasKicked()
{
    //return;    
}

function IsMenuPC()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CanRestartPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event PreClientTravel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PendingURL[8388609];
    local /*0x97E50000-0x00000000*/ private byte TravelType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsSeamlessTravel[8388609];

    super.PreClientTravel(PendingURL, TravelType, bIsSeamlessTravel);
    GetLoadoutKitManager().SaveLoadoutsToProfile();
    GetMetagameManager().SaveUnlockablesToProfile();
    //return;    
}

function OnPersistentDataManagersInit()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPRI;

    super.OnPersistentDataManagersInit();
    // End:0x61
    if(IsLocalPlayerController())
    {
        MyPRI = LPMenuGamePRI(PlayerReplicationInfo);
        // End:0x61
        if(MyPRI != none)
        {
            MyPRI.UpdateMPPlayerInfo();
        }
    }
    //return;    
}

function OnOpenFrontEndContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    ClientOpenFrontEndContent(Action);
    //return;    
}

reliable client simulated function ClientOpenFrontEndContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], GFxFlashMovieInstance;

    // End:0xDE
    if(MyLPGFxMovie_FrontEnd == none)
    {
        Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, Action.GFxFlashMovie, Action.GFxFlashMovieInstanceClass_FrontEnd, Class'Engine.UIManager'.static.GetUIManager().FindLocalPlayerIndex(Player), GFxFlashMovieInstance, 0);
        MyLPGFxMovie_FrontEnd = LPGFxMoviePlayerFrontEndManager(GFxFlashMovieInstance);
        ClientSetOnlineStatus();
    }
    //return;    
}

function CloseFrontEnd()
{
    // End:0x3A
    if(MyLPGFxMovie_FrontEnd != none)
    {
        MyLPGFxMovie_FrontEnd.Close(true);
        MyLPGFxMovie_FrontEnd = none;
    }
    //return;    
}

function IsAtTitleScreen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyLPGFxMovie_FrontEnd != none)
    {
        return MyLPGFxMovie_FrontEnd.bIsInStartScreen;
    }
    return false;
    //return ReturnValue;    
}

function IsAttemptingGamespyLogin()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyLPGFxMovie_FrontEnd != none)
    {
        return MyLPGFxMovie_FrontEnd.bIsInGamespyLoginScreen;
    }
    return false;
    //return ReturnValue;    
}

function IsMenuLoaded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyLPGFxMovie_FrontEnd != none;
    //return ReturnValue;    
}

function NotifyDeviceSelectComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    super(SPPlayerController).NotifyDeviceSelectComplete(bWasSuccessful);
    // End:0x4C
    if(MyLPGFxMovie_FrontEnd != none)
    {
        MyLPGFxMovie_FrontEnd.NotifyDeviceSelectComplete(bWasSuccessful);
    }
    //return;    
}

function NotifyLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];

    super(SPPlayerController).NotifyLoginChange(LocalUserNum);
    // End:0x4A
    if(MyLPGFxMovie_FrontEnd != none)
    {
        MyLPGFxMovie_FrontEnd.NotifyLoginChange(LocalUserNum);
    }
    //return;    
}

auto state PlayerWaiting
{
    ignores PlayerMove;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPFXActionManager'Default__LPMenuGamePC.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPCameraModeAimControlFirstPersonParam'Default__LPMenuGamePC.FirstPersonAimCamParamObj'
    begin object name=FirstPersonAimCamParamObj
    end object
    FirstPersonAimCamParams=FirstPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.FirstPersonAimTransitionParamObj'
    begin object name=FirstPersonAimTransitionParamObj
    end object
    FirstPersonAimTransitionParam=FirstPersonAimTransitionParamObj
    // Reference: LPCameraModeAimControlThirdPersonParam'Default__LPMenuGamePC.ThirdPersonAimCamParamObj'
    begin object name=ThirdPersonAimCamParamObj
    end object
    ThirdPersonAimCamParams=ThirdPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.ThirdPersonAimTransitionParamObj'
    begin object name=ThirdPersonAimTransitionParamObj
    end object
    ThirdPersonAimTransitionParam=ThirdPersonAimTransitionParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.ShoulderAimTransitionParamObj'
    begin object name=ShoulderAimTransitionParamObj
    end object
    ShoulderAimTransitionParam=ShoulderAimTransitionParamObj
    // Reference: LPCameraModeAimControlJobLogParam'Default__LPMenuGamePC.JobLogCamParamObj'
    begin object name=JobLogCamParamObj
    end object
    JobLogCamParams=JobLogCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.JobLogCamTransitionInParamObj'
    begin object name=JobLogCamTransitionInParamObj
    end object
    JobLogTransitionInParam=JobLogCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.JobLogCamTransitionOutParamObj'
    begin object name=JobLogCamTransitionOutParamObj
    end object
    JobLogTransitionOutParam=JobLogCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlRagdollParam'Default__LPMenuGamePC.RagdollCamParamObj'
    begin object name=RagdollCamParamObj
    end object
    RagdollCamParams=RagdollCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.RagdollCamTransitionInParamObj'
    begin object name=RagdollCamTransitionInParamObj
    end object
    RagdollTransitionInParam=RagdollCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.RagdollCamTransitionOutParamObj'
    begin object name=RagdollCamTransitionOutParamObj
    end object
    RagdollTransitionOutParam=RagdollCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlGrenadeParam'Default__LPMenuGamePC.GrenadeAimCamParamObj'
    begin object name=GrenadeAimCamParamObj
    end object
    GrenadeAimCamParams=GrenadeAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.GrenadeAimTransitionParamObj'
    begin object name=GrenadeAimTransitionParamObj
    end object
    GrenadeAimTransitionParam=GrenadeAimTransitionParamObj
    // Reference: LPCameraModeAimControlCrouchParam'Default__LPMenuGamePC.CrouchAimCamParamObj'
    begin object name=CrouchAimCamParamObj
    end object
    CrouchAimCamParams=CrouchAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.CrouchAimTransitionParamObj'
    begin object name=CrouchAimTransitionParamObj
    end object
    CrouchAimTransitionParam=CrouchAimTransitionParamObj
    // Reference: LPCameraModeVSRepairParam'Default__LPMenuGamePC.VSRepairCamParamObj'
    begin object name=VSRepairCamParamObj
    end object
    VSRepairCamParams=VSRepairCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPMenuGamePC.VSRepairTransitionParamObj'
    begin object name=VSRepairTransitionParamObj
    end object
    VSRepairTransitionParam=VSRepairTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPMenuGamePC.ThermalPostTransitionParamObj'
    begin object name=ThermalPostTransitionParamObj
    end object
    ThermalPostTransitionParam=ThermalPostTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPMenuGamePC.ReviveIncapacitatedTransitionParamObj'
    begin object name=ReviveIncapacitatedTransitionParamObj
    end object
    ReviveIncapacitatedTransitionParam=ReviveIncapacitatedTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPMenuGamePC.GeneralInteractionObjectTransitionParamObj'
    begin object name=GeneralInteractionObjectTransitionParamObj
    end object
    GeneralInteractionObjectTransitionParam=GeneralInteractionObjectTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPMenuGamePC.HardCutTransitionParamObj'
    begin object name=HardCutTransitionParamObj
    end object
    HardCutTransitionParam=HardCutTransitionParamObj
    // Reference: SPCameraModeZoomToTargetParam'Default__LPMenuGamePC.DeathCameraZoomCamParamObj'
    begin object name=DeathCameraZoomCamParamObj
    end object
    DeathCameraZoomCamParams=DeathCameraZoomCamParamObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPMenuGamePC.DeathCameraZoomTransitionParamObj'
    begin object name=DeathCameraZoomTransitionParamObj
    end object
    DeathCameraZoomTransitionParam=DeathCameraZoomTransitionParamObj
    // Reference: LPCameraModeIncapacitatedThirdPersonParam'Default__LPMenuGamePC.IncapacitatedCameraParamsObj'
    begin object name=IncapacitatedCameraParamsObj
    end object
    IncapacitatedCameraParams=IncapacitatedCameraParamsObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPMenuGamePC.IncapacitatedTransitionParamObj'
    begin object name=IncapacitatedTransitionParamObj
    end object
    IncapacitatedTransitionParam=IncapacitatedTransitionParamObj
    // Reference: LPCameraModeAimControlInPlaceRepairParam'Default__LPMenuGamePC.InPlaceRepairCamParamsObj'
    begin object name=InPlaceRepairCamParamsObj
    end object
    InPlaceRepairCamParams=InPlaceRepairCamParamsObj
    // Reference: LPCameraTransitionCutParam'Default__LPMenuGamePC.VSCamTransitionInParamObj'
    begin object name=VSCamTransitionInParamObj
    end object
    VSCamTransitionInParam=VSCamTransitionInParamObj
    // Reference: AkComponent'Default__LPMenuGamePC.MPAnnouncementComponentObj'
    begin object name=MPAnnouncementComponentObj
    end object
    MPAnnouncementComponent=MPAnnouncementComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPMenuGamePC.LPPCSFLoaderDefObj'
    begin object name=LPPCSFLoaderDefObj
    end object
    SeekFreeLoader=LPPCSFLoaderDefObj
    // Reference: LPTVCameraManager'Default__LPMenuGamePC.TVCameraManager0'
    begin object name=TVCameraManager0
    end object
    TVCameraManager=TVCameraManager0
    // Reference: LPSoundModeManager'Default__LPMenuGamePC.LPSoundModeManagerA'
    begin object name=LPSoundModeManagerA
    end object
    SoundModeManager=LPSoundModeManagerA
    // Reference: CylinderComponent'Default__LPMenuGamePC.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=FXActionManagerDefObj0
    Components[2]=MPAnnouncementComponentObj
    CollisionComponent=CollisionCylinder
}