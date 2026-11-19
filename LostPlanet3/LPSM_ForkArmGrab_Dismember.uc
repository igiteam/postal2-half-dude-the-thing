class LPSM_ForkArmGrab_Dismember extends LPSM_ForkArmGrab_Base
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
    super.StartInteraction();
    StartAnimationChoreography(MySPPawn, FollowerPawn, 4, false, DismemberFinished, FollowerSMInstance.EndAnimationFinished);
    //return;    
}

function DismemberFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, AkridPawn;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    AkridPawn = LPAIPawnAkrid(FollowerPawn);
    // End:0x72
    if(AkridPawn != none)
    {
        CoreID = GetVictimVulnerableCoreID();
        AkridPawn.BlendMaxCoreDamageFactorByCoreID(CoreID, 1.0000000, -1.0000000);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
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
        // End:0xAB
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            // End:0xA8
            if(MySPPawn.TakeDamageParams.InstigatedByPawn == FollowerPawn)
            {
                MySPPawn.TakeDamageParams.Damage = 0;
                return true;
            }
            // End:0xAE
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
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Dismember.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Dismember.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Dismember.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bUsesFloatingAim=true
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_Dismember'
}