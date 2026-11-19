class LPAICmd_VsLarocheStruggleVsKnockOutHitsOnUrStrike extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.UpdateVsLightsKoStruggleStart();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetLightsByStage();
    Outer.VsLarochePawn.LeftClavLightFactor = Outer.VsLarochePawn.TuneDataVsLaroche.LeftClavLightFactorWhenOn;
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr';
    //return ReturnValue;    
}
