/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.6 $
 * @date    Oct 2003
 */
class DOTZAudioSettings extends DOTZSettingsPanel;

// audio
var Automated GUILabel      musicVolumeLabel;
var Automated GuiSlider     musicVolumeSlider;
var Automated GUILabel      effectsVolumeLabel;
var Automated GuiSlider     effectsVolumeSlider;
var Automated moCheckBox    reverseStereoCheck;
var Automated GUILabel      audioModeLabel;
var Automated GUIComboBox   audioModesBox;
var localized string        AudioModes[2];
var private String          currentAudioMode;

// internal
var private bool bInitialized;
var sound ClickSound;

/*****************************************************************
 * InitComponents
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {

   local int i;
   local float curVal;
   Super.InitComponent(MyController,MyOwner);

   //set effects volume slider
   curVal = float(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"));
   effectsVolumeSlider.SetValue( curVal );

   //set the music slider
   curVal = float(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
   musicVolumeSlider.SetValue( curVal );

   //fill the audio drop down with available modes
   for ( i = 0; i < ArrayCount(AudioModes); ++i ) {
      audioModesBox.AddItem( AudioModes[i] );
   }
   InitAudioBox(audioModesBox, "");
   bInitialized = true;
}

/*****************************************************************
 * InternalOnLoadIni
 *****************************************************************
 */

function InitAudioBox(GUIComponent Sender, string s) {

   local bool bUse3D, bCompMode;

   bCompMode = bool( PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice CompatibilityMode") );
   bUse3D = bool( PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice Use3DSound") );

   if ( bCompMode == true){
    AudioModesBox.SetText( AudioModes[1] );

   } else if ( bUse3D ==true) {
    AudioModesBox.SetText( AudioModes[0] );

   } else {
    AudioModesBox.SetText( AudioModes[0] );
   }
   currentAudioMode = AudioModesBox.GetText();
}


/*****************************************************************
 * VolumeChange
 *****************************************************************
 */
function volumeChange( GUIComponent Sender ) {
   local String channel;

   //determine which slider changed
   if ( Sender == musicVolumeSlider ) {
    channel = "MusicVolume";
   } else if ( Sender == effectsVolumeSlider ){
    channel = "SoundVolume";
   } else {
     Log( "unknown component" @ sender );
     return;
   }

   Log("Volume slider value: " $ GuiSlider(Sender).Value);

   PlayerOwner().ConsoleCommand( "set ini:Engine.Engine.AudioDevice"
                                 @ channel @ GuiSlider(Sender).Value );
   PlayerOwner().ConsoleCommand("stopsounds");

   // restart the music at the new volume
   if ( Sender == musicVolumeSlider ) {
      restartLevelMusic();
   }

}


/*****************************************************************
 * RestartLevelMusic
 *****************************************************************
 */
function restartLevelMusic() {
   // Restart music.
   PlayerOwner().StopAllMusic( 0 );
   if (PlayerOwner().Level.Song != "" && PlayerOwner().Level.Song != "None") {
      PlayerOwner().ClientSetMusic( PlayerOwner().Level.Song, MTRAN_Instant );
   }
}


/*****************************************************************
 * AudioModeChange
 *****************************************************************
 */
function AudioModeChange( GUIComponent Sender ) {
   local String t;

   t = audioModesBox.GetText();
   if ( !bInitialized || t == currentAudioMode ) return;
   Log ("changing the audio mode because " $ currentAudioMode $ "  " $ bInitialized);

   //3D AUDIO
   if ( t == AudioModes[0] ) {
      PlayerOwner().ConsoleCommand
         ("set ini:Engine.Engine.AudioDevice Use3DSound true" );
      PlayerOwner().ConsoleCommand
         ("set ini:Engine.Engine.AudioDevice CompatibilityMode false" );
   }
   //Safe Mode
   else if ( t == AudioModes[1] ) {
      PlayerOwner().ConsoleCommand
         ("set ini:Engine.Engine.AudioDevice Use3DSound false" );
      PlayerOwner().ConsoleCommand
         ("set ini:Engine.Engine.AudioDevice CompatibilityMode true" );
   }
   PlayerOwner().ConsoleCommand("SOUND_REBOOT");
   currentAudioMode = AudioModesBox.GetText();
   restartLevelMusic();
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZAudioSettings.AudioMusicVolumeLabel'
    begin object name=AudioMusicVolumeLabel class=Class'GUI.GUILabel'
        Caption="Music Volume"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.1500000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0600000
    end object
    musicVolumeLabel=AudioMusicVolumeLabel
    // Reference: BBGuiSlider'DOTZAudioSettings.AudioMusicVolumeSlider'
    begin object name=AudioMusicVolumeSlider class=Class'BBGui.BBGuiSlider'
        MaxValue=1.0000000
        IniOption="ini:Engine.Engine.AudioDevice MusicVolume"
        IniDefault="0.5"
        Hint="Changes the volume of the background music."
        WinTop=0.1500000
        WinLeft=0.4100000
        OnChange=DOTZAudioSettings.volumeChange
    end object
    musicVolumeSlider=AudioMusicVolumeSlider
    // Reference: GUILabel'DOTZAudioSettings.AudioEffectsVolumeLabel'
    begin object name=AudioEffectsVolumeLabel class=Class'GUI.GUILabel'
        Caption="Effects Volume"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.2750000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0600000
    end object
    effectsVolumeLabel=AudioEffectsVolumeLabel
    // Reference: BBGuiSlider'DOTZAudioSettings.AudioEffectsVolumeSlider'
    begin object name=AudioEffectsVolumeSlider class=Class'BBGui.BBGuiSlider'
        MaxValue=1.0000000
        IniOption="ini:Engine.Engine.AudioDevice SoundVolume"
        IniDefault="0.9"
        Hint="Changes the volume of all in game sound effects."
        WinTop=0.2750000
        WinLeft=0.4100000
        OnChange=DOTZAudioSettings.volumeChange
    end object
    effectsVolumeSlider=AudioEffectsVolumeSlider
    // Reference: GUILabel'DOTZAudioSettings.audiomode_label'
    begin object name=audiomode_label class=Class'GUI.GUILabel'
        Caption="Audio mode"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.4000000
        WinLeft=0.2500000
        WinWidth=0.3000000
        WinHeight=0.0600000
    end object
    audioModeLabel=audiomode_label
    // Reference: BBComboBox'DOTZAudioSettings.AudioMode_cbox'
    begin object name=AudioMode_cbox class=Class'BBGui.BBComboBox'
        IniOption="@Internal"
        IniDefault="Software 3D Audio"
        StyleName="BBRoundButton"
        Hint="Changes the audio system mode."
        WinTop=0.4000000
        WinLeft=0.4200000
        WinWidth=0.3000000
        OnChange=DOTZAudioSettings.AudioModeChange
        OnLoadINI=DOTZAudioSettings.InitAudioBox
    end object
    audioModesBox=AudioMode_cbox
    AudioModes[0]="Software 3D Audio"
    AudioModes[1]="Safe Mode"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=55.9805000
    WinHeight=0.8078130
}