class LPUIDataStore_FrontEnd extends UIDataStore_StringBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipTitleScreen;

static function GetFrontEndData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreFrontEnd, DataStoreManager;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x89
    if(DataStoreManager != none)
    {
        DataStoreFrontEnd = LPUIDataStore_FrontEnd(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_FrontEnd'.default.Tag));
    }
    return DataStoreFrontEnd;
    //return ReturnValue;    
}

static function SetSkipTitleScreen()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldSkipTitleScreen[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreFrontEnd;

    DataStoreFrontEnd = GetFrontEndData();
    // End:0x4D
    if(DataStoreFrontEnd != none)
    {
        DataStoreFrontEnd.bSkipTitleScreen = bShouldSkipTitleScreen;
    }
    //return;    
}

static function ShouldSkipTitleScreen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreFrontEnd;

    DataStoreFrontEnd = GetFrontEndData();
    // End:0x43
    if(DataStoreFrontEnd != none)
    {
        return DataStoreFrontEnd.bSkipTitleScreen;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    Tag="DataStoreFrontEnd"
}