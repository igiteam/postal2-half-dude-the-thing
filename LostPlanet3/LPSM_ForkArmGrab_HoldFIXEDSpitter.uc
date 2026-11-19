class LPSM_ForkArmGrab_HoldFIXEDSpitter extends LPSM_ForkArmGrab_HoldFIXED
    config(Game);

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x76
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            bWantsToUseDrill = false;
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock',,,, FollowerPawn);
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

    // End:0x6A
    if(ClassIsChildOf(FollowerPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSWelder'))
    {
        LPAIPawn(FollowerPawn).bAutoExplodeFrozen = true;
    }
    return super.VictimDied();
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXEDSpitter.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldFIXEDSpitter.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldFIXEDSpitter.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}