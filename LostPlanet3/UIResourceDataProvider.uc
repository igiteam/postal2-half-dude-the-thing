class UIResourceDataProvider extends UIPropertyDataProvider
    abstract
    transient
    config(Game)
    perobjectconfig
    hidecategories(Object,UIRoot)
    implements(UIListElementProvider,UIListElementCellProvider);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IUIListElementProvider[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IUIListElementCellProvider[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bDataBindingPropertiesOnly;
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipDuringEnumeration[1073741825];

event InitializeProvider()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsEditor[8388609];

    //return;    
}

defaultproperties
{
    ComplexPropertyTypes=/* Array type was not detected. */
}