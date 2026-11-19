/**
 *
 *
 * @author  Jesse LaChapelle (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    July 2004
 */
class DOTZStoryBase extends DOTZSinglePlayerBase;



var int ChapterMax;
var int PageMax;
var sound ClickSound;

/*****************************************************************
 * InitComponent
 * Sets the values of the max page and the max chapter when the
 * page is initialized
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){
    super.InitComponent(MyController, MyOwner);
    SetBounds();
}

/*****************************************************************
 *
 *****************************************************************
 */
function SetBounds(){
    //Conditions to use local game settings
    /*if (ParentPage == none ||
        DOTZStoryMenu(ParentPage).StoryType == "local" ||
        DOTZMainMenu(ParentPage).StoryType == "local" ||
        DOTZInGameMenu(ParentPage).StoryType == "local" )
    {
        ChapterMax = DOTZGameInfoBase(PlayerOwner().Level.Game).CurrentChapter;
        PageMax = DOTZGameInfoBase(PlayerOwner().Level.Game).CurrentPage;

    //otherwise use global settings
    }else {
        ChapterMax = class'DOTZGameInfoBase'.static.GetBestChapter();
        PageMax = class'DOTZGameInfoBase'.static.GetBestPage();
    }*/
}


// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
}