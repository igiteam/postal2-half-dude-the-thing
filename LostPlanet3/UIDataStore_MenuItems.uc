class UIDataStore_MenuItems extends UIDataStore_GameResource
    transient
    config(UI)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private name CurrentGameSettingsTag[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OptionProviders[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DynamicProviders[536870913];

function OnGameSettingsChanged()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SourceProvider[8388609];
    local /*0x35EA0000-0x00000000*/ private name PropTag[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettingsDataStore;

    GameSettingsDataStore = UIDataStore_OnlineGameSettings(SourceProvider);
    // End:0x5B
    if((GameSettingsDataStore != none) && PropTag == 'SelectedIndex')
    {
        RefreshSubscribers(CurrentGameSettingsTag, true, self);
    }
    //return;    
}

event Registered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];

    super(UIDataStore).Registered(PlayerOwner);
    //return;    
}

event Unregistered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner[8388609];

    super(UIDataStore).Unregistered(PlayerOwner);
    //return;    
}

defaultproperties
{
    CurrentGameSettingsTag="CurrentGameSettings"
    Tag="MenuItems"
}