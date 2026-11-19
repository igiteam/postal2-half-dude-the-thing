class LPSM_ForkArmGrab_CoreDestroyed extends LPSM_ForkArmGrab_Base
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
    StartAnimationChoreography(MySPPawn, FollowerPawn, 23, false, Finished, FollowerSMInstance.EndAnimationFinished);
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
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, AkridPawn;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    AkridPawn = LPAIPawn(FollowerPawn);
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

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CoreDestroyed.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_CoreDestroyed.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_CoreDestroyed.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bUsesFloatingAim=true
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_CoreDestroyed'
}