/**
 * DOTZProfilePlayer
 * NOT USED ANYMORE
 * -users can change their in-game player settings using this GUI
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    May 2005
 */
class DOTZProfilePlayer extends DOTZProfilePanel;




var Automated GUILabel PlayerNameLabel;
var Automated GUILabel FOVLabel;
var Automated GUILabel TeamLabel;
var Automated GUILabel OnlineCharacterLabel;
var Automated GUILabel ProfileErrorLabel;

var Automated GUIEditBox PlayerNameBox;
var Automated GUINumericEdit FOVBox;
var Automated GuiComboBox TeamBox;
var Automated GuiComboBox OnlineCharacterBox;

var localized Array<String> Teams;
var localized Array<String> Characters;
var localized string NameErrorText;

var sound clickSound;

const constFOV = "DEFAULTFOV";
const constTEAM = "PREFERREDTEAM";
const constCHARACTER = "CHARACTER";



/****************************************************************
 * InitComponents
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
   local int i;

   Super.InitComponent(MyController,MyOwner);

   for ( i = 0; i < Teams.length; ++i )
   {
      TeamBox.AddItem( Teams[i] );
   }

   for ( i = 0; i < Characters.length; ++i )
   {
      OnlineCharacterBox.AddItem( Characters[i] );
   }

   LoadValues();
}


/****************************************************************
 * LoadValues
 * -populates GUI fields with info from currently loaded profile
 ****************************************************************
 */
function LoadValues()
{
    local string name;
    local int fov;
    local string team;
    local string character;

    name = DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName();
    if(name != "")
    {
        // Load the player name
        PlayerNameBox.SetText(name);

        // Load the FOV
        fov = int(class'Profiler'.static.GetValue(constFOV));
        if(fov < 80)
            fov = 80;
        else if(fov > 100)
            fov = 100;
        FOVBox.SetValue(fov);

        // Load the team
        team = class'Profiler'.static.GetValue(constTEAM);
        if(team != "Red" && team != "Blue")
            team = "Red";
        TeamBox.SetText(team);

        // Load the multiplayer character
        character = class'Profiler'.static.GetValue(constCHARACTER);
        if(character != "Jack" && character != "Otis")
            character = "Jack";
        OnlineCharacterBox.SetText(character);
    }
}


/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled)
{
    UpdateProfile();
    Super.Closed(Sender,bCancelled);
    Controller.MouseEmulation(false);
}

/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */
event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}



/*****************************************************************
 * HandleNameChange
 * -if name is already used, then this does not change it
 *****************************************************************
 */
function HandleNameChange(GUIComponent Sender)
{
    local int count, p;

    if(PlayerNameBox.GetText() == DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName())
        return;

    count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();
    for (p = 0; p < count; ++p)
    {
        if(PlayerNameBox.GetText() == DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(p))
        {
            ProfileErrorLabel.Caption = NameErrorText;
            ProfileErrorLabel.Show();
            return;
        }

        // This does not change actual name; when we close window, then it changes.
        //DOTZPlayerControllerBase(PlayerOwner()).RenameCurrentProfileName(PlayerNameBox.GetText());
    }
    ProfileErrorLabel.Hide();
}

/*****************************************************************
 * HandleFOVChange
 *****************************************************************
 */
function HandleFOVChange(GUIComponent Sender)
{
    class'Profiler'.static.SetValue(constFOV, FOVBox.Value);
}

/*****************************************************************
 * HandleTeamChange
 *****************************************************************
 */
function HandleTeamChange(GUIComponent Sender)
{
    class'Profiler'.static.SetValue(constTEAM, TeamBox.GetText());
}

/*****************************************************************
 * HandleCharacterChange
 *****************************************************************
 */
function HandleCharacterChange(GUIComponent Sender)
{
    class'Profiler'.static.SetValue(constCHARACTER, OnlineCharacterBox.GetText());
}

/*****************************************************************
 * UpdateProfile
 *****************************************************************
 */
function bool UpdateProfile()
{
    // Save the current profile first
    // The player name
    /*if(PlayerNameBox.GetText() != DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName())
    {
        DOTZPlayerControllerBase(PlayerOwner()).RenameCurrentProfileName(PlayerNameBox.GetText());
    }*/

    // The FOV
    class'Profiler'.static.SetValue(constFOV, FOVBox.Value);

    // The preferred team
    class'Profiler'.static.SetValue(constTEAM, TeamBox.GetText());

    // The online character
    class'Profiler'.static.SetValue(constCHARACTER, OnlineCharacterBox.GetText());

    // Save it
    DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();

    return true;
}




// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZProfilePlayer.PlayerName_label'
    begin object name=PlayerName_label class=Class'GUI.GUILabel'
        Caption="Player Name"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.1000000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    PlayerNameLabel=PlayerName_label
    // Reference: GUILabel'DOTZProfilePlayer.FOV_label'
    begin object name=FOV_label class=Class'GUI.GUILabel'
        Caption="Default FOV"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.2250000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    FOVLabel=FOV_label
    // Reference: GUILabel'DOTZProfilePlayer.Team_label'
    begin object name=Team_label class=Class'GUI.GUILabel'
        Caption="Preferred Team"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.3500000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    TeamLabel=Team_label
    // Reference: GUILabel'DOTZProfilePlayer.Character_label'
    begin object name=Character_label class=Class'GUI.GUILabel'
        Caption="Multiplayer Character"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.4750000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    OnlineCharacterLabel=Character_label
    // Reference: GUILabel'DOTZProfilePlayer.ProfileError_lbl'
    begin object name=ProfileError_lbl class=Class'GUI.GUILabel'
        TextAlign=1
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BigGuiFont"
        bVisible=false
        WinTop=0.6000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.0600000
    end object
    ProfileErrorLabel=ProfileError_lbl
    // Reference: BBEditBox'DOTZProfilePlayer.PlayerName_edit'
    begin object name=PlayerName_edit class=Class'BBGui.BBEditBox'
        Hint="Enter the new player name"
        WinTop=0.1000000
        WinLeft=0.5500000
        WinHeight=0.0600000
        OnChange=DOTZProfilePlayer.HandleNameChange
    end object
    PlayerNameBox=PlayerName_edit
    // Reference: BBNumericEdit'DOTZProfilePlayer.FOV_box'
    begin object name=FOV_box class=Class'BBGui.BBNumericEdit'
        Value="90"
        bLeftJustified=true
        MinValue=80
        MaxValue=100
        Step=5
        WinTop=0.2250000
        WinLeft=0.5500000
        WinWidth=0.1300000
        TabOrder=1
    end object
    FOVBox=FOV_box
    // Reference: BBComboBox'DOTZProfilePlayer.Team_box'
    begin object name=Team_box class=Class'BBGui.BBComboBox'
        Hint="Choose your preferred team"
        WinTop=0.3500000
        WinLeft=0.5500000
        WinWidth=0.2000000
        TabOrder=2
    end object
    TeamBox=Team_box
    // Reference: BBComboBox'DOTZProfilePlayer.OnlineCharacter_box'
    begin object name=OnlineCharacter_box class=Class'BBGui.BBComboBox'
        Hint="Choose who you want to play as online"
        WinTop=0.4800000
        WinLeft=0.5500000
        WinWidth=0.2000000
        TabOrder=2
    end object
    OnlineCharacterBox=OnlineCharacter_box
    Teams[0]="Red"
    Teams[1]="Blue"
    Characters[0]="Jack"
    Characters[1]="Otis"
    NameErrorText="Player name already exists.  Choose another."
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=55.9805000
    WinHeight=0.8078130
}