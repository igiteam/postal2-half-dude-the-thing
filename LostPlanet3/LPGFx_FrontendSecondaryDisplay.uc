class LPGFx_FrontendSecondaryDisplay extends GFxObject within GFxMoviePlayer
    config(UI)
    implements(SPGFxViewLoaderInterface);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ViewLoader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ViewData[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PendingViewName;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __EscapeDelegate__Delegate;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMoviePlayer[8388609];

    ViewLoader = new (self) Class'SPGfx.SPGFxViewLoader';
    ViewLoader.Init(SPGFxViewLoaderInterface(self), InMoviePlayer, ViewData, SubWidgetBindings);
    ViewLoader.SetRootMC(self);
    ViewLoader.SetManagerMC(self);
    ViewLoader.LoadViews();
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = false;
    bResult = ViewLoader.InitViewWidget(WidgetName, WidgetPath, Widget);
    // End:0xBA
    if((bResult == true) && WidgetName == PendingViewName)
    {
        ViewLoader.PushViewByName(PendingViewName);
        PendingViewName = 'None';        
    }
    else
    {
        bResult = true;
        switch(WidgetName)
        {
            // End:0x16C
            case 'selectText':
                Widget.SetText(ViewLoader.MoviePlayer.GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonAcceptSelect>"));
                // End:0x36B
                break;
            // End:0x21B
            case 'tabLeftText':
                Widget.SetText(ViewLoader.MoviePlayer.GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_bumperLeft>"));
                // End:0x36B
                break;
            // End:0x2CB
            case 'tabRightText':
                Widget.SetText(ViewLoader.MoviePlayer.GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.Widget_bumperRight>"));
                // End:0x36B
                break;
            // End:0x359
            case 'confirmText':
                Widget.SetText(ViewLoader.MoviePlayer.GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
                // End:0x36B
                break;
            // End:0xFFFF
            default:
                bResult = false;
                // End:0x36B
                break;
                break;
        }
    }
    return bResult;
    //return ReturnValue;    
}

delegate EscapeDelegate()
{
    //return;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PushView()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetView[142606337];

    ActionScriptVoid("pushStandardView");
    //return;    
}

function PushDialogView()
{
    local /*0x97E50000-0x00000000*/ private @NULL dialogView[142606337];
    local /*0x97E50000-0x00000000*/ private float TransitionTime[9437185];
    local /*0x97E50000-0x00000000*/ private bool bHideStack[9437185];

    0.3000000
    true
    ActionScriptVoid("pushDialogView");
    //return;    
}

function PopViewStub()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ActionScriptObject("popView");
    //return ReturnValue;    
}

function LoaderSetWidgetPathBinding()
{
    local /*0x97E50000-0x00000000*/ private @NULL WidgetToBind[8388609];
    local /*0x97E50000-0x00000000*/ private name Path[8388609];

    Outer.SetWidgetPathBinding(WidgetToBind, Path);
    //return;    
}

function ShouldUnloadViewOnPop()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetEscapeDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    ActionScriptSetFunction("OnEscapeKeyPress");
    //return;    
}

function SetSelectionFocus()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[142606337];

    // End:0x22
    if(MovieClip != none)
    {
        ASSetSelectionFocus(MovieClip);
    }
    //return;    
}

function ASSetSelectionFocus()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];

    ActionScriptVoid("setSelectionFocus");
    //return;    
}

defaultproperties
{
    ViewData=/* Array type was not detected. */
}