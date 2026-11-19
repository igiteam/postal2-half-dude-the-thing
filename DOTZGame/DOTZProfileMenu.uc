/**
 * DOTZProfileMenu - Profile Main Menu with tabs for Manager, Game, & Control Settings
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    March 2005
 */
class DOTZProfileMenu extends DOTZProfileBase;





var Automated BBListBox ProfileList;

var Automated GUILabel ListLabel;
var Automated GUILabel NameLabel;
var Automated GUILabel DiffLabel;
//var Automated GUILabel SubtitleLabel;

var Automated GUILabel NameValue;
var Automated BBComboBox DifficultyList;
//var Automated BBCheckBoxButton SubtitleCheck;

var Automated GUIButton NewProfileButton;
var Automated GUIButton LoadProfileButton;
var Automated GUIButton DeleteProfileButton;
var Automated GUIButton BackButton;

var string NewProfileMenu;
var String PageCaption;

var sound ClickSound;



/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   SetPageCaption( PageCaption );

   AddBackButton();

   DifficultyList.AddItem("Easy");
   DifficultyList.AddItem("Normal");
   DifficultyList.AddItem("Difficult");

   DifficultyList.OnChange = DifficultyChange;
   //SubtitleCheck.OnChange = SubtitlesChange;
}

/*****************************************************************
 * Refresh the accounts list
 *****************************************************************
 */
function Refresh_Profiles_List ()
{
    local int profile_count;
    local int current;
    local int p;
    local string tmp;

    current = 0;
    profile_count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();

    ProfileList.List.Clear();
    for (p = 0; p < profile_count; ++p)
    {
        // Need to toss out the .prof
        tmp = DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(p);
        //DOTZPlayerControllerBase(PlayerOwner()).ReplaceText(tmp, ".prof", "");
        ProfileList.List.Add(tmp);

        // Select the current profile
        if (tmp == DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName()) {
            current = p;
        }
    }

    Log("Setting selection to item " $ current);
    ProfileList.List.SetIndex(current);
    ProfileList.bHasFocus = true;
}

/*****************************************************************
 * Refresh the accounts list
 *****************************************************************
 */
function Refresh_Current_Profile ()
{
    NameValue.Caption = DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName();
    Log("Difficulty: " $ DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());

    DifficultyList.SetIndex(DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());
    //SubtitleCheck.bChecked = DOTZPlayerControllerBase(PlayerOwner()).GetUseSubtitles();
}

/*****************************************************************
 * Closed
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    Refresh_Profiles_List();
    Refresh_Current_Profile();
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
 event Closed( GUIComponent Sender, bool bCancelled ) {
   Super.Closed( Sender, bCancelled );
   Controller.MouseEmulation( false );
}

/*****************************************************************
 * ButtonClicked
 *****************************************************************
 */
function bool ButtonClicked( GUIComponent Sender )
{
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected)
    {
        //NEW PROFILE BUTTON
        case NewProfileButton:
            return Controller.OpenMenu( NewProfileMenu ); break;

        //LOAD PROFILE BUTTON
        case LoadProfileButton:
            LoadProfile();
            return true;

        //DELETE PROFILE BUTTON
        case DeleteProfileButton:
            DeleteProfile();
            return true;
    }

   return true;
}

/*****************************************************************
 * LoadProfile
 *****************************************************************
 */
function LoadProfile()
{
    local int list_index;

    // Load up the selected profile
    list_index = ProfileList.List.Index;
    if (list_index < 0 || list_index >= ProfileList.List.ItemCount)
        return;

    if(DOTZPlayerControllerBase(PlayerOwner()).LoadProfile(list_index))
        Refresh_Current_Profile ();
}

/*****************************************************************
 * DeleteProfile
 *****************************************************************
 */
function DeleteProfile()
{
    local int list_index;

    // Load up the selected profile
    list_index = ProfileList.List.Index;
    if (list_index < 0 || list_index >= ProfileList.List.ItemCount)
        return;

    if(DOTZPlayerControllerBase(PlayerOwner()).DeleteProfile(list_index)) {
        Refresh_Profiles_List();
        Refresh_Current_Profile();
    }
}


/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */
event NotifyLevelChange() {
   Controller.CloseMenu( true );
}

/*****************************************************************
 * Change settings
 *****************************************************************
 */

function DifficultyChange( GUIComponent Sender ) {
    Log("Difficulty changed: " $ DifficultyList.GetIndex());
    DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(DifficultyList.GetIndex());
}

/*function SubtitlesChange( GUIComponent Sender ) {
    DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(SubtitleCheck.bChecked);
}*/


//===========================================================================
// DefaultProperties
//===========================================================================






// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: BBListBox'DOTZProfileMenu.ProfileList_box'
    begin object name=ProfileList_box class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        StyleName="BBRoundButton"
        bNeverFocus=true
        WinTop=0.4600000
        WinLeft=0.3500000
        WinWidth=0.5000000
        WinHeight=0.4000000
    end object
    ProfileList=ProfileList_box
    // Reference: GUILabel'DOTZProfileMenu.List_lbl'
    begin object name=List_lbl class=Class'GUI.GUILabel'
        Caption="Select a profile:"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.4000000
        WinLeft=0.3500000
        WinWidth=0.3000000
        WinHeight=0.0600000
    end object
    ListLabel=List_lbl
    // Reference: GUILabel'DOTZProfileMenu.Name_lbl'
    begin object name=Name_lbl class=Class'GUI.GUILabel'
        Caption="Name:"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.2500000
        WinLeft=0.3000000
        WinWidth=0.2500000
        WinHeight=0.0600000
    end object
    NameLabel=Name_lbl
    // Reference: GUILabel'DOTZProfileMenu.Diff_lbl'
    begin object name=Diff_lbl class=Class'GUI.GUILabel'
        Caption="Single Player Difficulty:"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.3200000
        WinLeft=0.3000000
        WinWidth=0.2500000
        WinHeight=0.0600000
    end object
    DiffLabel=Diff_lbl
    // Reference: GUILabel'DOTZProfileMenu.NameValue_lbl'
    begin object name=NameValue_lbl class=Class'GUI.GUILabel'
        Caption="?????"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.2500000
        WinLeft=0.5500000
        WinWidth=0.1500000
        WinHeight=0.0600000
    end object
    NameValue=NameValue_lbl
    // Reference: BBComboBox'DOTZProfileMenu.DifficultyList_lbl'
    begin object name=DifficultyList_lbl class=Class'BBGui.BBComboBox'
        StyleName="BBTextButton"
        Hint="Choose how difficult the game is"
        WinTop=0.3200000
        WinLeft=0.5500000
        WinWidth=0.3500000
    end object
    DifficultyList=DifficultyList_lbl
    // Reference: GUIButton'DOTZProfileMenu.NewProfile_btn'
    begin object name=NewProfile_btn class=Class'GUI.GUIButton'
        Caption="New"
        StyleName="BBRoundButton"
        Hint="Create a new profile."
        WinTop=0.5200000
        WinLeft=0.1250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZProfileMenu.ButtonClicked
    end object
    NewProfileButton=NewProfile_btn
    // Reference: GUIButton'DOTZProfileMenu.LoadProfile_btn'
    begin object name=LoadProfile_btn class=Class'GUI.GUIButton'
        Caption="Load"
        StyleName="BBRoundButton"
        Hint="Load a profile."
        WinTop=0.6000000
        WinLeft=0.1250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZProfileMenu.ButtonClicked
    end object
    LoadProfileButton=LoadProfile_btn
    // Reference: GUIButton'DOTZProfileMenu.DeleteProfile_btn'
    begin object name=DeleteProfile_btn class=Class'GUI.GUIButton'
        Caption="Delete"
        StyleName="BBRoundButton"
        Hint="Delete a profile."
        WinTop=0.6800000
        WinLeft=0.1250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZProfileMenu.ButtonClicked
    end object
    DeleteProfileButton=DeleteProfile_btn
    NewProfileMenu="DOTZMenu.DOTZNewProfile"
    PageCaption="Profiles"
    ClickSound=Sound'DOTZXInterface.Select'
    OnKeyEvent=DOTZProfileMenu.HandleKeyEvent
}