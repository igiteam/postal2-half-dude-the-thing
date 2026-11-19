class SeqAct_MultiLevelStreaming extends SeqAct_LevelStreamingBase
    hidecategories(Object);

struct native LevelStreamingNameCombo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Level[131073];
    var(*) /*0x2E7C0000-0x00000000*/ private name LevelName[196609];

    structdefaultproperties
    {
        Level=none
        LevelName="None"
    }
};

var(*) /*0x44150000-0x00000000*/ private editfixedsize array Levels[65537];
var(*) /*0x44150000-0x00000000*/ private bool bUnloadAllOtherLevels[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStatusIsOk[536870913];

defaultproperties
{
    ObjName="Stream Levels"
}