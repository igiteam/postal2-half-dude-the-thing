class LPSM_ForkArmGrab_Kill extends LPSM_ForkArmGrab_Base
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    super.StartInteraction();
    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    bDrillInUse = true;
    MyVSPawn.StartRightArmPartAction(0);
    StartAnimationChoreography(MySPPawn, FollowerPawn, 16, true, KillFinished, FollowerSMInstance.EndAnimationFinished);
    //return;    
}

function KillFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.StopFullBodyAnim();
    MySPPawn.EndCurrentSpecialMove(self);
    IfVsDoesNotHaveDriverKillItsVelocity();
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            return true;
        // End:0x57
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
        // End:0x7A
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function VictimDied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Kill.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Kill.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Kill.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bStopRightArmPartAbruptly=true
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_Kill'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}