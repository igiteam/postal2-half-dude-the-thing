class LPTotemInteractionMetaData extends LPActorInteractionMetaData
    editinlinenew
    hidecategories(Object);

simulated function IsActorEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Totem, SP;

    Totem = LPTotemBase(MyActor);
    // End:0x2D
    if(Totem == none)
    {
        return false;
    }
    SP = SPPawn(WhoWantsToKnow);
    // End:0x5A
    if(SP == none)
    {
        return false;
    }
    // End:0xA3
    if(int(Totem.GetTeamNum()) != int(SP.GetTeamNum()))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event IsActorFriendly()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Totem, SP;

    Totem = LPTotemBase(MyActor);
    // End:0x2D
    if(Totem == none)
    {
        return false;
    }
    SP = SPPawn(WhoWantsToKnow);
    // End:0x5A
    if(SP == none)
    {
        return false;
    }
    // End:0xA3
    if(int(Totem.GetTeamNum()) == int(SP.GetTeamNum()))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
