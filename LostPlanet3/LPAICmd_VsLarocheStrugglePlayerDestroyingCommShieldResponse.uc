class LPAICmd_VsLarocheStrugglePlayerDestroyingCommShieldResponse extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    // End:0x6E
    if(!Outer.bJimsGrabbedLeftArm)
    {
        Outer.bJimsGrabbedLeftArm = true;
        Outer.ProcessForVirginGrabDialogNeeds();
    }
    Outer.UpdateVsLightsCommUnitStruggleStart();
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike';
    //return ReturnValue;    
}
