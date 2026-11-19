class LPAICmd_VsLarocheStrugglePlayerDestroyingHipShieldResponse extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    // End:0x6E
    if(!Outer.bJimsGrabbedCockpitCrossBarForShield)
    {
        Outer.bJimsGrabbedCockpitCrossBarForShield = true;
        Outer.ProcessForVirginGrabDialogNeeds();
    }
    Outer.UpdateVsLightsHipShieldStruggleStart();
    //return;    
}
