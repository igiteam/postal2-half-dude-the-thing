class SeqAct_GiveInventory extends SequenceAction
    hidecategories(Object);

var(*) /*0x44080000-0x00000000*/ private editfixedsize array InventoryList[65537];
var(*) /*0x44080000-0x00000000*/ private bool bClearExisting[65537];
var(*) /*0x44080000-0x00000000*/ private bool bForceReplace[65537];

defaultproperties
{
    ObjName="Give Inventory"
}