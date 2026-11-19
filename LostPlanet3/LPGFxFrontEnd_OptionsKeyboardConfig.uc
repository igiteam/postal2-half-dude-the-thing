class LPGFxFrontEnd_OptionsKeyboardConfig extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PopupHeaderText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentButtonHeaderText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ActionText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SecondaryText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string KeyAlreadyMappedText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ConfirmOverrideText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DefaultsText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string BackText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string OnFootControlModeText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UtilityRigControlModeText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VitalSuitControlModeText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PressAnyKeyText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnFootCommands[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array UtilityRigCommands[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VitalSuitCommands[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentPageName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControlModeLabel;

function OnViewLoaded()
{
    super.OnViewLoaded();
    SetupStrings();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    MoviePlayer.SetExternalInterface(self);
    CopyInputCommands(false);
    SelectView("onFoot");
    ASCancelMapping();
    ASOTMV();
    //return;    
}

function OnViewClosed()
{
    super.OnViewClosed();
    MoviePlayer.SetExternalInterface(MoviePlayer);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bRetval;

    // End:0x12C
    if((InStr(string(ButtonName), "XboxTypeS") >= 0) || InStr(string(ButtonName), "Gamepad") >= 0)
    {
        // End:0x12A
        if(int(InputEvent) == int(0))
        {
            // End:0x81
            if(ButtonName == 'XboxTypeS_B')
            {
                ASCancelMapping();
                MoveBackImpl();
            }
            // End:0xD7
            if(((ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'XboxTypeS_LeftShoulder')
            {
                ASTabLeft();                
            }
            else
            {
                // End:0x12A
                if(((ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'XboxTypeS_RightShoulder')
                {
                    ASTabRight();
                }
            }
        }
        return true;
    }
    // End:0x16C
    if(int(InputEvent) == int(0))
    {
        bRetval = CallHandleKeyboardInputFromGame(string(ButtonName), "keyDown");        
    }
    else
    {
        // End:0x1A7
        if(int(InputEvent) == int(1))
        {
            bRetval = CallHandleKeyboardInputFromGame(string(ButtonName), "keyUp");
        }
    }
    // End:0x1B6
    if(bRetval)
    {
        return true;
    }
    return super.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    //return ReturnValue;    
}

function SetMainMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    LPGFxMoviePlayerFrontEndManager(MoviePlayer).ShowBackground(bVisible);
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

function OnEscapeKeyPress()
{
    exitKeyboardControlScreen();
    //return;    
}

function SelectView()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string viewTabName[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LP, TransContext;

    LP = MoviePlayer.GetLP();
    TransContext = LP.GetTranslationContext();
    // End:0x1E5
    if(viewTabName == "onFoot")
    {
        SetNumCustomizationRows(OnFootCommands.Length);
        I = 0;
        J0x87:

        // End:0x1AA [Loop If]
        if(I < OnFootCommands.Length)
        {
            SetRowData(I, Class'GFxUI.GFxObject'.static.TranslateString(OnFootCommands[I].CommandName, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(OnFootCommands[I].PrimaryDisplay, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(OnFootCommands[I].SecondaryDisplay, TransContext));
            I++;
            // [Loop Continue]
            goto J0x87;
        }
        // End:0x1E2
        if(ControlModeLabel != none)
        {
            ControlModeLabel.SetText(OnFootControlModeText);
        }        
    }
    else
    {
        // End:0x37C
        if(viewTabName == "utilityRig")
        {
            SetNumCustomizationRows(UtilityRigCommands.Length);
            I = 0;
            J0x21E:

            // End:0x341 [Loop If]
            if(I < UtilityRigCommands.Length)
            {
                SetRowData(I, Class'GFxUI.GFxObject'.static.TranslateString(UtilityRigCommands[I].CommandName, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(UtilityRigCommands[I].PrimaryDisplay, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(UtilityRigCommands[I].SecondaryDisplay, TransContext));
                I++;
                // [Loop Continue]
                goto J0x21E;
            }
            // End:0x379
            if(ControlModeLabel != none)
            {
                ControlModeLabel.SetText(UtilityRigControlModeText);
            }            
        }
        else
        {
            // End:0x50F
            if(viewTabName == "vitalSuit")
            {
                SetNumCustomizationRows(VitalSuitCommands.Length);
                I = 0;
                J0x3B4:

                // End:0x4D7 [Loop If]
                if(I < VitalSuitCommands.Length)
                {
                    SetRowData(I, Class'GFxUI.GFxObject'.static.TranslateString(VitalSuitCommands[I].CommandName, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(VitalSuitCommands[I].PrimaryDisplay, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(VitalSuitCommands[I].SecondaryDisplay, TransContext));
                    I++;
                    // [Loop Continue]
                    goto J0x3B4;
                }
                // End:0x50F
                if(ControlModeLabel != none)
                {
                    ControlModeLabel.SetText(VitalSuitControlModeText);
                }
            }
        }
    }
    CurrentPageName = viewTabName;
    //return;    
}

function UserSwitchedPages()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string page[8388609];

    SelectView(page);
    //return;    
}

function FindCommandBoundToKey()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Key[8388609];
    local /*0x97E50000-0x00000000*/ private int BoundCommand[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x1A
    if(BoundCommand < 0)
    {
        BoundCommand = 0;
    }
    // End:0x11B
    if(CurrentPageName == "onFoot")
    {
        I = BoundCommand;
        J0x43:

        // End:0x118 [Loop If]
        if(I < OnFootCommands.Length)
        {
            // End:0x10A
            if((OnFootCommands[I].Primary == Key) || OnFootCommands[I].Secondary == Key)
            {
                BoundCommand = I;
                return OnFootCommands[I].Secondary == Key;
            }
            I++;
            // [Loop Continue]
            goto J0x43;
        }        
    }
    else
    {
        // End:0x220
        if(CurrentPageName == "utilityRig")
        {
            I = BoundCommand;
            J0x148:

            // End:0x21D [Loop If]
            if(I < UtilityRigCommands.Length)
            {
                // End:0x20F
                if((UtilityRigCommands[I].Primary == Key) || UtilityRigCommands[I].Secondary == Key)
                {
                    BoundCommand = I;
                    return UtilityRigCommands[I].Secondary == Key;
                }
                I++;
                // [Loop Continue]
                goto J0x148;
            }            
        }
        else
        {
            // End:0x321
            if(CurrentPageName == "vitalSuit")
            {
                I = BoundCommand;
                J0x24C:

                // End:0x321 [Loop If]
                if(I < VitalSuitCommands.Length)
                {
                    // End:0x313
                    if((VitalSuitCommands[I].Primary == Key) || VitalSuitCommands[I].Secondary == Key)
                    {
                        BoundCommand = I;
                        return VitalSuitCommands[I].Secondary == Key;
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x24C;
                }
            }
        }
    }
    BoundCommand = -1;
    return false;
    //return ReturnValue;    
}

function requestBindingChangeForKeyName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RowIndexStr[8388609], rowName, Column, KeyName;
    local /*0x97E50000-0x00000000*/ private int rowIndex, BoundCommand;
    local /*0x97E50000-0x00000000*/ private editfixedsize string alreadyMappedCommandName;
    local /*0x97E50000-0x00000000*/ private @NULL PInput;

    rowIndex = int(RowIndexStr);
    BoundCommand = -1;
    alreadyMappedCommandName = "";
    FindCommandBoundToKey(KeyName, BoundCommand);
    // End:0xAF
    if(BoundCommand < 0)
    {
        BindCommand(rowIndex, Column == SecondaryText, KeyName);
        ActionScriptVoid("validateBindingChange");        
    }
    else
    {
        PInput = LPPlayerInput(Outer.GetPC().PlayerInput);
        // End:0x224
        if(CurrentPageName == "onFoot")
        {
            // End:0x198
            if(PInput.OnFootCommands[rowIndex].Primary == KeyName)
            {
                BindCommand(rowIndex, false, KeyName);
                ActionScriptVoid("validateBindingChange");
                return;                
            }
            else
            {
                // End:0x221
                if(PInput.OnFootCommands[rowIndex].Secondary == KeyName)
                {
                    BindCommand(rowIndex, true, KeyName);
                    ActionScriptVoid("validateBindingChange");
                    return;
                }
            }            
        }
        else
        {
            // End:0x356
            if(CurrentPageName == "utilityRig")
            {
                // End:0x2CA
                if(PInput.UtilityRigCommands[rowIndex].Primary == KeyName)
                {
                    BindCommand(rowIndex, false, KeyName);
                    ActionScriptVoid("validateBindingChange");
                    return;                    
                }
                else
                {
                    // End:0x353
                    if(PInput.UtilityRigCommands[rowIndex].Secondary == KeyName)
                    {
                        BindCommand(rowIndex, true, KeyName);
                        ActionScriptVoid("validateBindingChange");
                        return;
                    }
                }                
            }
            else
            {
                // End:0x484
                if(CurrentPageName == "vitalSuit")
                {
                    // End:0x3FB
                    if(PInput.VitalSuitCommands[rowIndex].Primary == KeyName)
                    {
                        BindCommand(rowIndex, false, KeyName);
                        ActionScriptVoid("validateBindingChange");
                        return;                        
                    }
                    else
                    {
                        // End:0x484
                        if(PInput.VitalSuitCommands[rowIndex].Secondary == KeyName)
                        {
                            BindCommand(rowIndex, true, KeyName);
                            ActionScriptVoid("validateBindingChange");
                            return;
                        }
                    }
                }
            }
        }
        J0x484:

        // End:0x695 [Loop If]
        if(BoundCommand >= 0)
        {
            // End:0x52F
            if(CurrentPageName == "onFoot")
            {
                // End:0x4EC
                if(alreadyMappedCommandName == "")
                {
                    alreadyMappedCommandName = OnFootCommands[BoundCommand].CommandName;                    
                }
                else
                {                    
                    alreadyMappedCommandName $= ("," $ OnFootCommands[BoundCommand].CommandName);
                }                
            }
            else
            {
                // End:0x5CF
                if(CurrentPageName == "utilityRig")
                {
                    // End:0x58C
                    if(alreadyMappedCommandName == "")
                    {
                        alreadyMappedCommandName = UtilityRigCommands[BoundCommand].CommandName;                        
                    }
                    else
                    {                        
                        alreadyMappedCommandName $= ("," $ UtilityRigCommands[BoundCommand].CommandName);
                    }                    
                }
                else
                {
                    // End:0x66B
                    if(CurrentPageName == "vitalSuit")
                    {
                        // End:0x62B
                        if(alreadyMappedCommandName == "")
                        {
                            alreadyMappedCommandName = VitalSuitCommands[BoundCommand].CommandName;                            
                        }
                        else
                        {                            
                            alreadyMappedCommandName $= ("," $ VitalSuitCommands[BoundCommand].CommandName);
                        }
                    }
                }
            }
            BoundCommand++;
            FindCommandBoundToKey(KeyName, BoundCommand);
            // [Loop Continue]
            goto J0x484;
        }
        InvalidateBindingChange(KeyAlreadyMappedText, alreadyMappedCommandName);
    }
    //return;    
}

function forceBindingChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string strRowIndex[8388609], Column, Key;
    local /*0x97E50000-0x00000000*/ private int BoundCommand;
    local /*0x97E50000-0x00000000*/ private bool Secondary;

    Secondary = FindCommandBoundToKey(Key, BoundCommand);
    BindCommand(BoundCommand, Secondary, "");
    BindCommand(int(strRowIndex), Column == SecondaryText, Key);
    //return;    
}

function BindCommand()
{
    local /*0x97E50000-0x00000000*/ private int Row[8388609];
    local /*0x97E50000-0x00000000*/ private bool Secondary[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Key[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, Command, PInput, TransContext;

    LP = MoviePlayer.GetLP();
    PInput = LPPlayerInput(Outer.GetPC().PlayerInput);
    TransContext = LP.GetTranslationContext();
    // End:0x219
    if(CurrentPageName == "onFoot")
    {
        // End:0x15C
        if(Secondary)
        {
            PInput.RemoveBoundCommandForKey(OnFootCommands[Row].GameCommand, name(OnFootCommands[Row].Secondary));
            OnFootCommands[Row].Secondary = Key;            
        }
        else
        {
            PInput.RemoveBoundCommandForKey(OnFootCommands[Row].GameCommand, name(OnFootCommands[Row].Primary));
            OnFootCommands[Row].Primary = Key;
        }
        Command = OnFootCommands[Row];        
    }
    else
    {
        // End:0x39D
        if(CurrentPageName == "utilityRig")
        {
            // End:0x2E0
            if(Secondary)
            {
                PInput.RemoveBoundCommandForKey(UtilityRigCommands[Row].GameCommand, name(UtilityRigCommands[Row].Secondary));
                UtilityRigCommands[Row].Secondary = Key;                
            }
            else
            {
                PInput.RemoveBoundCommandForKey(UtilityRigCommands[Row].GameCommand, name(UtilityRigCommands[Row].Primary));
                UtilityRigCommands[Row].Primary = Key;
            }
            Command = UtilityRigCommands[Row];            
        }
        else
        {
            // End:0x51D
            if(CurrentPageName == "vitalSuit")
            {
                // End:0x463
                if(Secondary)
                {
                    PInput.RemoveBoundCommandForKey(VitalSuitCommands[Row].GameCommand, name(VitalSuitCommands[Row].Primary));
                    VitalSuitCommands[Row].Secondary = Key;                    
                }
                else
                {
                    PInput.RemoveBoundCommandForKey(VitalSuitCommands[Row].GameCommand, name(VitalSuitCommands[Row].Primary));
                    VitalSuitCommands[Row].Primary = Key;
                }
                Command = VitalSuitCommands[Row];
            }
        }
    }
    // End:0x587
    if(Secondary)
    {
        Command.SecondaryDisplay = PInput.GetDisplayStringForKey(name(Command.Secondary));        
    }
    else
    {
        Command.PrimaryDisplay = PInput.GetDisplayStringForKey(name(Command.Primary));
    }
    SetRowData(Row, Class'GFxUI.GFxObject'.static.TranslateString(Command.CommandName, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(Command.PrimaryDisplay, TransContext), Class'GFxUI.GFxObject'.static.TranslateString(Command.SecondaryDisplay, TransContext));
    //return;    
}

function SetupDefaultsConfirmDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog[8388609];

    // End:0x23E
    if(ConfirmDialog != none)
    {
        ConfirmDialog.SetDefaultFocusedButton(0);
        ConfirmDialog.EnableDialogBackground(true);
        ConfirmDialog.SetNumberOfOptions(2);
        ConfirmDialog.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsKeyboardConfig.ConfirmResetTitle>");
        ConfirmDialog.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsKeyboardConfig.ConfirmResetInfo>");
        ConfirmDialog.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialog.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialog.SetButtonOnPress(0, ConfirmDialog_SelectBack);
        ConfirmDialog.SetButtonOnPress(1, ConfirmDialog_SelectOK);
    }
    //return;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    bHandled = super.NotifyViewLoaded(View);
    // End:0x106
    if(bHandled == false)
    {
        // End:0x106
        if((MenuViewLoader.PendingViewLoad.ViewName == 'InfoDialog') && View.ViewName == 'InfoDialog')
        {
            ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
            // End:0xFA
            if(ConfirmDialog != none)
            {
                SetupDefaultsConfirmDialog(ConfirmDialog);
            }
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function resetKeyboardControlsToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x5F
    if(ConfirmDialog != none)
    {
        SetupDefaultsConfirmDialog(ConfirmDialog);
    }
    //return;    
}

function ConfirmDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    CopyInputCommands(true);
    SelectView(CurrentPageName);
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    ActionScriptVoid("defaultsClickedResponse");
    //return;    
}

function ConfirmDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    ActionScriptVoid("defaultsClickedResponse");
    //return;    
}

function ASTabLeft()
{
    ActionScriptVoid("tabLeft");
    //return;    
}

function ASTabRight()
{
    ActionScriptVoid("tabRight");
    //return;    
}

function ASCancelMapping()
{
    ActionScriptVoid("cancelMapping");
    //return;    
}

function ASOTMV()
{
    ActionScriptVoid("OnTopMostView");
    //return;    
}

function CopyInputCommands()
{
    local /*0x97E50000-0x00000000*/ private bool Reset[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PInput, Command;

    PInput = LPPlayerInput(Outer.GetPC().PlayerInput);
    // End:0x3D3
    if(Reset)
    {
        I = 0;
        J0x5F:

        // End:0x174 [Loop If]
        if(I < PInput.OnFootCommands.Length)
        {
            PInput.RemoveBoundCommandForKey(OnFootCommands[I].GameCommand, name(OnFootCommands[I].Primary));
            PInput.RemoveBoundCommandForKey(OnFootCommands[I].GameCommand, name(OnFootCommands[I].Secondary));
            I++;
            // [Loop Continue]
            goto J0x5F;
        }
        I = 0;
        J0x17F:

        // End:0x294 [Loop If]
        if(I < PInput.UtilityRigCommands.Length)
        {
            PInput.RemoveBoundCommandForKey(UtilityRigCommands[I].GameCommand, name(UtilityRigCommands[I].Primary));
            PInput.RemoveBoundCommandForKey(UtilityRigCommands[I].GameCommand, name(UtilityRigCommands[I].Secondary));
            I++;
            // [Loop Continue]
            goto J0x17F;
        }
        I = 0;
        J0x29F:

        // End:0x3B4 [Loop If]
        if(I < PInput.VitalSuitCommands.Length)
        {
            PInput.RemoveBoundCommandForKey(VitalSuitCommands[I].GameCommand, name(VitalSuitCommands[I].Primary));
            PInput.RemoveBoundCommandForKey(VitalSuitCommands[I].GameCommand, name(VitalSuitCommands[I].Secondary));
            I++;
            // [Loop Continue]
            goto J0x29F;
        }
        PInput.SetDefaultCommandMappings();
    }
    OnFootCommands.Remove(0, OnFootCommands.Length);    
    I = 0;
    J0x3F4:

    // End:0x55D [Loop If]
    if(I < PInput.OnFootCommands.Length)
    {
        Command = PInput.GetCurrentCommand(PInput.OnFootCommands[I].CommandName);
        Command.PrimaryDisplay = PInput.GetDisplayStringForKey(name(Command.Primary));
        Command.SecondaryDisplay = PInput.GetDisplayStringForKey(name(Command.Secondary));
        OnFootCommands.AddItem(Command);        
        I++;
        // [Loop Continue]
        goto J0x3F4;
    }
    UtilityRigCommands.Remove(0, OnFootCommands.Length);    
    I = 0;
    J0x57E:

    // End:0x6E7 [Loop If]
    if(I < PInput.UtilityRigCommands.Length)
    {
        Command = PInput.GetCurrentCommand(PInput.UtilityRigCommands[I].CommandName);
        Command.PrimaryDisplay = PInput.GetDisplayStringForKey(name(Command.Primary));
        Command.SecondaryDisplay = PInput.GetDisplayStringForKey(name(Command.Secondary));
        UtilityRigCommands.AddItem(Command);        
        I++;
        // [Loop Continue]
        goto J0x57E;
    }
    VitalSuitCommands.Remove(0, OnFootCommands.Length);    
    I = 0;
    J0x708:

    // End:0x871 [Loop If]
    if(I < PInput.VitalSuitCommands.Length)
    {
        Command = PInput.GetCurrentCommand(PInput.VitalSuitCommands[I].CommandName);
        Command.PrimaryDisplay = PInput.GetDisplayStringForKey(name(Command.Primary));
        Command.SecondaryDisplay = PInput.GetDisplayStringForKey(name(Command.Secondary));
        VitalSuitCommands.AddItem(Command);        
        I++;
        // [Loop Continue]
        goto J0x708;
    }
    //return;    
}

function exitKeyboardControlScreen()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PInput;

    PInput = LPPlayerInput(Outer.GetPC().PlayerInput);
    PInput.CurrentCommands.Remove(0, PInput.CurrentCommands.Length);    
    I = 0;
    J0x92:

    // End:0xED [Loop If]
    if(I < OnFootCommands.Length)
    {
        PInput.CurrentCommands.AddItem(OnFootCommands[I]);        
        I++;
        // [Loop Continue]
        goto J0x92;
    }
    I = 0;
    J0xF8:

    // End:0x153 [Loop If]
    if(I < UtilityRigCommands.Length)
    {
        PInput.CurrentCommands.AddItem(UtilityRigCommands[I]);        
        I++;
        // [Loop Continue]
        goto J0xF8;
    }
    I = 0;
    J0x15E:

    // End:0x1B9 [Loop If]
    if(I < VitalSuitCommands.Length)
    {
        PInput.CurrentCommands.AddItem(VitalSuitCommands[I]);        
        I++;
        // [Loop Continue]
        goto J0x15E;
    }
    PInput.ApplyControlMapping();
    PInput.SaveCommandMappings();
    ActionScriptVoid("defaultsClickedResponse");
    MoveBackImpl();
    //return;    
}

function SetupStrings()
{
    SetPopupHeaderText(PopupHeaderText);
    SetCurrentButtonHeaderText(CurrentButtonHeaderText);
    SetActionText(ActionText);
    SetPrimaryText(PrimaryText);
    SetSecondaryText(SecondaryText);
    SetKeyAlreadyMappedText(KeyAlreadyMappedText);
    SetConfirmOverrideText(ConfirmOverrideText);
    SetDefaultsText(DefaultsText);
    SetBackText(BackText);
    SetPressAnyKeyToContinueText(PressAnyKeyText);
    //return;    
}

function InvalidateBindingChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[8388609], advice;
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    LP = MoviePlayer.GetLP();
    CallInvalidateBindingChange(Class'GFxUI.GFxObject'.static.TranslateString(Reason, LP.GetTranslationContext()), Class'GFxUI.GFxObject'.static.TranslateString(advice, LP.GetTranslationContext()));
    //return;    
}

function CallHandleKeyboardInputFromGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ButtonName[8388609], KeyEvent;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Retval;

    Retval = ASHandleKeyboardInputFromGame(ButtonName, KeyEvent);
    // End:0x39
    if(Retval > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ASHandleKeyboardInputFromGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ButtonName[8388609], KeyEvent;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ActionScriptFloat("handleKeyboardInputFromGame");
    //return ReturnValue;    
}

function CallInvalidateBindingChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[8388609], advice;

    ActionScriptVoid("invalidateBindingChange");
    //return;    
}

function CallAlreadyMapped()
{
    local /*0x97E50000-0x00000000*/ private int rowIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Column[8388609];

    ActionScriptVoid("alreadyMapped");
    //return;    
}

function SetNumCustomizationRows()
{
    local /*0x97E50000-0x00000000*/ private int NumRows[8388609];

    ActionScriptVoid("setNumCustomizationRows");
    //return;    
}

function SetRowData()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string rowName[8388609], Primary, Secondary;

    ActionScriptVoid("setRowData");
    //return;    
}

function SetPopupHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setPopupHeaderText");
    //return;    
}

function SetCurrentButtonHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setCurrentButtonHeaderText");
    //return;    
}

function SetActionText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setActionText");
    //return;    
}

function SetPrimaryText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setPrimaryText");
    //return;    
}

function SetSecondaryText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setSecondaryText");
    //return;    
}

function SetKeyAlreadyMappedText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setKeyAlreadyMappedText");
    //return;    
}

function SetConfirmOverrideText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setConfirmOverrideText");
    //return;    
}

function SetDefaultsText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setDefaultsText");
    //return;    
}

function SetBackText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setBackText");
    //return;    
}

function SetPressAnyKeyToContinueText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setPressAnyKeyToContinueText");
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
        // End:0x61
        case 'DefaultsLabel':
            Widget.SetText(GetLocalizedString(DefaultsText));
            // End:0x17F
            break;
        // End:0xA3
        case 'BackLabel':
            Widget.SetText(GetLocalizedString(BackText));
            // End:0x17F
            break;
        // End:0xC5
        case 'ControlModeLabel':
            ControlModeLabel = Widget;
            // End:0x17F
            break;
        // End:0xFD
        case 'ActionLabel':
            Widget.SetText(ActionText);
            // End:0x17F
            break;
        // End:0x135
        case 'PrimaryLabel':
            Widget.SetText(PrimaryText);
            // End:0x17F
            break;
        // End:0x16D
        case 'AlternateLabel':
            Widget.SetText(SecondaryText);
            // End:0x17F
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x17F
            break;
            break;
    }
    // End:0x1BE
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function setShiftKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setShiftKeyText");
    //return;    
}

function setControlKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setControlKeyText");
    //return;    
}

function setAltKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setAltKeyText");
    //return;    
}

function setPauseKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setPauseKeyText");
    //return;    
}

function setCapsLockKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setCapsLockKeyText");
    //return;    
}

function setPageUpKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setPageUpKeyText");
    //return;    
}

function setPageDownKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setPageDownKeyText");
    //return;    
}

function setEndKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setEndKeyText");
    //return;    
}

function setHomeKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setHomeKeyText");
    //return;    
}

function setLeftArrowKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setLeftArrowKeyText");
    //return;    
}

function setUpArrowKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setUpArrowKeyText");
    //return;    
}

function setRightArrowKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setRightArrowKeyText");
    //return;    
}

function setDownArrowKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setDownArrowKeyText");
    //return;    
}

function setInsertKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setInsertKeyText");
    //return;    
}

function setDeleteKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setDeleteKeyText");
    //return;    
}

function setF1KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF1KeyText");
    //return;    
}

function setF2KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF2KeyText");
    //return;    
}

function setF3KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF3KeyText");
    //return;    
}

function setF4KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF4KeyText");
    //return;    
}

function setF5KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF5KeyText");
    //return;    
}

function setF6KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF6KeyText");
    //return;    
}

function setF7KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF7KeyText");
    //return;    
}

function setF8KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF8KeyText");
    //return;    
}

function setF9KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF9KeyText");
    //return;    
}

function setF10KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF10KeyText");
    //return;    
}

function setF11KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF11KeyText");
    //return;    
}

function setF12KeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setF12KeyText");
    //return;    
}

function setNumLockKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setNumLockKeyText");
    //return;    
}

function setScrollLockKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setScrollLockKeyText");
    //return;    
}

function setEnterKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setEnterKeyText");
    //return;    
}

function setTabKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setTabKeyText");
    //return;    
}

function setBackSpaceKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setBackSpaceKeyText");
    //return;    
}

function setSpaceBarKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setSpaceBarKeyText");
    //return;    
}

function setKeyPad0Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad0Text");
    //return;    
}

function setKeyPad1Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad1Text");
    //return;    
}

function setKeyPad2Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad2Text");
    //return;    
}

function setKeyPad3Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad3Text");
    //return;    
}

function setKeyPad4Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad4Text");
    //return;    
}

function setKeyPad5Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad5Text");
    //return;    
}

function setKeyPad6Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad6Text");
    //return;    
}

function setKeyPad7Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad7Text");
    //return;    
}

function setKeyPad8Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad8Text");
    //return;    
}

function setKeyPad9Text()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    Text = FixUpKeyText(Text);
    ActionScriptVoid("setkeyPad9Text");
    //return;    
}

function FixUpKeyText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609], ReturnValue, newText;

    newText = MoviePlayer.GetLocalizedString(Text);
    newText = Repl(newText, "(", "");
    newText = Repl(newText, ")", "");
    return newText;
    //return ReturnValue;    
}

defaultproperties
{
    PopupHeaderText="Press desired key to change:"
    CurrentButtonHeaderText="Currently mapped to:"
    ActionText="Action"
    PrimaryText="Primary"
    SecondaryText="Secondary"
    KeyAlreadyMappedText="This key is already mapped to:"
    ConfirmOverrideText="Enter: Replace   Escape: Cancel"
    DefaultsText="Defaults"
    BackText="(Escape) Back"
    OnFootControlModeText="ON FOOT"
    UtilityRigControlModeText="UTILITY RIG"
    VitalSuitControlModeText="VITAL SUIT"
    PressAnyKeyText="Press any key to continue."
}