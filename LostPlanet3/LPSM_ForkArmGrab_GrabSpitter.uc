class LPSM_ForkArmGrab_GrabSpitter extends LPSM_ForkArmGrab_Grab
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GrabFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;

    SpitterPawn = LPAIPawnSpitter(FollowerPawn);
    // End:0x5D
    if((SpitterPawn != none) && !SpitterPawn.IsTailDestroyed())
    {
        FinishGrabAbrupt();
        return;
    }
    LPPawn(MySPPawn).TemplateLogicData.HoldStateIndex = 9;
    super.GrabFinished(Node, InUserData, bInterrupted);
    //return;    
}

function GetGrabAnimationIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;

    SpitterPawn = LPAIPawnSpitter(FollowerPawn);
    // End:0x53
    if((SpitterPawn != none) && !SpitterPawn.IsTailDestroyed())
    {
        return 0;
    }
    return 1;
    //return ReturnValue;    
}

function DoShockVictim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock', true,,, FollowerPawn);
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_GrabSpitter.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_GrabSpitter.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_GrabSpitter.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}