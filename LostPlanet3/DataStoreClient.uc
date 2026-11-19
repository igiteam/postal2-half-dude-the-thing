class DataStoreClient extends UIRoot
    config(Engine)
    hidecategories(Object,UIRoot);

struct native transient PlayerDataStoreGroup
{
    var(*) /*0x35EA0000-0x00000010*/ private @NULL PlayerOwner[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array DataStores[537001985];

    structdefaultproperties
    {
        PlayerOwner=none
        DataStores=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GlobalDataStoreClasses[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GlobalDataStores[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerDataStoreClassNames[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerDataStoreClasses[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerDataStores[131073];

// Export UDataStoreClient::execFindDataStore(FFrame&, void* const)
native final function FindDataStore()
{
    local /*0x35EA0000-0x00000000*/ private name DataStoreTag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[9437185], ReturnValue;


}

// Export UDataStoreClient::execCreateDataStore(FFrame&, void* const)
native final function CreateDataStore()
{
    local /*0x35EA0000-0x00000000*/ private class DataStoreClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[226492417];


}

// Export UDataStoreClient::execRegisterDataStore(FFrame&, void* const)
native final function RegisterDataStore()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DataStore[8388609], PlayerOwner;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UDataStoreClient::execUnregisterDataStore(FFrame&, void* const)
native final function UnregisterDataStore()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DataStore[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UDataStoreClient::execFindPlayerDataStoreIndex(FFrame&, void* const)
native final function FindPlayerDataStoreIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

final function GetPlayerDataStoreClasses()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_DataStoreClasses[25165825];

    out_DataStoreClasses = PlayerDataStoreClasses;
    //return;    
}

final function FindDataStoreClass()
{
    local /*0x35EA0000-0x00000000*/ private class RequiredMetaClass[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private class Result;

    I = 0;
    J0x0B:

    // End:0xA8 [Loop If]
    if(I < GlobalDataStores.Length)
    {
        // End:0x9A
        if(GlobalDataStores[I].IsA(RequiredMetaClass.Name))
        {
            Result = GlobalDataStores[I].Class;
            // [Explicit Break]
            goto J0xA8;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xA8:

    // End:0x12A
    if(Result == none)
    {
        I = 0;
        J0xC2:

        // End:0x12A [Loop If]
        if(I < PlayerDataStoreClasses.Length)
        {
            // End:0x11C
            if(ClassIsChildOf(PlayerDataStoreClasses[I], RequiredMetaClass))
            {
                Result = PlayerDataStoreClasses[I];
                // [Explicit Break]
                goto J0x12A;
            }
            I++;
            // [Loop Continue]
            goto J0xC2;
        }
    }
    J0x12A:

    return Result;
    //return ReturnValue;    
}

final event NotifyGameSessionEnded()
{
    local /*0x35EA0000-0x00000000*/ private int I, DataStoreIndex;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DataStoreArray;

    DataStoreArray = GlobalDataStores;
    DataStoreIndex = 0;
    J0x1E:

    // End:0x8D [Loop If]
    if(DataStoreIndex < DataStoreArray.Length)
    {
        // End:0x7F
        if(DataStoreArray[DataStoreIndex].NotifyGameSessionEnded())
        {
            UnregisterDataStore(DataStoreArray[DataStoreIndex]);
        }
        DataStoreIndex++;
        // [Loop Continue]
        goto J0x1E;
    }
    I = PlayerDataStores.Length - 1;
    J0xA4:

    // End:0x168 [Loop If]
    if(I >= 0)
    {
        DataStoreArray = PlayerDataStores[I].DataStores;
        DataStoreIndex = 0;
        J0xEE:

        // End:0x15A [Loop If]
        if(DataStoreIndex < DataStoreArray.Length)
        {
            DataStoreArray[DataStoreIndex].NotifyGameSessionEnded();
            UnregisterDataStore(DataStoreArray[DataStoreIndex]);
            DataStoreIndex++;
            // [Loop Continue]
            goto J0xEE;
        }
        I--;
        // [Loop Continue]
        goto J0xA4;
    }
    //return;    
}

final function DebugDumpDataStoreInfo()
{
    local /*0x35EA0000-0x00000000*/ private bool bVerbose[8388609];

    //return;    
}

defaultproperties
{
    GlobalDataStoreClasses=/* Array type was not detected. */
    PlayerDataStoreClassNames=/* Array type was not detected. */
}