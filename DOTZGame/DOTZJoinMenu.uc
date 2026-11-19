/**
 * DOTZJoinMenu
 * -contains all the multiplayer join game panels
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    May 2005
 */
class DOTZJoinMenu extends DOTZMultiPlayerBase;




var Automated GUITabControl TabC;

//All the panels
var DOTZMultiPlayerClientPanel InternetListPage;
var DOTZMultiPlayerClientPanel DirectConnectionPage;
var DOTZMultiPlayerClientPanel FilterPage;
var DOTZMultiPlayerClientPanel LANPage;

var bool bCreatedQueryTabs;
var bool bCreatedStandardTabs;
var string PageCaption;

var bool bInitialized;

//A reference to the controls that are on the panels
var BBComboBox Filter_GameTypeBox;
const FILTER_GAMETYPE = 0;

var moCheckBox Filter_FullServerBox;
const FILTER_FULLSERVER = 2;

var moCheckBox Filter_PasswordBox;
const FILTER_PASSWORD = 4;

/*****************************************************************
 * InitComponents
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    Super.InitComponent(MyController, MyOwner);

    //make page pretty
    SetPageCaption(PageCaption);
    AddBackButton();

    // delegates
    OnClose = InternalOnClose;

    // Add pages
    if(!bCreatedStandardTabs){
       AddBrowserPage(InternetListPage, "Internet");
       AddBrowserPage(FilterPage, "Internet Filter");
       AddBrowserPage(LANPage, "LAN");
       AddBrowserPage(DirectConnectionPage, "Connect to IP");
       bCreatedStandardTabs=true;
    }

    //add references to the sub controls
    Filter_GameTypeBox = BBComboBox(FilterPage.Controls[FILTER_GAMETYPE]);
    Filter_FullServerBox = moCheckBox(FilterPage.Controls[FILTER_FULLSERVER]);
    Filter_PasswordBox = moCheckBox(FilterPage.Controls[FILTER_PASSWORD]);
    bInitialized = true;
}

/*****************************************************************
 *
 *****************************************************************
 */
function AddBrowserPage( DOTZMultiPlayerClientPanel NewPage, string caption )
{
    TabC.AddTab(Caption,"", NewPage);
    NewPage.ParentPage = self;
}

/*****************************************************************
 * TabChange
 *****************************************************************
 */
function TabChange( GUIComponent Sender ) {
   if ( GUITabButton(Sender) == none ) return;
   if (!bInitialized) return;
  	PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
}


/*****************************************************************
 * InternalOnClose
 *****************************************************************
 */
function InternalOnClose(optional Bool bCanceled)
{
    local int i;
    for( i=0;i<TabC.TabStack.Length;i++ ){
        DOTZMultiPlayerClientPanel(TabC.TabStack[i].MyPanel).OnCloseBrowser();
    }
    Super.OnClose(bCanceled);
}



// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUITabControl'DOTZJoinMenu.ServerBrowserTabs'
    begin object name=ServerBrowserTabs class=Class'GUI.GUITabControl'
        bDockPanels=true
        TabHeight=0.0500000
        bAcceptsInput=true
        WinTop=0.1650000
        WinLeft=0.1100000
        WinHeight=48.0000000
        OnChange=DOTZJoinMenu.TabChange
    end object
    TabC=ServerBrowserTabs
    // Reference: DOTZMultiPlayerClientPanelServerList'DOTZJoinMenu.InternetListPanel'
    begin object name=InternetListPanel class=Class'DOTZMultiPlayerClientPanelServerList'
    end object
    InternetListPage=InternetListPanel
    // Reference: DOTZMultiPlayerClientPanelManual'DOTZJoinMenu.DirectConnectionPanel'
    begin object name=DirectConnectionPanel class=Class'DOTZMultiPlayerClientPanelManual'
    end object
    DirectConnectionPage=DirectConnectionPanel
    // Reference: DOTZMultiPlayerClientPanelFilter'DOTZJoinMenu.FilterPanel'
    begin object name=FilterPanel class=Class'DOTZMultiPlayerClientPanelFilter'
    end object
    FilterPage=FilterPanel
    // Reference: DOTZMultiPlayerClientPanelLAN'DOTZJoinMenu.LANPanel'
    begin object name=LANPanel class=Class'DOTZMultiPlayerClientPanelLAN'
    end object
    LANPage=LANPanel
    PageCaption="Join Multiplayer"
    Background=Texture'DOTZTInterface.Menu.MultiplayerBackground'
    OnKeyEvent=DOTZJoinMenu.HandleKeyEvent
}