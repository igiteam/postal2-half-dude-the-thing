interface OnlinePartyChatInterface extends Interface
    abstract;

function SendPartyGameInvites()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnSendPartyGameInvitesComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddSendPartyGameInvitesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> SendPartyGameInvitesCompleteDelegate[8388609];

    //return;    
}

function ClearSendPartyGameInvitesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> SendPartyGameInvitesCompleteDelegate[8388609];

    //return;    
}

function GetPartyMembersInformation()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PartyMembers[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetPartyMemberInformation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MemberId[8388609], PartyMember;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnPartyMemberListChanged()
{
    local /*0x35EA0000-0x00000000*/ private bool bJoinedOrLeft[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];

    //return;    
}

function AddPartyMemberListChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> PartyMemberListChangedDelegate[8388609];

    //return;    
}

function ClearPartyMemberListChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> PartyMemberListChangedDelegate[8388609];

    //return;    
}

delegate OnPartyMembersInfoChanged()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int CustomData1[8388609], CustomData2, CustomData3, CustomData4;

    //return;    
}

function AddPartyMembersInfoChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> PartyMembersInfoChangedDelegate[8388609];

    //return;    
}

function ClearPartyMembersInfoChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> PartyMembersInfoChangedDelegate[8388609];

    //return;    
}

function SetPartyMemberCustomData()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int Data1[8388609], Data2, Data3, Data4;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetPartyBandwidth()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowPartyUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowVoiceChannelUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowCommunitySessionsUI()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsInPartyChat()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
