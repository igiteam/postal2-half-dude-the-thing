class LPSM_ForkArmGrab_Base extends SPSM_LeaderPawnBase
    abstract
    config(Game);

enum EForkArmGrabAnim
{
    efagForkArmGrab,                // 0
    efagForkArmGrabRecover,         // 1
    efagForkArmHold,                // 2
    efagForkArmRelease,             // 3
    efagdDismemberTarget,           // 4
    efagdDrillStart,                // 5
    efagdDrillLoop,                 // 6
    efagdDrillStop,                 // 7
    efagdHoldTweanStart,            // 8
    efagdHoldTweanEnd,              // 9
    efagdCircleInMiss,              // 10
    efagdCircleInGlance,            // 11
    efagdCircleInHit,               // 12
    efagForkArmDrillFixedIn,        // 13
    efagForkArmDrillFixedHold,      // 14
    efagForkArmDrillFixedProtectedHold,// 15
    efagForkArmDrillKill,           // 16
    efagForkArmEscape,              // 17
    efagForkArmShock,               // 18
    efagForkArmShockAlt,            // 19
    efagForkArmShockCommon,         // 20
    efagForkArmRemoveLid,           // 21
    efagForkArmGrabCombatWindow,    // 22
    efagCoreDestroyed,              // 23
    efagForkArmTorchHold,           // 24
    efagForkArmTorchHoldIn,         // 25
    EForkArmGrabAnim_MAX            // 26
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForkArmGrabInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultGrabCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabTransitionInParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowDrillUse;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrillInUse;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsesFloatingAim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStopRightArmPartAbruptly;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEndSpecialMoveOnInvalidVictim;

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ClassIsChildOf(NewMove, Class'LPSM_ForkArmGrab_Base');
    //return ReturnValue;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SetFloatingAimThreshold()
{
    local /*0x97E50000-0x00000000*/ private float X[8388609], Y;

    // End:0x2D
    if(!bUsesFloatingAim)
    {
        X = 0.0000000;
        Y = 0.0000000;
    }
    GrabCamParams.FloatingAimThresholdMinX = -X;
    GrabCamParams.FloatingAimThresholdMaxX = X;
    GrabCamParams.FloatingAimThresholdMinY = -Y;
    GrabCamParams.FloatingAimThresholdMaxY = Y;
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, SMGrab, vsPawn;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    SMGrab = LPSM_ForkArmGrab_Base(PrevMove);
    // End:0x16F
    if(!MySPPawn.IsLocallyControlled() && int(MySPPawn.WorldInfo.NetMode) == int(NM_Client))
    {
        vsPawn = LPVSPlayerPawn(MySPPawn);
        ForkArmGrabInfo.GrabPoint = vsPawn.ReplicatedForkArmGrabInfo.GrabPointInfo;
        // End:0x142
        if(SMGrab != none)
        {
            bDrillInUse = SMGrab.bDrillInUse;            
        }
        else
        {
            bDrillInUse = vsPawn.bControllerUsingRightArm;
        }        
    }
    else
    {
        // End:0x1DF
        if(!bFirstMove)
        {
            // End:0x1DF
            if(SMGrab != none)
            {
                ForkArmGrabInfo = SMGrab.ForkArmGrabInfo;
                bDrillInUse = SMGrab.bDrillInUse;
            }
        }
    }
    //return;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SMGrab;

    SMGrab = LPSM_ForkArmGrab_Base(MySPPawn.GetCurrentSpecialMoveInstance());
    // End:0x78
    if((MySPPawn.IsLocallyControlled() && SMGrab == none) && !bFirstMove)
    {
        return false;
    }
    return super(GameSpecialMove).InternalCanDoSpecialMove();
    //return ReturnValue;    
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
    local /*0x97E50000-0x00000000*/ private @NULL LPC, vsPawn;

    UseForkArmGrabCamera();
    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x27D
    if(vsPawn != none)
    {
        LPC = LPPlayerController(MySPPawn.Controller);
        // End:0xB8
        if(LPC != none)
        {
            LPC.EnableGrabPointsDisplay(false);
            LPC.GotoState('ForkArmGrab');
        }
        vsPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        vsPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        vsPawn.SetPitchControllerTarget(0, 0.2500000);
        vsPawn.SetPitchControllerLock(true);
        vsPawn.TemplateLogicData.TargetPawn = LPPawn(FollowerPawn);
        vsPawn.TemplateLogicData.GrabPointIndex = ForkArmGrabInfo.GrabPoint.GrabPointIndex;
        vsPawn.TemplateLogicData.bFirmGrab = ForkArmGrabInfo.GrabPoint.bFirmGrab;
        vsPawn.EnableAIResourceStrike(false);
    }
    SetVictimDamageHandling(true);
    super(SPSM_LeaderFollowerBase).StartInteraction();
    //return;    
}

function EndOfMoveCameraAndPcStateUpdating()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x109
    if(LPC != none)
    {
        LPC.EnableGrabPointsDisplay(true);
        // End:0xAA
        if(!LPC.IsInState('Dead'))
        {
            LPC.GotoState('PlayerWalking');
        }
        // End:0x109
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.SetDefaultCam(LPC.VSCamTransitionInParam);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MySPGFPawn;

    // End:0x1A4
    if(LPSM_ForkArmGrab_Base(NextMove) == none)
    {
        EndOfMoveCameraAndPcStateUpdating();
        MySPGFPawn = SPGFPawn(MySPPawn);
        // End:0xB4
        if(MySPPawn != none)
        {
            MySPGFPawn.SetPitchControllerLock(false);
            SPGFAimControlPlayerControlled(MySPGFPawn.AimController).SetDynamicFloatingAimInputScale(1.0000000, 1.0000000);
        }
        MySPPawn.StopFullBodyAnim(0.2000000);
        StopAnimationChoreography(MySPPawn);
        SetVictimDamageHandling(false);
        // End:0x144
        if(bDrillInUse)
        {
            LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0, bStopRightArmPartAbruptly);
            bDrillInUse = false;
        }
        LPBaseVSPlayerPawn(MySPPawn).EnableAIResourceStrike(true);
        // End:0x1A4
        if(NextMove != none)
        {
            FollowerPawn.EndCurrentSpecialMove(FollowerSMInstance);
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function IfVsDoesNotHaveDriverKillItsVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, vsPawn;

    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0xC3
    if(vsPawn != none)
    {
        LPC = LPPlayerController(MySPPawn.Controller);
        // End:0xC3
        if(LPC == none)
        {
            vsPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            vsPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        }
    }
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

    0.5000000
    0
    0
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, true, PreferredOtherMovementPercent, 1, RotationMode);
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0xB1
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            // End:0xAF
            if(bAllowDrillUse)
            {
                bDrillInUse = true;
                LPVSPlayerPawn(MySPPawn).StartRightArmPartAction(0, 2, true, GetIKAssistanceType(), LPPawn(FollowerPawn), GetIKTargetDepthSocket(),,,,, GetIKTargetAssistSocket());
            }
            return true;
        // End:0xD2
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
        // End:0x13A
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            // End:0x138
            if(bDrillInUse)
            {
                bDrillInUse = false;
                LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0);
            }
            return true;
        // End:0x15D
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS:
            return false;
        // End:0x18A
        case Class'LPSMMTypes'.default.SMM_PlayerEnteredVS:
            UseForkArmGrabCamera();
            return true;
        // End:0x1B7
        case Class'LPSMMTypes'.default.SMM_NewVSRightArmPartEquipped:
            UseForkArmGrabCamera();
            return true;
        // End:0x1DA
        case Class'LPSMMTypes'.default.SMM_VSForceAdditiveHitReaction:
            return true;
        // End:0x1FD
        case Class'LPSMMTypes'.default.SMM_AllowMunitionsLockerAccess:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xE4
    if(ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill') || ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSWelder'))
    {
        // End:0xE4
        if(MySPPawn.CanDoSpecialMove(Class'LPSM_ForkArmGrab_Dismember'))
        {
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Dismember',,,, FollowerPawn);
            return true;
        }
    }
    FinishGrabAbrupt();
    return false;
    //return ReturnValue;    
}

function GetCoreDestroyedSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ForkArmGrab_CoreDestroyed';
    //return ReturnValue;    
}

function HandleCoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x64
    if(MySPPawn.CanDoSpecialMove(GetCoreDestroyedSM()))
    {
        MySPPawn.DoSpecialMove(GetCoreDestroyedSM(),,,, FollowerPawn);
        return true;
    }
    FinishGrabAbrupt();
    return false;
    //return ReturnValue;    
}

function VictimDamaged()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function VictimDied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FinishGrabAbrupt();
    return false;
    //return ReturnValue;    
}

function GetVictimVulnerableCoreID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL aiDrivenPawn;

    aiDrivenPawn = LPAIPawn(FollowerPawn);
    // End:0x8D
    if(aiDrivenPawn != none)
    {
        return aiDrivenPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].VulnerableCoreID;
    }
    return -1;
    //return ReturnValue;    
}

function IsVictimVulnerableCoreProtected()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreID;
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn;

    AkridPawn = LPAIPawn(FollowerPawn);
    CoreID = GetVictimVulnerableCoreID();
    return (AkridPawn != none) && AkridPawn.IsCoreProtectedByShield(CoreID);
    //return ReturnValue;    
}

function GetGrabPointHoldSMClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn;

    EnemyPawn = LPAIPawn(FollowerPawn);
    return EnemyPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].HoldSMClass;
    //return ReturnValue;    
}

function SetVictimDamageHandling()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    AkridPawn = LPAIPawn(FollowerPawn);
    // End:0xC2
    if(AkridPawn != none)
    {
        CoreID = GetVictimVulnerableCoreID();
        // End:0x91
        if(bOn)
        {
            AkridPawn.AddCoreDamageFilter(CoreID, MySPPawn, HitVulnerableCore);            
        }
        else
        {
            AkridPawn.RemoveCoreDamageFilter(CoreID, MySPPawn);
        }
    }
    //return;    
}

function GetVulnerableCoreBone()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    AkridPawn = LPAIPawn(ForkArmGrabInfo.GrabPoint.HitPawn);
    // End:0x8F
    if(AkridPawn != none)
    {
        CoreID = GetVictimVulnerableCoreID();
        return AkridPawn.FindBoneNameFromCoreID(CoreID);
    }
    return 'None';
    //return ReturnValue;    
}

function GetIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn;

    AkridPawn = LPAIPawn(ForkArmGrabInfo.GrabPoint.HitPawn);
    // End:0xB3
    if(AkridPawn != none)
    {
        return AkridPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].IKDrillTargetSocket;
    }
    return 'None';
    //return ReturnValue;    
}

function GetIKTargetAssistSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

function GetIKAssistanceType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn;

    AkridPawn = LPAIPawn(ForkArmGrabInfo.GrabPoint.HitPawn);
    // End:0xB3
    if(AkridPawn != none)
    {
        return AkridPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].IKType;
    }
    return 1;
    //return ReturnValue;    
}

function HitVulnerableCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], vsPawn;

    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0xC6
    if(((vsPawn != none) && vsPawn.RightArmPart != none) && int(vsPawn.RightArmPart.GetActionMode()) == int(0))
    {
        vsPawn.RightArmPart.MarkArmAssistance();
    }
    //return;    
}

function NotifyVictimLidRemoved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function UseForkArmGrabCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, vsPawn;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x2AF
    if(MySPPawn.IsLocallyControlled() && LPC != none)
    {
        vsPawn = LPVSPlayerPawn(MySPPawn);
        GrabCamParams.FloatingAimInputScaleX = DefaultGrabCamParams.FloatingAimInputScaleX * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleX;
        GrabCamParams.FloatingAimInputScaleY = DefaultGrabCamParams.FloatingAimInputScaleY * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleY;
        SetFloatingAimThreshold(vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX, vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY);
        GrabCamParams.FloatingAimForce = bUsesFloatingAim;
        GrabCamParams.FloatingAimDontScale = bUsesFloatingAim;
        LPC.ChangeCameraMode(GrabCamParams, GrabTransitionInParam,, false);
    }
    //return;    
}

function FinishGrabAbrupt()
{
    local /*0x97E50000-0x00000000*/ private @NULL vicSM;
    local /*0x97E50000-0x00000000*/ private bool followerSMHandlingPawnNotification;
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0x16E
    if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
    {
        followerSMHandlingPawnNotification = false;
        vicSM = LPSM_ForkArmGrabVictim_Base(FollowerSMInstance);
        // End:0x8A
        if(vicSM != none)
        {
            followerSMHandlingPawnNotification = vicSM.bCanHandlePawnNotificationOfAbruptGrabRelease;
        }
        FollowerPawn.EndCurrentSpecialMove(FollowerSMInstance);
        // End:0x144
        if(!followerSMHandlingPawnNotification && FollowerPawn != none)
        {
            AICtrl = LPAIController(FollowerPawn.Controller);
            // End:0x144
            if(AICtrl != none)
            {
                AICtrl.NotifyJustReleasedFromGrapple(FollowerSMInstance, MySPPawn, true);
            }
        }
        MySPPawn.EndCurrentSpecialMove(self);
        IfVsDoesNotHaveDriverKillItsVelocity();
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x68
    if(bEndSpecialMoveOnInvalidVictim)
    {
        // End:0x68
        if((FollowerPawn == none) || !FollowerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrabVictim_Base'))
        {
            FinishGrabAbrupt();
        }
    }
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPVSPlayerPawn(MySPPawn) != none) && LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree != none)
    {
        return LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Base.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Base.GrabCamParamObj'
    begin object name=GrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Base.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj class=Class'LPCameraTransitionCutParam'
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bEndSpecialMoveOnInvalidVictim=true
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_Grab'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}