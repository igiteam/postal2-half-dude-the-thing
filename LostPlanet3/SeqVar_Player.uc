class SeqVar_Player extends SeqVar_Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Players[536870913];
var(*) /*0x44A30000-0x00000000*/ private bool bAllPlayers[65537];
var(*) /*0x44A30000-0x00000000*/ private int PlayerIdx[65537];

// Export USeqVar_Player::execUpdatePlayersList(FFrame&, void* const)
native final function UpdatePlayersList();

function GetObjectValue()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], C;

    UpdatePlayersList();
    // End:0x99
    if(Players.Length > 0)
    {
        // End:0x73
        if((bAllPlayers || PlayerIdx < 0) || PlayerIdx >= Players.Length)
        {
            C = Controller(Players[0]);            
        }
        else
        {
            C = Controller(Players[PlayerIdx]);
        }
    }
    return (((C != none) && C.Pawn != none) ? C.Pawn : C);
    //return ReturnValue;    
}

defaultproperties
{
    bAllPlayers=true
    SupportedClasses=/* Array type was not detected. */
    ObjName="Player"
}