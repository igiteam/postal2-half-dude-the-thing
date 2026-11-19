class UIDataStore_OnlineGameSearch extends UIDataStore_Remote
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

struct native GameSearchCfg
{
    var(*) /*0x35EA0000-0x00000000*/ private class GameSearchClass;
    var(*) /*0x35EA0000-0x00000000*/ private class DefaultGameSettingsClass;
    var(*) /*0x35EA0000-0x00000000*/ private class SearchResultsProviderClass;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL DesiredSettingsProvider;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Search;
    var(*) /*0x35EA0000-0x00000000*/ private name SearchName;

    structdefaultproperties
    {
        GameSearchClass=none
        DefaultGameSettingsClass=none
        SearchResultsProviderClass=none
        DesiredSettingsProvider=none
        Search=none
        SearchName="None"
    }
};

var(*) /*0x35EA0000-0x00000000*/ private name SearchResultsName[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameInterface;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GameSearchCfgList[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SelectedIndex;
var(*) /*0x35EA0000-0x00000000*/ private int ActiveSearchIndex;

event Init()
{
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB1
    if(OnlineSub != none)
    {
        GameInterface = OnlineSub.GameInterface;
        // End:0xB1
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameInterface.AddFindOnlineGamesCompleteDelegate(OnSearchComplete);
        }
    }
    //return;    
}

function InvalidateCurrentSearchResults()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL ActiveSearch;
    local /*0x35EA0000-0x00000000*/ private bool bResult;

    ActiveSearch = GetActiveGameSearch();
    // End:0x96
    if(ActiveSearch != none)
    {
        // End:0x96
        if(GameInterface.FreeSearchResults(ActiveSearch))
        {
            RefreshSubscribers(SearchResultsName, true, GameSearchCfgList[SelectedIndex].DesiredSettingsProvider);
            bResult = true;
        }
    }
    return bResult;
    //return ReturnValue;    
}

event SubmitGameSearch()
{
    local /*0x35EA0000-0x00000000*/ private byte ControllerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateExistingSearchResults[9437185], ReturnValue;

    true
    // End:0x16B
    if(OnlineSub != none)
    {
        // End:0x168
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            // End:0x64
            if(bInvalidateExistingSearchResults || ActiveSearchIndex == SelectedIndex)
            {
                InvalidateCurrentSearchResults();
            }
            // End:0xCD
            if((ActiveSearchIndex == -1) || !GameSearchCfgList[ActiveSearchIndex].Search.bIsSearchInProgress)
            {
                ActiveSearchIndex = SelectedIndex;
            }
            // End:0x10B
            if(OverrideQuerySubmission(ControllerIndex, GameSearchCfgList[ActiveSearchIndex].Search))
            {
                return true;
            }
            InvalidateCurrentSearchResults();
            return GameInterface.FindOnlineGames(ControllerIndex, GameSearchCfgList[ActiveSearchIndex].Search);            
        }        
    }
    return false;
    //return ReturnValue;    
}

protected function OverrideQuerySubmission()
{
    local /*0x35EA0000-0x00000000*/ private byte ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Search[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function OnSearchComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x59
    if(bWasSuccessful == true)
    {
        ActiveSearchIndex = 0;
        RefreshSubscribers(SearchResultsName, false, GameSearchCfgList[ActiveSearchIndex].DesiredSettingsProvider);        
    }
    //return;    
}

event GetSearchResultFromIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ListIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Result[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xAC
    if((ListIndex >= 0) && ListIndex < GameSearchCfgList[SelectedIndex].Search.Results.Length)
    {
        Result = GameSearchCfgList[SelectedIndex].Search.Results[ListIndex];
        return true;
    }
    return false;
    //return ReturnValue;    
}

event ShowHostGamercard()
{
    local /*0x35EA0000-0x00000000*/ private byte ControllerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private int ListIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerExt, Game;

    // End:0x165
    if((ListIndex >= 0) && ListIndex < GameSearchCfgList[SelectedIndex].Search.Results.Length)
    {
        // End:0x162
        if(OnlineSub != none)
        {
            PlayerExt = OnlineSub.PlayerInterfaceEx;
            // End:0x15F
            if(NotEqual_InterfaceInterface(PlayerExt, OnlinePlayerInterfaceEx(none)))
            {
                Game = GameSearchCfgList[SelectedIndex].Search.Results[ListIndex].GameSettings;
                return PlayerExt.ShowGamerCardUI(ControllerIndex, Game.OwningPlayerId);                
            }            
        }        
    }
    //return ReturnValue;    
}

event GetCurrentGameSearch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x50
    if((SelectedIndex >= 0) && SelectedIndex < GameSearchCfgList.Length)
    {
        return GameSearchCfgList[SelectedIndex].Search;
    }
    return none;
    //return ReturnValue;    
}

event GetActiveGameSearch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x50
    if((ActiveSearchIndex >= 0) && ActiveSearchIndex < GameSearchCfgList.Length)
    {
        return GameSearchCfgList[ActiveSearchIndex].Search;
    }
    return none;
    //return ReturnValue;    
}

function FindSearchConfigurationIndex()
{
    local /*0x35EA0000-0x00000000*/ private name SearchTag[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], Index;

    Index = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(Index < GameSearchCfgList.Length)
    {
        // End:0x61
        if(GameSearchCfgList[Index].SearchName == SearchTag)
        {
            return Index;
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

event SetCurrentByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int NewIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateExistingSearchResults[9437185];

    true
    // End:0x9F
    if((NewIndex >= 0) && NewIndex < GameSearchCfgList.Length)
    {
        SelectedIndex = NewIndex;
        // End:0x9C
        if(!bInvalidateExistingSearchResults || !InvalidateCurrentSearchResults())
        {
            RefreshSubscribers(SearchResultsName, true, GameSearchCfgList[SelectedIndex].DesiredSettingsProvider);
        }        
    }
    //return;    
}

event SetCurrentByName()
{
    local /*0x35EA0000-0x00000000*/ private name SearchName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateExistingSearchResults[9437185];
    local /*0x35EA0000-0x00000000*/ private int Index;

    true
    Index = FindSearchConfigurationIndex(SearchName);
    // End:0xA6
    if(Index != -1)
    {
        SelectedIndex = Index;
        // End:0xA3
        if(!bInvalidateExistingSearchResults || !InvalidateCurrentSearchResults())
        {
            RefreshSubscribers(SearchResultsName, true, GameSearchCfgList[SelectedIndex].DesiredSettingsProvider);
        }        
    }
    //return;    
}

event MoveToNext()
{
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateExistingSearchResults[9437185];

    true
    SelectedIndex = Min(SelectedIndex + 1, GameSearchCfgList.Length - 1);
    // End:0x85
    if(!bInvalidateExistingSearchResults || !InvalidateCurrentSearchResults())
    {
        RefreshSubscribers(SearchResultsName, true, GameSearchCfgList[SelectedIndex].DesiredSettingsProvider);
    }
    //return;    
}

event MoveToPrevious()
{
    local /*0x35EA0000-0x00000000*/ private bool bInvalidateExistingSearchResults[9437185];

    true
    SelectedIndex = Max(SelectedIndex - 1, 0);
    // End:0x79
    if(!bInvalidateExistingSearchResults || !InvalidateCurrentSearchResults())
    {
        RefreshSubscribers(SearchResultsName, true, GameSearchCfgList[SelectedIndex].DesiredSettingsProvider);
    }
    //return;    
}

function ClearAllSearchResults()
{
    local /*0x35EA0000-0x00000000*/ private int OriginalActiveIndex, GameTypeIndex;

    OriginalActiveIndex = ActiveSearchIndex;
    // End:0xC2
    if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        GameTypeIndex = 0;
        J0x3E:

        // End:0xC2 [Loop If]
        if(GameTypeIndex < GameSearchCfgList.Length)
        {
            ActiveSearchIndex = GameTypeIndex;
            // End:0xB4
            if(!GameInterface.FreeSearchResults(GameSearchCfgList[GameTypeIndex].Search))
            {
            }
            GameTypeIndex++;
            // [Loop Continue]
            goto J0x3E;
        }
    }
    ActiveSearchIndex = OriginalActiveIndex;
    //return;    
}

defaultproperties
{
    SearchResultsName="SearchResults"
    ActiveSearchIndex=-1
    Tag="OnlineGameSearch"
}