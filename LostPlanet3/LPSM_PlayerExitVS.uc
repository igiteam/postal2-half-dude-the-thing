class LPSM_PlayerExitVS extends SPSM_LeaderPawnBase
    config(Game);

enum EExitAnims
{
    EEA_Front,                      // 0
    EEA_Rear,                       // 1
    EEA_FrontShort,                 // 2
    EEA_RearShort,                  // 3
    EEA_Zipline,                    // 4
    EEA_DeployPlatform,             // 5
    EEA_FutureCritical,             // 6
    EEA_TurretRight,                // 7
    EEA_TurretLeft,                 // 8
    EEA_TurretRightDeath,           // 9
    EEA_TurretLeftDeath,            // 10
    EEA_DeployPlatformVSISS,        // 11
    EEA_MAX                         // 12
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionCutParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionCubicParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingFrontLongExit;

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
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x177
    if(MySPPawn.IsLocallyControlled() && LPC != none)
    {
        CamParams.MyPawn = MySPPawn;
        CamParams.CameraFOVBoneName = 'None';
        CamParams.FloatingAimThresholdMinX = 0.0000000;
        CamParams.FloatingAimThresholdMaxX = 0.0000000;
        CamParams.FloatingAimThresholdMinY = 0.0000000;
        CamParams.FloatingAimThresholdMaxY = 0.0000000;
        LPC.ChangeCameraMode(CamParams, CamTransitionCutParam);
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

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSFacing, LPC;
    local /*0x97E50000-0x00000000*/ private bool bInFront;
    local /*0x97E50000-0x00000000*/ private int AnimIndex;
    local /*0x97E50000-0x00000000*/ private bool bAnimationSuccessful;
    local /*0x97E50000-0x00000000*/ private @NULL VSPP;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    vsPawn = LPBaseVSPlayerPawn(FollowerPawn);
    // End:0x67
    if(LPVSPlayerPawn(vsPawn) != none)
    {
        LPVSPlayerPawn(vsPawn).HideVSGlass();
    }
    LPPawn(MySPPawn).TemplateLogicData.TargetPawn = vsPawn;
    MySPPawn.SetPhysics(7);
    MySPPawn.SetCollision(false, false);
    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x203
    if(LPC != none)
    {
        // End:0x18C
        if(!LPPlayerPawn(MySPPawn).bUseShortVSEntry)
        {
            LPC.StopFire();
            LPC.ReleaseHeldButtons();
        }
        // End:0x203
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.PauseFire();
            LPC.myLPHUD.RemoveMessageLayer(24);
        }
    }
    bInFront = true;
    VSFacing = Vector(vsPawn.Rotation);
    // End:0x29A
    if((Normal(vsPawn.Location - MySPPawn.Location) Dot VSFacing) > 0.0000000)
    {
        bInFront = false;
    }
    PlayerLocation = MySPPawn.Location;
    AnimIndex = ((bInFront) ? 0 : 1);
    // End:0x318
    if(LPPlayerPawn(MySPPawn).bUseShortVSEntry)
    {
        AnimIndex += 2;        
    }
    else
    {
        bUsingFrontLongExit = bInFront;
    }
    // End:0x3AB
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerTarget(0, 0.0100000);
        // End:0x3AB
        if(LPPlayerPawn(MySPPawn).bUseZiplineVSTransition)
        {
            vsPawn.SetMeshLodForInsideCockpit();
        }
    }
    CamParams.CheckCameraCollision = false;
    CamParams.bCollideCamera = false;
    CamParams.bConstrainPlayerInFOV = false;
    CamParams.bConstrainEnemyInFOV = false;
    // End:0x51C
    if(LPPlayerPawn(MySPPawn).bUseZiplineVSTransition)
    {
        AnimIndex = 4;
        CamParams.AnimatedFOV = 75.0000000;
        // End:0x519
        if(StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, true, AnimFinished, vsPawn.ZiplineExitFinished,, 0.0000000))
        {
            MySPPawn.SetPhysics(4);
            bAnimationSuccessful = true;
        }        
    }
    else
    {
        // End:0x669
        if(LPPlayerPawn(MySPPawn).bDeployPlatform)
        {
            VSPP = LPVSPlayerPawn(vsPawn);
            // End:0x5AF
            if(VSPP != none)
            {
                VSPP.RevealPlatform(VSPP.ExtractPocket);
            }
            // End:0x5E9
            if(LPPlayerPawn(MySPPawn).bDeployPlatformVSISS)
            {
                AnimIndex = 11;                
            }
            else
            {
                AnimIndex = 5;
            }
            bAnimationSuccessful = StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, true, AnimFinished, vsPawn.DeployPlatformFinished,, 0.0000000);            
        }
        else
        {
            LPC.GotoState('EjectVSState');
            // End:0x6F1
            if((LPVSFuturePlayerPawn(FollowerPawn) != none) && LPPlayerTurretPawn(FollowerPawn) == none)
            {
                // End:0x6EE
                if(FollowerPawn.Health <= 0)
                {
                    AnimIndex = 6;
                }                
            }
            else
            {
                // End:0x787
                if(LPPlayerTurretPawn(FollowerPawn) != none)
                {
                    // End:0x74A
                    if(int(LPPlayerPawn(MySPPawn).ExitDirection) == int(4))
                    {
                        AnimIndex = 7;                        
                    }
                    else
                    {
                        AnimIndex = 8;
                    }
                    // End:0x787
                    if(MySPPawn.Health <= 0)
                    {
                        AnimIndex += 2;
                    }
                }
            }
            bAnimationSuccessful = StartAnimationChoreography(MySPPawn, FollowerPawn, AnimIndex, false, AnimFinished,,, 0.0000000);
            CamParams.AnimatedFOV = CamParams.default.AnimatedFOV;
        }
    }
    // End:0x827
    if(bAnimationSuccessful)
    {
        UseAnimatedCamera();
    }
    MySPPawn.SetHidden(false);
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
    LPPlayerPawn(MySPPawn).PositionSelfForVSEnterOrExit(MySeq, LPBaseVSPlayerPawn(Follower), false);
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, 0.0000000, 2, RotationMode);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPC, LPP, Loc, Norm,
	    Extent, WorldAimVec, CameraLoc;

    local /*0x97E50000-0x00000000*/ private float Dist;

    LPC = LPPlayerController(MySPPawn.Controller);
    LPP = LPPlayerPawn(MySPPawn);
    // End:0x5C
    if(NextMove != none)
    {
    }
    // End:0x216
    if(FollowerPawn != none)
    {
        FollowerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        FollowerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        FollowerPawn.EndCurrentSpecialMove();
        // End:0x141
        if(LPP.bUseZiplineVSTransition)
        {
            FollowerPawn.DoSpecialMove(Class'LPSM_PlayerVSWinchWinchPoint', true, false, None);
        }
        // End:0x1A7
        if(LPP.bDeployPlatform)
        {
            LPP.bDeployPlatform = false;
            FollowerPawn.GotoState('VSExtraction');
        }
        // End:0x1D5
        if(vsPawn != none)
        {
            vsPawn.SetMeshLodForOutsideCockpit();
        }
        // End:0x216
        if(LPVSPlayerPawn(vsPawn) != none)
        {
            LPVSPlayerPawn(vsPawn).HideVSGlass(false);
        }
    }
    StopAnimationChoreography(MySPPawn);
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.0000000);
    MySPPawn.SetHidden(false);
    MySPPawn.ClearTimer('BecomeVisible');
    // End:0x32A
    if(LPC != none)
    {
        // End:0x32A
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.UnPauseFire();
            LPC.SetDefaultCam(CamTransitionCutParam);
        }
    }
    MySPPawn.SetCollision(true, true);
    // End:0x38D
    if(!MySPPawn.IsInState('PlayerZipline'))
    {
        MySPPawn.bCollideWorld = true;
    }
    // End:0x432
    if((MySPPawn.Controller != none) && !LPPlayerPawn(MySPPawn).bUseZiplineVSTransition)
    {
        MySPPawn.SetPhysics(1);
        MySPPawn.Controller.GotoState('PlayerWalking');
    }
    // End:0x839
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        // End:0x79A
        if(!LPP.bUseZiplineVSTransition)
        {
            // End:0x65B
            if(bUsingFrontLongExit)
            {
                Loc = MySPPawn.Location;
                Loc.Z += (float(300) + MySPPawn.CylinderComponent.CollisionHeight);
                Extent = vect(1.0000000, 1.0000000, 1.0000000);
                Class'SPEngine.SPUtil'.static.DistanceToGround(Loc, Extent, Norm, Dist, MySPPawn);
                Loc.Z -= Dist;
                Loc.Z += 1.0000000;
                Loc.Z += MySPPawn.CylinderComponent.CollisionHeight;
                MySPPawn.SetLocationNoCheck(Loc);
                MySPPawn.CurrentSinkDepth = 25.0000000;                
            }
            else
            {
                // End:0x6A5
                if(int(LPP.ExitStyle) != int(3))
                {
                    MySPPawn.SetLocation(PlayerLocation);
                }
            }
            WorldAimVec = Vector(MySPPawn.Rotation);
            CameraLoc = MySPPawn.Location - WorldAimVec;
            LPC.PlayerCamera.SetCameraViewPoint(MySPPawn, CameraLoc, MySPPawn.Rotation, LPC.PlayerCamera.GetFOVAngle());
        }
        // End:0x81A
        if(LPP.Health <= 0)
        {
            LPP.CachedHitLocation = LPP.Location;
            LPP.DEKillPlayer();
        }
        LPP.CheckCSAForSwitchToBestWeapon();
    }
    //return;    
}

event AnimNotifySpecialMove()
{
    LPPlayerController(MySPPawn.Controller).WinchBoneDetach();
    //return;    
}

function OverrideChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL InParams[25165825];

    super(SPSM_LeaderFollowerBase).OverrideChoreographyParams(InParams);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerExitVS.CamParamObj'
    begin object name=CamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=85.0000000
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerExitVS.CamTransitionCutParamObj'
    begin object name=CamTransitionCutParamObj class=Class'LPCameraTransitionCutParam'
    end object
    CamTransitionCutParam=CamTransitionCutParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerExitVS.CamTransitionCubicParamObj'
    begin object name=CamTransitionCubicParamObj class=Class'LPCameraTransitionCubicParam'
        bCutDestMode=false
    end object
    CamTransitionCubicParam=CamTransitionCubicParamObj
    FollowerSpecialMoveClass=Class'LPSM_VSPlayerExit'
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
}