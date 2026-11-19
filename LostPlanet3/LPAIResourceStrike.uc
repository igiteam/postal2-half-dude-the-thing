class LPAIResourceStrike extends SPAIResLocation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

// Export ULPAIResourceStrike::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResourceStrike::execAttemptRevokeOldAccess(FFrame&, void* const)
protected native function AttemptRevokeOldAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];


}

function Init()
{
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, Attributes.Radius, Attributes.Height);
    Attributes.Height *= float(2);
    Attributes.MoveThreshold = Attributes.Radius;
    super.Init();
    //return;    
}

function CanRequesterRevokeDongoAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPAIPawnAkridSmall(Requester) != none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanRequesterRevokeUserAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], CurrentUser;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(LPAIPawnDongo(CurrentUser) != none)
    {
        return CanRequesterRevokeDongoAccess(Requester);
    }
    return true;
    //return ReturnValue;    
}

function ShouldSmallAkridAlwaysYieldAccessToRequester()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPAIPawnDongo(Requester) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldUserAlwaysYieldAccessToRequester()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], CurrentUser;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(LPAIPawnAkridSmall(CurrentUser) != none)
    {
        return ShouldSmallAkridAlwaysYieldAccessToRequester(Requester);
    }
    return false;
    //return ReturnValue;    
}

event GetUserReachTimeForRating()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RequesterPawn, UserController;
    local /*0x97E50000-0x00000000*/ private float ReachTime, Scale, Constant;

    ReachTime = super.GetUserReachTimeForRating(Requester);
    RequesterPawn = LPAIPawn(Requester);
    // End:0xE2
    if(RequesterPawn != none)
    {
        UserController = LPAIController(RequesterPawn.Controller);
        // End:0xE2
        if(UserController != none)
        {
            UserController.GetStrikeRevokeRatingModificationFactor(Scale, Constant);
            ReachTime = (ReachTime * Scale) + Constant;
        }
    }
    return ReachTime;
    //return ReturnValue;    
}

protected event GetRevokeRating()
{
    local /*0x97E50000-0x00000000*/ private @NULL User[8388609], Requester;
    local /*0x97E50000-0x00000000*/ private float UserRevokeTimeTolerance[8388609], RequesterReachTime, ReturnValue, UserReachTime;

    // End:0xA5
    if(CanRequesterRevokeUserAccess(Requester, User))
    {
        // End:0x73
        if(ShouldUserAlwaysYieldAccessToRequester(Requester, User))
        {
            UserReachTime = GetUserReachTimeForRating(User);
            return UserReachTime + RequesterReachTime;            
        }
        else
        {
            return super.GetRevokeRating(User, Requester, UserRevokeTimeTolerance, RequesterReachTime);
        }        
    }
    else
    {
        return float(-2147483647);
    }
    //return ReturnValue;    
}

defaultproperties
{
    Attributes=(RevokeReachTimeTolerance=0.1000000,TestForBlockers=false,bTestRechability=false,bTestForGround=false)
    UniqueName="strike"
}