class LPGFxFrontEnd_OptionsGamma extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GammaSlider;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GammaTitleLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GammaInfoLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GammaMin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GammaMax;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentGamma[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrevGamma[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NormalGamma;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrevEnableGammaCorrection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNormalShutdown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNormalizedGammaSet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConfirmLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;

function OnViewLoaded()
{
    super.OnViewLoaded();
    InitLabels();
    GammaMin = GammaMin / NormalGamma;
    GammaMax = GammaMax / NormalGamma;
    //return;    
}

function InitLabels()
{
    GammaTitleLabel = Outer.GetVariableObject(string(MyWidgetPath) $ ".GammaTitleText");
    // End:0xA8
    if(GammaTitleLabel != none)
    {
        GammaTitleLabel.SetText("<Strings:LostPlanetGame.GammaScreen.GammaTitle>");
    }
    GammaInfoLabel = Outer.GetVariableObject(string(MyWidgetPath) $ ".GammaInfoText");
    // End:0x14E
    if(GammaInfoLabel != none)
    {
        GammaInfoLabel.SetText("<Strings:LostPlanetGame.GammaScreen.GammaInfo>");
    }
    //return;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    // End:0x68
    if(SelectLabel != none)
    {
        SelectLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelectHoriz>"));
    }
    // End:0xD5
    if(ConfirmLabel != none)
    {
        ConfirmLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.GammaScreen.OptionDefault>"));
    }
    // End:0x136
    if(BackLabel != none)
    {
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
    }
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    ASRepositionButtonPrompts();
    // End:0x9D
    if(MoviePlayer != none)
    {
        bPrevEnableGammaCorrection = MoviePlayer.bEnableGammaCorrection;
        EnableMoviePlayerGammaCorrection(true);
        MoviePlayer.SetExternalInterface(self);
    }
    // End:0xD4
    if(MenuViewLoader != none)
    {
        MenuViewLoader.SetSelectionFocus(GammaSlider);
    }
    InitGammaFromProfile();
    //return;    
}

function OnViewClosed()
{
    super.OnViewClosed();
    MoviePlayer.SetExternalInterface(MoviePlayer);
    EnableMoviePlayerGammaCorrection(bPrevEnableGammaCorrection);
    // End:0x6E
    if(!bNormalShutdown && bNormalizedGammaSet)
    {
        RestorePreviousGamma();
    }
    //return;    
}

function OnViewUnloaded()
{
    super.OnViewUnloaded();
    // End:0x32
    if(!bNormalShutdown && bNormalizedGammaSet)
    {
        RestorePreviousGamma();
    }
    //return;    
}

function EnableMoviePlayerGammaCorrection()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GVP, LP;

    // End:0xF7
    if((MoviePlayer != none) && MoviePlayer.bEnableGammaCorrection != bSet)
    {
        MoviePlayer.bEnableGammaCorrection = bSet;
        LP = MoviePlayer.GetLP();
        // End:0xF7
        if(LP != none)
        {
            GVP = LP.ViewportClient;
            // End:0xF7
            if(GVP != none)
            {
                GVP.NotifySplitscreenLayoutChanged();
            }
        }
    }
    //return;    
}

function InitGammaFromProfile()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private float profileGamma, SliderValue;

    PC = SPPlayerController(Outer.GetPC());
    // End:0x43
    if(PC == none)
    {
        return;
    }
    profileGamma = PC.ProfileSettings.GetGammaSetting();
    PrevGamma = profileGamma;
    CurrentGamma = profileGamma / NormalGamma;
    PC.SetGamma(CurrentGamma);
    SliderValue = (CurrentGamma - GammaMin) / (GammaMax - GammaMin);
    SetGammaSliderValue(SliderValue);
    bNormalizedGammaSet = true;
    //return;    
}

function GammaSliderChanged()
{
    local /*0x97E50000-0x00000000*/ private float SliderValue[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = SPPlayerController(Outer.GetPC());
    // End:0x43
    if(PC == none)
    {
        return;
    }
    CurrentGamma = GammaMin + ((GammaMax - GammaMin) * SliderValue);
    PC.SetGamma(CurrentGamma);
    PC.ProfileSettings.SetGammaSetting(CurrentGamma * NormalGamma);
    //return;    
}

function SetGammaSliderValue()
{
    local /*0x97E50000-0x00000000*/ private float SliderValue[8388609];

    ActionScriptFloat("SetGammaSliderValue");
    //return;    
}

function ASRepositionButtonPrompts()
{
    ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

function OnEscapeKeyPress()
{
    AcceptGammaScreen();
    //return;    
}

function CancelGammaScreen()
{
    //return;    
}

function RestorePreviousGamma()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = SPPlayerController(Outer.GetPC());
    // End:0x43
    if(PC == none)
    {
        return;
    }
    PC.SetGamma(PrevGamma);
    PC.ProfileSettings.SetGammaSetting(PrevGamma);
    //return;    
}

function RestoreDefaultGamma()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private float SliderValue;

    PC = SPPlayerController(Outer.GetPC());
    // End:0x43
    if(PC == none)
    {
        return;
    }
    CurrentGamma = 1.0000000;
    PC.SetGamma(CurrentGamma);
    PC.ProfileSettings.SetGammaSetting(CurrentGamma * NormalGamma);
    SliderValue = (CurrentGamma - GammaMin) / (GammaMax - GammaMin);
    SetGammaSliderValue(SliderValue);
    //return;    
}

function AcceptGammaScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = SPPlayerController(Outer.GetPC());
    // End:0x43
    if(PC == none)
    {
        return;
    }
    bNormalShutdown = true;
    PC.SetGamma(CurrentGamma * NormalGamma);
    PC.SaveProfile();
    MoveBackImpl();
    //return;    
}

function PlayNavBackSoundEvent()
{
    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(NavBackSoundEventName);
    }
    //return;    
}

function MoveBackImpl()
{
    PlayNavBackSoundEvent();
    // End:0x61
    if(MenuViewLoader != none)
    {
        PlayCloseAnimation();
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x78
        case 'GammaSlider':
            GammaSlider = Widget;
            // End:0x75
            if(MenuViewLoader != none)
            {
                MenuViewLoader.SetSelectionFocus(GammaSlider);
            }
            // End:0x10E
            break;
        // End:0xA4
        case 'SelectString':
            SelectLabel = Widget;
            RefreshButtonPrompts();
            // End:0x10E
            break;
        // End:0xD0
        case 'ConfirmString':
            ConfirmLabel = Widget;
            RefreshButtonPrompts();
            // End:0x10E
            break;
        // End:0xFC
        case 'BackString':
            BackLabel = Widget;
            RefreshButtonPrompts();
            // End:0x10E
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x10E
            break;
            break;
    }
    // End:0x14D
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bRetval;

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    bRetval = false;
    // End:0x6F
    if(IsOptionDefaultsButton(ButtonName))
    {
        // End:0x6D
        if(int(InputEvent) == int(0))
        {
            RestoreDefaultGamma();
        }
        return true;
    }
    return bRetval;
    //return ReturnValue;    
}

function IsOptionDefaultsButton()
{
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if((ButtonName == 'XboxTypeS_X') || ButtonName == 'BackSpace')
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    GammaMin=0.3000000
    GammaMax=5.0000000
    NormalGamma=2.2000000
}