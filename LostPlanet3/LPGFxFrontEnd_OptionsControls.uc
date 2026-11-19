class LPGFxFrontEnd_OptionsControls extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFloatingAimMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OriginalFloatingAimScale_X;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OriginalFloatingAimScale_Y;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OriginalFloatingAimWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OriginalFloatingAimHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OriginalScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FloatingAimScale;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x90
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
    }
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    // End:0x3A
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(false);
    }
    //return;    
}

function ResetSettingsToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super.ResetSettingsToDefaults();
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x73
    if(LPPC != none)
    {
        LPPC.SetControllerConfig("Default");
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

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'ControlConfig':
            Select_ControlConfig();
            // End:0xD4
            break;
        // End:0xCE
        case 'KeyboardConfig':
            Select_KeyboardConfig();
            // End:0xD4
            break;
        // End:0xFFFF
        default:
            // End:0xD4
            break;
            break;
    }
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex, ListIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data;

    // End:0x9B
    if((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.DisplayContent == none)
    {
        LPFrontEndMoviePlayer.DisplayContent = Outer.GetVariableObject("_root.displaySecondary.displayContent");
    }
    super.UpdateDescription();
    // End:0x260
    if(ListMC != none)
    {
        SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
        ListIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
        // End:0x125
        if(ListIndex < 0)
        {
            ListIndex = 0;
        }
        // End:0x203
        if(ListIndex == (GetFloatingAimScaleIndex()))
        {
            bFloatingAimMode = true;
            // End:0x200
            if(LPFrontEndMoviePlayer != none)
            {
                LPFrontEndMoviePlayer.DisplayContent.GotoAndStopI(2);
                Data = ListDataProvider.GetElementObject(SelectedIndex);
                // End:0x200
                if(Data != none)
                {
                    UpdateFloatingAimRegionDisplay(Data.GetFloat("value"));
                }
            }            
        }
        else
        {
            // End:0x260
            if(bFloatingAimMode)
            {
                bFloatingAimMode = false;
                // End:0x260
                if(LPFrontEndMoviePlayer != none)
                {
                    LPFrontEndMoviePlayer.DisplayContent.GotoAndStopI(1);
                }
            }
        }
    }
    //return;    
}

function FloatingAimInit()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewFloatingAimScaleRegion[8388609];
    local /*0x97E50000-0x00000000*/ private int ProfileSettingId;
    local /*0x97E50000-0x00000000*/ private @NULL PC, ProfileSettings;
    local /*0x97E50000-0x00000000*/ private float SettingValue;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    mySettingsList = GetSettingsList();
    // End:0x68
    if(FloatingAimScale == none)
    {
        FloatingAimScale = NewFloatingAimScaleRegion;
        OriginalScale = FloatingAimScale.GetFloat("_xscale");
    }
    PC = SPPlayerController(MoviePlayer.GetPC());
    // End:0x155
    if(PC != none)
    {
        ProfileSettings = PC.ProfileSettings;
        // End:0x155
        if(ProfileSettings != none)
        {
            ProfileSettingId = mySettingsList[GetFloatingAimScaleIndex()].ProfileSettingId;
            ProfileSettings.GetProfileSettingValueFloat(ProfileSettingId, SettingValue);
            UpdateFloatingAimRegionDisplay(SettingValue);
        }
    }
    //return;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    LPFrontEndMoviePlayer = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    // End:0x55
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.ControlsMenu = self;
    }
    //return;    
}

function GetFloatingAimScaleIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    mySettingsList = GetSettingsList();
    I = 0;
    J0x1F:

    // End:0x8D [Loop If]
    if(I < mySettingsList.Length)
    {
        // End:0x7F
        if(mySettingsList[I].OptionName == "FloatingAimRegion")
        {
            return I;
        }
        I++;
        // [Loop Continue]
        goto J0x1F;
    }
    return -1;
    //return ReturnValue;    
}

function OnOptionChanged()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], Data;
    local /*0x97E50000-0x00000000*/ private float SliderValue;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    // End:0xD1
    if(SelectedIndex == (GetFloatingAimScaleIndex()))
    {
        Data = ListDataProvider.GetElementObject(ev.Index);
        SliderValue = Data.GetFloat("value");
        UpdateFloatingAimRegionDisplay(SliderValue);
    }
    super(SPGFxUIViewSettingsMenuBase).OnOptionChanged(ev);
    //return;    
}

function UpdateFloatingAimRegionDisplay()
{
    local /*0x97E50000-0x00000000*/ private float SliderValue[8388609], ScaleValue;

    // End:0xAA
    if(FloatingAimScale == none)
    {
        FloatingAimScale = Outer.GetVariableObject("_root.displaySecondary.displayContent.floatingAim.aimBoundary");
        OriginalScale = FloatingAimScale.GetFloat("_xscale");
    }
    // End:0x17C
    if((FloatingAimScale != none) && OriginalScale != float(0))
    {
        // End:0xF1
        if(SliderValue < 0.0010000)
        {
            ScaleValue = 0.0500000;            
        }
        else
        {
            ScaleValue = SliderValue;
        }
        FloatingAimScale.SetFloat("_xscale", ScaleValue * OriginalScale);
        FloatingAimScale.SetFloat("_yscale", ScaleValue * OriginalScale);
    }
    //return;    
}

function Select_ControlConfig()
{
    MenuViewLoader.SpawnDialog('ControlConfig', self);
    //return;    
}

function Select_KeyboardConfig()
{
    MenuViewLoader.SpawnDialog('KeyboardConfig', self);
    //return;    
}

function Select_BackImpl()
{
    // End:0x85
    if(((LPFrontEndMoviePlayer != none) && LPFrontEndMoviePlayer.DisplayContent != none) && bFloatingAimMode)
    {
        bFloatingAimMode = false;
        LPFrontEndMoviePlayer.DisplayContent.GotoAndPlayI(1);
    }
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Controls>"
    SettingsList=/* Array type was not detected. */
}