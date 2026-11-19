class LPSM_PlayerVSWinchedLargePawn extends SPSM_LeaderPawnBase
    config(Game);

enum ERetractAnims
{
    ERA_Impact,                     // 0
    ERA_ImpactToDrag,               // 1
    ERA_Drag,                       // 2
    ERA_BreakOut,                   // 3
    ERA_Completed,                  // 4
    ERA_MAX                         // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Winch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte animationState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrabSucceeded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOldCollideAsEncroacher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowTaserHelp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WinchToGrabSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DragTimeOut;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, vsPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    AttachedPawn = LPAIPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    bGrabSucceeded = false;
    animationState = 0;
    bOldCollideAsEncroacher = AttachedPawn.bCollideAsEncroacher;
    AttachedPawn.ZeroMovementVariables();
    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x23B
    if(vsPawn != none)
    {
        vsPawn.ZeroMovementVariables();
        vsPawn.TemplateLogicData.TargetPawn = AttachedPawn;
        LPC = LPPlayerController(MySPPawn.Controller);
        // End:0x23B
        if(LPC != none)
        {
            LPC.SetVSReticleHelpButton(4, false);
            LPC.EnableGrabPointsDisplay(false);
            LPC.GotoState('WinchedLargePawn');
        }
    }
    // End:0x346
    if(Winch != none)
    {
        bSuccess = Winch.StartInteractingWithLargePawn(AttachedPawn);
        AttachedPawn.TemplateLogicData.GrabPointIndex = Winch.GrabbedPawnWinchPointIndex;
        AttachedPawn.TemplateLogicData.TargetPawn = vsPawn;
        AttachedPawn.SetWinchPointEnabledByIndex(Winch.GrabbedPawnWinchPointIndex, false);
    }
    // End:0x375
    if(!bSuccess)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

function CleanupAttachedPawn()
{
    // End:0x17F
    if(AttachedPawn != none)
    {
        AttachedPawn.StopCustomAnim(0.2000000);
        AttachedPawn.bCollideAsEncroacher = bOldCollideAsEncroacher;
        AttachedPawn.GroundSpeed = AttachedPawn.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        AttachedPawn.AccelRate = AttachedPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
        AttachedPawn.ZeroMovementVariables();
        AttachedPawn.EndSpecialMove(FollowerSpecialMoveClass);
        AttachedPawn = none;
    }
    //return;    
}

function SetEndedControllerState()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPC[8388609];

    // End:0x4A
    if(!myLPC.IsInState('Dead'))
    {
        myLPC.GotoState('PlayerWalking');
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x95
    if(LPC != none)
    {
        LPC.SetVSReticleHelpButton(10, false);
        LPC.EnableGrabPointsDisplay(true);
        SetEndedControllerState(LPC);
    }
    DragEnded();
    CleanupAttachedPawn();
    Winch.FinishInteractingWithLargePawn(bGrabSucceeded);
    MySPPawn.StopPawnChoreography();
    MySPPawn.StopCustomAnim(0.2000000);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    animationState = 0;
    StartAnimationChoreography(MySPPawn, FollowerPawn, 0, true, ImpactFinishedCB,, true, 0.2000000);
    // End:0x9C
    if(bShowTaserHelp)
    {
        LPPlayerController(MySPPawn.Controller).SetVSReticleHelpButton(10, true);
    }
    //return;    
}

simulated function DoesStateUseFullChoreography()
{
    local /*0x97E50000-0x00000000*/ private byte InState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(InState) > int(2);
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
    // End:0x9C
    if(DoesStateUseFullChoreography(animationState))
    {
        return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, PreferredOtherMovementPercent, ZMatchType, RotationMode);
    }
    // End:0xCF
    if(((Follower == none) || MySeq == none) || OtherSeq == none)
    {
        return false;
    }
    ChoreographyParams.OtherTarget = Follower;
    ChoreographyParams.MySequence = MySeq;
    ChoreographyParams.OtherTargetSequence = OtherSeq;
    // End:0x18E
    if(ChoreoMetaData != none)
    {
        ChoreographyParams.BlendTime = ChoreoMetaData.TimeToFullAlignment;        
    }
    else
    {
        ChoreographyParams.BlendTime = 0.2500000;
    }
    ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = false;
    ChoreographyParams.AlignmentType = 1;
    ChoreographyParams.ManualYawDeltaFromCenterline = 0;
    ChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
    ChoreographyParams.bOverrideTranslationOffset = true;
    ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
    ChoreographyParams.bIgnoreCollisionWithOther = true;
    ChoreographyParams.ZMatchType = 0;
    OtherSeq.Rate = MySeq.Rate;
    ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = false;
    ChoreographyParams.OtherTargetMovePercent = 0.5000000;
    ChoreographyParams.RotationMode = RotationMode;
    ChoreographyParams.TooCloseTranslationTolerance = 100000.0000000;
    ChoreographyParams.TooFarTranslationTolerance = 100000.0000000;
    ChoreographyParams.AutoShutoffTime = 0.0000000;
    MySPPawn.StartPawnChoreography(ChoreographyParams);
    return true;
    //return ReturnValue;    
}

function ImpactFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    animationState = 1;
    StartAnimationChoreography(MySPPawn, FollowerPawn, 1, true, ImpactToDragFinishedCB,, true, 0.2000000);
    //return;    
}

function DragSetup()
{
    AttachedPawn.DesiredSpeed = 1.0000000;
    AttachedPawn.GroundSpeed = AttachedPawn.TuneDataAIPawn.DraggedByWinchSpeed;
    AttachedPawn.AccelRate = AttachedPawn.TuneDataAIPawn.DraggedByWinchAccelRate;
    DragTimeOut = Sqrt((2.0000000 * (GetDistance())) / AttachedPawn.AccelRate);
    DragTimeOut += 1.0000000;
    Winch.StartDraggingLargePawn();
    //return;    
}

function ImpactToDragFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x8A
    if(int(animationState) == int(1))
    {
        MySPPawn.StopCustomAnim(0.2000000);
        AttachedPawn.StopCustomAnim(0.2000000);
        AttachedPawn.SetPhysics(1);
        StartDragAnimation();
        DragSetup();
    }
    //return;    
}

function StartDragAnimation()
{
    animationState = 2;
    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2, 0.2000000);
    //return;    
}

function DragEnded()
{
    // End:0x2E
    if(AttachedPawn != none)
    {
        AttachedPawn.ZeroMovementVariables();
    }
    animationState = 4;
    //return;    
}

function TransitionToGrab()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabInfo;
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex;

    DragEnded();
    // End:0x183
    if(WinchToGrabSM != none)
    {
        // End:0x180
        if(AttachedPawn != none)
        {
            GrabPointIndex = AttachedPawn.WinchPoints[Winch.GrabbedPawnWinchPointIndex].GrabPointIndex;
            // End:0x17D
            if((GrabPointIndex >= 0) && GrabPointIndex < AttachedPawn.GrabPoints.Length)
            {
                GrabInfo.GrabPoint.HitPawn = AttachedPawn;
                GrabInfo.GrabPoint.GrabPointIndex = GrabPointIndex;
                LPVSPlayerPawn(MySPPawn).ServerStartForkArmGrab(WinchToGrabSM, GrabInfo);
                bGrabSucceeded = true;
                return;                
            }            
        }        
    }
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function TransitionToBreak()
{
    DragEnded();
    animationState = 3;
    StartAnimationChoreography(MySPPawn, FollowerPawn, 3, true, BreakOutFinishedCB,, true, 0.2000000);
    StopAnimationChoreography(MySPPawn);
    //return;    
}

function BreakOutFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function DragUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Dir, Delta;

    Delta = MySPPawn.Location - AttachedPawn.Location;
    Dir = Normal(Delta);
    AttachedPawn.Acceleration = Dir * AttachedPawn.AccelRate;
    //return;    
}

function GetDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Distance;

    Distance = MySPPawn.DistanceBetweenCollisionCylinders(AttachedPawn);
    return Distance;
    //return ReturnValue;    
}

function GetDragEndDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 10.0000000;
    //return ReturnValue;    
}

function CheckTimeout()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    DragTimeOut -= DeltaTime;
    return DragTimeOut < float(0);
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x6D
    if(int(animationState) == int(2))
    {
        DragUpdate(DeltaTime);
        // End:0x4D
        if((GetDistance()) <= (GetDragEndDistance()))
        {
            TransitionToGrab();            
        }
        else
        {
            // End:0x6D
            if(CheckTimeout(DeltaTime))
            {
                TransitionToBreak();
            }
        }
    }
    super.Tick(DeltaTime);
    //return;    
}

function AddForward()
{
    // End:0x23
    if((GetDistance()) <= (GetDragEndDistance()))
    {
        TransitionToGrab();
    }
    //return;    
}

function DoVSShock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
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
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_WinchButtonPressed:
            TransitionToBreak();
            return true;
        // End:0x82
        case Class'LPSMMTypes'.default.SMM_StruggleButton:
            // End:0x7F
            if(int(animationState) == int(2))
            {
                AddForward();
            }
            // End:0x108
            break;
        // End:0xC4
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            // End:0xC2
            if(int(animationState) == int(2))
            {
                return DoVSShock();
            }
            return false;
        // End:0x105
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
            // End:0x103
            if(int(animationState) <= int(2))
            {
                TransitionToBreak();
            }
            return false;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    WinchToGrabSM=Class'LPSM_ForkArmGrab_WinchToGrabBase'
    FollowerSpecialMoveClass=Class'LPSM_LargePawnWinched'
    bEndSpecialMoveOnInvalidFollower=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}