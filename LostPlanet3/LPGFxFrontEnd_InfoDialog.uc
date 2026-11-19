class LPGFxFrontEnd_InfoDialog extends LPGFxFrontEnd_Dialog within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DialogOpenSoundEventName[1073741825];

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    ASShowInfoDialog(false);
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super(SPGFxUIView).OnTopMostView(bPlayOpenAnimation, previousView);
    ASShowInfoDialog(true);
    Outer.PlaySoundFromTheme(DialogOpenSoundEventName);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super(SPGFxUIView).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x156
    if((((((((((((ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XboxTypeS_A') || ButtonName == 'XboxTypeS_B') || ButtonName == 'Enter') || ButtonName == 'Escape') && int(InputEvent) == int(0)) || ButtonName == 'LeftMouseButton')
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function OnEscapeKeyPress()
{
    super(SPGFxUIView).OnEscapeKeyPress();
    //return;    
}

defaultproperties
{
    DialogOpenSoundEventName="MenuChange"
    bShouldHideViewStack=false
}