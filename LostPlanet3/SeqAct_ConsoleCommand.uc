class SeqAct_ConsoleCommand extends SequenceAction
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Command;
var(*) /*0x43F40000-0x00000000*/ private editfixedsize array Commands[65537];

function VersionUpdated()
{
    local /*0x35EA0000-0x00000000*/ private int OldVersion[8388609], NewVersion;

    // End:0x4B
    if((OldVersion < 2) && (Commands.Length == 0) || Commands[0] == "")
    {
        Commands[0] = Command;
    }
    //return;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    Commands=/* Array type was not detected. */
    ObjName="Console Command"
}