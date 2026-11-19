class UIDataProvider_MenuItem extends UIResourceDataProvider
    transient
    config(UI)
    perobjectconfig
    hidecategories(Object,UIRoot);

enum EMenuOptionType
{
    MENUOT_ComboReadOnly,           // 0
    MENUOT_ComboNumeric,            // 1
    MENUOT_CheckBox,                // 2
    MENUOT_Slider,                  // 3
    MENUOT_Spinner,                 // 4
    MENUOT_EditBox,                 // 5
    MENUOT_CollectionCheckBox,      // 6
    MENUOT_CollapsingList,          // 7
    MENUOT_MAX                      // 8
};

var(*) /*0x35EA0000-0x00000000*/ private byte OptionType[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OptionSet[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DataStoreMarkup[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DescriptionMarkup[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private name RequiredGameMode[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string CustomFriendlyName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Description;
var(*) /*0x35EA0000-0x00000000*/ private bool bEditableCombo[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bNumericCombo[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bKeyboardOrMouseOption[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlineOnly[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bOfflineOnly[1073741825];
var(*) /*0x4E290000-0x00000000*/ private bool bSearchAllInis[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRemoveOn360[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bRemoveOnPC[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bRemoveOnPS3[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int EditBoxMaxLength[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RangeData[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SchemaCellFields[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IniName[131073];
