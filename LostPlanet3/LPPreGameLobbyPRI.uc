class LPPreGameLobbyPRI extends LPMenuGamePRI
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReady;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSubmittedMapVote[2097153];

simulated function RemoveMapVote()
{
    // End:0x11
    if(!bSubmittedMapVote)
    {
        return;
    }
    ServerRemoveMapVote();
    //return;    
}

protected reliable server function ServerRemoveMapVote()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    // End:0x7D
    if(GRI != none)
    {
        bSubmittedMapVote = false;
        // End:0x7D
        if(!GRI.RemoveMapVote(self))
        {
            bSubmittedMapVote = true;
        }
    }
    //return;    
}

simulated function SubmitMapVote()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    // End:0x66
    if(bSubmittedMapVote && !GRI.bAllowVoteRecast)
    {
        return;
    }
    ServerSubmitMapVote(MapName);
    //return;    
}

protected reliable server function ServerSubmitMapVote()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    // End:0x86
    if(GRI != none)
    {
        bSubmittedMapVote = true;
        // End:0x86
        if(!GRI.SubmitMapVote(self, MapName))
        {
            bSubmittedMapVote = false;
        }
    }
    //return;    
}
