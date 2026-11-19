class LPSM_PlayerEnterVS extends SPSM_LeaderPawnBase
    config(Game);

enum EEntryAnims
{
    ENA_Front,                      // 0
    ENA_Rear,                       // 1
    ENA_FrontShort,                 // 2
    ENA_RearShort,                  // 3
    ENA_Zipline,                    // 4
    ENA_TurretRight,                // 5
    ENA_TurretLeft,                 // 6
    ENA_EnterPlatform,              // 7
    ENA_MAX                         // 8
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionInParam;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PlayerPawn = LPPlayerPawn(inPawn);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(AnimTemplateTree != none)
    {
        return AnimTemplateTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function UseAnimatedCamera()
{
    // End:0x14A
    if(MySPPawn.IsLocallyControlled())
    {
        CamParams.MyPawn = MySPPawn;
        CamParams.CameraFOVBoneName = 'None';
        CamParams.FloatingAimThresholdMinX = 0.0000000;
        CamParams.FloatingAimThresholdMaxX = 0.0000000;
        CamParams.FloatingAimThresholdMinY = 0.0000000;
        CamParams.FloatingAimThresholdMaxY = 0.0000000;
        PlayerPawn.SavedController.ChangeCameraMode(CamParams, CamTransitionInParam);
    }
    //return;    
}

function UseDefaultCam()
{
    // End:0x5F
    if(MySPPawn.IsLocallyControlled())
    {
        PlayerPawn.SavedController.SetDefaultCam(CamTransitionInParam);
    }
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetMyAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    switch(PlayerPawn.ExitStyle)
    {
        // End:0x60
        case 4:
            return ((int(PlayerPawn.ExitDirection) == int(3)) ? 6 : 5);
            // End:0x106
            break;
        // End:0x6B
        case 2:
            return 4;
            // End:0x106
            break;
        // End:0x76
        case 3:
            return 7;
            // End:0x106
            break;
        // End:0x103
        case 0:
            // End:0xD0
            if(PlayerPawn.bUseShortVSEntry)
            {
                return ((int(PlayerPawn.ExitDirection) == int(0)) ? 2 : 3);                
            }
            else
            {
                return ((int(PlayerPawn.ExitDirection) == int(0)) ? 0 : 1);
            }
            // End:0x106
            break;
        // End:0xFFFF
        default:
            break;
    }
    return 2;
    //return ReturnValue;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private int AnimIndex;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    // End:0x175
    if(MySPPawn.IsLocallyControlled())
    {
        PlayerPawn.SavedController.myLPHUD.RemoveMessageLayer(22);
        PlayerPawn.SavedController.myLPHUD.RemoveMessageLayer(11);
        PlayerPawn.SavedController.myLPHUD.RemoveMessageLayer(19);
        PlayerPawn.SavedController.PauseFire();
        PlayerPawn.SavedController.ReleaseHeldButtons();
    }
    vsPawn = LPBaseVSPlayerPawn(FollowerPawn);
    LPPawn(MySPPawn).TemplateLogicData.TargetPawn = vsPawn;
    // End:0x216
    if(LPVSPlayerPawn(vsPawn) != none)
    {
        LPVSPlayerPawn(vsPawn).HideVSGlass();
    }
    MySPPawn.SetCollision(false, false);
    MySPPawn.bBlockActors = false;
    CamParams.CheckCameraCollision = false;
    CamParams.bCollideCamera = false;
    CamParams.bConstrainPlayerInFOV = false;
    CamParams.bConstrainEnemyInFOV = false;
    AnimIndex = int(GetMyAnimIndex());
    // End:0x3CA
    if(AnimIndex == 4)
    {
        // End:0x33D
        if(MySPPawn.IsLocallyControlled())
        {
            vsPawn.SetMeshLodForInsideCockpit();
        }
        CamParams.AnimatedFOV = 75.0000000;
        StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, false, AnimFinished, vsPawn.ZiplineEnterFinished,, 0.0000000);        
    }
    else
    {
        // End:0x422
        if(AnimIndex == 7)
        {
            StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, true, AnimFinished,,, 0.0000000,, 0.0000000);            
        }
        else
        {
            StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, true, AnimFinished,,, 0.0000000);
        }
        CamParams.AnimatedFOV = CamParams.default.AnimatedFOV;
    }
    UseAnimatedCamera();
    //return;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0
    0
    PlayerPawn.PositionSelfForVSEnterOrExit(MySeq, LPBaseVSPlayerPawn(Follower), true);
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, 0.0000000, 2, RotationMode);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x9C
    if(FollowerPawn != none)
    {
        FollowerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        FollowerPawn.EndCurrentSpecialMove();
        // End:0x9C
        if(LPVSPlayerPawn(FollowerPawn) != none)
        {
            LPVSPlayerPawn(FollowerPawn).HideVSGlass(false);
        }
    }
    StopAnimationChoreography(MySPPawn);
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x139
    if(((MySPPawn.Health <= 0) || MySPPawn.bDeleteMe) || MySPPawn.bPlayedDeath)
    {
        return;
    }
    // End:0x178
    if(LPPlayerTurretPawn(vsPawn) == none)
    {
        MySPPawn.StopFullBodyAnim(0.5000000);        
    }
    else
    {
        MySPPawn.StopFullBodyAnim(0.0000000);
        MySPPawn.DoSpecialMove(Class'LPSM_PlayerTurretSeated');
        LPPlayerTurretPawn(vsPawn).SeatedPawn = MySPPawn;
        // End:0x280
        if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Client))
        {
            vsPawn.ReplicatedEvent('SeatedPawn');
            vsPawn.bForceNetUpdate = true;
        }
    }
    // End:0x30A
    if(PlayerPawn.SavedController.IsLocalController())
    {
        PlayerPawn.SavedController.UnPauseFire();
        vsPawn.LocalPlayerEnteringVS();
    }
    // End:0x460
    if((MySPPawn.Controller != none) && int(MySPPawn.Role) == int(ROLE_Authority))
    {
        // End:0x423
        if(vsPawn.Health < vsPawn.TuneDataVSPlayerPawn.MinHealthForEntry)
        {
            vsPawn.HealDamage(vsPawn.TuneDataVSPlayerPawn.MinHealthForEntry - vsPawn.Health, none, none);
        }
        PlayerPawn.SavedController.ServerEnterVS(vsPawn);
    }
    vsPawn.ForceRetractWinch();
    // End:0x4C2
    if(NextMove == none)
    {
        PlayerPawn.SavedController.TryToOpenMunitionsLockerForDesign();
    }
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerEnterVS.CamParamObj'
    begin object name=CamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=85.0000000
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerEnterVS.CamTransitionInParamObj'
    begin object name=CamTransitionInParamObj class=Class'LPCameraTransitionCutParam'
    end object
    CamTransitionInParam=CamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VSPlayerEnter'
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
}