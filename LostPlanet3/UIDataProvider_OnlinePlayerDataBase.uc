class UIDataProvider_OnlinePlayerDataBase extends UIDataProvider
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private int PlayerControllerId;

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609];

    // End:0x37
    if(InPlayer != none)
    {
        PlayerControllerId = InPlayer.ControllerId;
    }
    //return;    
}

event OnUnregister()
{
    PlayerControllerId = -1;
    //return;    
}

defaultproperties
{
    PlayerControllerId=-1
}