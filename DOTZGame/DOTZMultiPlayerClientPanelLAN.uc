/**
 * A one-page configuration panel, which covers coarse graphics and
 * sound settings.
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.19 $
 * @date    Oct 2003
 */
class DOTZMultiPlayerClientPanelLAN extends DOTZMultiPlayerClientPanel;

var LANQueryClient LQC;
var GUIButton RefreshButton;
var GUIButton NextButton;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.Initcomponent(MyController, MyOwner);

   MyServersList = DOTZBrowser_ServersList(GUIMultiColumnListBox(Controls[0]).List);
   RefreshButton = GUIButton(Controls[1]);
   NextButton = GUIButton(Controls[2]);
   NextButton.OnClick=OnNext;
   MyServersList.MyPage        = Self;

	if( LQC == none )
	{
		LQC = PlayerOwner().Level.Spawn( class'LANQueryClient' );
		LQC.OnReceivedPingInfo = MyReceivedPingInfo;
		LQC.OnPingTimeout      = MyServersList.MyPingTimeout;
	}

   RefreshButton.OnClick=RefreshClick;
	// Change server list spacing a bit (no icons)
//	MyServersList.InitColumnPerc[0]=0.0;
//	MyServersList.InitColumnPerc[1]=0.47;
//	MyServersList.InitColumnPerc[2]=0.25;
//	MyServersList.InitColumnPerc[3]=0.13;
//	MyServersList.InitColumnPerc[4]=0.15;

	RefreshList();
}

/*****************************************************************
 * Next Button
 *****************************************************************
 */
function bool OnNext( GUIComponent Sender ) {

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    MyServersList.Connect(false);
    return true;
}

/*****************************************************************
 * RefreshClick
 * calls refresh list
 *****************************************************************
 */
function bool RefreshClick(GUIComponent Sender)
{
   log(self @ "refreshclick");
 PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    RefreshList();
    return true;
}

function OnCloseBrowser()
{
	if( LQC != none )
	{
		LQC.Destroy();
		LQC = None;
	}
}

function MyReceivedPingInfo( int ServerID, ServerQueryClient.EPingCause PingCause, GameInfo.ServerResponseLine s ){
	local int i;
	if( ServerID < 0 ){
		for( i=0;i<MyServersList.Servers.Length;i++ ){
			// dupe
			if( MyServersList.Servers[i].IP==s.IP && MyServersList.Servers[i].Port==s.Port )
				return;
		}
		MyServersList.MyOnReceivedServer( s );
	}	else	{
		MyServersList.MyReceivedPingInfo( ServerID, PingCause, s );
	}
}


function PingServer( int listid, ServerQueryClient.EPingCause PingCause, GameInfo.ServerResponseLine s ){
	LQC.PingServer( listid, PingCause, s.IP, s.QueryPort, QI_RulesAndPlayers, s );
}

function CancelPings()
{
	LQC.CancelPings();
}

function RefreshList()
{
	MyServersList.Clear();
	CancelPings();
	LQC.BroadcastPingRequest();
}

function ShowPanel(bool bShow){
   super.ShowPanel(bShow);
   MyServersList.bLanQuery = true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: BBGUIMultiColumnListBox'DOTZMultiPlayerClientPanelLAN.ServerListBox'
    begin object name=ServerListBox class=Class'BBGui.BBGUIMultiColumnListBox'
        DefaultListClass="DOTZMenu.DOTZBrowser_ServersList"
        bVisibleWhenEmpty=true
        bNeverFocus=true
        WinTop=0.0750000
        WinLeft=0.1250000
        WinWidth=0.7500000
        WinHeight=0.6500000
    end object
    Controls[0]=ServerListBox
    // Reference: GUIButton'DOTZMultiPlayerClientPanelLAN.aRefreshButton'
    begin object name=aRefreshButton class=Class'GUI.GUIButton'
        Caption="Refresh List"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7500000
        WinLeft=0.1500000
        WinWidth=0.1500000
        WinHeight=0.0500000
        bFocusOnWatch=true
        RenderWeight=1.0000000
    end object
    Controls[1]=aRefreshButton
    // Reference: GUIButton'DOTZMultiPlayerClientPanelLAN.NextButtonLabel_lbl'
    begin object name=NextButtonLabel_lbl class=Class'GUI.GUIButton'
        Caption="Next"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7500000
        WinLeft=0.7000000
        WinWidth=0.1500000
        WinHeight=0.0500000
    end object
    Controls[2]=NextButtonLabel_lbl
}