/**
 *
 *
 * @author  Jesse LaChapelle (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    July 2004
 */
class DOTZStoryMenu extends DOTZStoryBase;



var string StoryType;

//Controls
var Automated GUIButton   BackButton;

//var Automated array<GUIButton> ChapterButton; doesn't work...forget it
var Automated GUILabel Chapter1Label;
var Automated GUILabel Chapter2Label;
var Automated GUILabel Chapter3Label;
var Automated GUILabel Chapter4Label;
var Automated GUILabel Chapter5Label;
var Automated GUILabel Chapter6Label;
var Automated GUILabel Chapter7Label;
var Automated GUILabel Chapter8Label;
var Automated GUILabel Chapter9Label;
var Automated GUILabel Chapter10Label;
var Automated GUILabel Chapter11Label;

var Automated GUIButton   Chapter1Button;
var Automated GUIButton   Chapter2Button;
var Automated GUIButton   Chapter3Button;
var Automated GUIButton   Chapter4Button;
var Automated GUIButton   Chapter5Button;
var Automated GUIButton   Chapter6Button;
var Automated GUIButton   Chapter7Button;
var Automated GUIButton   Chapter8Button;
var Automated GUIButton   Chapter9Button;
var Automated GUIButton   Chapter10Button;
var Automated GUIButton   Chapter11Button;
var Automated GUILabel    Title;

//internal
var int escHack;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){

    Super.InitComponent(MyController, MyOwner);

    //i.e. if at chapter one, then chapter 2 on is disabled
    switch (ChapterMax){
    case 0:
//        Chapter1Button.bVisible = false;
        Chapter1Button.MenuState = MSAT_Disabled;
    case 1:
//        Chapter2Button.bVisible = false;
        Chapter2Button.MenuState = MSAT_Disabled;
    case 2:
//        Chapter3Button.bVisible = false;
        Chapter3Button.MenuState = MSAT_Disabled;
    case 3:
//        Chapter4Button.bVisible = false;
        Chapter4Button.MenuState = MSAT_Disabled;
    case 4:
//        Chapter5Button.bVisible = false;
        Chapter5Button.MenuState = MSAT_Disabled;
    case 5:
//        Chapter6Button.bVisible = false;
        Chapter6Button.MenuState = MSAT_Disabled;
    case 6:
//        Chapter7Button.bVisible = false;
        Chapter7Button.MenuState = MSAT_Disabled;
    case 7:
//        Chapter8Button.bVisible = false;
        Chapter8Button.MenuState = MSAT_Disabled;
    case 8:
//        Chapter9Button.bVisible = false;
        Chapter9Button.MenuState = MSAT_Disabled;
    case 9:
//        Chapter10Button.bVisible = false;
        Chapter10Button.MenuState = MSAT_Disabled;
    case 10:
        //Chapter11Button.bNeverFocus = true; // bVisible = false;
        Chapter11Button.MenuState = MSAT_Disabled;


    }
}

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied
 * here.
 *
 * Param1 - the menu to load
 * Param2 - the name of the sub menu to load on top of the first menu
 *****************************************************************
 */
event HandleParameters( String aStoryType, String param2 ) {
    StoryType = aStoryType;
}

/*****************************************************************
 * SelectChapter
 *****************************************************************
 */
function bool SelectChapter( GUIComponent Sender){

    local string ChapterNum;

  	PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Sender){
    case Chapter1Button:
        ChapterNum = "1"; break;
    case Chapter2Button:
        ChapterNum = "2"; break;
    case Chapter3Button:
        ChapterNum = "3"; break;
    case Chapter4Button:
        ChapterNum = "4"; break;
    case Chapter5Button:
        ChapterNum = "5"; break;
    case Chapter6Button:
        ChapterNum = "6"; break;
    case Chapter7Button:
        ChapterNum = "7"; break;
    case Chapter8Button:
        ChapterNum = "8"; break;
    case Chapter9Button:
        ChapterNum = "9"; break;
    case Chapter10Button:
        ChapterNum = "10"; break;
    case Chapter11Button:
        ChapterNum = "11"; break;
    default:
        return true;
    }
    return Controller.OpenMenu("DOTZMenu.DOTZStoryPageMenu", ChapterNum);
}


/*****************************************************************
 * ButtonClicked
 * Back button selected do nothing here!
 *****************************************************************
 */
function bool BackButtonClicked( GUIComponent Sender ) {
   PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   Controller.CloseMenu( true );
   return true;
}


/*****************************************************************
 * HandleKeyEvent
 *****************************************************************
 */
/*function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

    //ESC IS PRESSED
    if (Key==0x1B) {
       if (escHack == 0){
          escHack = 1;
          return true;
       }
       Controller.CloseMenu(true);
    }
    return true;
}*/




//===========================================================================
// DefaultProperties
//===========================================================================

                                                     //Caption="Chapter 1 : Home              "

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZStoryMenu.MyBackButton'
    begin object name=MyBackButton class=Class'GUI.GUIButton'
        Caption="Back"
        StyleName="BBSquareButton"
        Hint="Return to the previous menu"
        WinTop=0.9000000
        WinLeft=0.4200000
        WinWidth=0.1800000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.BackButtonClicked
    end object
    BackButton=MyBackButton
    // Reference: GUILabel'DOTZStoryMenu.CH1_Label'
    begin object name=CH1_Label class=Class'GUI.GUILabel'
        Caption="Chapter 1 : Home"
        StyleName="BBSquareButton"
        WinTop=0.3000000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
    end object
    Chapter1Label=CH1_Label
    // Reference: GUILabel'DOTZStoryMenu.CH2_Label'
    begin object name=CH2_Label class=Class'GUI.GUILabel'
        Caption="Chapter 2 : My Neighbors"
        StyleName="BBSquareButton"
        WinTop=0.3600000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
    end object
    Chapter2Label=CH2_Label
    // Reference: GUILabel'DOTZStoryMenu.CH3_Label'
    begin object name=CH3_Label class=Class'GUI.GUILabel'
        Caption="Chapter 3 : Main Street"
        StyleName="BBSquareButton"
        WinTop=0.4200000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter3Label=CH3_Label
    // Reference: GUILabel'DOTZStoryMenu.CH4_Label'
    begin object name=CH4_Label class=Class'GUI.GUILabel'
        Caption="Chapter 4 : The Doctor"
        StyleName="BBSquareButton"
        WinTop=0.4800000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter4Label=CH4_Label
    // Reference: GUILabel'DOTZStoryMenu.CH5_Label'
    begin object name=CH5_Label class=Class'GUI.GUILabel'
        Caption="Chapter 5 : Inferno"
        StyleName="BBSquareButton"
        WinTop=0.5400000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter5Label=CH5_Label
    // Reference: GUILabel'DOTZStoryMenu.CH6_label'
    begin object name=CH6_label class=Class'GUI.GUILabel'
        Caption="Chapter 6 : Alleyways"
        StyleName="BBSquareButton"
        WinTop=0.6000000
        WinLeft=0.2600000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter6Label=CH6_label
    // Reference: GUILabel'DOTZStoryMenu.CH7_label'
    begin object name=CH7_label class=Class'GUI.GUILabel'
        Caption="Chapter 7 : Police Station"
        StyleName="BBSquareButton"
        WinTop=0.3000000
        WinLeft=0.5300000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter7Label=CH7_label
    // Reference: GUILabel'DOTZStoryMenu.CH8_label'
    begin object name=CH8_label class=Class'GUI.GUILabel'
        Caption="Chapter 8 : Covering Fire"
        StyleName="BBSquareButton"
        WinTop=0.3600000
        WinLeft=0.5300000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter8Label=CH8_label
    // Reference: GUILabel'DOTZStoryMenu.CH9_label'
    begin object name=CH9_label class=Class'GUI.GUILabel'
        Caption="Chapter 9 : Sewers"
        StyleName="BBSquareButton"
        WinTop=0.4200000
        WinLeft=0.5300000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter9Label=CH9_label
    // Reference: GUILabel'DOTZStoryMenu.CH10_label'
    begin object name=CH10_label class=Class'GUI.GUILabel'
        Caption="Chapter 10 : Safe House "
        StyleName="BBSquareButton"
        WinTop=0.4800000
        WinLeft=0.5300000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter10Label=CH10_label
    // Reference: GUILabel'DOTZStoryMenu.CH11_label'
    begin object name=CH11_label class=Class'GUI.GUILabel'
        Caption="Chapter 11 : Getaway      "
        StyleName="BBSquareButton"
        WinTop=0.5400000
        WinLeft=0.5300000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter11Label=CH11_label
    // Reference: GUIButton'DOTZStoryMenu.CH1_button'
    begin object name=CH1_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.3000000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter1Button=CH1_button
    // Reference: GUIButton'DOTZStoryMenu.CH2_button'
    begin object name=CH2_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.3600000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter2Button=CH2_button
    // Reference: GUIButton'DOTZStoryMenu.CH3_button'
    begin object name=CH3_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.4200000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter3Button=CH3_button
    // Reference: GUIButton'DOTZStoryMenu.CH4_button'
    begin object name=CH4_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.4800000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter4Button=CH4_button
    // Reference: GUIButton'DOTZStoryMenu.CH5_button'
    begin object name=CH5_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.5400000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter5Button=CH5_button
    // Reference: GUIButton'DOTZStoryMenu.CH6_button'
    begin object name=CH6_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.6000000
        WinLeft=0.2500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter6Button=CH6_button
    // Reference: GUIButton'DOTZStoryMenu.CH7_button'
    begin object name=CH7_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.3000000
        WinLeft=0.5200000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter7Button=CH7_button
    // Reference: GUIButton'DOTZStoryMenu.CH8_button'
    begin object name=CH8_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.3600000
        WinLeft=0.5200000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter8Button=CH8_button
    // Reference: GUIButton'DOTZStoryMenu.CH9_button'
    begin object name=CH9_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.4200000
        WinLeft=0.5200000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter9Button=CH9_button
    // Reference: GUIButton'DOTZStoryMenu.CH10_button'
    begin object name=CH10_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.4800000
        WinLeft=0.5200000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter10Button=CH10_button
    // Reference: GUIButton'DOTZStoryMenu.CH11_button'
    begin object name=CH11_button class=Class'GUI.GUIButton'
        StyleName="BBSquareButton"
        WinTop=0.5400000
        WinLeft=0.5200000
        WinWidth=0.2500000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryMenu.SelectChapter
    end object
    Chapter11Button=CH11_button
    // Reference: GUILabel'DOTZStoryMenu.The_title'
    begin object name=The_title class=Class'GUI.GUILabel'
        Caption="The Story"
        TextAlign=1
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="BigGuiFont"
        WinTop=0.0300000
        WinLeft=0.4000000
        WinWidth=0.2000000
        WinHeight=0.1000000
    end object
    Title=The_title
    OnKeyEvent=DOTZStoryMenu.HandleKeyEvent
}