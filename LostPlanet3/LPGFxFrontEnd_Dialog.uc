class LPGFxFrontEnd_Dialog extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Buttons[5];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TitleTextString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InfoTextString;

function OnButtonFocus()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(ListChangeSoundEventName);
    }
    //return;    
}

function SetNumberOfOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609], I;

    // End:0x44
    if((Num >= 0) && Num <= 5)
    {
        ActionScriptVoid("setNumInfoDialogOptions");
    }
    I = 0;
    J0x4F:

    // End:0x170 [Loop If]
    if(I < 5)
    {
        Buttons[I].SetBool("pressedByKeyboard", false);
        Buttons[I].RemoveAllEventListeners("CLIK_focusIn");
        Buttons[I].RemoveAllEventListeners("focusIn");
        // End:0x162
        if(I < Num)
        {
            Buttons[I].AddEventListener('CLIK_focusIn', OnButtonFocus);
        }
        I++;
        // [Loop Continue]
        goto J0x4F;
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

    // End:0x84
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex] != none)
    {
        SuppressDefaultSoundEvents(true);
        MenuViewLoader.SetSelectionFocus(Buttons[ButtonIndex]);
        SuppressDefaultSoundEvents(false);
    }
    //return;    
}

function SetButtonOnPress()
{
    local /*0x97E50000-0x00000000*/ private int ButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EventListener[8388609];

    // End:0x125
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex] != none)
    {
        Buttons[ButtonIndex].RemoveAllEventListeners("CLIK_press");
        Buttons[ButtonIndex].RemoveAllEventListeners("press");
        Buttons[ButtonIndex].AddEventListener('CLIK_press', EventListener);
        Buttons[ButtonIndex].AddEventListener('CLIK_press', ButtonPressSoundDelegate);
    }
    //return;    
}

function ButtonPressSoundDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
    }
    //return;    
}

function SetButtonLabel()
{
    local /*0x97E50000-0x00000000*/ private int ButtonIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    // End:0x76
    if(((ButtonIndex >= 0) && ButtonIndex < 5) && Buttons[ButtonIndex] != none)
    {
        Buttons[ButtonIndex].SetString("label", Label);
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

    // End:0x57
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
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    switch(WidgetName)
    {
        // End:0x95
        case 'popup_title':
            // End:0x92
            if(TitleTxt == none)
            {
                TitleTxt = Widget.GetObject("textField");
                // End:0x86
                if(TitleTextString != "")
                {
                    SetTitle(TitleTextString);
                }
                bResult = true;
            }
            // End:0x33A
            break;
        // End:0x117
        case 'popup_info':
            // End:0x114
            if(InfoTxt == none)
            {
                InfoTxt = Widget.GetObject("textField");
                // End:0x108
                if(InfoTextString != "")
                {
                    SetInfo(InfoTextString);
                }
                bResult = true;
            }
            // End:0x33A
            break;
        // End:0x174
        case 'option1':
            Buttons[0] = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            bResult = true;
            // End:0x33A
            break;
        // End:0x1D1
        case 'option2':
            Buttons[1] = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            bResult = true;
            // End:0x33A
            break;
        // End:0x22F
        case 'option3':
            Buttons[2] = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            bResult = true;
            // End:0x33A
            break;
        // End:0x28D
        case 'option4':
            Buttons[3] = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            bResult = true;
            // End:0x33A
            break;
        // End:0x2EB
        case 'option5':
            Buttons[4] = GFxClikWidget(Widget.GetObject("btn", Class'GFxUI.GFxClikWidget'));
            bResult = true;
            // End:0x33A
            break;
        // End:0x328
        case 'Dialog':
            // End:0x325
            if(DialogMC == none)
            {
                DialogMC = Widget;
                bResult = true;
            }
            // End:0x33A
            break;
        // End:0xFFFF
        default:
            bResult = false;
            // End:0x33A
            break;
            break;
    }
    return bResult;
    //return ReturnValue;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    super.DisableSubComponents(bDisableComponents);
    I = 0;
    J0x1F:

    // End:0x93 [Loop If]
    if(I < 5)
    {
        // End:0x85
        if(Buttons[I] != none)
        {
            Buttons[I].SetBool("disabled", bDisableComponents);
        }
        I++;
        // [Loop Continue]
        goto J0x1F;
    }
    // End:0xAB
    if(bDisableComponents)
    {
        EnableDialogBackground(false);
    }
    //return;    
}

function SuppressDefaultSoundEvents()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppress[8388609];

    bSoundEvents = ((bSuppress) ? false : default.bSoundEvents);
    //return;    
}

function ASShowInfoDialog()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showInfoDialog");
    //return;    
}
