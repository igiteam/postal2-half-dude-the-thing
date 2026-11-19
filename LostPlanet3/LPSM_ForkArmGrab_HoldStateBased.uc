class LPSM_ForkArmGrab_HoldStateBased extends LPSM_ForkArmGrab_Hold
    config(Game);

enum ETemplateLogicHoldState
{
    etlhsUnknown,                   // 0
    etlhsSpitterTail_Neutral,       // 1
    etlhsSpitterTail_NeutralToUp,   // 2
    etlhsSpitterTail_NeutralToUpSpit,// 3
    etlhsSpitterTail_UpToNeutral,   // 4
    etlhsSpitterTail_UpStruggle,    // 5
    etlhsSpitterTail_NeutralToRight,// 6
    etlhsSpitterTail_RightSpit,     // 7
    etlhsSpitterTail_RightToNeutralSpit,// 8
    etlhsSpitterTail_Carapace,      // 9
    etlhsCrabClaw_Low,              // 10
    etlhsCrabClaw_LowToHigh,        // 11
    etlhsCrabClaw_High,             // 12
    ETemplateLogicHoldState_MAX     // 13
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoopAnimation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToUseDrill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte HoldState;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], GrabSM;

    // End:0x74
    if((int(HoldState) != int(0)) && LPPawn(MySPPawn) != none)
    {
        LPPawn(MySPPawn).TemplateLogicData.HoldStateIndex = int(HoldState);
    }
    bWantsToUseDrill = false;
    GrabSM = LPSM_ForkArmGrab_Grab(PrevMove);
    // End:0xD9
    if(GrabSM != none)
    {
        // End:0xD9
        if(GrabSM.bWantsToUseDrill)
        {
            bWantsToUseDrill = true;
        }
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    // End:0x37
    if(bWantsToUseDrill)
    {
        ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartStart, self, 0);
    }
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function StartHoldAnimation()
{
    // End:0x38
    if(bLoopAnimation)
    {
        StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 0, BlendTime);        
    }
    else
    {
        StartAnimationChoreography(MySPPawn, FollowerPawn, 0, true, HoldFinished,,, BlendTime);
    }
    //return;    
}

function HoldFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    ExecuteTransitionOfClass(Class'SPEngine.SPSMT_AnimationEnds');
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    UpdateStickyAim();
    //return;    
}

function UpdateStickyAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, AkridPawn, AimControl, AimAtActor;
    local /*0x97E50000-0x00000000*/ private float InputScale;

    AkridPawn = LPAIPawn(FollowerPawn);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x1E7
    if((AkridPawn != none) && AkridPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].bStickyAimOnFSMShields)
    {
        AimControl = SPGFAimControlPlayerControlled(vsPawn.GetAimController());
        // End:0x1E7
        if(AimControl != none)
        {
            AimAtActor = AimControl.GetAimCollisionActor();
            // End:0x1BE
            if(LPShieldFracture(AimAtActor) != none)
            {
                InputScale = 1.0000000 - vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_StickOnFSMPercent;
                AimControl.SetDynamicFloatingAimInputScale(InputScale, InputScale);                
            }
            else
            {
                AimControl.SetDynamicFloatingAimInputScale(1.0000000, 1.0000000);
            }
        }
    }
    //return;    
}

defaultproperties
{
    BlendTime=0.2500000
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldStateBased.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldStateBased.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldStateBased.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}