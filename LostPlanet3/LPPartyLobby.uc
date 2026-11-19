class LPPartyLobby extends LPMenuGame
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

event InitGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    super.InitGame(Options, ErrorMessage);
    //return;    
}

function PickTeam()
{
    local /*0x97E50000-0x00000000*/ private byte Current[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

event PostLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609], LPPC;

    super.PostLogin(NewPlayer);
    // End:0x65
    if(NumPlayers > MaxPlayers)
    {
        LPPC = LPPlayerController(NewPlayer);
        LPPC.ClientGameFullError();
    }
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameParty);
    //return;    
}

function Logout()
{
    local /*0x97E50000-0x00000000*/ private @NULL Exiting[8388609];

    super(GameInfo).Logout(Exiting);
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameParty);
    //return;    
}

function RegisterServer()
{
    //return;    
}

defaultproperties
{
    // Reference: SPAIVisibilityManager'Default__LPPartyLobby.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    PlayerControllerClass=Class'LPPartyPC'
    PlayerReplicationInfoClass=Class'LPPartyPRI'
}