class UIDataStore_OnlineGameSettings extends UIDataStore_Settings
    abstract
    transient
    config(Game)
    hidecategories(Object,UIRoot);

struct native GameSettingsCfg
{
    var(*) /*0x35EA0000-0x00000000*/ private class GameSettingsClass;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Provider;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GameSettings;
    var(*) /*0x35EA0000-0x00000000*/ private name SettingsName;

    structdefaultproperties
    {
        GameSettingsClass=none
        Provider=none
        GameSettings=none
        SettingsName="None"
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GameSettingsCfgList[131073];
var(*) /*0x35EA0000-0x00000000*/ private class SettingsProviderClass[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SelectedIndex;

event CreateGame()
{
    local /*0x35EA0000-0x00000000*/ private byte ControllerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, GameInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xDF
    if(OnlineSub != none)
    {
        GameInterface = OnlineSub.GameInterface;
        // End:0xDC
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            return GameInterface.CreateOnlineGame(ControllerIndex, 'Game', GameSettingsCfgList[SelectedIndex].GameSettings);            
        }        
    }
    return false;
    //return ReturnValue;    
}

event GetCurrentGameSettings()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GameSettingsCfgList[SelectedIndex].GameSettings;
    //return ReturnValue;    
}

event GetCurrentProvider()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GameSettingsCfgList[SelectedIndex].Provider;
    //return ReturnValue;    
}

event SetCurrentByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int NewIndex[8388609];

    // End:0x56
    if((NewIndex >= 0) && NewIndex < GameSettingsCfgList.Length)
    {
        SelectedIndex = NewIndex;
        RefreshSubscribers(,, true, GetCurrentProvider());        
    }
    //return;    
}

event SetCurrentByName()
{
    local /*0x35EA0000-0x00000000*/ private name SettingsName[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index;

    Index = 0;
    J0x0B:

    // End:0x7A [Loop If]
    if(Index < GameSettingsCfgList.Length)
    {
        // End:0x6C
        if(GameSettingsCfgList[Index].SettingsName == SettingsName)
        {
            SetCurrentByIndex(Index);
            return;
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

event MoveToNext()
{
    local /*0x35EA0000-0x00000000*/ private int NewIndex;

    NewIndex = Min(SelectedIndex + 1, GameSettingsCfgList.Length - 1);
    // End:0x4F
    if(SelectedIndex != NewIndex)
    {
        SetCurrentByIndex(NewIndex);
    }
    //return;    
}

event MoveToPrevious()
{
    local /*0x35EA0000-0x00000000*/ private int NewIndex;

    NewIndex = Max(SelectedIndex - 1, 0);
    // End:0x43
    if(SelectedIndex != NewIndex)
    {
        SetCurrentByIndex(NewIndex);
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
    SettingsProviderClass=Class'UIDataProvider_Settings'
    Tag="OnlineGameSettings"
}