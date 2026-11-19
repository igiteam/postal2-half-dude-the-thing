interface OnlinePlayerInterface extends Interface
    abstract;

delegate OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    //return;    
}

delegate OnLoginCancelled()
{
    //return;    
}

delegate OnMutingChange()
{
    //return;    
}

delegate OnFriendsChange()
{
    //return;    
}

function ShowLoginUI()
{
    local /*0x35EA0000-0x00000000*/ private bool bShowOnlineOnly[9437185], bAllowGuest, ReturnValue;

    false
    true
    //return ReturnValue;    
}

function Login()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LoginName[8388609], Password;
    local /*0x35EA0000-0x00000000*/ private bool bWantsLocalOnly[9437185], ReturnValue;

    //return ReturnValue;    
}

function AutoLogin()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnLoginFailed()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ErrorCode;

    //return;    
}

function AddLoginFailedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginDelegate[8388609];

    //return;    
}

function ClearLoginFailedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginDelegate[8388609];

    //return;    
}

function Logout()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnLogoutCompleted()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddLogoutCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LogoutDelegate[8388609];

    //return;    
}

function ClearLogoutCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LogoutDelegate[8388609];

    //return;    
}

function GetLoginStatus()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function GetUniquePlayerId()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetPlayerNickname()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function IsGuestLogin()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsLocalLogin()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CanPlayOnline()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function CanCommunicate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function CanDownloadUserContent()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function CanPurchaseContent()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function CanViewPlayerProfiles()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function CanShowPresenceInformation()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], ReturnValue;

    //return ReturnValue;    
}

function IsFriend()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsBlocklisted()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AreAnyFriends()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Query[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsMuted()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowFriendsUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddLoginChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginDelegate[8388609];

    //return;    
}

function ClearLoginChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginDelegate[8388609];

    //return;    
}

delegate OnLoginStatusChange()
{
    local /*0x35EA0000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewId[8388609];

    //return;    
}

function AddLoginStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginStatusDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    //return;    
}

function ClearLoginStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LoginStatusDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    //return;    
}

function AddLoginCancelledDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CancelledDelegate[8388609];

    //return;    
}

function ClearLoginCancelledDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CancelledDelegate[8388609];

    //return;    
}

function AddMutingChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MutingDelegate[8388609];

    //return;    
}

function ClearMutingChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MutingDelegate[8388609];

    //return;    
}

function AddFriendsChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FriendsDelegate[8388609];

    //return;    
}

function ClearFriendsChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FriendsDelegate[8388609];

    //return;    
}

function ReadProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ProfileSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadProfileSettingsComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function ClearReadProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function GetProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function WriteProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ProfileSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnWriteProfileSettingsComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddWriteProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function ClearWriteProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WriteProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function ReadPlayerStorage()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

delegate OnReadPlayerStorageComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadPlayerStorageCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadPlayerStorageCompleteDelegate[8388609];

    //return;    
}

function ClearReadPlayerStorageCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadPlayerStorageCompleteDelegate[8388609];

    //return;    
}

function ReadPlayerStorageForNetId()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NetId[8388609], PlayerStorage;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadPlayerStorageForNetIdComplete()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NetId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadPlayerStorageForNetIdCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NetId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadPlayerStorageForNetIdCompleteDelegate[8388609];

    //return;    
}

function ClearReadPlayerStorageForNetIdCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NetId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadPlayerStorageForNetIdCompleteDelegate[8388609];

    //return;    
}

function GetPlayerStorage()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function WritePlayerStorage()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    //return ReturnValue;    
}

delegate OnWritePlayerStorageComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddWritePlayerStorageCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WritePlayerStorageCompleteDelegate[8388609];

    //return;    
}

function ClearWritePlayerStorageCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> WritePlayerStorageCompleteDelegate[8388609];

    //return;    
}

function ReadFriendsList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int Count[9437185], StartingAt;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadFriendsComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadFriendsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadFriendsCompleteDelegate[8388609];

    //return;    
}

function ClearReadFriendsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadFriendsCompleteDelegate[8388609];

    //return;    
}

function GetFriendsList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Friends[25165825];
    local /*0x35EA0000-0x00000000*/ private int Count[9437185], StartingAt;
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

function SetOnlineStatus()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatusId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array LocalizedStringSettings[25296897], Properties;

    //return;    
}

function ShowKeyboardUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TitleText[8388609], DescriptionText;
    local /*0x35EA0000-0x00000000*/ private bool bIsPassword[9437185], bShouldValidate;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultText[9437185];
    local /*0x35EA0000-0x00000000*/ private int MaxResultLength[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    false
    true    
    256
    //return ReturnValue;    
}

delegate OnKeyboardInputComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddKeyboardInputDoneDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InputDelegate[8388609];

    //return;    
}

function ClearKeyboardInputDoneDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InputDelegate[8388609];

    //return;    
}

function GetKeyboardInputResults()
{
    local /*0x35EA0000-0x00000000*/ private byte bWasCanceled[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function AddFriend()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewFriend[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function AddFriendByName()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FriendName[8388609], Message;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnAddFriendByNameComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddAddFriendByNameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FriendDelegate[8388609];

    //return;    
}

function ClearAddFriendByNameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FriendDelegate[8388609];

    //return;    
}

function AcceptFriendInvite()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RequestingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DenyFriendInvite()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RequestingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RemoveFriend()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FormerFriend[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnFriendInviteReceived()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RequestingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RequestingNick[8388609], Message;

    //return;    
}

function AddFriendInviteReceivedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InviteDelegate[8388609];

    //return;    
}

function ClearFriendInviteReceivedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InviteDelegate[8388609];

    //return;    
}

function SendMessageToFriend()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Friend[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendGameInviteToFriend()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Friend[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendGameInviteToFriends()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Friends[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReceivedGameInvite()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InviterName[8388609];

    //return;    
}

function AddReceivedGameInviteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReceivedGameInviteDelegate[8388609];

    //return;    
}

function ClearReceivedGameInviteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReceivedGameInviteDelegate[8388609];

    //return;    
}

function OpenInvites()
{
    //return;    
}

function JoinFriendGame()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Friend[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnJoinFriendGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddJoinFriendGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinFriendGameCompleteDelegate[8388609];

    //return;    
}

function ClearJoinFriendGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinFriendGameCompleteDelegate[8388609];

    //return;    
}

function GetFriendMessages()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FriendMessages[25165825];

    //return;    
}

delegate OnFriendMessageReceived()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SendingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SendingNick[8388609], Message;

    //return;    
}

function AddFriendMessageReceivedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MessageDelegate[8388609];

    //return;    
}

function ClearFriendMessageReceivedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MessageDelegate[8388609];

    //return;    
}

function DeleteMessage()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int MessageIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnlockAchievement()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int AchievementId[8388609];
    local /*0x35EA0000-0x00000000*/ private float PercentComplete[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    100.0000000
    //return ReturnValue;    
}

delegate OnUnlockAchievementComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddUnlockAchievementCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UnlockAchievementCompleteDelegate[8388609];

    //return;    
}

function ClearUnlockAchievementCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UnlockAchievementCompleteDelegate[8388609];

    //return;    
}

function ReadAchievements()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int TitleId[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bShouldReadText[9437185], bShouldReadImages, ReturnValue;

    0
    true
    false
    //return ReturnValue;    
}

delegate OnReadAchievementsComplete()
{
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];

    //return;    
}

function AddReadAchievementsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadAchievementsCompleteDelegate[8388609];

    //return;    
}

function ClearReadAchievementsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadAchievementsCompleteDelegate[8388609];

    //return;    
}

function GetAchievements()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Achievements[25165825];
    local /*0x35EA0000-0x00000000*/ private int TitleId[9437185];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    0
    //return ReturnValue;    
}
