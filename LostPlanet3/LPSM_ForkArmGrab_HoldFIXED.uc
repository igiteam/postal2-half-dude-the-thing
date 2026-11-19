class LPSM_ForkArmGrab_HoldFIXED extends LPSM_ForkArmGrab_Hold
    config(Game);

enum EHoldFixedAnimState
{
    HFAS_Idle,                      // 0
    HFAS_TransitionIn,              // 1
    HFAS_NormalHold,                // 2
    HFAS_ProtectedHold,             // 3
    HFAS_MAX                        // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AnimState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToUseDrill;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(LPSM_ForkArmGrab_Base).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], GrabSM;

    super.SpecialMoveStarted(bForced, PrevMove);
    bWantsToUseDrill = false;
    GrabSM = LPSM_ForkArmGrab_Grab(PrevMove);
    // End:0x82
    if(GrabSM != none)
    {
        // End:0x82
        if(GrabSM.bWantsToUseDrill)
        {
            bWantsToUseDrill = true;
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    // End:0x41
    if(bWantsToUseDrill)
    {
        ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartStart, self, 0);
    }
    MySPPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitCombat', FollowerPawn, 1);
    //return;    
}

function StartHoldAnimation()
{
    // End:0x52
    if(bDrillInUse)
    {
        AnimState = 1;
        StartAnimationChoreography(MySPPawn, FollowerPawn, 13, true, DrillInFinished,, false);        
    }
    else
    {
        AnimState = 0;
        StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2);
    }
    //return;    
}

function DrillInFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x77
    if(bDrillInUse)
    {
        // End:0x4A
        if(IsVictimVulnerableCoreProtected())
        {
            AnimState = 3;
            StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 15);            
        }
        else
        {
            AnimState = 2;
            StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 14);
        }
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
        // End:0xC8
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            bWantsToUseDrill = true;
            // End:0xC6
            if(bInteractionStarted)
            {
                bDrillInUse = true;
                LPVSPlayerPawn(MySPPawn).StartRightArmPartAction(0, 2, true, GetIKAssistanceType(), LPPawn(FollowerPawn), GetIKTargetDepthSocket(), false, true, false,, GetIKTargetAssistSocket(), 1);
                StartHoldAnimation();
            }
            return true;
        // End:0x146
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            // End:0x138
            if(bDrillInUse)
            {
                bDrillInUse = false;
                LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0);
                StartHoldAnimation();
            }
            bWantsToUseDrill = false;
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x78
    if((FollowerPawn != none) && int(AnimState) == int(3))
    {
        // End:0x78
        if(!IsVictimVulnerableCoreProtected())
        {
            AnimState = 2;
            StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 14, 0.1000000);
        }
    }
    //return;    
}

function VictimDied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x168
    if(((ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill') || ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSWelder')) || ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSWelderDOT')) || ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeForced'))
    {
        // End:0x168
        if(MySPPawn.CanDoSpecialMove(Class'LPSM_ForkArmGrab_Kill'))
        {
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Kill',,,, FollowerPawn);
            return true;
        }
    }
    return super(LPSM_ForkArmGrab_Base).VictimDied();
    //return ReturnValue;    
}

defaultproperties
{
    bDrawHydraulicBar=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXED.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXED.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldFIXED.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bUsesFloatingAim=false
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_HoldFIXED'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}