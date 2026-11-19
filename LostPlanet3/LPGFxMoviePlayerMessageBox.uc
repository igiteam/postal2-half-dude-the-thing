class LPGFxMoviePlayerMessageBox extends SPGFxMoviePlayerMessageBox
    config(UI);

struct ButtonInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OptionWidget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BtnWidget;

    structdefaultproperties
    {
        OptionWidget=none
        BtnWidget=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MessageBoxMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Buttons[5];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TitleTextString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InfoTextString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClosing;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnStartButtonPressed__Delegate;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocPlay[9437185], MyEngine;

    super.Init(LocPlay);
    SetTimingMode(1);
    RootMC = GetVariableObject("_root");
    ViewLoader.SetRootMC(RootMC);
    ViewLoader.SetManagerMC(RootMC);
    FlushPlayerInput(false);
    PlaySoundFromTheme('Popup_Enter');
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x10B
    if(MyEngine != none)
    {
        MyEngine.ForceResumeRendering();
    }
    bClosing = false;
    //return;    
}

function InfoDialogIsLoaded()
{
    //return;    
}

function InfoDialogIsClosed()
{
    Close();
    //return;    
}

function SetUpMessageBox()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dialog[8388609];
    local /*0x97E50000-0x00000000*/ private int NumButtons, I;

    NumButtons = ButtonTitles.Length;
    // End:0x30
    if(NumButtons > 5)
    {
        NumButtons = 5;
    }
    ASShowInfoDialog(true);
    SetDefaultFocusedButton(0);
    EnableDialogBackground(true);
    SetNumberOfOptions(NumButtons);
    SetTitle(TitleString);
    SetInfo(BodyString);
    I = 0;
    J0x95:

    // End:0x104 [Loop If]
    if(I < NumButtons)
    {
        SetButtonLabel(I, ButtonTitles[I]);
        SetButtonOnPress(I, OnButtonPress);
        I++;
        // [Loop Continue]
        goto J0x95;
    }
    //return;    
}

function OnButtonPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL targetparent;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;

    targetparent = ev.Target.GetObject("_parent");
    PlayerIndex = Class'Engine.UIInteraction'.static.GetPlayerIndex(GetLP().ControllerId);
    I = 0;
    J0x99:

    // End:0x128 [Loop If]
    if(I < NumOptions)
    {
        // End:0x11A
        if(targetparent == Buttons[I].OptionWidget)
        {
            // End:0x117
            if(OnOptionSelected(self, I, PlayerIndex))
            {
                StartExit();
            }
            // [Explicit Break]
            goto J0x128;
        }
        I++;
        // [Loop Continue]
        goto J0x99;
    }
    J0x128:

    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x61
    if(Retval == false)
    {
        Retval = ViewLoader.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    return Retval;
    //return ReturnValue;    
}

function SetEscapeDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "OnEscapeKeyPress");
    //return;    
}

delegate OnStartButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int ControllerIdx[8388609];

    return;
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = true;
    switch(WidgetName)
    {
        // End:0x41
        case 'Dialog':
            MessageBoxMC = Widget;
            // End:0x466
            break;
        // End:0xC3
        case 'popup_title':
            // End:0xC0
            if(TitleTxt == none)
            {
                TitleTxt = Widget.GetObject("textField");
                // End:0xB4
                if(TitleTextString != "")
                {
                    SetTitle(TitleTextString);
                }
                bResult = true;
            }
            // End:0x466
            break;
        // End:0x145
        case 'popup_info':
            // End:0x142
            if(InfoTxt == none)
            {
                InfoTxt = Widget.GetObject("textField");
                // End:0x136
                if(InfoTextString != "")
                {
                    SetInfo(InfoTextString);
                }
                bResult = true;
            }
            // End:0x466
            break;
        // End:0x188
        case 'option1':
            Buttons[0].OptionWidget = Widget;
            bResult = true;
            // End:0x466
            break;
        // End:0x1CB
        case 'option2':
            Buttons[1].OptionWidget = Widget;
            bResult = true;
            // End:0x466
            break;
        // End:0x20F
        case 'option3':
            Buttons[2].OptionWidget = Widget;
            bResult = true;
            // End:0x466
            break;
        // End:0x253
        case 'option4':
            Buttons[3].OptionWidget = Widget;
            bResult = true;
            // End:0x466
            break;
        // End:0x297
        case 'option5':
            Buttons[4].OptionWidget = Widget;
            bResult = true;
            // End:0x466
            break;
        // End:0x454
        case 'btn':
            // End:0x2F9
            if(InStr(string(WidgetPath), "option1") >= 0)
            {
                Buttons[0].BtnWidget = Widget;
                bResult = true;                
            }
            else
            {
                // End:0x34F
                if(InStr(string(WidgetPath), "option2") >= 0)
                {
                    Buttons[1].BtnWidget = Widget;
                    bResult = true;                    
                }
                else
                {
                    // End:0x3A6
                    if(InStr(string(WidgetPath), "option3") >= 0)
                    {
                        Buttons[2].BtnWidget = Widget;
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x3FD
                        if(InStr(string(WidgetPath), "option4") >= 0)
                        {
                            Buttons[3].BtnWidget = Widget;
                            bResult = true;                            
                        }
                        else
                        {
                            // End:0x451
                            if(InStr(string(WidgetPath), "option5") >= 0)
                            {
                                Buttons[4].BtnWidget = Widget;
                                bResult = true;
                            }
                        }
                    }
                }
            }
            // End:0x466
            break;
        // End:0xFFFF
        default:
            bResult = false;
            // End:0x466
            break;
            break;
    }
    return bResult;
    //return ReturnValue;    
}

function PostWidgetInit()
{
    // End:0x22
    if(MessageBoxMC != none)
    {
        SetUpMessageBox(MessageBoxMC);
    }
    //return;    
}

function StartExit()
{
    // End:0x0F
    if(bClosing)
    {
        return;
    }
    ASShowInfoDialog(false);
    PlaySoundFromTheme('Popup_Leave');
    //return;    
}

event OnClose()
{
    bClosing = true;
    Class'LPUIManager'.static.RemoveUIMessageReference(self);
    //return;    
}

function Callback_DoneExiting()
{
    Close();
    //return;    
}

function OnButtonFocus()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    //return;    
}

function SetNumberOfOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609], I;

    NumOptions = 0;
    // End:0x62
    if((Num >= 0) && Num <= 5)
    {
        NumOptions = Num;
        ActionScriptVoid("setNumInfoDialogOptions");
    }
    I = 0;
    J0x6D:

    // End:0x1A7 [Loop If]
    if(I < 5)
    {
        Buttons[I].BtnWidget.SetBool("pressedByKeyboard", false);
        GFxClikWidget(Buttons[I].BtnWidget).RemoveAllEventListeners("CLIK_focusIn");
        // End:0x199
        if(I < Num)
        {
            GFxClikWidget(Buttons[I].BtnWidget).AddEventListener('CLIK_focusIn', OnButtonFocus);
        }
        I++;
        // [Loop Continue]
        goto J0x6D;
    }
    //return;    
}

function EnableDialogBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    ActionScriptVoid("bShowInfoDialogBackground");
    //return;    
}

function SetDefaultFocusedButton()
{
    local /*0x97E50000-0x00000000*/ private int ButtonIndex[8388609];

    // End:0x7F
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex].BtnWidget != none)
    {
        SetSelectionFocus(Buttons[ButtonIndex].BtnWidget);
    }
    //return;    
}

function SetButtonOnPress()
{
    local /*0x97E50000-0x00000000*/ private int ButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EventListener[8388609];

    // End:0xFA
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex].BtnWidget != none)
    {
        GFxClikWidget(Buttons[ButtonIndex].BtnWidget).RemoveAllEventListeners("CLIK_press");
        GFxClikWidget(Buttons[ButtonIndex].BtnWidget).AddEventListener('CLIK_press', EventListener);
    }
    //return;    
}

function SetButtonLabel()
{
    local /*0x97E50000-0x00000000*/ private int ButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    // End:0x9C
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex].BtnWidget != none)
    {
        Buttons[ButtonIndex].BtnWidget.SetString("label", Label);
    }
    //return;    
}

function SetTitle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609];

    TitleTextString = Title;
    // End:0x4B
    if(TitleTxt != none)
    {
        TitleTxt.SetText(Title);
    }
    //return;    
}

function SetInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Info[8388609];

    InfoTextString = Info;
    // End:0x4B
    if(InfoTxt != none)
    {
        InfoTxt.SetText(Info);
    }
    //return;    
}

function Select_Back()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA5 [Loop If]
    if(I < 5)
    {
        // End:0x97
        if(Buttons[I].BtnWidget != none)
        {
            Buttons[I].BtnWidget.SetBool("disabled", bDisableComponents);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ASShowInfoDialog()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showInfoDialog");
    //return;    
}

defaultproperties
{
    MovieInfo=SwfMovie'HUD.Pause_InfoDialog'
    CaptureKeys=/* Array type was not detected. */
    WidgetBindings=/* Array type was not detected. */
}