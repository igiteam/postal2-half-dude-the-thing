class LPCameraTypeGame extends SPCameraTypeGame;

simulated function Init()
{
    DefaultCameraParam = new (self) DefaultCameraParamClass;
    super(SPCameraTypeBase).Init();
    //return;    
}

defaultproperties
{
    Layers=/* Array type was not detected. */
    bUseGlobalFilter=false
    DefaultCameraParamClass=Class'LPCameraModeDefaultParam'
    DefaultCameraModeParamClass=Class'LPCameraModeAimControlThirdPersonParam'
    // Reference: SPCameraBlendCut'Default__LPCameraTypeGame.CutTransitionObj'
    begin object name=CutTransitionObj
    end object
    CutTransition=CutTransitionObj
    // Reference: SPCameraTransitionCutParam'Default__LPCameraTypeGame.CutTransitionParamsObj'
    begin object name=CutTransitionParamsObj
    end object
    CutTransitionParams=CutTransitionParamsObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraTypeGame.GlobalFilterObj'
    begin object name=GlobalFilterObj
    end object
    GlobalFilter=GlobalFilterObj
    // Reference: SPCameraBlendCubic'Default__LPCameraTypeGame.RecenterTransitionObj'
    begin object name=RecenterTransitionObj
    end object
    RecenterTransition=RecenterTransitionObj
    // Reference: SPCameraTransitionCubicParam'Default__LPCameraTypeGame.RecenterTransitionParamsObj'
    begin object name=RecenterTransitionParamsObj
    end object
    RecenterTransitionParams=RecenterTransitionParamsObj
}