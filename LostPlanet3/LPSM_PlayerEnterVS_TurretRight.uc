class LPSM_PlayerEnterVS_TurretRight extends LPSM_PlayerEnterVS
    config(Game);

function GetMyAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 5;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerEnterVS_TurretRight.CamParamObj'
    begin object name=CamParamObj
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerEnterVS_TurretRight.CamTransitionInParamObj'
    begin object name=CamTransitionInParamObj
    end object
    CamTransitionInParam=CamTransitionInParamObj
}