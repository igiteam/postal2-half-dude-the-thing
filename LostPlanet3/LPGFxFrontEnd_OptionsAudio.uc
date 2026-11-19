class LPGFxFrontEnd_OptionsAudio extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0xB0
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
        LPFrontEndMoviePlayer.SetOptionSelectButton(false);
    }
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    // End:0x5A
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(false);
        LPFrontEndMoviePlayer.SetOptionSelectButton(true);
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x63
    if(IsOptionDefaultsButton(ButtonName))
    {
        // End:0x61
        if(int(InputEvent) == int(0))
        {
            ConfirmDefaults();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnOptionChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], PC;

    super(SPGFxUIViewSettingsMenuBase).OnOptionChanged(ev);
    PC = SPPlayerController(Outer.GetPC());
    // End:0x73
    if(PC != none)
    {
        PC.UpdateLocalCacheOfProfileSettings();
    }
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Audio>"
    SettingsList=/* Array type was not detected. */
}