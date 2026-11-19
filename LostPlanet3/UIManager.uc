class UIManager extends Object within UIInteraction;

// Export UUIManager::execGetUIManager(FFrame&, void* const)
native static final function GetUIManager()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UUIManager::execCanUnpauseInternalUI(FFrame&, void* const)
native final function CanUnpauseInternalUI()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PauseGame()
{
    local /*0x35EA0000-0x00000000*/ private bool bDesiredPauseState[8388609];
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner, Eng;

    0
    Eng = Class'Engine'.static.GetEngine();
    // End:0x11B
    if(Eng.GamePlayers.Length > 0)
    {
        PlayerIndex = Clamp(PlayerIndex, 0, Eng.GamePlayers.Length - 1);
        PlayerOwner = Eng.GamePlayers[PlayerIndex].Actor;
        // End:0x11B
        if(PlayerOwner != none)
        {
            PlayerOwner.SetPause(bDesiredPauseState, CanUnpauseInternalUI);
        }
    }
    //return;    
}

function NotifyPlayerAdded()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL AddedPlayer[8388609];

    //return;    
}

function NotifyPlayerRemoved()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RemovedPlayer[8388609];

    //return;    
}

function FindLocalPlayerIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Engine;
    local /*0x35EA0000-0x00000000*/ private int I;

    Engine = Class'Engine'.static.GetEngine();
    I = 0;
    J0x34:

    // End:0xAF [Loop If]
    if(I < Engine.GamePlayers.Length)
    {
        // End:0xA1
        if(Engine.GamePlayers[I] == P)
        {
            return I;
        }
        I++;
        // [Loop Continue]
        goto J0x34;
    }
    return 0;
    //return ReturnValue;    
}
