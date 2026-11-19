class LPAct1BossShellInteractionMetaData extends LPActorInteractionMetaData
    editinlinenew
    hidecategories(Object);

simulated function IsActorEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Shell;

    Shell = LPAct1BossShell(MyActor);
    // End:0x53
    if((Shell == none) || !Shell.bCanTakeDamage)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}
