class LPMPMapList extends Object
    config(MP_MapList);

struct native MapLoadingScreen
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Filename[1073741825];

    structdefaultproperties
    {
        GameType=EMPGameType.EMPGT_Default
        Filename=""
    }
};

struct native MapAtmosphereState
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string StateName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;

    structdefaultproperties
    {
        StateName=""
        Label=""
    }
};

struct native MapListItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDevMap;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MapName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Image;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AtmosphereStates;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LoadingScreens;

    structdefaultproperties
    {
        bIsDevMap=false
        MapName=""
        Label=""
        Image=""
        AtmosphereStates=none
        LoadingScreens=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DefaultLoadingScreen[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HostMapList[1073741825];

static function GetLoadingScreenFilename()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string inMapName[8388609];
    local /*0x97E50000-0x00000000*/ private byte eGameMode[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Map, loadscr;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Filename;

    Filename = default.DefaultLoadingScreen;
    // End:0x2E
    if(Len(inMapName) == 0)
    {
        return Filename;
    }
    // End:0x136
    foreach default.HostMapList(Map)
    {
        // End:0x135
        if(Map.MapName ~= inMapName)
        {
            // End:0x134
            foreach Map.LoadingScreens(loadscr)
            {
                // End:0xE6
                if(int(loadscr.GameType) == int(0))
                {
                    Filename = loadscr.Filename;
                }
                // End:0x133
                if(int(loadscr.GameType) == int(eGameMode))
                {
                    break;                    
                    return loadscr.Filename;
                }                
            }            
        }        
    }    
    return Filename;
    //return ReturnValue;    
}

static function ShowMapGameSpecificLoadingMovie()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string inMapName[8388609];
    local /*0x97E50000-0x00000000*/ private byte eGameMode[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string strLoadingScreen;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    strLoadingScreen = Class'LPMPMapList'.static.GetLoadingScreenFilename(inMapName, eGameMode);
    // End:0xAF
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPPC)
    {
        LPPC.ClientShowMapGameSpecificLoadingMovie(strLoadingScreen);        
    }    
    //return;    
}

defaultproperties
{
    DefaultLoadingScreen="LS-GENERIC"
    HostMapList=/* Array type was not detected. */
}