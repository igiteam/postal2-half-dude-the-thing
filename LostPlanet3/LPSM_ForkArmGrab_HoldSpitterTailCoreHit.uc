class LPSM_ForkArmGrab_HoldSpitterTailCoreHit extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastHitTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxMissTime;

function ShouldShowReticleHelp()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LastHitTime = MySPPawn.WorldInfo.TimeSeconds;
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKType = GetIKAssistanceType();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetPawn = LPPawn(FollowerPawn);
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetDepthSocket = GetIKTargetDepthSocket();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetAssistSocket = GetIKTargetAssistSocket();
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
        // End:0x7A
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            // End:0x77
            if(!bSpecialMoveEnded)
            {
                MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_HoldSpitterTailUpStruggle', true, true,, FollowerPawn);
            }
            // End:0x7D
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function HitVulnerableCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    super(LPSM_ForkArmGrab_Base).HitVulnerableCore(HitPawn);
    LastHitTime = MySPPawn.WorldInfo.TimeSeconds;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPSM_ForkArmGrab_HoldStateBased).Tick(DeltaTime);
    // End:0xA2
    if(!bSpecialMoveEnded)
    {
        // End:0xA2
        if((MySPPawn.WorldInfo.TimeSeconds - LastHitTime) > MaxMissTime)
        {
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_HoldSpitterTailUpStruggle', true, true,, FollowerPawn);
        }
    }
    //return;    
}

function GetIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'IKTailTarget';
    //return ReturnValue;    
}

function GetIKAssistanceType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 2;
    //return ReturnValue;    
}

function GetVictimVulnerableCoreID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    MaxMissTime=0.3000000
    bLoopAnimation=true
    BlendTime=0.5000000
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailCoreHit.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailCoreHit.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailCoreHit.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}