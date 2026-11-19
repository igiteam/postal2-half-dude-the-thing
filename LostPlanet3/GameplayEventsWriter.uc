class GameplayEventsWriter extends GameplayEventsWriterBase;

// Export UGameplayEventsWriter::execResolvePlayerIndex(FFrame&, void* const)
native function ResolvePlayerIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UGameplayEventsWriter::execOpenStatsFile(FFrame&, void* const)
native function OpenStatsFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameplayEventsWriter::execCloseStatsFile(FFrame&, void* const)
native function CloseStatsFile();

// Export UGameplayEventsWriter::execSerializeHeader(FFrame&, void* const)
protected native function SerializeHeader()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameplayEventsWriter::execSerializeFooter(FFrame&, void* const)
protected native function SerializeFooter()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameplayEventsWriter::execStartLogging(FFrame&, void* const)
native function StartLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];


}

// Export UGameplayEventsWriter::execResetLogging(FFrame&, void* const)
native function ResetLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];


}

// Export UGameplayEventsWriter::execEndLogging(FFrame&, void* const)
native function EndLogging();

// Export UGameplayEventsWriter::execLogGameIntEvent(FFrame&, void* const)
native function LogGameIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], Value;


}

// Export UGameplayEventsWriter::execLogGameStringEvent(FFrame&, void* const)
native function LogGameStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];


}

// Export UGameplayEventsWriter::execLogGameFloatEvent(FFrame&, void* const)
native function LogGameFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsWriter::execLogGamePositionEvent(FFrame&, void* const)
native function LogGamePositionEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Position[25296897];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsWriter::execLogTeamIntEvent(FFrame&, void* const)
native function LogTeamIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsWriter::execLogTeamFloatEvent(FFrame&, void* const)
native function LogTeamFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsWriter::execLogTeamStringEvent(FFrame&, void* const)
native function LogTeamStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerIntEvent(FFrame&, void* const)
native function LogPlayerIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerFloatEvent(FFrame&, void* const)
native function LogPlayerFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerStringEvent(FFrame&, void* const)
native function LogPlayerStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventString[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerSpawnEvent(FFrame&, void* const)
native function LogPlayerSpawnEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class PawnClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int TeamID[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerLoginChange(FFrame&, void* const)
native function LogPlayerLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSplitScreen[8388609];


}

// Export UGameplayEventsWriter::execLogAllPlayerPositionsEvent(FFrame&, void* const)
native function LogAllPlayerPositionsEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerKillDeath(FFrame&, void* const)
native function LogPlayerKillDeath()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], KillType;
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Dead[8388609];


}

// Export UGameplayEventsWriter::execLogPlayerPlayerEvent(FFrame&, void* const)
native function LogPlayerPlayerEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609], Target;


}

// Export UGameplayEventsWriter::execLogWeaponIntEvent(FFrame&, void* const)
native function LogWeaponIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class WeaponClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsWriter::execLogDamageEvent(FFrame&, void* const)
native function LogDamageEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609];


}

// Export UGameplayEventsWriter::execLogProjectileIntEvent(FFrame&, void* const)
native function LogProjectileIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class Proj[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];


}

// Export UGameplayEventsWriter::execLogSystemPollEvents(FFrame&, void* const)
native function LogSystemPollEvents();

// Export UGameplayEventsWriter::execGetGenericParamListEntry(FFrame&, void* const)
native function GetGenericParamListEntry()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


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

    return 0;
    //return ReturnValue;    
}
