/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.14 $
 * @date    Oct 2003
 */
class DOTZVideoSettings extends DOTZSettingsPanel;

// graphics
var config enum EGraphicsLevel {
   DTGFX_LOW,
   DTGFX_MED,
   DTGFX_HIGH
} GraphicsDetailLevel;

// video modes
struct DisplayMode {
   var int Width;
   var int Height;
};

//gui
var Automated GUILabel    graphicsLabel;
var Automated GUIComboBox GraphicsComboBox;
var Automated GUILabel    videoLabel;
var Automated GUILabel    resolutionLabel;
var Automated GuiComboBox resolutionBox;
var Automated GuiComboBox colorDepthBox;
var localized string      BitDepthText[2];
var Automated GuiButton   videoApplyButton;
var Automated GUILabel    ShadowLabel;
var Automated GuiComboBox ShadowBox;
var Automated GUILabel    gammaLabel;
var Automated GuiSlider   gammaSlider;

// internal
var private bool bInitialized;
var localized Array<String> graphicsLevels;
var Array<DisplayMode>    DisplayModes;
var sound clickSound;

const SHADOW_LABEL = 6;
const SHADOW_BOX = 7;

struct ShadowType {
    var string label;
    var int Type;
};

var localized Array<ShadowType> ShadowTypes;

/****************************************************************
 * InitComponents
 ****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner) {
   local int i;
   Log( "INITCOMPONENT" );
   Super.InitComponent(MyController,MyOwner);

   for ( i = 0; i < graphicsLevels.length; ++i ) {
      GraphicsComboBox.AddItem( graphicsLevels[i] );
   }
   InternalOnLoadINI( graphicsComboBox, "INIT-GRAPHICS" );

   colorDepthBox.AddItem( BitDepthText[0] );
   colorDepthBox.AddItem( BitDepthText[1] );
   colorDepthBox.ReadOnly( true );
   CheckSupportedResolutions();

   InternalOnLoadINI( colorDepthBox, "INIT-GRAPHICS" );

   for ( i = 0; i < shadowtypes.length; i++){
      ShadowBox.AddItem( shadowtypes[i].label );
   }
   InitShadowBox( ShadowBox, "INIT-DIFFICULTY" );


   gammaSlider.SetValue(float(PlayerOwner().
         ConsoleCommand("get ini:Engine.Engine.ViewPortManager Gamma")));

   bInitialized = true;
   LOG( "END OF INIT" );
}


/****************************************************************
 * CheckSupportedResolutions
 ****************************************************************
 */
function CheckSupportedResolutions() {
   local int        Index;
   local int        BitDepth;
   local string CurrentSelection;

   CurrentSelection = resolutionBox.Edit.GetText();
   if( resolutionBox.ItemCount() > 0 ) {
      resolutionBox.RemoveItem( 0, resolutionBox.ItemCount() );
   }
   if( colorDepthBox.GetText() == BitDepthText[0] ) {
      BitDepth = 16;
   }  else {
      BitDepth = 32;
   }

   for( Index = 0; Index < DisplayModes.length; Index++ ) {
      if ( PlayerOwner().ConsoleCommand
           ( "SupportedResolution"
             @ "WIDTH="  $ DisplayModes[Index].Width
             @ "HEIGHT=" $ DisplayModes[Index].Height
             @ "BITDEPTH=" $ BitDepth ) == "1" ) {
         resolutionBox.AddItem( DisplayModes[Index].Width $ "x"
                                $ DisplayModes[Index].Height );
      }
   }
   resolutionBox.SetText( CurrentSelection );
}


/****************************************************************
 * InternalOnLoadINI
 ****************************************************************
 */
function InternalOnLoadINI(GUIComponent Sender, string s) {

   Log( "InternalOnLoadINI [" $Sender$ "] [" $s$ "]" );

   switch ( Sender ) {

   case graphicsComboBox:
      graphicsComboBox.SetText
         ( graphicsLevels[Class.default.GraphicsDetailLevel] );
      graphicsComboBox.SetIndex( Class.default.GraphicsDetailLevel );
      GraphicsChange(Sender);

   case resolutionBox:
      if( Controller.GameResolution != "" ) {
         resolutionBox.SetText( Controller.GameResolution );
      } else {
         resolutionBox.SetText( Controller.GetCurrentRes() );
      }
      CheckSupportedResolutions();


   case colorDepthBox:
      if ( PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit") == "True" ) {
         Log("Use16bit = true" @ BitDepthText[0]);
         colorDepthBox.SetText( BitDepthText[0] );
      } else {
         Log("Use16bit = false" @ BitDepthText[1]);
         colorDepthBox.SetText( BitDepthText[1] );
      }
   } // end of switch(Sender)
}


/****************************************************************
 * SliderChange
 ****************************************************************
 */
function SliderChange(GUICOmponent Sender){

   Log ("Slider Change:" @ Sender);

   if (Sender == gammaSlider){
      PlayerOwner().
         ConsoleCommand( "set ini:Engine.Engine.ViewPortManager Gamma" @
                         GuiSlider(Sender).Value );
      Class.static.StaticSaveConfig();
   }
}


/****************************************************************
 * GraphicsChange
 ****************************************************************
 */
function GraphicsChange(GUIComponent Sender) {
   local bool changed;

   if ( !bInitialized ) return;
   changed = false;
   switch ( GraphicsComboBox.getIndex() ) {
   case 2:
      if ( GraphicsDetailLevel == DTGFX_HIGH ) break;
      SetGraphicsDetailHigh();
      changed = true;
      break;
   case 1:
      if ( GraphicsDetailLevel == DTGFX_MED ) break;
      SetGraphicsDetailMedium();
      changed = true;
      break;
   case 0:
   default:
      if ( GraphicsDetailLevel == DTGFX_LOW ) break;
      SetGraphicsDetailLow();
      changed = true;
      break;
   }

   Log( "GRAPHICS SAVE" @ Sender @ graphicsDetailLevel );
   Class.default.GraphicsDetailLevel = GraphicsDetailLevel;
   Class.static.StaticSaveConfig();
   // GraphicsDetailLevel = DTGFX_LOW;
}


/****************************************************************
 * SetGraphicsDetailHigh
 ****************************************************************
 */
function SetGraphicsDetailHigh() {
   SetTextureDetail( DTGFX_HIGH );
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice HighDetailActors True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Coronas True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Projectors True");
   PlayerOwner().ConsoleCommand
      ("ini:Engine.Engine.ViewportManager NoDynamicLights False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager DecoLayers True");
   PlayerOwner().ConsoleCommand
      ("ini:Engine.Engine.RenderDevice UseTrilinear True");
   PlayerOwner().Level.DetailChange(DM_SuperHigh);
   PlayerOwner().Level.default.PhysicsDetailLevel = PDL_High;
   PlayerOwner().Level.default.DecalStayScale = 2;
   PlayerOwner().Level.PhysicsDetailLevel
      = PlayerOwner().Level.default.PhysicsDetailLevel;
   PlayerOwner().Level.DecalStayScale
      = PlayerOwner().Level.default.DecalStayScale;
   PlayerOwner().Level.SaveConfig();
   //   PlayerOwner().ConsoleCommand
   // ("set ini:Engine.Engine.AudioDevice LowQualitySound False");
   //   PlayerOwner().ConsoleCommand("SOUND_REBOOT");
   GraphicsDetailLevel = DTGFX_HIGH;
}


/****************************************************************
 * SetGraphicsDetailMedium
 ****************************************************************
 */
function SetGraphicsDetailMedium() {
   SetTextureDetail( DTGFX_MED );
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice HighDetailActors True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Coronas True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Projectors True");
   PlayerOwner().ConsoleCommand
      ("ini:Engine.Engine.ViewportManager NoDynamicLights False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager DecoLayers True");
   PlayerOwner().ConsoleCommand
      ("ini:Engine.Engine.RenderDevice UseTrilinear False");
   PlayerOwner().Level.DetailChange(DM_High);
   PlayerOwner().Level.default.PhysicsDetailLevel = PDL_Medium;
   PlayerOwner().Level.default.DecalStayScale = 1;
   PlayerOwner().Level.PhysicsDetailLevel
      = PlayerOwner().Level.default.PhysicsDetailLevel;
   PlayerOwner().Level.DecalStayScale
      = PlayerOwner().Level.default.DecalStayScale;
   PlayerOwner().Level.SaveConfig();
   //   PlayerOwner().ConsoleCommand
   // ("set ini:Engine.Engine.AudioDevice LowQualitySound False");
   //   PlayerOwner().ConsoleCommand("SOUND_REBOOT");
   GraphicsDetailLevel = DTGFX_MED;
}


/****************************************************************
 * SetGraphicsDetailLow
 ****************************************************************
 */
function SetGraphicsDetailLow() {
   SetTextureDetail( DTGFX_LOW );
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice HighDetailActors False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Coronas True");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager Projectors False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager NoDynamicLights False");
   PlayerOwner().ConsoleCommand
      ("set ini:Engine.Engine.ViewportManager DecoLayers True");
   PlayerOwner().ConsoleCommand
      ("ini:Engine.Engine.RenderDevice UseTrilinear False");
   PlayerOwner().Level.DetailChange(DM_Low);
   PlayerOwner().Level.default.PhysicsDetailLevel = PDL_Low;
   PlayerOwner().Level.default.DecalStayScale = 0;
   PlayerOwner().Level.PhysicsDetailLevel
      = PlayerOwner().Level.default.PhysicsDetailLevel;
   PlayerOwner().Level.DecalStayScale
      = PlayerOwner().Level.default.DecalStayScale;
   PlayerOwner().Level.SaveConfig();
   // okay, technically this isn't a graphics thing, but it makes
   // things simpler for the user...
   // PlayerOwner().ConsoleCommand
   //  ("set ini:Engine.Engine.AudioDevice LowQualitySound True");
   // PlayerOwner().ConsoleCommand("SOUND_REBOOT");
   GraphicsDetailLevel = DTGFX_LOW;
}


/****************************************************************
 * SetTextureDetail
 ****************************************************************
 */
function SetTextureDetail( EGraphicsLevel level ) {
   local String t,v;

   Log( "Setting texture detail to" @ level );
   // figure out the command prefix and suffix...
   t = "set ini:Engine.Engine.ViewportManager TextureDetail";
   switch ( level ) {
   case DTGFX_HIGH:
      v = "UltraHigh";
      break;
   case DTGFX_MED:
      v = "Normal";
      break;
   case DTGFX_LOW:
   default:
      v = "UltraLow";
      break;
   }
   // perform the changes
   PlayerOwner().ConsoleCommand(t$"Terrain"@v);
   PlayerOwner().ConsoleCommand(t$"World"@v);
   //PlayerOwner().ConsoleCommand(t$"Rendermap"@v);
   PlayerOwner().ConsoleCommand(t$"Lightmap"@v);
   PlayerOwner().ConsoleCommand(t$"WeaponSkin"@v);
   PlayerOwner().ConsoleCommand(t$"PlayerSkin"@v);
   PlayerOwner().ConsoleCommand("flush");
}


/****************************************************************
 * UnHideVideoApply
 ****************************************************************
 */
function UnHideVideoApply( GUIComponent Sender ) {
   videoApplyButton.bVisible = true;
}


/****************************************************************
 * ApplyChanges
 ****************************************************************
 */
function bool ApplyChanges( GUIComponent Sender ) {
   local string DesiredRes;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

   DesiredRes = resolutionBox.Edit.GetText();
   if ( colorDepthBox.GetText() == BitDepthText[0] ) {
      Log( "setting to 16bit" );
      DesiredRes = DesiredRes$"x16";
   }
   else {
      Log( "setting to 32bit" );
      DesiredRes = DesiredRes$"x32";
   }
   // always play full screen
   DesiredRes = DesiredRes$"f";
   videoApplyButton.bVisible = false;
   PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit"
                          @( InStr(DesiredRes, "x16") != -1 ));
   PlayerOwner().ConsoleCommand( "setres" @ DesiredRes );

   Log ("Desired Res" @ DesiredRes);
   return true;
}


/****************************************************************
 * InternalOnSaveINI
 ****************************************************************
 */
function string InternalOnSaveINI(GUIComponent Sender);


/****************************************************************
 * InitDifficultyBox
 ****************************************************************
 */
function InitShadowBox(GUIComponent Sender, string s) {

    local int ID;
/*
     switch (Class'AdvancedGameInfo'.default.iUseShadows){
   case AdvancedGameInfo(Level.game).E_ShadowType.SHADOW_NONE:
  */
    switch ( Class'AdvancedGameInfo'.default.iUseShadows ) {
    case AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_NONE:
        Id = 0;
        break;
    case AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_PROJ:
        Id = 1;
        break;
    case AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_BLOB:
       Id = 2;
        break;
    //fall through to default...
    default:
        ID = 1;
    }

    ShadowBox.SetText(shadowtypes[Id].Label);
    ShadowBox.SetIndex( ID );
}

/****************************************************************
 * ShadowChange
 ****************************************************************
 */
function ShadowChange(GUIComponent Sender) {
   local int Id;

   if ( !bInitialized
        || ShadowBox.ItemCount() < shadowtypes.length )
   {
      return;
   }

   Id = GUIComboBox(Sender).getIndex();
   if ( GuiComboBox(Sender) != None) {
      SetShadowType(shadowTypes[ID].Type);
   }
}


/*****************************************************************
 * SetShadowType
 *****************************************************************
 */
function SetShadowType(int shadowtype){
    local AdvancedPawn temp;

    switch(ShadowType){
    case 0:
        class'AdvancedGameInfo'.default.iUseShadows = AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_NONE;
        break;
    case 1:
        class'AdvancedGameInfo'.default.iUseShadows = AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_PROJ;
        break;
    case 2:
        class'AdvancedGameInfo'.default.iUseShadows = AdvancedGameInfo(PlayerOwner().Level.Game).E_ShadowType.SHADOW_BLOB;
        break;
    }
    Class'AdvancedGameInfo'.static.StaticSaveConfig();

    //update the existing pawns
    foreach  PlayerOwner().allactors(class'AdvancedPawn', temp){
            temp.CheckShadow();
    }
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    GraphicsDetailLevel=2
    // Reference: GUILabel'DOTZVideoSettings.graphics_label'
    begin object name=graphics_label class=Class'GUI.GUILabel'
        Caption="Detail level"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.5500000
        WinLeft=0.2500000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    graphicsLabel=graphics_label
    // Reference: BBComboBox'DOTZVideoSettings.cComboBox2'
    begin object name=cComboBox2 class=Class'BBGui.BBComboBox'
        IniOption="@Internal"
        Hint="Choose how detailed the graphics are"
        WinTop=0.5500000
        WinLeft=0.4200000
        WinWidth=0.3000000
        TabOrder=1
        OnChange=DOTZVideoSettings.GraphicsChange
        OnLoadINI=DOTZVideoSettings.InternalOnLoadINI
        OnSaveINI=DOTZVideoSettings.InternalOnSaveINI
    end object
    GraphicsComboBox=cComboBox2
    // Reference: GUILabel'DOTZVideoSettings.video_label'
    begin object name=video_label class=Class'GUI.GUILabel'
        Caption="Video mode"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.2000000
        WinLeft=0.2500000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    videoLabel=video_label
    // Reference: GUILabel'DOTZVideoSettings.resolution_label'
    begin object name=resolution_label class=Class'GUI.GUILabel'
        Caption="Resolution"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.1000000
        WinLeft=0.2500000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    resolutionLabel=resolution_label
    // Reference: BBComboBox'DOTZVideoSettings.VideoResolution'
    begin object name=VideoResolution class=Class'BBGui.BBComboBox'
        IniOption="@INTERNAL"
        IniDefault="640x480"
        WinTop=0.1000000
        WinLeft=0.4200000
        WinWidth=0.3000000
        OnChange=DOTZVideoSettings.UnHideVideoApply
        OnLoadINI=DOTZVideoSettings.InternalOnLoadINI
        OnSaveINI=DOTZVideoSettings.InternalOnSaveINI
    end object
    resolutionBox=VideoResolution
    // Reference: BBComboBox'DOTZVideoSettings.VideoColorDepth'
    begin object name=VideoColorDepth class=Class'BBGui.BBComboBox'
        IniOption="@Internal"
        IniDefault="false"
        WinTop=0.2000000
        WinLeft=0.4200000
        WinWidth=0.3000000
        OnChange=DOTZVideoSettings.UnHideVideoApply
        OnLoadINI=DOTZVideoSettings.InternalOnLoadINI
        OnSaveINI=DOTZVideoSettings.InternalOnSaveINI
    end object
    colorDepthBox=VideoColorDepth
    BitDepthText[0]="16-bit Color"
    BitDepthText[1]="32-bit Color"
    // Reference: GUIButton'DOTZVideoSettings.VideoApply'
    begin object name=VideoApply class=Class'GUI.GUIButton'
        Caption="Apply Video Changes"
        StyleName="BBTextButton"
        bVisible=false
        Hint="Apply all changes to your video settings."
        WinTop=0.4000000
        WinLeft=0.3600000
        WinWidth=0.3000000
        WinHeight=0.0700000
        OnClick=DOTZVideoSettings.ApplyChanges
    end object
    videoApplyButton=VideoApply
    // Reference: GUILabel'DOTZVideoSettings.shadow_label1'
    begin object name=shadow_label1 class=Class'GUI.GUILabel'
        Caption="Shadows"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.6500000
        WinLeft=0.2500000
        WinWidth=0.3000000
        WinHeight=0.0500000
    end object
    ShadowLabel=shadow_label1
    // Reference: BBComboBox'DOTZVideoSettings.cComboBox7'
    begin object name=cComboBox7 class=Class'BBGui.BBComboBox'
        IniOption="@Internal"
        IniDefault="High Detail"
        StyleName="BBTextButton"
        Hint="Choose how difficult the game is"
        WinTop=0.6500000
        WinLeft=0.4200000
        WinWidth=0.3000000
        TabOrder=4
        OnChange=DOTZVideoSettings.ShadowChange
        OnLoadINI=DOTZVideoSettings.InitShadowBox
        OnSaveINI=DOTZVideoSettings.InternalOnSaveINI
    end object
    ShadowBox=cComboBox7
    // Reference: GUILabel'DOTZVideoSettings.gamma_label'
    begin object name=gamma_label class=Class'GUI.GUILabel'
        Caption="Gamma level"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.3000000
        WinLeft=0.2500000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    gammaLabel=gamma_label
    // Reference: BBGuiSlider'DOTZVideoSettings.gamma_slider'
    begin object name=gamma_slider class=Class'BBGui.BBGuiSlider'
        MaxValue=2.5000000
        IniOption="ini:Engine.Engine.ViewPortManager Gamma"
        IniDefault="1"
        Hint="Changes the gamma for the game."
        WinTop=0.3050000
        WinLeft=0.4100000
        OnChange=DOTZVideoSettings.SliderChange
    end object
    gammaSlider=gamma_slider
    graphicsLevels[0]="Low detail: best speed"
    graphicsLevels[1]="Medium detail"
    graphicsLevels[2]="High detail: best quality"
    DisplayModes[0]=(Width=640,Height=480)
    DisplayModes[1]=(Width=800,Height=500)
    DisplayModes[2]=(Width=800,Height=600)
    DisplayModes[3]=(Width=1024,Height=640)
    DisplayModes[4]=(Width=1024,Height=768)
    DisplayModes[5]=(Width=1152,Height=864)
    DisplayModes[6]=(Width=1280,Height=800)
    DisplayModes[7]=(Width=1280,Height=960)
    DisplayModes[8]=(Width=1280,Height=1024)
    DisplayModes[9]=(Width=1600,Height=1200)
    ClickSound=Sound'DOTZXInterface.Select'
    ShadowTypes[0]=(Label="None",Type=0)
    ShadowTypes[1]=(Label="High Detail",Type=1)
    ShadowTypes[2]=(Label="Low Detail",Type=2)
    WinTop=55.9805000
    WinHeight=0.8078130
}