class GameplayEventsReader extends GameplayEvents;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RegisteredHandlers[536870913];

// Export UGameplayEventsReader::execOpenStatsFile(FFrame&, void* const)
native function OpenStatsFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameplayEventsReader::execCloseStatsFile(FFrame&, void* const)
native function CloseStatsFile();

// Export UGameplayEventsReader::execSerializeHeader(FFrame&, void* const)
protected native function SerializeHeader()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event RegisterHandler()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewHandler[8388609];
    local /*0x35EA0000-0x00000000*/ private int AddIndex;

    // End:0x89
    if(RegisteredHandlers.Find(NewHandler) == )
    {        
        AddIndex = RegisteredHandlers.Length;
        RegisteredHandlers.Length = RegisteredHandlers.Length + 1;
        RegisteredHandlers[AddIndex] = NewHandler;
        NewHandler.SetReader(self);
    }
    //return;    
}

event UnregisterHandler()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExistingHandler[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = RegisteredHandlers.Find(ExistingHandler);    
    // End:0x68
    if(RemoveIndex != -1)
    {
        RegisteredHandlers.Remove(RemoveIndex, 1);        
        ExistingHandler.SetReader(none);
    }
    //return;    
}

// Export UGameplayEventsReader::execProcessStreamStart(FFrame&, void* const)
private native final function ProcessStreamStart();

// Export UGameplayEventsReader::execProcessStream(FFrame&, void* const)
native function ProcessStream();

// Export UGameplayEventsReader::execProcessStreamEnd(FFrame&, void* const)
private native final function ProcessStreamEnd();

// Export UGameplayEventsReader::execGetSessionID(FFrame&, void* const)
native function GetSessionID()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetTitleID(FFrame&, void* const)
native function GetTitleID()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetPlatform(FFrame&, void* const)
native function GetPlatform()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetSessionTimestamp(FFrame&, void* const)
native function GetSessionTimestamp()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetSessionStart(FFrame&, void* const)
native function GetSessionStart()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetSessionEnd(FFrame&, void* const)
native function GetSessionEnd()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UGameplayEventsReader::execGetSessionDuration(FFrame&, void* const)
native function GetSessionDuration()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}
