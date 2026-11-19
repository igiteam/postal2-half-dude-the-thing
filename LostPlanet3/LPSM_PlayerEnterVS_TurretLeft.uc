class LPSM_PlayerEnterVS_TurretLeft extends LPSM_PlayerEnterVS
    config(Game);

function GetMyAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 6;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerEnterVS_TurretLeft.CamParamObj'
    begin object name=CamParamObj
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerEnterVS_TurretLeft.CamTransitionInParamObj'
    begin object name=CamTransitionInParamObj
    end object
    CamTransitionInParam=CamTransitionInParamObj
}