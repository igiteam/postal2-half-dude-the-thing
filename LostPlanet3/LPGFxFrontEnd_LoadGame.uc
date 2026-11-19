class LPGFxFrontEnd_LoadGame extends LPGFxSaveSlot within GFxMoviePlayer
    config(UI);

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MyEngine, LPPC;

    super.OnListItemPress(ev);
    LPPC = LPPlayerController(MoviePlayer.GetPC());
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0xF4
    if(LPPC != none)
    {
        // End:0xF4
        if(LPPC.LoadCheckpointNamed("SPCheckpoint0", MyEngine.PendingCheckpointSlot))
        {
            MoviePlayer.EndSPGFxMoviePlayer();
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPSeekFreePackageLoader'Default__LPGFxFrontEnd_LoadGame.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
}