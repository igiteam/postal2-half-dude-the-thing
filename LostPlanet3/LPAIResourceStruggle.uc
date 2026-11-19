class LPAIResourceStruggle extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

// Export ULPAIResourceStruggle::execAttemptRevokeOldAccess(FFrame&, void* const)
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

function AllowAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bAllow[8388609];

    // End:0x47
    if(bAccessAllowed != bAllow)
    {
        bAccessAllowed = bAllow;
        // End:0x47
        if(!bAccessAllowed)
        {
            RevokeAllAccess();
        }
    }
    //return;    
}

event IsUsable()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bAccessAllowed;
    //return ReturnValue;    
}

defaultproperties
{
    UniqueName="Struggle"
}