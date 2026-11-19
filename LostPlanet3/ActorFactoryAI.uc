class ActorFactoryAI extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x48B00000-0x00000000*/ private class ControllerClass[65537];
var(*) /*0x48B00000-0x00000000*/ private class PawnClass[65537];
var(*) /*0x34520000-0x00000000*/ private editfixedsize string PawnName[65537];
var(*) /*0x2C390000-0x00000000*/ private bool bGiveDefaultInventory[65537];
var(*) /*0x2C390000-0x00000000*/ private editfixedsize array InventoryList[65537];
var(*) /*0x4BA40000-0x00000000*/ private int TeamIndex[65537];

defaultproperties
{
    ControllerClass=Class'AIController'
    TeamIndex=255
    bPlaceable=false
}