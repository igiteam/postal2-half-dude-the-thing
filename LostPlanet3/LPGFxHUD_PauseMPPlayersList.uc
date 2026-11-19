class LPGFxHUD_PauseMPPlayersList extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedPlayerIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayerList;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MyGRI = Outer.GetPC().WorldInfo.GRI;
    RegisterUpdate();
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    UnregisterUpdate();
    //return;    
}

function RegisterUpdate()
{
    Outer.GetPC().SetTimer(0.1000000, true, 'UpdatePlayerList', self);
    //return;    
}

function UnregisterUpdate()
{
    Outer.GetPC().ClearTimer('UpdatePlayerList', self);
    //return;    
}

function UpdatePlayerList()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPRI;
    local /*0x97E50000-0x00000000*/ private int PlayerCount, I;

    MyPRI = Outer.GetPC().PlayerReplicationInfo;
    I = 0;
    J0x49:

    // End:0x10A [Loop If]
    if(I < MyGRI.PRIArray.Length)
    {
        // End:0xFC
        if((MyGRI.PRIArray[I] != MyPRI) && !MyGRI.PRIArray[I].bBot)
        {
            PlayerCount++;
        }
        I++;
        // [Loop Continue]
        goto J0x49;
    }
    // End:0x12D
    if(PlayerList.Length != PlayerCount)
    {
        UpdateListDataProvider();
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj, MyPRI;

    0
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    PlayerList.Length = 0;
    DataProvider = Outer.CreateArray();
    MyPRI = Outer.GetPC().PlayerReplicationInfo;
    I = 0;
    J0x97:

    // End:0x2B7 [Loop If]
    if(int(I) < MyGRI.PRIArray.Length)
    {
        // End:0x2A9
        if((MyGRI.PRIArray[int(I)] != MyPRI) && !MyGRI.PRIArray[int(I)].bBot)
        {
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("label", MyGRI.PRIArray[int(I)].PlayerName);
            TempObj.SetString("control", "menu");
            TempObj.SetBool("bUpdateFromUnreal", true);
            DataProvider.SetElementObject(PlayerList.Length, TempObj);
            PlayerList.AddItem(MyGRI.PRIArray[int(I)]);            
        }
        I++;
        // [Loop Continue]
        goto J0x97;
    }
    ListMC.SetString("wrapping", ((PlayerList.Length > 0) ? "wrap" : "normal"));
    ListMC.SetObject("dataProvider", DataProvider);
    ListDataProvider = ListMC.GetObject("dataProvider");
    ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    SelectedPlayerIndex = -1;
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedPlayerIndex = ev.Index;
    Select_Player();
    //return;    
}

function Select_Player()
{
    UnregisterUpdate();
    MenuViewLoader.PushViewByName('ConfirmPlayer', self);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.PauseMenu.PlayersList>"
    bDisableRenderer3DEffects=true
}