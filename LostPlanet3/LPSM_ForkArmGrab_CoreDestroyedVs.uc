class LPSM_ForkArmGrab_CoreDestroyedVs extends LPSM_ForkArmGrab_CoreDestroyed
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    //return;    
}

function StartInteraction()
{
    bDrillInUse = true;
    // End:0x48
    if(MyVSPawn != none)
    {
        MyVSPawn.StartRightArmPartAction(0,,,,,,,,,,, 2);
    }
    super.StartInteraction();
    //return;    
}

function Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
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
        // End:0xDB
        case Class'LPSMMTypes'.default.SMM_VSForcedRightArmPartEndThroughAnimNotify:
            bDrillInUse = false;
            // End:0xD9
            if(MyVSPawn != none)
            {
                MyVSPawn.StopRightArmPartAction(0, true);
            }
            return true;
        // End:0xFFFF
        default:
            return super(LPSM_ForkArmGrab_Base).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CoreDestroyedVs.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CoreDestroyedVs.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_CoreDestroyedVs.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bUsesFloatingAim=false
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_CoreDestroyedVs'
}