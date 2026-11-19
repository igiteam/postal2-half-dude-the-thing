class CloudStorageBase extends PlatformInterfaceBase
    transient;

enum ECloudStorageDelegate
{
    CSD_KeyValueReadComplete,       // 0
    CSD_KeyValueWriteComplete,      // 1
    CSD_ValueChanged,               // 2
    CSD_DocumentQueryComplete,      // 3
    CSD_DocumentReadComplete,       // 4
    CSD_DocumentWriteComplete,      // 5
    CSD_DocumentConflictDetected,   // 6
    CSD_MAX                         // 7
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalCloudFiles;
var(*) /*0x35EA0000-0x00000000*/ private bool bSuppressDelegateCalls;

// Export UCloudStorageBase::execInit(FFrame&, void* const)
native event Init();

// Export UCloudStorageBase::execIsUsingLocalStorage(FFrame&, void* const)
native function IsUsingLocalStorage()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execReadKeyValue(FFrame&, void* const)
native event ReadKeyValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string KeyName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Type[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execWriteKeyValue(FFrame&, void* const)
native event WriteKeyValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string KeyName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execQueryForCloudDocuments(FFrame&, void* const)
native event QueryForCloudDocuments()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execGetNumCloudDocuments(FFrame&, void* const)
native event GetNumCloudDocuments()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsForConflict[9437185];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UCloudStorageBase::execGetCloudDocumentName(FFrame&, void* const)
native event GetCloudDocumentName()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UCloudStorageBase::execCreateCloudDocument(FFrame&, void* const)
native event CreateCloudDocument()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UCloudStorageBase::execReadCloudDocument(FFrame&, void* const)
native event ReadCloudDocument()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsForConflict[9437185], ReturnValue;


}

// Export UCloudStorageBase::execParseDocumentAsString(FFrame&, void* const)
native event ParseDocumentAsString()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsForConflict[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UCloudStorageBase::execParseDocumentAsBytes(FFrame&, void* const)
native event ParseDocumentAsBytes()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ByteData[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bIsForConflict[9437185];


}

// Export UCloudStorageBase::execParseDocumentAsObject(FFrame&, void* const)
native event ParseDocumentAsObject()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private class ObjectClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int ExpectedVersion[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsForConflict[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UCloudStorageBase::execWriteCloudDocument(FFrame&, void* const)
native event WriteCloudDocument()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execSaveDocumentWithString(FFrame&, void* const)
native event SaveDocumentWithString()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StringData[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execSaveDocumentWithBytes(FFrame&, void* const)
native event SaveDocumentWithBytes()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ByteData[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execSaveDocumentWithObject(FFrame&, void* const)
native event SaveDocumentWithObject()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ObjectData[8388609];
    local /*0x35EA0000-0x00000000*/ private int SaveVersion[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execIsStillWritingFiles(FFrame&, void* const)
native event IsStillWritingFiles()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execWaitForWritesToFinish(FFrame&, void* const)
native event WaitForWritesToFinish()
{
    local /*0x35EA0000-0x00000000*/ private float MaxTimeSeconds[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execResolveConflictWithNewestDocument(FFrame&, void* const)
native event ResolveConflictWithNewestDocument()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execResolveConflictWithVersionIndex(FFrame&, void* const)
native event ResolveConflictWithVersionIndex()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCloudStorageBase::execUpgradeLocalStorageToCloud(FFrame&, void* const)
native event UpgradeLocalStorageToCloud()
{
    local /*0x35EA0000-0x00000000*/ private @NULL UpgradeHelper[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceSearchAgain[9437185], ReturnValue;


}
