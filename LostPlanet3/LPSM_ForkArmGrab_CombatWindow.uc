class LPSM_ForkArmGrab_CombatWindow extends LPSM_ForkArmGrab_Grab
    config(Game);

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x21
    if(super(LPSM_ForkArmGrab_Base).InternalCanDoSpecialMove())
    {
        return FindValidForkArmGrabPoint(ForkArmGrabInfo);
    }
    return false;
    //return ReturnValue;    
}

function FindValidForkArmGrabPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, ForkArmCombatWindow, GrabPoint;

    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x23A
    if(vsPawn != none)
    {
        ForkArmCombatWindow = LPCombatWindow_ForkArm(vsPawn.ReplicatedCombatWindowInfo.Window.CombatWindow);
        // End:0x23A
        if((ForkArmCombatWindow != none) && vsPawn.ReplicatedCombatWindowInfo.Window.Publisher != none)
        {
            GrabPoint.GrabPointIndex = ForkArmCombatWindow.GetGrabPointIndex();
            // End:0x23A
            if(vsPawn.ReplicatedCombatWindowInfo.Window.Publisher.IsValidGrabPointIndex(GrabPoint.GrabPointIndex))
            {
                GrabPoint.bFirmGrab = true;
                GrabPoint.HitPawn = vsPawn.ReplicatedCombatWindowInfo.Window.Publisher;
                InForkArmGrabInfo.GrabPoint = GrabPoint;
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyLPPawn, LPPC;

    MyLPPawn = LPPawn(MySPPawn);
    MyLPPawn.TemplateLogicData.CombatWindowName = MyLPPawn.ReplicatedCombatWindowInfo.Window.CombatWindow.WindowName;
    LPPC = LPPlayerController(MyLPPawn.Controller);
    // End:0x108
    if(LPPC != none)
    {
        LPPC.CompletedTutorialMode(3);
    }
    super.StartInteraction();
    //return;    
}

function GetGrabPointHoldSMClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, ForkArmCombatWindow;

    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0xD6
    if(vsPawn != none)
    {
        ForkArmCombatWindow = LPCombatWindow_ForkArm(vsPawn.ReplicatedCombatWindowInfo.Window.CombatWindow);
        // End:0xD6
        if((ForkArmCombatWindow != none) && ForkArmCombatWindow.InitialForkArmGrabSpecialMove != none)
        {
            return ForkArmCombatWindow.InitialForkArmGrabSpecialMove;
        }
    }
    return super(LPSM_ForkArmGrab_Base).GetGrabPointHoldSMClass();
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetGrabAnimationIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 22;
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            return true;
        // End:0x77
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            // End:0x74
            if(!bAllowDrillUse)
            {
                bWantsToUseDrill = true;
                return true;
            }
            // End:0x7A
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CombatWindow.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CombatWindow.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_CombatWindow.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanOverrideBaseClasses=/* Array type was not detected. */
}