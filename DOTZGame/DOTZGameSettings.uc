/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZGameSettings extends DOTZSettingsPanel;



var(Object) int DebugFlags;

//control numbers
const DIFF_LABEL = 0;
const DIFF_BOX = 1;
const AUTO_LABEL = 2;
const AUTO_BOX = 3;
const RETICULE_LABEL = 4;
const RETICULE_BOX = 5;



// game difficulty
struct DifficultyLevel {
   var int playerHealth;
   var string label;
};



// internal
var private bool bInitialized;
var localized Array<DifficultyLevel> difficultyLevels;

var sound ClickSound;


/****************************************************************
 * InitComponent
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {
   local int i;

   Super.InitComponent(MyController,MyOwner);
   //init the game difficulty
   for ( i = 0; i < difficultyLevels.length; ++i ) {
      GuiComboBox(Controls[DIFF_BOX]).AddItem( difficultyLevels[i].label );
   }
   InitDifficultyBox( Controls[DIFF_BOX], "INIT-DIFFICULTY" );
   //init autosaves
   moCheckBox(Controls[AUTO_BOX])
        .Checked(!class'AdvancedGameInfo'.default.bAutoSaveDisabled);
   //init reticule
   moCheckBox(Controls[RETICULE_BOX])
        .Checked(class'AdvancedGameInfo'.default.bUseReticule);


   bInitialized = true;
}

/****************************************************************
 * InitDifficultyBox
 ****************************************************************
 */
function InitDifficultyBox(GUIComponent Sender, string s) {

    local int prevDifficultyIdx;
    


                // Log( self @ "InternalOnLoadINI [" $Sender$ "] [" $s$ "]"  )    ;

    switch ( DOTZPlayerControllerBase(PlayerOwner()).GetDifficultyLevel()){ //Class'AdvancedGameInfo'.default.currentDifficultyLevel ) {
    case 2:
        prevDifficultyIdx = 2;
        break;
    case 0:
        prevDifficultyIdx = 0;
        break;
    case 1:
    // fall through to default...
    default:
        prevDifficultyIdx = 1;
    }
    



                // Log( self @ logout  )    ;
    GuiComboBox(Controls[DIFF_BOX])
        .SetText(difficultyLevels[prevDifficultyIdx].Label);
    GuiComboBox(Controls[DIFF_BOX])
        .SetIndex( prevDifficultyIdx );
}

/****************************************************************
 * DifficultyChange
 ****************************************************************
 */
function DifficultyChange(GUIComponent Sender) {
   local int diffIdx;
   local AdvancedPawn TempPawn;
   local RailShooter TempRail;
   local int OldLevel;

   if ( !bInitialized || GUIComboBox(Controls[DIFF_BOX]).ItemCount()
                            < difficultyLevels.length ) {
      return;
   }

    //the level you start with
   OldLevel = class'AdvancedGameInfo'.default.iDifficultyLevel;

   diffIdx = GUIComboBox(Sender).getIndex();
   if ( GuiComboBox(Sender) != None) {
      //update pawns with new difficulty levels
      foreach PlayerOwner().AllActors(class'AdvancedPawn', TempPawn){
         TempPawn.UpdateDifficultyLevel(diffIdx);
      }
      //update railshooter with new difficulty levels
      foreach PlayerOwner().AllActors(class'RailShooter', TempRail){
         TempRail.UpdateDifficultyLevel(diffIdx);
      }
      DOTZPlayerControllerBase(PlayerOwner()).SetDifficultyLevel(diffIdx);

      //note the hack here to uncheck the box on difficult
      //ONLY do it if you are REALLY changed the settings
      if (diffIdx != OldLevel){
        if (diffIdx == 2){
              moCheckBox(Controls[RETICULE_BOX]).Checked(false);
          } else {
              moCheckBox(Controls[RETICULE_BOX]).Checked(true);
          }
      }

      //class'AdvancedGameInfo'.default.currentDifficultyLevel=difficultyLevels[diffIdx].label;
      class'AdvancedGameInfo'.default.iDifficultyLevel=diffIdx;
      Class'AdvancedGameInfo'.static.StaticSaveConfig();
                  // Log( self @ "supposed to save" @ difficultyLevels[diffIdx].label @ "sent by" @ Sender  )    ;
   }
}



/****************************************************************
 * OnAutoSaveChanged
 ****************************************************************
 */
function OnAutoSaveChanged(GUIComponent Sender){
    local bool bIsChecked;

    if ( bInitialized == false){
        return;
    }
    bIsChecked = moCheckBox(Sender).IsChecked();
    class'AdvancedGameInfo'.default.bAutoSaveDisabled = !bIsChecked;
    class'AdvancedGameInfo'.static.StaticSaveConfig();
               // Log( self @ "Saved autosave setting" @ class'AdvancedGameInfo'.default.bAutoSaveDisabled  )    ;
}


/*****************************************************************
 * OnReticuleChanged
 *****************************************************************
 */
function OnReticuleChanged(GUIComponent Sender){
    local bool bIsChecked;

    if ( bInitialized == false){
        return;
    }
    bIsChecked = moCheckBox(Sender).IsChecked();
    class'AdvancedGameInfo'.default.bUseReticule = bIsChecked;
    class'AdvancedGameInfo'.static.StaticSaveConfig();

}

/****************************************************************
 * InternalOnSaveINI
 ****************************************************************
 */
function string InternalOnSaveINI(GUIComponent Sender);


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    DebugFlags=1
    difficultyLevels[0]=(playerHealth=10000,Label="Easy")
    difficultyLevels[1]=(playerHealth=4500,Label="Standard")
    difficultyLevels[2]=(playerHealth=2000,Label="Difficult")
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUILabel'DOTZGameSettings.difficulty_label'
    begin object name=difficulty_label class=Class'GUI.GUILabel'
        Caption="Difficulty"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.1500000
        WinLeft=0.2500000
        WinWidth=0.3000000
        WinHeight=0.0500000
    end object
    Controls[0]=difficulty_label
    // Reference: BBComboBox'DOTZGameSettings.cComboBox1'
    begin object name=cComboBox1 class=Class'BBGui.BBComboBox'
        IniOption="@Internal"
        IniDefault="Standard"
        StyleName="BBTextButton"
        Hint="Choose how difficult the game is"
        WinTop=0.1500000
        WinLeft=0.4350000
        WinWidth=0.3000000
        TabOrder=1
        OnChange=DOTZGameSettings.DifficultyChange
        OnLoadINI=DOTZGameSettings.InitDifficultyBox
        OnSaveINI=DOTZGameSettings.InternalOnSaveINI
    end object
    Controls[1]=cComboBox1
    // Reference: GUILabel'DOTZGameSettings.autosave_label'
    begin object name=autosave_label class=Class'GUI.GUILabel'
        Caption="Enable auto save"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.2900000
        WinLeft=0.2500000
        WinWidth=0.3000000
        WinHeight=0.0500000
    end object
    Controls[2]=autosave_label
    // Reference: moCheckBox'DOTZGameSettings.autosave_box'
    begin object name=autosave_box class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="PlainGuiFont"
        IniOption="@internal"
        StyleName="BBTextButton"
        bNeverFocus=true
        WinTop=0.2900000
        WinLeft=0.4000000
        WinWidth=0.0700000
        WinHeight=0.1000000
        TabOrder=2
        OnChange=DOTZGameSettings.OnAutoSaveChanged
    end object
    Controls[3]=autosave_box
    // Reference: GUILabel'DOTZGameSettings.reticule_label1'
    begin object name=reticule_label1 class=Class'GUI.GUILabel'
        Caption="Enable reticule"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.4200000
        WinLeft=0.2500000
        WinWidth=0.3000000
        WinHeight=0.0500000
    end object
    Controls[4]=reticule_label1
    // Reference: moCheckBox'DOTZGameSettings.reticule_box1'
    begin object name=reticule_box1 class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="PlainGuiFont"
        IniOption="@internal"
        StyleName="BBTextButton"
        bNeverFocus=true
        WinTop=0.4200000
        WinLeft=0.4000000
        WinWidth=0.0700000
        WinHeight=0.1000000
        TabOrder=3
        OnChange=DOTZGameSettings.OnReticuleChanged
    end object
    Controls[5]=reticule_box1
    WinTop=55.9805000
    WinHeight=0.8078130
}