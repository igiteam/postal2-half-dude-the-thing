class LPDataStoreGameSettings extends UIDataStore_StringBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL GameSettings[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SearchSettings[524289];

defaultproperties
{
    // Reference: OnlineGameSettings'Default__LPDataStoreGameSettings.TempGameSettings'
    begin object name=TempGameSettings class=Class'Engine.OnlineGameSettings'
        bIsLanMatch=true
    end object
    GameSettings=TempGameSettings
    // Reference: OnlineGameSearch'Default__LPDataStoreGameSettings.TempSearchSettings'
    begin object name=TempSearchSettings class=Class'Engine.OnlineGameSearch'
        MaxSearchResults=30
        bIsLanQuery=true
    end object
    SearchSettings=TempSearchSettings
    Tag="DataStoreGameSettings"
}