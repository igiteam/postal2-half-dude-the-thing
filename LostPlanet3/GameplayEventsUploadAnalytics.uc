class GameplayEventsUploadAnalytics extends GameplayEventsWriterBase;

// Export UGameplayEventsUploadAnalytics::execStartLogging(FFrame&, void* const)
native function StartLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];


}

// Export UGameplayEventsUploadAnalytics::execResetLogging(FFrame&, void* const)
native function ResetLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];


}

// Export UGameplayEventsUploadAnalytics::execEndLogging(FFrame&, void* const)
native function EndLogging();

// Export UGameplayEventsUploadAnalytics::execLogGameIntEvent(FFrame&, void* const)
native function LogGameIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], Value;


}

// Export UGameplayEventsUploadAnalytics::execLogGameStringEvent(FFrame&, void* const)
native function LogGameStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogGameFloatEvent(FFrame&, void* const)
native function LogGameFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogGamePositionEvent(FFrame&, void* const)
native function LogGamePositionEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Position[25296897];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogTeamIntEvent(FFrame&, void* const)
native function LogTeamIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogTeamFloatEvent(FFrame&, void* const)
native function LogTeamFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogTeamStringEvent(FFrame&, void* const)
native function LogTeamStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerIntEvent(FFrame&, void* const)
native function LogPlayerIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerFloatEvent(FFrame&, void* const)
native function LogPlayerFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerStringEvent(FFrame&, void* const)
native function LogPlayerStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventString[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerSpawnEvent(FFrame&, void* const)
native function LogPlayerSpawnEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class PawnClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int TeamID[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerLoginChange(FFrame&, void* const)
native function LogPlayerLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSplitScreen[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogAllPlayerPositionsEvent(FFrame&, void* const)
native function LogAllPlayerPositionsEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerKillDeath(FFrame&, void* const)
native function LogPlayerKillDeath()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], KillType;
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Dead[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogPlayerPlayerEvent(FFrame&, void* const)
native function LogPlayerPlayerEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609], Target;


}

// Export UGameplayEventsUploadAnalytics::execLogWeaponIntEvent(FFrame&, void* const)
native function LogWeaponIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class WeaponClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogDamageEvent(FFrame&, void* const)
native function LogDamageEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609];


}

// Export UGameplayEventsUploadAnalytics::execLogProjectileIntEvent(FFrame&, void* const)
native function LogProjectileIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class Proj[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

function GetGenericParamListEntry()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function RecordAIPathFail()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AI[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[142606337];
    local /*0x35EA0000-0x00000000*/ private @NULL Dest[8388609];

    //return;    
}

function RecordCoverLinkFireLinks()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609], Player;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}
