class LPPreGameLobbyPC extends LPMenuGamePC
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

reliable client simulated function ClientOpenFrontEndContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x35
    if(Action.bIsPreGameLobby)
    {
        super.ClientOpenFrontEndContent(Action);
    }
    //return;    
}

function OnLoginChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Game, GRI;

    super(LPPlayerController).OnLoginChanged(NewStatus);
    Game = LPPreGameLobby(WorldInfo.Game);
    // End:0x55
    if(Game == none)
    {
        return;
    }
    GRI = LPPreGameLobbyGRI(Game.GameReplicationInfo);
    // End:0x97
    if(GRI == none)
    {
        return;
    }
    // End:0x136
    if(((int(GRI.OnlineMode) == int(1)) && int(NewStatus) < int(2)) || (int(GRI.OnlineMode) == int(2)) && int(NewStatus) < int(1))
    {
        GRI.StopCountdown();
    }
    //return;    
}

event PreClientTravel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PendingURL[8388609];
    local /*0x97E50000-0x00000000*/ private byte TravelType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsSeamlessTravel[8388609];

    UpdateURL("Team", string(PlayerReplicationInfo.Team.TeamIndex), false);
    InitMatchData(true, true);
    super.PreClientTravel(PendingURL, TravelType, bIsSeamlessTravel);
    //return;    
}

reliable server function ServerChangeTeam()
{
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, Game, MyGRI;

    GameSettings = Class'LPMultiplayerManager'.static.GetInstance().GetLPGameSettings();
    // End:0x108
    if((GameSettings != none) && WorldInfo != none)
    {
        Game = SPGameInfo(WorldInfo.Game);
        // End:0x108
        if((Game != none) && Game.Teams[N].Size >= (GameSettings.GetMaxPlayers() / 2))
        {
            return;
        }
    }
    super(LPPlayerController).ServerChangeTeam(N);
    // End:0x187
    if(IsLocalPlayerController())
    {
        MyGRI = LPPreGameLobbyGRI(WorldInfo.GRI);
        // End:0x187
        if(MyGRI != none)
        {
            MyGRI.ExecOnLocalPlayerTeamChanged();
        }
    }
    //return;    
}

event InitInputSystem()
{
    WorldInfo.bDoNotStopMovieAfterLoad = true;
    super(LPPlayerController).InitInputSystem();
    //return;    
}

reliable client simulated function ClientSetOnlineStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, MPMgr;

    LP = LocalPlayer(Player);
    // End:0x2D
    if(LP == none)
    {
        return;
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 3);
    //return;    
}

auto state PlayerWaiting
{
    reliable server function ServerChangeTeam()
    {
        local /*0x97E50000-0x00000000*/ private int N[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL GameSettings, Game, MyGRI;

        GameSettings = Class'LPMultiplayerManager'.static.GetInstance().GetLPGameSettings();
        // End:0x108
        if((GameSettings != none) && WorldInfo != none)
        {
            Game = SPGameInfo(WorldInfo.Game);
            // End:0x108
            if((Game != none) && Game.Teams[N].Size >= (GameSettings.GetMaxPlayers() / 2))
            {
                return;
            }
        }
        super.ServerChangeTeam(N);
        // End:0x187
        if(IsLocalPlayerController())
        {
            MyGRI = LPPreGameLobbyGRI(WorldInfo.GRI);
            // End:0x187
            if(MyGRI != none)
            {
                MyGRI.ExecOnLocalPlayerTeamChanged();
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPFXActionManager'Default__LPPreGameLobbyPC.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPCameraModeAimControlFirstPersonParam'Default__LPPreGameLobbyPC.FirstPersonAimCamParamObj'
    begin object name=FirstPersonAimCamParamObj
    end object
    FirstPersonAimCamParams=FirstPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.FirstPersonAimTransitionParamObj'
    begin object name=FirstPersonAimTransitionParamObj
    end object
    FirstPersonAimTransitionParam=FirstPersonAimTransitionParamObj
    // Reference: LPCameraModeAimControlThirdPersonParam'Default__LPPreGameLobbyPC.ThirdPersonAimCamParamObj'
    begin object name=ThirdPersonAimCamParamObj
    end object
    ThirdPersonAimCamParams=ThirdPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.ThirdPersonAimTransitionParamObj'
    begin object name=ThirdPersonAimTransitionParamObj
    end object
    ThirdPersonAimTransitionParam=ThirdPersonAimTransitionParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.ShoulderAimTransitionParamObj'
    begin object name=ShoulderAimTransitionParamObj
    end object
    ShoulderAimTransitionParam=ShoulderAimTransitionParamObj
    // Reference: LPCameraModeAimControlJobLogParam'Default__LPPreGameLobbyPC.JobLogCamParamObj'
    begin object name=JobLogCamParamObj
    end object
    JobLogCamParams=JobLogCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.JobLogCamTransitionInParamObj'
    begin object name=JobLogCamTransitionInParamObj
    end object
    JobLogTransitionInParam=JobLogCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.JobLogCamTransitionOutParamObj'
    begin object name=JobLogCamTransitionOutParamObj
    end object
    JobLogTransitionOutParam=JobLogCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlRagdollParam'Default__LPPreGameLobbyPC.RagdollCamParamObj'
    begin object name=RagdollCamParamObj
    end object
    RagdollCamParams=RagdollCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.RagdollCamTransitionInParamObj'
    begin object name=RagdollCamTransitionInParamObj
    end object
    RagdollTransitionInParam=RagdollCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.RagdollCamTransitionOutParamObj'
    begin object name=RagdollCamTransitionOutParamObj
    end object
    RagdollTransitionOutParam=RagdollCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlGrenadeParam'Default__LPPreGameLobbyPC.GrenadeAimCamParamObj'
    begin object name=GrenadeAimCamParamObj
    end object
    GrenadeAimCamParams=GrenadeAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.GrenadeAimTransitionParamObj'
    begin object name=GrenadeAimTransitionParamObj
    end object
    GrenadeAimTransitionParam=GrenadeAimTransitionParamObj
    // Reference: LPCameraModeAimControlCrouchParam'Default__LPPreGameLobbyPC.CrouchAimCamParamObj'
    begin object name=CrouchAimCamParamObj
    end object
    CrouchAimCamParams=CrouchAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.CrouchAimTransitionParamObj'
    begin object name=CrouchAimTransitionParamObj
    end object
    CrouchAimTransitionParam=CrouchAimTransitionParamObj
    // Reference: LPCameraModeVSRepairParam'Default__LPPreGameLobbyPC.VSRepairCamParamObj'
    begin object name=VSRepairCamParamObj
    end object
    VSRepairCamParams=VSRepairCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPreGameLobbyPC.VSRepairTransitionParamObj'
    begin object name=VSRepairTransitionParamObj
    end object
    VSRepairTransitionParam=VSRepairTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPreGameLobbyPC.ThermalPostTransitionParamObj'
    begin object name=ThermalPostTransitionParamObj
    end object
    ThermalPostTransitionParam=ThermalPostTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPreGameLobbyPC.ReviveIncapacitatedTransitionParamObj'
    begin object name=ReviveIncapacitatedTransitionParamObj
    end object
    ReviveIncapacitatedTransitionParam=ReviveIncapacitatedTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPreGameLobbyPC.GeneralInteractionObjectTransitionParamObj'
    begin object name=GeneralInteractionObjectTransitionParamObj
    end object
    GeneralInteractionObjectTransitionParam=GeneralInteractionObjectTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPreGameLobbyPC.HardCutTransitionParamObj'
    begin object name=HardCutTransitionParamObj
    end object
    HardCutTransitionParam=HardCutTransitionParamObj
    // Reference: SPCameraModeZoomToTargetParam'Default__LPPreGameLobbyPC.DeathCameraZoomCamParamObj'
    begin object name=DeathCameraZoomCamParamObj
    end object
    DeathCameraZoomCamParams=DeathCameraZoomCamParamObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPreGameLobbyPC.DeathCameraZoomTransitionParamObj'
    begin object name=DeathCameraZoomTransitionParamObj
    end object
    DeathCameraZoomTransitionParam=DeathCameraZoomTransitionParamObj
    // Reference: LPCameraModeIncapacitatedThirdPersonParam'Default__LPPreGameLobbyPC.IncapacitatedCameraParamsObj'
    begin object name=IncapacitatedCameraParamsObj
    end object
    IncapacitatedCameraParams=IncapacitatedCameraParamsObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPreGameLobbyPC.IncapacitatedTransitionParamObj'
    begin object name=IncapacitatedTransitionParamObj
    end object
    IncapacitatedTransitionParam=IncapacitatedTransitionParamObj
    // Reference: LPCameraModeAimControlInPlaceRepairParam'Default__LPPreGameLobbyPC.InPlaceRepairCamParamsObj'
    begin object name=InPlaceRepairCamParamsObj
    end object
    InPlaceRepairCamParams=InPlaceRepairCamParamsObj
    // Reference: LPCameraTransitionCutParam'Default__LPPreGameLobbyPC.VSCamTransitionInParamObj'
    begin object name=VSCamTransitionInParamObj
    end object
    VSCamTransitionInParam=VSCamTransitionInParamObj
    // Reference: AkComponent'Default__LPPreGameLobbyPC.MPAnnouncementComponentObj'
    begin object name=MPAnnouncementComponentObj
    end object
    MPAnnouncementComponent=MPAnnouncementComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPreGameLobbyPC.LPPCSFLoaderDefObj'
    begin object name=LPPCSFLoaderDefObj
    end object
    SeekFreeLoader=LPPCSFLoaderDefObj
    // Reference: LPTVCameraManager'Default__LPPreGameLobbyPC.TVCameraManager0'
    begin object name=TVCameraManager0
    end object
    TVCameraManager=TVCameraManager0
    // Reference: LPSoundModeManager'Default__LPPreGameLobbyPC.LPSoundModeManagerA'
    begin object name=LPSoundModeManagerA
    end object
    SoundModeManager=LPSoundModeManagerA
    // Reference: CylinderComponent'Default__LPPreGameLobbyPC.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=FXActionManagerDefObj0
    Components[2]=MPAnnouncementComponentObj
    CollisionComponent=CollisionCylinder
}