class LPGFxFrontEnd_OptionsImport extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GSProfiles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GSCurrentProfile;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0xB1
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
        LPFrontEndMoviePlayer.SetOptionDefaultButton(false);
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

function SetupSettingsObject()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Option[8388609], ReturnValue, TempObj, RendererDataProvider;
    local /*0x97E50000-0x00000000*/ private int DefaultIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x54B
    if(Option.OptionName == "ImportProfile")
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", Option.FriendlyName);
        TempObj.SetString("control", Option.OptionType);
        RendererDataProvider = Outer.CreateArray();
        DefaultIndex = 0;
        OnlineSub = OnlineSubsystemSteamworks(Class'Engine.GameEngine'.static.GetOnlineSubsystem());
        OnlineSub.GetGameSpyProfiles(GSProfiles);
        I = 0;
        J0x184:

        // End:0x1F8 [Loop If]
        if(I < GSProfiles.Length)
        {
            RendererDataProvider.SetElementString(I, GSProfiles[I].FriendlyName);
            ++I;
            // [Loop Continue]
            goto J0x184;
        }
        // End:0x213
        if(GSProfiles.Length > 0)
        {
            GSCurrentProfile = 0;
        }
        TempObj.SetObject("dataProvider", RendererDataProvider);
        TempObj.SetFloat("optIndex", float(DefaultIndex));
        TempObj.SetFloat("prevOptIndex", float(DefaultIndex));
        TempObj.SetFloat("minimum", Option.RawValueMin);
        TempObj.SetFloat("maximum", Option.RawValueMax);
        TempObj.SetFloat("value", 0.0000000);
        TempObj.SetFloat("prevValue", 0.0000000);
        TempObj.SetFloat("snapInterval", Option.SliderSnapInterval);
        TempObj.SetBool("bUpdateFromUnreal", true);
        TempObj.SetBool("bNumericCombo", Option.bNumericCombo);
        TempObj.SetBool("bEditableCombo", Option.bEditableCombo);
        TempObj.SetFloat("editBoxMaxLength", float(Option.EditBoxMaxLength));
        TempObj.SetBool("isDisabled", Option.bDisabled);
        return TempObj;
    }
    return super(SPGFxUIViewSettingsMenuBase).SetupSettingsObject(Option);
    //return ReturnValue;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    GSCurrentProfile = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[GSCurrentProfile].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'ApplyImport':
            ConfirmApplyImport();
            // End:0xBB
            break;
        // End:0xFFFF
        default:
            // End:0xBB
            break;
            break;
    }
    //return;    
}

function SetUpConfirmDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog[8388609];

    ConfirmDialog.SetDefaultFocusedButton(0);
    ConfirmDialog.EnableDialogBackground(true);
    ConfirmDialog.SetNumberOfOptions(2);
    ConfirmDialog.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.ConfirmTitle>");
    ConfirmDialog.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_OptionsVideoPC.ConfirmInfo>");
    ConfirmDialog.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    ConfirmDialog.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    ConfirmDialog.SetButtonOnPress(0, ConfirmDialog_SelectBack);
    ConfirmDialog.SetButtonOnPress(1, ConfirmDialog_SelectOK);
    //return;    
}

function ConfirmDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    DoProfileImport();
    //return;    
}

function ConfirmDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    CancelSettingsChange();
    //return;    
}

function CancelSettingsChange()
{
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function ConfirmApplyImport()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialog;

    ConfirmDialog = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x5F
    if(ConfirmDialog != none)
    {
        SetUpConfirmDialog(ConfirmDialog);
    }
    //return;    
}

function DoProfileImport()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, ProfileEntry, Profile;

    // End:0x11
    if(GSCurrentProfile < 0)
    {
        return;
    }
    ProfileEntry = GSProfiles[GSCurrentProfile];
    OnlineSub = OnlineSubsystemSteamworks(Class'Engine.GameEngine'.static.GetOnlineSubsystem());
    Profile = LPProfileSettings(OnlineSub.PlayerInterface.GetProfileSettings(0));
    OnlineSub.ImportGameSpyProfile(ProfileEntry.FullPath, Profile);
    //return;    
}

defaultproperties
{
    GSCurrentProfile=-1
}