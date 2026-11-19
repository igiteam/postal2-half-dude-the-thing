class OnlineGameSettings extends Settings;

var(*) /*0x35EA0000-0x00000000*/ private config int NumPublicConnections;
var(*) /*0x35EA0000-0x00000000*/ private config int NumPrivateConnections;
var(*) /*0x35EA0000-0x00000000*/ private config int NumOpenPublicConnections;
var(*) /*0x35EA0000-0x00000000*/ private config int NumOpenPrivateConnections;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ServerNonce[131073];
var(*) /*0x35EA0000-0x00000000*/ private config bool bShouldAdvertise;
var(*) /*0x35EA0000-0x00000000*/ private config bool bIsLanMatch;
var(*) /*0x35EA0000-0x00000000*/ private config bool bUsesStats;
var(*) /*0x35EA0000-0x00000000*/ private config bool bAllowJoinInProgress;
var(*) /*0x35EA0000-0x00000000*/ private config bool bAllowInvites;
var(*) /*0x35EA0000-0x00000000*/ private config bool bUsesPresence;
var(*) /*0x35EA0000-0x00000000*/ private config bool bAllowJoinViaPresence;
var(*) /*0x35EA0000-0x00000000*/ private config bool bAllowJoinViaPresenceFriendsOnly;
var(*) /*0x35EA0000-0x00000000*/ private config bool bUsesArbitration;
var(*) /*0x35EA0000-0x00000000*/ private config bool bAntiCheatProtected;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasFromInvite[131073];
var(*) /*0x35EA0000-0x00000000*/ private config bool bIsDedicated;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasSkillUpdateInProgress[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldShrinkArbitratedSessions[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize config string OwningPlayerName;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OwningPlayerId;
var(*) /*0x35EA0000-0x00000000*/ private config int PingInMs;
var(*) /*0x35EA0000-0x00000000*/ private config float MatchQuality;
var(*) /*0x35EA0000-0x00000000*/ private config byte GameState[131073];
var(*) /*0x35EA0000-0x00000000*/ private config int BuildUniqueId[131073];

defaultproperties
{
    bShouldAdvertise=true
    bUsesStats=true
    bAllowJoinInProgress=true
    bAllowInvites=true
    bUsesPresence=true
    bAllowJoinViaPresence=true
    bShouldShrinkArbitratedSessions=true
}