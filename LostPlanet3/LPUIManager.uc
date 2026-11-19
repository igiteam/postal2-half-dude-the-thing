class LPUIManager extends SPGFxUIManager within LPUIInteraction;

static function GetLPUIManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPUIManager(GetUIManager());
    //return ReturnValue;    
}

defaultproperties
{
    MessageBoxClass=Class'LPGFxMoviePlayerMessageBox'
}