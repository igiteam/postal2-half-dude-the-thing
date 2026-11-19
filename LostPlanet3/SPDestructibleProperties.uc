class SPDestructibleProperties extends SPBaseDestructibleProperties
    editinlinenew
    hidecategories(Object,Object);

var(__OnDestroyed__Delegate) /*0x01740000-0x00000000*/ private bool bEnableCommands[196609];
var(__OnDestroyed__Delegate) /*0x01C90000-0x00000400*/ private editfixedsize array OnBreakActionLists[589825];
var(__OnDestroyed__Delegate) /*0x01C90000-0x00000400*/ private editfixedsize array OnBreakAlwaysRunActionLists[589825];
var(__OnDestroyed__Delegate) /*0x01CD0000-0x00000400*/ private editfixedsize array OnSpawnActionList[589825];

// Export USPDestructibleProperties::execCanHandleDamageType(FFrame&, void* const)
native function CanHandleDamageType()
{
    local /*0x01C00000-0x00000000*/ private class Type[8388609];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    bEnableCommands=true
}