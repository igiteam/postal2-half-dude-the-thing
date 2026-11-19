class LPSM_PlayerEnterVSAdditive extends SPSM_PlayAnimBase
    config(Game);

enum EEntryAnims
{
    EEnA_Front,                     // 0
    EEnA_Rear,                      // 1
    EEnA_FrontShort,                // 2
    EEnA_RearShort,                 // 3
    EEnA_MAX                        // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionInParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSAnimTemplates[536870913];

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PlayerPawn = LPPlayerPawn(inPawn);
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((int(PlayerPawn.ExitDirection) == int(0)) ? 2 : 3);
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPBaseVSPlayerPawn(PlayerPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    PlayerPawn.PositionSelfForVSEnterOrExit(PlayingSeq, vsPawn, true);
    PlayerPawn.SetLocation(SPMakeVector(PlayerPawn.Location.X, PlayerPawn.Location.Y, PlayerPawn.Location.Z + float(171)));
    // End:0x26E
    if(MySPPawn.IsLocallyControlled())
    {
        PlayerPawn.SavedController.myLPHUD.RemoveMessageLayer(22);
        PlayerPawn.SavedController.PauseFire();
        PlayerPawn.SavedController.ReleaseHeldButtons();
        PlayerPawn.Controller.GotoState('EjectVSState');
    }
    PlayerPawn.TemplateLogicData.TargetPawn = vsPawn;
    // End:0x2FF
    if(ClassIsChildOf(vsPawn.Class, Class'LPVSPlayerPawn'))
    {
        LPVSPlayerPawn(vsPawn).HideVSGlass();
    }
    PlayerPawn.SetCollision(false, false);
    PlayerPawn.bBlockActors = false;
    CamParams.CheckCameraCollision = false;
    CamParams.bCollideCamera = false;
    CamParams.bConstrainPlayerInFOV = false;
    CamParams.bConstrainEnemyInFOV = false;
    CamParams.CheckCameraCollision = false;
    CamParams.bCollideCamera = false;
    CamParams.bConstrainPlayerInFOV = false;
    CamParams.bConstrainEnemyInFOV = false;
    CamParams.CheckCameraCollision = false;
    CamParams.MyPawn = MySPPawn;
    CamParams.CameraFOVBoneName = 'None';
    CamParams.FloatingAimThresholdMinX = 0.0000000;
    CamParams.FloatingAimThresholdMaxX = 0.0000000;
    CamParams.FloatingAimThresholdMinY = 0.0000000;
    CamParams.FloatingAimThresholdMaxY = 0.0000000;
    PlayerPawn.SavedController.ChangeCameraMode(CamParams, CamTransitionInParam);
    PlayVSAdditive();
    //return;    
}

function PlayVSAdditive()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimTemplateRoot, AnimSeq;

    vsPawn.PlayerVSLogicAnimTree.FindAnimNodes(AnimationTemplateNodeNames, VSAnimTemplates, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
    AnimTemplateRoot = SPAnimNodeTemplateLogicNamedRoot(VSAnimTemplates[GetDesiredAnimIndex()]);
    // End:0x87
    if(AnimTemplateRoot == none)
    {
        return;
    }
    AnimSeq = AnimTemplateRoot.GetBestSequenceTemplate(vsPawn);
    // End:0xCA
    if(AnimSeq == none)
    {
        return;
    }
    vsPawn.PlayAdditiveAnimationSequence(AnimSeq,,,, 0.0000000, 0.1000000);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0xDD
    if(vsPawn != none)
    {
        // End:0xDD
        if(ClassIsChildOf(vsPawn.Class, Class'LPVSPlayerPawn'))
        {
            LPVSPlayerPawn(vsPawn).HideVSGlass(false);
            // End:0xDD
            if(vsPawn.IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin') || vsPawn.IsDoingSpecialMove(Class'LPSM_VSWaitEntryEnd'))
            {
                vsPawn.EndCurrentSpecialMove();
            }
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x14F
    if(!ClassIsChildOf(vsPawn.Class, Class'LPPlayerTurretPawn'))
    {
        PlayerPawn.StopFullBodyAnim(0.5000000);        
    }
    else
    {
        PlayerPawn.StopFullBodyAnim(0.0000000);
        PlayerPawn.DoSpecialMove(Class'LPSM_PlayerTurretSeated');
        LPPlayerTurretPawn(vsPawn).SeatedPawn = PlayerPawn;
        // End:0x257
        if(int(PlayerPawn.WorldInfo.NetMode) != int(NM_Client))
        {
            PlayerPawn.ReplicatedEvent('SeatedPawn');
            PlayerPawn.bForceNetUpdate = true;
        }
    }
    // End:0x2E1
    if(PlayerPawn.SavedController.IsLocalController())
    {
        PlayerPawn.SavedController.UnPauseFire();
        vsPawn.LocalPlayerEnteringVS();
    }
    // End:0x437
    if((MySPPawn.Controller != none) && int(MySPPawn.Role) == int(ROLE_Authority))
    {
        // End:0x3FA
        if(vsPawn.Health < vsPawn.TuneDataVSPlayerPawn.MinHealthForEntry)
        {
            vsPawn.HealDamage(vsPawn.TuneDataVSPlayerPawn.MinHealthForEntry - vsPawn.Health, none, none);
        }
        PlayerPawn.SavedController.ServerEnterVS(vsPawn);
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

event AnimNotifySpecialMove()
{
    PlayerPawn.SavedController.WinchBoneDetach();
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerEnterVSAdditive.CamParamObj'
    begin object name=CamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=85.0000000
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerEnterVSAdditive.CamTransitionInParamObj'
    begin object name=CamTransitionInParamObj class=Class'LPCameraTransitionCutParam'
    end object
    CamTransitionInParam=CamTransitionInParamObj
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    BlendInTime=0.0000000
    BlendOutTime=0.0000000
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
}