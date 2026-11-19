/**
 *
 *
 * @author  Jesse LaChapelle (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    July 2004
 */
class DOTZStoryPageMenu extends DOTZStoryBase
config(Story);




//Controls
var Automated GUIButton   BackButton;
var Automated GUIButton   NextButton;
var Automated GUIButton   PreviousButton;
var Automated GUIImage    StoryImage;
var Automated GUILabel    StoryBox;


//internal
//var int escHack;
var int CurrentPage;
var int CurrentChapter;
var int AudioDelay;
var sound HackChapterSound;
var sound CurrentSound;
var int HackPlayed;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){
    Super.InitComponent(MyController, MyOwner);
//    StopSound();
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
event HandleParameters( String ChapterNum, String PageNum ) {

    if (ChapterNum != ""){
        Log("OPENING CHAPTER : " $ ChapterNum);
        if (int(PageNum) == 0){
            CurrentPage = 1;
        } else {
            CurrentPage = int(PageNum);
        }
        CurrentChapter = int(ChapterNum);
        AudioDelay = 2;
        PreviousButton.Hide();
        SetImageAndText(CurrentChapter,CurrentPage,true);
    }
}


/*****************************************************************
 * Timer to play sounds after audio has initialized
 *****************************************************************
 */
function Timer(){
    super.Timer();

    if (HackPlayed < AudioDelay){
        HackPlayed++;
        Log ("Hack");
    } else {
        Log("Playing : " $ HackChapterSound);
        HackPlayed = 0;
        SetTimer(0,false);
        PlayerOwner().Pawn.PlayOwnedSound(HackChapterSound,SLOT_Interface,1.0);
    }

    //if this is the first timer, then do it again. you are not ready
    /*
    if (HackPlayed == false){
        Log("Whoops, not ready, set another timer");
        Settimer(1,false);
        HackPlayed = true;
        return;
    }
    */

}



/*****************************************************************
 * SetImageAndText
 *****************************************************************
 */
function SetImageAndText(int ChapterNum, int PageNum, optional bool bDelayaudio){

    local array<Chapters.PageStruct> PageList;
    local int PageIndex;
    PageIndex = PageNum - 1;

    switch (ChapterNum){
    case 1:
        PageList = class'ChapterOne'.default.Page;
        break;
    case 2:
        PageList = class'ChapterTwo'.default.Page;
        break;
    case 3:
        PageList = class'ChapterThree'.default.Page;
        break;
    case 4:
        PageList = class'ChapterFour'.default.Page;
        break;
    case 5:
        PageList = class'ChapterFive'.default.Page;
        break;
    case 6:
        PageList = class'ChapterSix'.default.Page;
        break;
    case 7:
        PageList = class'ChapterSeven'.default.Page;
        break;
    case 8:
        PageList = class'ChapterEight'.default.Page;
        break;
    case 9:
        PageList = class'ChapterNine'.default.Page;
        break;
    case 10:
        PageList = class'ChapterTen'.default.Page;
        break;
    case 11:
        PageList = class'ChapterEleven'.default.Page;
        break;
    }

    //if there is a new page to display
    Log("There are : " $ PageList.length $ " Pages to display");
    Log("Currently trying to display " $ CurrentPage);


    if (PageNum <= PageList.Length && PageNum >= 1 &&
        AllowedToDisplay(ChapterNum, PageNum)){

        //set page appearence, and save audio for later
        CurrentPage = PageNum;
        Background = PageList[PageIndex].image;
        StoryBox.Caption = PageList[PageIndex].text;

        HackChapterSound = PageList[PageIndex].Audio;

//        AudioDelay=default.AudioDelay;

        Log("Value of text  : " $ PageList[PageIndex].text);
        Log("Value of image : " $ PageList[PageIndex].image);
        Log("Value of sound : " $ PageList[PageIndex].Audio);


        //SetTimer(2,false); // old school timer to play audio
        if (bDelayAudio == false){
            PlayerOwner().Pawn.PlayOwnedSound(HackChapterSound,SLOT_Interface,1.0);
        } else {
            StopSound();
            Log("Setting a timer for " $ AudioDelay $ " seconds now");
//            SetTimer(AudioDelay,false); // old school timer to play audio
            SetTimer(1,true); // old school timer to play audio
        }


    } else {
         //if (PageNum <= PageList.Length){
            TestForUnpause();
         //}
         StopSound();
         //TODO: add a case for the end of the book
         Controller.CloseMenu( true );
    }

    if (CurrentPage == 1){
       PreviousButton.Hide();
    } else {
      PreviousButton.Show();
    }

}


/*****************************************************************
 * StopSound
 *****************************************************************
 */
function StopSound(){
    //can't stop a sound, but you can clobber playing sounds with another that
    //has a very low volume
    PlayerOwner().Pawn.PlaySound(HackChapterSound,SLOT_Interface,0.0001);
    SetTimer(0,false);
}


/*****************************************************************
 * AllowedToDisplay
 * Check the values given against the values you can display.
 *****************************************************************
 */
function bool AllowedToDisplay(int TheChapter, int ThePage){

    local int revealledChapter, revealledPage;

    revealledChapter = ChapterMax; //class'DOTZGameInfoBase'.static.GetBestChapter();
    revealledPage = PageMax; //class'DOTZGameInfoBase'.static.GetBestPage();

    //if trying to access a chapter less than the currently revealled
    if ( TheChapter < revealledChapter){
        return true;

    //if current chapter check if the page is revealled yet
    } else if (TheChapter == revealledChapter){


        //and the page is -1 or less than the system's currentpage
        if ( revealledPage == -1 || ThePage <= revealledPage){
            return true;
        }
    }

    //otherwise not revealled yet
    return false;

}

/*****************************************************************
 * BackButtonClicked
 * Back button selected do nothing here!
 *****************************************************************
 */
function bool BackButtonClicked( GUIComponent Sender ) {
   TestForUnpause();
   SetTimer(0,false);
   PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   Controller.CloseMenu( true );
   return true;
}


/*****************************************************************
 * NextButtonClicked
 *****************************************************************
 */
function bool NextButtonClicked( GUIComponent Sender ) {
   SetTimer(0,false);
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   SetImageAndText(CurrentChapter,CurrentPage + 1);
   return true;
}


/*****************************************************************
 * PreviousButtonClicked
 *****************************************************************
 */
function bool PreviousButtonClicked (GUIComponent Sender){
  SetTimer(0,false);
  PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
  SetImageAndText(CurrentChapter,CurrentPage - 1);
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
           StopSound();
           Log("Stop Sound done");
          escHack = 1;
          return true;
       }
       Log("Unpause done");
       TestForUnPause();
       Controller.CloseMenu(true);
    }
    return true;
}*/

/*****************************************************************
 * TestForUnpause
 * if accessed from the game, then return to the game
 *****************************************************************
 */
function TestForUnPause(){
    if (ParentPage == none){
        PlayerOwner().Level.GetLocalPlayerController().SetPause(false);
    }
}


//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'DOTZStoryPageMenu.MyBackButton'
    begin object name=MyBackButton class=Class'GUI.GUIButton'
        Caption="Close"
        StyleName="BBSquareButton"
        Hint="Return to the previous menu"
        WinTop=0.9000000
        WinLeft=0.0600000
        WinWidth=0.1800000
        WinHeight=0.0500000
        RenderWeight=0.9000000
        OnClick=DOTZStoryPageMenu.BackButtonClicked
    end object
    BackButton=MyBackButton
    // Reference: GUIButton'DOTZStoryPageMenu.MyNextButton'
    begin object name=MyNextButton class=Class'GUI.GUIButton'
        Caption="Next"
        StyleName="BBSquareButton"
        WinTop=0.9000000
        WinLeft=0.7700000
        WinWidth=0.3500000
        WinHeight=0.0800000
        RenderWeight=0.9000000
        OnClick=DOTZStoryPageMenu.NextButtonClicked
    end object
    NextButton=MyNextButton
    // Reference: GUIButton'DOTZStoryPageMenu.MyPreviousButton'
    begin object name=MyPreviousButton class=Class'GUI.GUIButton'
        Caption="Previous"
        StyleName="BBSquareButton"
        WinTop=0.9000000
        WinLeft=0.5700000
        WinWidth=0.3500000
        WinHeight=0.0800000
        RenderWeight=0.9000000
        OnClick=DOTZStoryPageMenu.PreviousButtonClicked
    end object
    PreviousButton=MyPreviousButton
    // Reference: GUIImage'DOTZStoryPageMenu.logo_img'
    begin object name=logo_img class=Class'GUI.GUIImage'
        ImageStyle=2
        WinTop=0.0400000
        WinLeft=0.0250000
        WinWidth=0.9000000
        WinHeight=0.8000000
        RenderWeight=0.8000000
    end object
    StoryImage=logo_img
    // Reference: GUILabel'DOTZStoryPageMenu.StoryText_edit'
    begin object name=StoryText_edit class=Class'GUI.GUILabel'
        bMultiLine=true
        StyleName="BBSquareButton"
        WinTop=0.0700000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.2000000
        RenderWeight=0.9000000
    end object
    StoryBox=StoryText_edit
    AudioDelay=1
    OnKeyEvent=DOTZStoryPageMenu.HandleKeyEvent
}