interface CloudStorageUpgradeHelper extends Interface
    abstract;

event HandleLocalDocument()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DocName[25165825];
    local /*0x35EA0000-0x00000000*/ private int bShouldMoveToCloud[25165825], bShouldDeleteLocalFile;

    //return;    
}

event HandleLocalKeyValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string CloudKeyName[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CloudValue[25165825];
    local /*0x35EA0000-0x00000000*/ private int bShouldMoveToCloud[25165825], bShouldDeleteLocalKey;

    //return;    
}

event GetCloudUpgradeKeys()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array CloudKeys[25165825];

    //return;    
}
