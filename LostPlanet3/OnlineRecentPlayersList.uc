class OnlineRecentPlayersList extends Object
    config(Engine);

struct native RecentParty
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PartyLeader;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PartyMembers;

    structdefaultproperties
    {
        PartyLeader=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        PartyMembers=none
    }
};

struct native CurrentPlayerMet
{
    var(*) /*0x35EA0000-0x00000000*/ private int TeamNum;
    var(*) /*0x35EA0000-0x00000000*/ private int Skill;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NetId;

    structdefaultproperties
    {
        TeamNum=0
        Skill=0
        NetId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RecentPlayers;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RecentParties;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LastParty;
var(*) /*0x35EA0000-0x00000000*/ private int MaxRecentPlayers[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxRecentParties[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int RecentPlayersAddIndex;
var(*) /*0x35EA0000-0x00000000*/ private int RecentPartiesAddIndex;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CurrentPlayers;

function AddPlayerToRecentPlayers()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int FindIndex;

    FindIndex = RecentPlayers.Find('Uid', NewPlayer.Uid);    
    // End:0xCB
    if(FindIndex == -1)
    {
        // End:0x71
        if(RecentPlayersAddIndex >= MaxRecentPlayers)
        {
            RecentPlayersAddIndex = 0;
        }
        // End:0xA3
        if((RecentPlayersAddIndex + 1) >= RecentPlayers.Length)
        {
            RecentPlayers.Length = RecentPlayersAddIndex + 1;
        }
        RecentPlayers[RecentPlayersAddIndex] = NewPlayer;
        RecentPlayersAddIndex++;
    }
    //return;    
}

function ClearRecentPlayers()
{
    RecentPlayersAddIndex = 0;
    RecentPlayers.Length = 0;
    //return;    
}

function AddPartyToRecentParties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PartyLeader[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PartyMembers[25296897];
    local /*0x35EA0000-0x00000000*/ private int FindIndex;

    FindIndex = RecentParties.Find('PartyLeader', PartyLeader);    
    // End:0xFB
    if(FindIndex == -1)
    {
        // End:0x5E
        if(RecentPartiesAddIndex >= MaxRecentParties)
        {
            RecentPartiesAddIndex = 0;
        }
        // End:0x90
        if((RecentPartiesAddIndex + 1) >= RecentParties.Length)
        {
            RecentParties.Length = RecentPartiesAddIndex + 1;
        }
        RecentParties[RecentPartiesAddIndex].PartyLeader = PartyLeader;
        RecentParties[RecentPartiesAddIndex].PartyMembers = PartyMembers;
        RecentPartiesAddIndex++;
    }
    //return;    
}

function ClearRecentParties()
{
    RecentPartiesAddIndex = 0;
    RecentParties.Length = 0;
    //return;    
}

function GetPlayersFromRecentParties()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25165825];
    local /*0x35EA0000-0x00000000*/ private int PartyIndex, MemberIndex, AddMemberAt;

    Players.Length = 0;
    AddMemberAt = 0;
    PartyIndex = 0;
    J0x22:

    // End:0xF1 [Loop If]
    if(PartyIndex < RecentParties.Length)
    {
        MemberIndex = 0;
        J0x45:

        // End:0xE3 [Loop If]
        if(MemberIndex < RecentParties[PartyIndex].PartyMembers.Length)
        {
            Players.Length = AddMemberAt + 1;
            Players[AddMemberAt] = RecentParties[PartyIndex].PartyMembers[MemberIndex];
            MemberIndex++;
            // [Loop Continue]
            goto J0x45;
        }
        PartyIndex++;
        // [Loop Continue]
        goto J0x22;
    }
    //return;    
}

function GetPlayersFromCurrentPlayers()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25165825];
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex;

    Players.Length = 0;
    PlayerIndex = 0;
    J0x17:

    // End:0x70 [Loop If]
    if(PlayerIndex < CurrentPlayers.Length)
    {
        Players.AddItem(CurrentPlayers[PlayerIndex].NetId);        
        PlayerIndex++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function GetSkillForCurrentPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], PlayerIndex;

    PlayerIndex = 0;
    J0x0B:

    // End:0x94 [Loop If]
    if(PlayerIndex < CurrentPlayers.Length)
    {
        // End:0x86
        if(EqualEqual_UniqueNetIdUniqueNetId(CurrentPlayers[PlayerIndex].NetId, Player))
        {
            return CurrentPlayers[PlayerIndex].Skill;
        }
        PlayerIndex++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 0;
    //return ReturnValue;    
}

function GetTeamForCurrentPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], PlayerIndex;

    PlayerIndex = 0;
    J0x0B:

    // End:0x94 [Loop If]
    if(PlayerIndex < CurrentPlayers.Length)
    {
        // End:0x86
        if(EqualEqual_UniqueNetIdUniqueNetId(CurrentPlayers[PlayerIndex].NetId, Player))
        {
            return CurrentPlayers[PlayerIndex].TeamNum;
        }
        PlayerIndex++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 255;
    //return ReturnValue;    
}

function SetLastParty()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PartyLeader[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PartyMembers[25296897];

    LastParty.PartyLeader = PartyLeader;
    LastParty.PartyMembers = PartyMembers;
    //return;    
}

function ShowRecentPlayerList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[8388609], Description;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xC9
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
    {
        return OnlineSub.PlayerInterfaceEx.ShowCustomPlayersUI(LocalUserNum, RecentPlayers, Title, Description);
    }
    return false;
    //return ReturnValue;    
}

function ShowRecentPartiesPlayerList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[8388609], Description;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xDC
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
    {
        GetPlayersFromRecentParties(Players);
        return OnlineSub.PlayerInterfaceEx.ShowCustomPlayersUI(LocalUserNum, Players, Title, Description);
    }
    return false;
    //return ReturnValue;    
}

function ShowLastPartyPlayerList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[8388609], Description;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xDC
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
    {
        return OnlineSub.PlayerInterfaceEx.ShowCustomPlayersUI(LocalUserNum, LastParty.PartyMembers, Title, Description);
    }
    return false;
    //return ReturnValue;    
}

function ShowCurrentPlayersList()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[8388609], Description;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xDC
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
    {
        GetPlayersFromCurrentPlayers(Players);
        return OnlineSub.PlayerInterfaceEx.ShowCustomPlayersUI(LocalUserNum, Players, Title, Description);
    }
    return false;
    //return ReturnValue;    
}

function SetCurrentPlayersList()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[8519681];

    CurrentPlayers = Players;
    //return;    
}

function GetCurrentPlayersListCount()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return CurrentPlayers.Length;
    //return ReturnValue;    
}

defaultproperties
{
    MaxRecentPlayers=100
    MaxRecentParties=5
}