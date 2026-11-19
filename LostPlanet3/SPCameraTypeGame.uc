class SPCameraTypeGame extends SPCameraTypeBase
    abstract;

defaultproperties
{
    bWarnAboutUnknownLayers=true
    // Reference: SPCameraBlendCut'Default__SPCameraTypeGame.CutTransitionObj'
    begin object name=CutTransitionObj
    end object
    CutTransition=CutTransitionObj
    // Reference: SPCameraTransitionCutParam'Default__SPCameraTypeGame.CutTransitionParamsObj'
    begin object name=CutTransitionParamsObj
    end object
    CutTransitionParams=CutTransitionParamsObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraTypeGame.GlobalFilterObj'
    begin object name=GlobalFilterObj
    end object
    GlobalFilter=GlobalFilterObj
    // Reference: SPCameraBlendCubic'Default__SPCameraTypeGame.RecenterTransitionObj'
    begin object name=RecenterTransitionObj
    end object
    RecenterTransition=RecenterTransitionObj
    // Reference: SPCameraTransitionCubicParam'Default__SPCameraTypeGame.RecenterTransitionParamsObj'
    begin object name=RecenterTransitionParamsObj
    end object
    RecenterTransitionParams=RecenterTransitionParamsObj
}