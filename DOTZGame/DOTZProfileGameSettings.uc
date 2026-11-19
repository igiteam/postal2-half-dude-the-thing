/**
 * DOTZProfileGameSettings
 * -users can change gameplay settings using this GUI
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    May 2005
 */
class DOTZProfileGameSettings extends DOTZProfilePanel;



var Automated GUILabel DifficultyLabel;
var Automated GUILabel AutosaveLabel;
var Automated GUILabel ReticuleLabel;
var Automated GUILabel SubtitlesLabel;

var Automated GuiComboBox DifficultyBox;
var Automated moCheckBox AutosaveBox;
var Automated moCheckBox ReticuleBox;
var Automated moCheckBox SubtitlesBox;

var sound clickSound;

const constAUTOSAVE = "AUTOSAVE";
const constRETICULE = "RETICULE";

const constTRUE = "true";
const constFALSE = "false";

var localized string Normaltxt;
var localized string Easytxt;
var localized string Hardtxt;



/****************************************************************
 * InitComponents
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner)
{

   Super.InitComponent(MyController,MyOwner);

   LoadValues();
}


/****************************************************************
 * LoadValues
 * -populates GUI fields with info from currently loaded profile
 ****************************************************************
 */
function LoadValues()
{
    local string temp;

    temp = DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName();
    if(temp == "")
    {
        return;
    }

    // Load the difficulty setting
    DifficultyBox.AddItem(Easytxt);
    DifficultyBox.AddItem(Normaltxt);
    DifficultyBox.AddItem(Hardtxt);
    Log("level:" @DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());
    DifficultyBox.List.SetIndex(DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel());

    // Load the autosave setting
    temp = class'Profiler'.static.GetValue(constAUTOSAVE);
    if(temp == constFALSE)
        AutosaveBox.Checked(false);
    else
        AutosaveBox.Checked(true);

    // Load the reticule setting
    temp = class'Profiler'.static.GetValue(constRETICULE);
    if(temp == constFALSE)
        ReticuleBox.Checked(false);
    else
        ReticuleBox.Checked(true);

    // Load the subtitle setting
    if(DOTZPlayerControllerBase(PlayerOwner()).GetUseSubtitles())
        SubtitlesBox.Checked(true);
    else
        SubtitlesBox.Checked(false);
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
 * HandleDifficultyChange
 *****************************************************************
 */
function HandleDifficultyChange(GUIComponent Sender)
{
    Log("setting:"@DifficultyBox.List.Index);
    DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(DifficultyBox.List.Index);
}

/*****************************************************************
 * HandleAutosaveChange
 *****************************************************************
 */
function HandleAutosaveChange(GUIComponent Sender)
{
    if(AutosaveBox.IsChecked())
        class'Profiler'.static.SetValue(constAUTOSAVE, constTRUE);
    else
        class'Profiler'.static.SetValue(constAUTOSAVE, constFALSE);
}

/*****************************************************************
 * HandleReticuleChange
 *****************************************************************
 */
function HandleReticuleChange(GUIComponent Sender)
{
    if(ReticuleBox.IsChecked())
        class'Profiler'.static.SetValue(constRETICULE, constTRUE);
    else
        class'Profiler'.static.SetValue(constRETICULE, constFALSE);
}

/*****************************************************************
 * HandleSubtitlesChange
 *****************************************************************
 */
function HandleSubtitlesChange(GUIComponent Sender)
{
    //DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(SubtitlesBox.IsChecked());
    DOTZPlayerControllerBase(PlayerOwner()).SetUseSubtitles(SubtitlesBox.IsChecked());
    /*
    if(SubtitlesBox.IsChecked())
        DOTZPlayerControllerBase(PlayerOwner()).class'Profiler'.static.SetValue(constSUBTITLES, constTRUE);
    else
        DOTZPlayerControllerBase(PlayerOwner()).class'Profiler'.static.SetValue(constSUBTITLES, constFALSE);
    */
}


/*****************************************************************
 * UpdateProfile
 *****************************************************************
 */
function bool UpdateProfile()
{
    HandleDifficultyChange(Self);
    HandleAutosaveChange(Self);
    HandleReticuleChange(Self);
    HandleSubtitlesChange(Self);

    // Save entire profile
    //DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();
    DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();
    return true;
}




// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZProfileGameSettings.difficulty_label'
    begin object name=difficulty_label class=Class'GUI.GUILabel'
        Caption="Difficulty"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.1000000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    DifficultyLabel=difficulty_label
    // Reference: GUILabel'DOTZProfileGameSettings.autosave_label'
    begin object name=autosave_label class=Class'GUI.GUILabel'
        Caption="Enable autosave"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.2250000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    AutosaveLabel=autosave_label
    // Reference: GUILabel'DOTZProfileGameSettings.RETICULE_LABEL'
    begin object name=RETICULE_LABEL class=Class'GUI.GUILabel'
        Caption="Enable reticule"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.3500000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    ReticuleLabel=RETICULE_LABEL
    // Reference: GUILabel'DOTZProfileGameSettings.Subtitles_label'
    begin object name=Subtitles_label class=Class'GUI.GUILabel'
        Caption="Use subtitles"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BoldGuiFont"
        WinTop=0.4750000
        WinLeft=0.1700000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    SubtitlesLabel=Subtitles_label
    // Reference: BBComboBox'DOTZProfileGameSettings.Difficulty_edit'
    begin object name=Difficulty_edit class=Class'BBGui.BBComboBox'
        Hint="Choose the game difficulty"
        WinTop=0.1000000
        WinLeft=0.5500000
        WinWidth=0.3000000
    end object
    DifficultyBox=Difficulty_edit
    // Reference: moCheckBox'DOTZProfileGameSettings.autosave_box'
    begin object name=autosave_box class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="BigGuiFont"
        StyleName="BBSquareButton"
        bNeverFocus=true
        WinTop=0.2250000
        WinLeft=0.5500000
        WinWidth=0.0600000
        TabOrder=1
    end object
    AutosaveBox=autosave_box
    // Reference: moCheckBox'DOTZProfileGameSettings.RETICULE_BOX'
    begin object name=RETICULE_BOX class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="BigGuiFont"
        StyleName="BBSquareButton"
        bNeverFocus=true
        WinTop=0.3500000
        WinLeft=0.5500000
        WinWidth=0.0600000
        TabOrder=2
    end object
    ReticuleBox=RETICULE_BOX
    // Reference: moCheckBox'DOTZProfileGameSettings.Subtitles_box'
    begin object name=Subtitles_box class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="BigGuiFont"
        StyleName="BBSquareButton"
        bNeverFocus=true
        WinTop=0.4750000
        WinLeft=0.5500000
        WinWidth=0.0600000
        TabOrder=3
    end object
    SubtitlesBox=Subtitles_box
    ClickSound=Sound'DOTZXInterface.Select'
    Normaltxt="Normal"
    Easytxt="Easy"
    Hardtxt="Hard"
    WinTop=55.9805000
    WinHeight=0.8078130
}