class LPSM_ForkArmGrab_HoldFIXEDAct1Boss extends LPSM_ForkArmGrab_HoldFIXED
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TimeDrillStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BossController[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    BossController = LPAIControllerAct1Boss(LPAIPawnAct1Boss(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor).Controller);
    BossController.bCoresVulnerable = true;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    BossController.bCoresVulnerable = false;
    BossController = none;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function DrillInFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super.DrillInFinished(Node, InUserData, bInterrupted);
    // End:0x79
    if(int(AnimState) == int(2))
    {
        TimeDrillStarted = int(MySPPawn.WorldInfo.TimeSeconds);
    }
    //return;    
}

function GetVictimVulnerableCoreID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

function GetCoreDestroyedSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ForkArmGrab_KillAct1Boss';
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXEDAct1Boss.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXEDAct1Boss.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldFIXEDAct1Boss.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}