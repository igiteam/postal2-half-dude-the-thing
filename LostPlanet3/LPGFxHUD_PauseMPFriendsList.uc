class LPGFxHUD_PauseMPFriendsList extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Friends;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentSelectedFriendIndex;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    RegisterDelegates();
    OnlineSub.PlayerInterface.ReadFriendsList(byte(Outer.GetLP().ControllerId));
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    UnregisterDelegates();
    //return;    
}

function RegisterDelegates()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.AddFriendsChangeDelegate(byte(Outer.GetLP().ControllerId), OnFriendsChange);
    OnlineSub.PlayerInterface.AddReadFriendsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadFriendsComplete);
    //return;    
}

function UnregisterDelegates()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ClearFriendsChangeDelegate(byte(Outer.GetLP().ControllerId), OnFriendsChange);
    OnlineSub.PlayerInterface.ClearReadFriendsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadFriendsComplete);
    //return;    
}

function OnFriendsChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ReadFriendsList(byte(Outer.GetLP().ControllerId));
    //return;    
}

function OnReadFriendsComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x2F
    if(bWasSuccessful && bIsTopView)
    {
        UpdateListDataProvider(SavedSelectedIndex);
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AllFriends;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Friend, OnlineSub;

    0
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    Friends.Remove(0, Friends.Length);    
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendsList(byte(Outer.GetLP().ControllerId), AllFriends);
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x102:

    // End:0x28E [Loop If]
    if(int(I) < AllFriends.Length)
    {
        Friend = AllFriends[int(I)];
        // End:0x160
        if(!Friend.bIsOnline)
        {            
        }
        else
        {
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("label", Friend.NickName);
            TempObj.SetString("control", "menu");
            TempObj.SetBool("bUpdateFromUnreal", true);
            DataProvider.SetElementObject(Friends.Length, TempObj);
            Friends.AddItem(Friend);            
        }
        I++;
        // [Loop Continue]
        goto J0x102;
    }
    ListMC.SetString("wrapping", ((Friends.Length > 0) ? "wrap" : "normal"));
    ListMC.SetObject("dataProvider", DataProvider);
    ListDataProvider = ListMC.GetObject("dataProvider");
    ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    CurrentSelectedFriendIndex = -1;
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    CurrentSelectedFriendIndex = ev.Index;
    Select_Friend();
    //return;    
}

function Select_Friend()
{
    UnregisterDelegates();
    MenuViewLoader.PushViewByName('ConfirmFriend', self);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.PauseMenu.FriendsList>"
    bDisableRenderer3DEffects=true
}