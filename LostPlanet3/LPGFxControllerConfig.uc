class LPGFxControllerConfig extends GFxObject within GFxMoviePlayer;

const MaxControlModes = 1;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControlConfig;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentControlModeIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPresetIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentControlConfigString;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL TMP[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentConfigIndex[8388609];

    CurrentPresetIndex = CurrentConfigIndex;
    ControlConfig = TMP;
    CurrentControlModeIndex = 0;
    GotoScreen(0);
    //return;    
}

function GetControlConfigurationString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPI;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xBD
    if(LPPC != none)
    {
        LPPI = LPPlayerInput(LPPC.PlayerInput);
        // End:0xBD
        if(LPPI != none)
        {
            return LPPI.InputConfigurations[CurrentPresetIndex].ProfileSettingsName;
        }
    }
    return "";
    //return ReturnValue;    
}

function GetControlModeIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return CurrentControlModeIndex;
    //return ReturnValue;    
}

function GetPresetIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return CurrentPresetIndex;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x67
    if(int(InputEvent) == int(0))
    {
        // End:0x46
        if(ButtonName == 'XboxTypeS_X')
        {
            ResetToDefaults();
            return true;            
        }
        else
        {
            // End:0x67
            if(ButtonName == 'XboxTypeS_B')
            {
                CancelControllerScreen();
            }
        }
    }
    return Retval;
    //return ReturnValue;    
}

function ResetToDefaults()
{
    CurrentPresetIndex = 0;
    ControlConfig.NotifyPresetChanged(0);
    //return;    
}

function NextPreset()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPI;

    LPPI = LPPlayerInput(Outer.GetPC().PlayerInput);
    // End:0xAD
    if((CurrentPresetIndex + 1) < LPPI.InputConfigurations.Length)
    {
        CurrentPresetIndex++;
        ControlConfig.NotifyPresetChanged(CurrentPresetIndex);        
    }
    else
    {
        CurrentPresetIndex = 0;
        ControlConfig.NotifyPresetChanged(CurrentPresetIndex);
    }
    //return;    
}

function PrevPreset()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPI;

    LPPI = LPPlayerInput(Outer.GetPC().PlayerInput);
    // End:0x93
    if((CurrentPresetIndex - 1) > -1)
    {
        CurrentPresetIndex--;
        ControlConfig.NotifyPresetChanged(CurrentPresetIndex);        
    }
    else
    {
        CurrentPresetIndex = LPPI.InputConfigurations.Length - 1;
        ControlConfig.NotifyPresetChanged(CurrentPresetIndex);
    }
    //return;    
}

function CancelControllerScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPI;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xDE
    if(LPPC != none)
    {
        LPPI = LPPlayerInput(LPPC.PlayerInput);
        // End:0xDE
        if(LPPI != none)
        {
            LPPC.ProfileSettings.SetControlConfigurationString(GetControlConfigurationString());
            LPPC.SaveProfile();
        }
    }
    //return;    
}

function GotoScreen()
{
    local /*0x97E50000-0x00000000*/ private int NewScreen[8388609];

    SwitchToPage(NewScreen);
    //return;    
}

function SwitchToPage()
{
    local /*0x97E50000-0x00000000*/ private int page[8388609];

    ActionScriptVoid("switchPages");
    //return;    
}
