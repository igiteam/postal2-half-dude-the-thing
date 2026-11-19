interface OnlinePlayerInterfaceEx extends Interface
    abstract;

function ShowFeedbackUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowGamerCardUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowMessagesUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowAchievementsUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowInviteUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InviteText[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowContentMarketplaceUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int CategoryMask[9437185], OfferId;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1    
    //return ReturnValue;    
}

function ShowMembershipMarketplaceUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowDeviceSelectionUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int SizeNeeded[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bManageStorage[9437185], bForceShowUI, ReturnValue;

    false
    //return ReturnValue;    
}

delegate OnDeviceSelectionComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddDeviceSelectionDoneDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DeviceDelegate[8388609];

    //return;    
}

function ClearDeviceSelectionDoneDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DeviceDelegate[8388609];

    //return;    
}

function GetDeviceSelectionResults()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DeviceName[25165825];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}

function IsDeviceValid()
{
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609], SizeNeeded;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnlockGamerPicture()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int PictureId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnProfileDataChanged()
{
    //return;    
}

function AddProfileDataChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ProfileDataChangedDelegate[8388609];

    //return;    
}

function ClearProfileDataChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ProfileDataChangedDelegate[8388609];

    //return;    
}

function ShowFriendsInviteUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowPlayersUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowCustomPlayersUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[8388609], Description;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnlockAvatarAward()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int AvatarItemId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadCrossTitleProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ProfileSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadCrossTitleProfileSettingsComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadCrossTitleProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function ClearReadCrossTitleProfileSettingsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadProfileSettingsCompleteDelegate[8388609];

    //return;    
}

function GetCrossTitleProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function ClearCrossTitleProfileSettings()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];

    //return;    
}

function ShowCustomMessageUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Recipients[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MessageTitle[8388609], NonEditableMessage, EditableMessage;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
