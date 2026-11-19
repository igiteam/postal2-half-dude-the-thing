class FileWriter extends Info
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

enum FWFileType
{
    FWFT_Log,                       // 0
    FWFT_Stats,                     // 1
    FWFT_HTML,                      // 2
    FWFT_User,                      // 3
    FWFT_Debug,                     // 4
    FWFT_MAX                        // 5
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL ArchivePtr[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte FileType[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bFlushEachWrite;
var(*) /*0x35EA0000-0x00000000*/ private bool bWantsAsyncWrites;

// Export UFileWriter::execOpenFile(FFrame&, void* const)
native final function OpenFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InFilename[142606337];
    local /*0x35EA0000-0x00000000*/ private byte InFileType[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InExtension[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bUnique[9437185], bIncludeTimeStamp, ReturnValue;


}

// Export UFileWriter::execCloseFile(FFrame&, void* const)
native final function CloseFile();

// Export UFileWriter::execLogf(FFrame&, void* const)
native final function Logf()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string logString[142606337];


}

event Destroyed()
{
    CloseFile();
    //return;    
}

defaultproperties
{
    bFlushEachWrite=true
    bTickIsDisabled=true
}