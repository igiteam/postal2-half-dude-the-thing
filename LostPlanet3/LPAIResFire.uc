class LPAIResFire extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

// Export ULPAIResFire::execAttemptRevokeOldAccess(FFrame&, void* const)
protected native function AttemptRevokeOldAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];


}

function CanRequesterRevokeUserAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], CurrentUser;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event IsUsable()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsUsable(Requester);
    //return ReturnValue;    
}
