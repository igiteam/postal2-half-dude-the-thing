class LPSnowcatObjectiveInteractionMetaData extends LPActorInteractionMetaData
    editinlinenew
    hidecategories(Object);

simulated function IsActorEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Snowcat, TI, GRI, SP;

    Snowcat = LPSnowcatObjective(MyActor);
    // End:0x2D
    if(Snowcat == none)
    {
        return false;
    }
    SP = SPPawn(WhoWantsToKnow);
    // End:0x5A
    if(SP == none)
    {
        return false;
    }
    GRI = Snowcat.WorldInfo.GRI;
    // End:0xA8
    if(GRI == none)
    {
        return false;
    }
    TI = LPTeamInfo_MP(GRI.Teams[int(SP.GetTeamNum())]);
    // End:0x10C
    if(TI == none)
    {
        return false;
    }
    // End:0x151
    if(Snowcat.bAttacking != TI.bAttackingTeam)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
