class LPProfilePersistentData extends LPProfileSettings
    config(Game);

event SetToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    super.SetToDefaults();
    // End:0xBA
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPC)
    {
        // End:0xB9
        if(LPC.OnlinePlayerData.StorageProvider.Profile == self)
        {
            PCOwner = LPC;
            // End:0xBA
            break;
        }        
    }    
    //return;    
}
