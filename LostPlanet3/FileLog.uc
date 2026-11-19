class FileLog extends FileWriter
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

function OpenLog()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LogFilename[142606337], extension;
    local /*0x35EA0000-0x00000000*/ private bool bUnique[9437185];

    OpenFile(LogFilename, 0, extension, bUnique);
    //return;    
}

function CloseLog()
{
    CloseFile();
    //return;    
}
