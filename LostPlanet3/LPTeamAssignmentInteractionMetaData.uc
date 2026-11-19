class LPTeamAssignmentInteractionMetaData extends LPActorInteractionMetaData
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x89380000-0x00000000*/ private byte TeamNumber[65537];

simulated function IsActorEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AskingPawn;

    // End:0x16
    if(int(TeamNumber) == int(3))
    {
        return false;
    }
    AskingPawn = SPPawn(WhoWantsToKnow);
    // End:0x74
    if(AskingPawn != none)
    {
        // End:0x74
        if(int(AskingPawn.GetTeamNum()) != int(TeamNumber))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsActorFriendly()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AskingPawn;

    // End:0x16
    if(int(TeamNumber) == int(3))
    {
        return true;
    }
    AskingPawn = SPPawn(WhoWantsToKnow);
    // End:0x74
    if(AskingPawn != none)
    {
        // End:0x74
        if(int(AskingPawn.GetTeamNum()) != int(TeamNumber))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}
