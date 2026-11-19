class LPGFxFrontEnd_OnlineAddFriend extends SPGFxUIView within GFxMoviePlayer
    config(UI);

//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __gscbAddFriendComplete__Delegate;

function ErrorResponseDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorPostfix[8388609];
    local /*0x97E50000-0x00000000*/ private bool bExitOnDone[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    false
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x290
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.ErrorResponseDialogTitle_" $ ErrorPostfix) $ ">");
        ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.ErrorResponseDialogBody_" $ ErrorPostfix) $ ">");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.ErrorResponseDialogOK>");
        // End:0x25F
        if(bExitOnDone)
        {
            ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OKAndExit);            
        }
        else
        {
            ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OK);
        }
    }
    //return;    
}

function cbErrorResponseDialog_OK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function cbErrorResponseDialog_OKAndExit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    OnEscapeKeyPress();
    //return;    
}

function ValidateName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iAt, iDot, I, C, L;

    L = Len(InName);
    // End:0x3E
    if(L <= 0)
    {
        ErrorResponseDialog("InvalidNick");
        return false;
    }
    // End:0xAD
    if(InName == Outer.GetPC().PlayerReplicationInfo.PlayerName)
    {
        ErrorResponseDialog("InvalidNick");
    }
    iAt = InStr(InName, "@");
    iDot = InStr(InName, ".");
    // End:0x2BE
    if((iAt > 0) && iDot > 0)
    {
        // End:0x17E
        if((((iAt > iDot) || iAt == 0) || iDot == (iAt + 1)) || InStr(InName, "..") >= 0)
        {
            ErrorResponseDialog("MalformedEmail");
            return false;
        }
        I = 0;
        J0x189:

        // End:0x2BB [Loop If]
        if(I < L)
        {
            C = Asc(InName);
            // End:0x27C
            if((((((((C == 37) || C == 43) || C == 45) || C == 46) || C == 95) || (C >= 48) && C <= 57) || (C >= 64) && C <= 90) || (C >= 97) && C <= 122)
            {                
            }
            else
            {
                ErrorResponseDialog("InvalidEmail");
                return false;
            }
            InName = Right(InName, 1);
            ++I;
            // [Loop Continue]
            goto J0x189;
        }        
    }
    else
    {
        I = 0;
        J0x2C9:

        // End:0x3FA [Loop If]
        if(I < L)
        {
            C = Asc(InName);
            // End:0x3BC
            if((((((((C == 37) || C == 43) || C == 45) || C == 46) || C == 95) || (C >= 48) && C <= 57) || (C >= 64) && C <= 90) || (C >= 97) && C <= 122)
            {                
            }
            else
            {
                ErrorResponseDialog("InvalidNick");
                return false;
            }
            InName = Right(InName, 1);
            ++I;
            // [Loop Continue]
            goto J0x2C9;
        }
    }
    return true;
    //return ReturnValue;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL FriendId;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    FriendId = GetObject("friendID");
    FriendId.SetText("");
    MenuViewLoader.SetSelectionFocus(FriendId);
    Outer.SetExternalInterface(self);
    SetAcceptButtonText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.Widget_acceptButton>"));
    SetCancelButtonText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.Widget_cancelButton>"));
    //return;    
}

function OnViewClosed()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ClearAddFriendByNameCompleteDelegate(byte(Outer.GetLP().ControllerId), gscbAddFriendComplete);
    super.OnViewClosed();
    Outer.SetExternalInterface(MoviePlayer);
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;

    LocalizedString = GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_OnlineAddFriend.Widget_" $ string(WidgetName)) $ ">");
    // End:0xA6
    if(IsLocalizationSuccessful(LocalizedString))
    {
        Widget.SetText(LocalizedString);
        return true;
    }
    return super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if(ButtonName == 'XboxTypeS_B')
    {
        // End:0x35
        if(int(InputEvent) == int(0))
        {
            OnEscapeKeyPress();
        }
        return true;
    }
    // End:0x1E0
    if(((((((((((((((((ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left') || ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right') || ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter') || ButtonName == 'Escape') || ButtonName == 'LeftMouseButton') || ButtonName == 'BackSpace')
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

delegate gscbAddFriendComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    ShowBusyIcon(false);
    // End:0x2D
    if(bWasSuccessful)
    {
        ErrorResponseDialog("AddOK", true);        
    }
    else
    {
        ErrorResponseDialog("AddFailed", true);
    }
    //return;    
}

function AddFriend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ButtonName[8388609], FriendName;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x29
    if(ButtonName == "CancelClicked")
    {
        OnEscapeKeyPress();
        return;
    }
    // End:0x43
    if(!ValidateName(FriendName))
    {
        return;
    }
    ShowBusyIcon(true);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.AddAddFriendByNameCompleteDelegate(byte(Outer.GetLP().ControllerId), gscbAddFriendComplete);
    // End:0x20E
    if(!OnlineSub.PlayerInterface.AddFriendByName(byte(Outer.GetLP().ControllerId), FriendName, "Friend Request"))
    {
        ErrorResponseDialog("AddFailed", true);
        OnlineSub.PlayerInterface.ClearAddFriendByNameCompleteDelegate(byte(Outer.GetLP().ControllerId), gscbAddFriendComplete);
    }
    return;
    //return;    
}

function ShowBusyIcon()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("showBusyIcon");
    //return;    
}

function SetAcceptButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setAcceptButtonText");
    //return;    
}

function SetCancelButtonText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setCancelButtonText");
    //return;    
}

defaultproperties
{
    bShouldHideViewStack=false
}