class LPAIResSpitterFire extends LPAIResFire within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

protected event FindUserThatCanBeRevokedInFavourOf()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], ReturnValue, CurrentUser;
    local /*0x97E50000-0x00000000*/ private float CurrentUserDist, PotentialUserDist;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    CurrentUser = GetAUser();
    // End:0x3E
    if((CurrentUser == none) || CurrentUser == Requester)
    {
        return none;
    }
    CurrentUserDist = VSize(OuterActor.Location - CurrentUser.Location);
    PotentialUserDist = VSize(OuterActor.Location - Requester.Location);
    CurrentPawn = LPAIPawn(CurrentUser);
    // End:0x114
    if(!CurrentPawn.CanCurrentCommandBeInterrupted())
    {
        return none;
    }
    // End:0x135
    if(PotentialUserDist < CurrentUserDist)
    {
        return CurrentUser;
    }
    return none;
    //return ReturnValue;    
}

defaultproperties
{
    UniqueName="SpitterFire"
}