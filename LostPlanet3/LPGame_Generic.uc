class LPGame_Generic extends LPGameInfo
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

static event GetDefaultGameClassPath()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal, ReturnValue;

    // End:0x4D
    if(HasOption(Options, "listen"))
    {
        return "LostPlanetGameContent.LPGameMP_TDMContent";        
    }
    else
    {
        // End:0x9A
        if(MapName == "LostPlanetEntry")
        {
            return "LostPlanetGameContent.LPFrontEnd_Content";            
        }
        else
        {
            return "LostPlanetGameContent.LPGameSP_Content";
        }
    }
    //return ReturnValue;    
}

static event SetGameType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal;
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string GameOption;
    local /*0x97E50000-0x00000000*/ private class NewGameType;

    GameOption = ParseOption(Options, "Game");
    // End:0x33
    if(GameOption != "")
    {
    }
    // End:0xB2
    if(Class'Engine.WorldInfo'.static.IsMenuLevel(MapName))
    {
        NewGameType = class<GameInfo>(DynamicLoadObject("LostPlanetGameContent.LPFrontEnd_Content", Class'Core.Class'));        
    }
    else
    {
        // End:0x125
        if(HasOption(Options, "listen"))
        {
            NewGameType = class<GameInfo>(DynamicLoadObject("LostPlanetGameContent.LPGameMP_TDMContent", Class'Core.Class'));            
        }
        else
        {
            NewGameType = class<GameInfo>(DynamicLoadObject("LostPlanetGameContent.LPGameSP_Content", Class'Core.Class'));
        }
    }
    // End:0x1C7
    if(NewGameType != none)
    {
        NewGameType = NewGameType.static.SetGameType(MapName, Options, Portal);
    }
    // End:0x205
    if(NewGameType == none)
    {
        NewGameType = super(GameInfo).SetGameType(MapName, Options, Portal);
    }
    return NewGameType;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPAIVisibilityManager'Default__LPGame_Generic.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    bUsePackageNetInfo=true
}