class LPGFxFrontEnd_CinematicGallery extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClosing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumMoviesVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

function ErrorResponseDialog()
{
    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x20E
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_CinematicGallery.NoMoviesTitle>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_CinematicGallery.NoMoviesBody>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_CinematicGallery.NoMoviesBack>");
        ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OK);
    }
    //return;    
}

function cbErrorResponseDialog_OK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    ConfirmMC.Select_Back(ev);
    //return;    
}

function OnViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private byte I;

    super.OnViewLoaded();
    I = 0;
    J0x16:

    // End:0x9D [Loop If]
    if(int(I) < SettingsList.Length)
    {
        // End:0x8F
        if(SettingsList[int(I)].OptionType == "movie")
        {
            SettingsList[int(I)].bHidden = true;
        }
        I++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL mySetting, SPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Splits;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName;

    // End:0x0F
    if(bClosing)
    {
        return;
    }
    SPPC = SPPlayerController(Outer.GetPC());
    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SPPC.GetCurrentMovie(MovieName);
    // End:0x1D9
    if(Len(MovieName) == 0)
    {
        SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
        // End:0xEA
        if(!GetVisibleSettingsOptionByIndex(SelectedIndex, mySetting))
        {
            return;
        }
        Splits = SplitString(mySetting.OptionName, ".");
        // End:0x131
        if(Splits.Length != 2)
        {
            return;
        }
        MovieName = Splits[1];
        // End:0x1D9
        if(mySetting.OptionType == "movie")
        {
            SPPC.ClientPlayMovie(MovieName,,, false,, false, false, false);
            Class'SPEngine.SPSeqAct_SetMovieSkippable'.static.SetMovieSkippable(MovieName, true);
            UpdateListDataProvider(SelectedIndex);
        }
    }
    //return;    
}

function Select_BackImpl()
{
    bClosing = true;
    bOpen = false;
    Outer.GetPC().ClearTimer('UpdateDescription', self);
    LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("default");
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
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
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x31
            break;
            break;
    }
    // End:0x70
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    bClosing = false;
    bOpen = true;
    NumMoviesVisible = 0;
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MoviePlayer.SetExternalInterface(self);
    LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("saveLoad");
    // End:0xD1
    if(previousView == 'InfoDialog')
    {
        OnEscapeKeyPress();
    }
    //return;    
}

function PostPushFromPreviousScreen()
{
    local /*0x97E50000-0x00000000*/ private bool bTriggerOnPreviousScreenIsPressed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private int iIndex, iMovie, iVisible;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList, Splits;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName;

    LPC = LPPlayerController(Outer.GetPC());
    // End:0x2EB
    if(LPC != none)
    {
        mySettingsList = GetSettingsList();
        // End:0x157
        if(bTriggerOnPreviousScreenIsPressed)
        {
            iIndex = 0;
            J0x6D:

            // End:0x157 [Loop If]
            if(iIndex < mySettingsList.Length)
            {
                // End:0xBA
                if(mySettingsList[iIndex].OptionType != "movie")
                {                    
                }
                else
                {
                    Splits = SplitString(mySettingsList[iIndex].OptionName, ".");
                    // End:0x10C
                    if(Splits.Length != 2)
                    {                        
                    }
                    else
                    {
                        MovieName = Splits[1];
                        LPC.UnlockMovie(MovieName);
                    }
                }
                ++iIndex;
                // [Loop Continue]
                goto J0x6D;
            }
        }
        iMovie = 0;
        iVisible = 0;
        iIndex = 0;
        J0x178:

        // End:0x2E0 [Loop If]
        if(iIndex < mySettingsList.Length)
        {
            // End:0x1C5
            if(mySettingsList[iIndex].OptionType != "movie")
            {                
            }
            else
            {
                Splits = SplitString(mySettingsList[iIndex].OptionName, ".");
                // End:0x217
                if(Splits.Length != 2)
                {                    
                }
                else
                {
                    MovieName = Splits[1];
                    // End:0x296
                    if(LPC.IsMovieUnlocked(MovieName))
                    {
                        HideOptionItemByName(mySettingsList[iIndex].OptionName, false);
                        ++iVisible;                        
                    }
                    else
                    {
                        HideOptionItemByName(mySettingsList[iIndex].OptionName, true);
                    }
                    ++iMovie;
                }
            }
            ++iIndex;
            // [Loop Continue]
            goto J0x178;
        }
        UpdateListDataProvider();
    }
    NumMoviesVisible = iVisible;
    // End:0x31A
    if(NumMoviesVisible == 0)
    {
        ErrorResponseDialog();        
    }
    else
    {
        UpdateDescription();
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName;

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    SPPC = SPPlayerController(Outer.GetPC());
    SPPC.GetCurrentMovie(MovieName);
    // End:0x9A
    if(Len(MovieName) == 0)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

static function GetMovieCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array MovieList;
    local /*0x97E50000-0x00000000*/ private int I, iCount;

    MovieList = Class'LPGFxFrontEnd_CinematicGallery'.default.SettingsList;
    iCount = 0;
    I = 0;
    J0x3E:

    // End:0xA1 [Loop If]
    if(I < MovieList.Length)
    {
        // End:0x93
        if(MovieList[I].OptionType ~= "movie")
        {
            ++iCount;
        }
        ++I;
        // [Loop Continue]
        goto J0x3E;
    }
    return iCount;
    //return ReturnValue;    
}

static function IsMovieUnlockable()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InMovieName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array MovieList;
    local /*0x97E50000-0x00000000*/ private int I;

    MovieList = Class'LPGFxFrontEnd_CinematicGallery'.default.SettingsList;
    I = 0;
    J0x33:

    // End:0xC7 [Loop If]
    if(I < MovieList.Length)
    {
        // End:0xB9
        if(MovieList[I].OptionType ~= "movie")
        {
            // End:0xB9
            if(InStr(MovieList[I].OptionName, InMovieName, false, true) >= 0)
            {
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x33;
    }
    return false;
    //return ReturnValue;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private @NULL ImageLoader;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImageName;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL mySetting, ManagerDescriptionMC;

    // End:0x31
    if((!bOpen || bClosing) || NumMoviesVisible == 0)
    {
        return;
    }
    SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    // End:0x8E
    if(!GetVisibleSettingsOptionByIndex(SelectedIndex, mySetting))
    {
        return;
    }
    // End:0xE9
    if(mySetting.OptionType == "movie")
    {
        ImageName = "img://" $ mySetting.OptionName;        
    }
    else
    {
        ImageName = "";
    }
    ImageLoader = Outer.GetVariableObject("_root.displaySecondary.displayContent.saveLoadImage");
    ImageLoader.SetBool("maintainAspectRatio", true);
    // End:0x1CD
    if(ImageName != "")
    {
        ImageLoader.SetString("source", ImageName);        
    }
    else
    {
        ImageLoader.ActionScriptVoid("unload");
    }
    ManagerDescriptionMC = LPFrontEndMoviePlayer.Description;
    // End:0x267
    if(ManagerDescriptionMC != none)
    {
        ManagerDescriptionMC.SetText(mySetting.Description);
    }
    //return;    
}

function SaveImageInit()
{
    Outer.GetPC().SetTimer(0.5000000, false, 'UpdateDescription', self);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.CinematicGallery>"
    SettingsList=/* Array type was not detected. */
}