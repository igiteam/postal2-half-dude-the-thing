class UIResourceCombinationProvider extends UIDataProvider
    abstract
    transient
    config(Game)
    perobjectconfig
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private @NULL StaticDataProvider[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ProfileProvider[536870913];

event InitializeProvider()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsEditor[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InStaticResourceProvider[8388609], InProfileProvider;

    StaticDataProvider = InStaticResourceProvider;
    ProfileProvider = InProfileProvider;
    //return;    
}

function ClearProviderReferences()
{
    StaticDataProvider = none;
    ProfileProvider = none;
    //return;    
}
