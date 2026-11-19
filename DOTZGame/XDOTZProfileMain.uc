/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZProfileMain extends XDOTZProfileBase;




//Page components

var Automated GuiButton  ChangeProfileButton;
//var Automated GuiButton  EditProfileButton;
var Automated GuiButton  DeleteProfileButton;
var Automated GuiButton  NewProfileButton;

//configurable stuff

var string ChangeProfileMenu;
//var string EditProfileMenu;
var string EditSettingsMenu;         // Profile menu location
var string DeleteProfileMenu;
var string NewProfileMenu;

var string ProfileNeedOneMenu;
var string ProfileErrorMenu;

//configurable stuff
var localized string DefaultProfileName;
var localized string PageCaption;

var sound ClickSound;

// Profiles
//var Profiler profiles;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    //profiles = new(self) class'Profiler';

    SetPageCaption (PageCaption);
    AddBackButton ();
    AddSelectButton ();

    if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() <= 0) {
        Controller.OpenMenu (ProfileNeedOneMenu);
    }
}

/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    if ( DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() >= 8 ) {
        NewProfileButton.bVisible = false;
        NewProfileButton.bNeverFocus = true;
        MapControls();
    } else {
        NewProfileButton.bVisible = true;
        NewProfileButton.bNeverFocus = false;
        MapControls();
    }

    super.Opened(Sender);
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
    Super.Closed(Sender,bCancelled);
    Controller.MouseEmulation(false);
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;
    local int available_space;
    local int desired_space;
    local int used_space;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case ChangeProfileButton:
             return Controller.OpenMenu(ChangeProfileMenu);
             break;

        case NewProfileButton:
             class'UtilsXbox'.static.Refresh_Memory_Unit();
             used_space = class'UtilsXbox'.static.Get_All_Containers_Size(60);

             available_space = class'UtilsXbox'.static.Get_Total_Free_Blocks() + used_space;
             desired_space = 60 * (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() + 1);

             Log("Available space " $ available_space);
             Log("Desired space " $ desired_space);
             Log("Used space " $ desired_space);


             // Adjust used and desired space
             /*if (used_space > desired_space)
                used_space = desired_space;
             desired_space += 60;*/

             if (available_space < desired_space) {
                 return Controller.OpenMenu("DOTZMenu.XDOTZNeedBlocksProfileError", string(desired_space - available_space + 1), string(desired_space - used_space));
             } else {
                 return Controller.OpenMenu("DOTZMenu.XDOTZKeyboard");
             }

             return false;
             break;

        //case EditProfileButton:
        //     return Controller.OpenMenu(EditProfileMenu);
        //     break;

        case DeleteProfileButton:
             return Controller.OpenMenu(DeleteProfileMenu);
             break;
    };

   return false;
}


/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}


/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    if (!class'UtilsXbox'.static.Get_Save_Enable()) {
        Controller.CloseMenu(true);

    } else if (DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount() <= 0) {
        Controller.OpenMenu (ProfileNeedOneMenu);

    } else {
        if (!DOTZPlayerControllerBase(PlayerOwner()).IsLoadedProfileValid()) {
            //BBGuiController(Controller).SwitchMenu ("DOTZMenu.XDOTZProfileSelectForce");
            BBGuiController(Controller).OpenMenu ("DOTZMenu.XDOTZProfileNeedActiveProfile");
        } else {
            Controller.CloseMenu(true);
        }
    }
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZProfileMain.ChangeProfileButton_btn'
    begin object name=ChangeProfileButton_btn class=Class'GUI.GUIButton'
        Caption="Select Profile"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZProfileMain.ButtonClicked
    end object
    ChangeProfileButton=ChangeProfileButton_btn
    // Reference: GUIButton'XDOTZProfileMain.DeleteProfileButton_btn'
    begin object name=DeleteProfileButton_btn class=Class'GUI.GUIButton'
        Caption="Delete Profile"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=XDOTZProfileMain.ButtonClicked
    end object
    DeleteProfileButton=DeleteProfileButton_btn
    // Reference: GUIButton'XDOTZProfileMain.NewProfileButton_btn'
    begin object name=NewProfileButton_btn class=Class'GUI.GUIButton'
        Caption="New Profile"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZProfileMain.ButtonClicked
    end object
    NewProfileButton=NewProfileButton_btn
    ChangeProfileMenu="DOTZMenu.XDOTZProfileSelect"
    EditSettingsMenu="DOTZMenu.XDOTZProfileEditSettings"
    DeleteProfileMenu="DOTZMenu.XDOTZProfileDelete"
    NewProfileMenu="DOTZMenu.XDOTZProfileNew"
    ProfileNeedOneMenu="DOTZMenu.XDOTZProfileNeedOneProfile"
    ProfileErrorMenu="DOTZMenu.XDOTZProfileError"
    DefaultProfileName="New Profile"
    PageCaption="Profile"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZProfileMain.HandleKeyEvent
}