class LPSM_ForkArmGrab_Shock extends LPSM_ForkArmGrab_Hold
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAltAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipCommon[536870913];

function EndAnimationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.StopPawnChoreography();
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function GetPressureDepletionRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function FinishGrabAbrupt()
{
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    bUseAltAnim = false;
    bSkipCommon = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x98
    if(ClassIsChildOf(PrevMove.Class, Class'LPSM_ForkArmGrab_HoldStump'))
    {
        bUseAltAnim = LPSM_ForkArmGrab_HoldStump(PrevMove).bIsTorch;        
    }
    else
    {
        // End:0x103
        if(ClassIsChildOf(PrevMove.Class, Class'LPSM_ForkArmGrab_HoldCrabClaw_Low') || ClassIsChildOf(PrevMove.Class, Class'LPSM_ForkArmGrab_HoldCrabClaw_LToH'))
        {
            bUseAltAnim = true;            
        }
        else
        {
            // End:0x1A5
            if(ClassIsChildOf(FollowerPawn.Class, Class'LPAIPawnSpitter'))
            {
                // End:0x1A5
                if(LPPawn(MySPPawn).TemplateLogicData.GrabPointIndex == 0)
                {
                    bUseAltAnim = !LPAIPawnSpitter(FollowerPawn).IsTailDestroyed();
                }
            }
        }
    }
    //return;    
}

function StartHoldAnimation()
{
    local /*0x97E50000-0x00000000*/ private byte AnimToUse;

    AnimToUse = ((bUseAltAnim) ? 19 : 18);
    // End:0x91
    if(bSkipCommon)
    {
        StartAnimationChoreography(MySPPawn, FollowerPawn, int(AnimToUse), true, EndAnimationFinished, FollowerSMInstance.EndAnimationFinished, false);        
    }
    else
    {
        StartAnimationChoreography(MySPPawn, FollowerPawn, int(AnimToUse), true, StartCommonAnimation,, false);
    }
    //return;    
}

function StartCommonAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartAnimationChoreography(MySPPawn, FollowerPawn, 20, true, EndAnimationFinished, FollowerSMInstance.EndAnimationFinished, false);
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
        // End:0x34
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
        // End:0x55
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS:
        // End:0x78
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Shock.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Shock.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Shock.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_Shock'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}