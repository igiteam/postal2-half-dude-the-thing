class LPSM_ForkArmGrab_Grab extends LPSM_ForkArmGrab_Base
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToUseDrill;

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x94
    if(super.InternalCanDoSpecialMove())
    {
        // End:0x46
        if(MySPPawn.IsLocallyControlled())
        {
            return FindValidForkArmGrabPoint(ForkArmGrabInfo);            
        }
        else
        {
            // End:0x92
            if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Client))
            {
                return VerifyValidForkArmGrabPoint();                
            }
            else
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetForkArmGrabRange()
{
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(PawnOwner);
    // End:0xA8
    if(vsPawn != none)
    {
        OutRadius = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRange2D;
        OutHeight = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRangeZ;        
    }
    else
    {
        OutRadius = 0.0000000;
        OutHeight = 0.0000000;
    }
    //return;    
}

function FindValidForkArmGrabPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, AimController, CurrentViewLoc, Dir, CurrentViewRot, CurrentAimPoint;

    local /*0x97E50000-0x00000000*/ private float GrabRadius, GrabHeight;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;

    // End:0x1C8
    if(PawnOwner.IsLocallyControlled())
    {
        GetForkArmGrabRange(GrabRadius, GrabHeight);
        CameraMgr = SPPlayerCameraManager(LPPlayerController(PawnOwner.Controller).PlayerCamera);
        // End:0x1C6
        if(CameraMgr != none)
        {
            CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
            AimController = LPPawn(PawnOwner).GetAimController();
            CurrentAimPoint = AimController.GetAimCollisionPoint();
            Dir = Normal(CurrentAimPoint - CurrentViewLoc);
            bSuccess = LPPawn(PawnOwner).TraceGrabPoint(CurrentViewLoc, Dir, GrabRadius, GrabHeight, InForkArmGrabInfo.GrabPoint);
            return bSuccess;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function VerifyValidForkArmGrabPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x83
    if((ForkArmGrabInfo.GrabPoint.HitPawn == none) || ForkArmGrabInfo.GrabPoint.HitPawn.Health <= 0)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x6E
    if((MySPPawn != none) && LPVSPlayerPawn(MySPPawn) != none)
    {
        LPVSPlayerPawn(MySPPawn).NotifyArmGrab();
    }
    bWantsToUseDrill = false;
    //return;    
}

function GetGrabAnimationIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams;

    0.5000000
    0
    0
    // End:0x138
    if(((FollowerPawn == none) || !ClassIsChildOf(FollowerPawn.Class, Class'LPAIPawn')) || !LPAIPawn(FollowerPawn).GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].bManualRotation)
    {
        return super.SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, PreferredOtherMovementPercent, ZMatchType, RotationMode);
    }
    // End:0x47C
    if((Follower != none) && MySeq != none)
    {
        ChoreographyParams.OtherTarget = Follower;
        ChoreographyParams.MySequence = MySeq;
        ChoreographyParams.OtherTargetSequence = OtherSeq;
        // End:0x217
        if(ChoreoMetaData != none)
        {
            ChoreographyParams.BlendTime = ChoreoMetaData.TimeToFullAlignment;            
        }
        else
        {
            ChoreographyParams.BlendTime = 0.2500000;
        }
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = false;
        ChoreographyParams.AlignmentType = AlignmentType;
        ChoreographyParams.TargetPassThroughActor = none;
        ChoreographyParams.bIgnoreCollisionWithOther = bIgnoreCollisionBetweenLeaderAndFollower;
        ChoreographyParams.ZMatchType = ZMatchType;
        // End:0x47C
        if(OtherSeq != none)
        {
            OtherSeq.Rate = MySeq.Rate;
            ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = !bLeaveCollisionOnOther;
            ChoreographyParams.OtherTargetMovePercent = PreferredOtherMovementPercent;
            ChoreographyParams.RotationMode = 1;
            ChoreographyParams.bOverrideTranslationOffset = false;
            ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
            ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
            ChoreographyParams.AutoShutoffTime = 0.0000000;
            Leader.NotifyNewChoreographyParams(ChoreographyParams);
            Leader.StartPawnChoreography(ChoreographyParams);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetClawRoll()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NewClawRoll;
    local /*0x97E50000-0x00000000*/ private @NULL CrossVec, toPawn, PawnDir;
    local /*0x97E50000-0x00000000*/ private float StandardOffset, dotDir, Angle;

    StandardOffset = 180.0000000;
    toPawn = FollowerPawn.Location - MySPPawn.Location;
    toPawn.Z = 0.0000000;
    // End:0x8E
    if(IsZero(toPawn))
    {
        return 0.0000000;
    }
    toPawn = Normal(toPawn);
    PawnDir = Vector(FollowerPawn.Rotation);
    PawnDir.Z = 0.0000000;
    // End:0x104
    if(IsZero(PawnDir))
    {
        return 0.0000000;
    }
    PawnDir = Normal(PawnDir);
    dotDir = toPawn Dot PawnDir;
    Angle = Acos(dotDir) * 57.2957800;
    CrossVec = toPawn Cross PawnDir;
    // End:0x1C2
    if(CrossVec.Z < float(0))
    {
        Angle = (Angle * float(-1)) + float(360);
    }
    Angle += StandardOffset;
    NewClawRoll = Angle * 182.0444000;
    return NewClawRoll;
    //return ReturnValue;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, vsPawn, AIPawn;

    LPC = LPPlayerController(MySPPawn.Controller);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    AIPawn = LPAIPawn(FollowerPawn);
    super.StartInteraction();
    // End:0xD9
    if(AIPawn != none)
    {
        AIPawn.NotifyGrabInterationJustStarted(vsPawn, ForkArmGrabInfo.GrabPoint.GrabPointIndex);
    }
    bAllowDrillUse = ClassIsChildOf(GetGrabPointHoldSMClass().Class, Class'LPSM_ForkArmGrab_HoldFIXED');
    // End:0x2C1
    if(((vsPawn != none) && AIPawn != none) && AIPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].bManualRotation)
    {
        vsPawn.ForkArmSkelControl.bApplyRotation = true;
        vsPawn.ForkArmSkelControl.bApplyTranslation = false;
        vsPawn.ForkArmSkelControl.BoneRotation = MakeRotator(0, 0, int(GetClawRoll()));
        vsPawn.ForkArmSkelControl.SetSkelControlActive(true);
        vsPawn.ForkArmSkelControl.SetSkelControlStrength(1.0000000, 0.3000000);
    }
    StartAnimationChoreography(MySPPawn, FollowerPawn, GetGrabAnimationIndex(), true, GrabFinished,,, 0.2000000);
    // End:0x345
    if(MySPPawn.IsLocallyControlled())
    {
        LPC.EnableHydraulicPressureDisplay(true);
    }
    // End:0x386
    if(bAllowDrillUse)
    {
        MySPPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitCombat', FollowerPawn, 0);
    }
    //return;    
}

function GrabFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private class Move;

    Move = GetGrabPointHoldSMClass();
    // End:0xB1
    if(!bInterrupted && MySPPawn.CanDoSpecialMove(Move))
    {
        // End:0xAE
        if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
        {
            MySPPawn.DoSpecialMove(Move,,,, FollowerPawn);
        }        
    }
    else
    {
        FinishGrabAbrupt();
    }
    //return;    
}

function DoShockVictim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9E
    if(ClassIsChildOf(FollowerPawn.Class, Class'LPAIPawnSpitter') || ClassIsChildOf(FollowerPawn.Class, Class'LPAIPawnSnowCrab'))
    {
        bWantsToUseDrill = false;
        MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock',,,, FollowerPawn);
        return true;
    }
    return false;
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
        // End:0x54
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            // End:0x51
            if(!bAllowDrillUse)
            {
                bWantsToUseDrill = true;
                return true;
            }
            // End:0x103
            break;
        // End:0x77
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            return true;
        // End:0xA3
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            return DoShockVictim();
        // End:0x100
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabVictimInClaw:
            LPVSPlayerPawn(MySPPawn).PutGrabbedPawnInClaw(LPAIPawn(FollowerPawn));
            return true;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function FinishGrabAbrupt()
{
    // End:0xE5
    if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
    {
        // End:0x9D
        if(int(MySPPawn.Role) == int(ROLE_Authority))
        {
            FollowerPawn.ServerEndCurrentSpecialMove(FollowerSMInstance);
            MySPPawn.ServerEndCurrentSpecialMove(self);            
        }
        else
        {
            MySPPawn.ServerEndFollowerSpecialMove(FollowerPawn);
            MySPPawn.LocalEndCurrentSpecialMove(self);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Grab.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Grab.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Grab.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bFirstMove=true
}