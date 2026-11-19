class LPAIResourceManager extends SPAIResourceManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array RestrictedTypes;

// Export ULPAIResourceManager::execIsRestrictedType(FFrame&, void* const)
native final function IsRestrictedType()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResourceManager::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                        
}

// Export ULPAIResourceManager::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event SetRestrictedTypes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InRestrictedTypes[8388609];

    RestrictedTypes = InRestrictedTypes;
    RevokeAccessForRestrictedTypes();
    //return;    
}

function RevokeAccessForRestrictedTypes()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private class RestrictedClass;

    I = 0;
    J0x0B:

    // End:0x61 [Loop If]
    if(I < RestrictedTypes.Length)
    {
        RestrictedClass = RestrictedTypes[I];
        RevokeAccessForRestrictedType(RestrictedClass);
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GetAccess_WhileUsingAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    return GetAccess(ResourceName, Requester, RevokeTolerance);
    //return ReturnValue;    
}

function IsAccessPossible_WhileUsingAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsAccessPossible(ResourceName, Requester);
    //return ReturnValue;    
}

function RevokeAccessForRestrictedType()
{
    local /*0x97E50000-0x00000000*/ private class RestrictedClass[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x63 [Loop If]
    if(I < Resource.Length)
    {
        Resource[I].RevokeAccessForType(RestrictedClass);
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0x6E:

    // End:0xC6 [Loop If]
    if(I < ResourceGroup.Length)
    {
        ResourceGroup[I].RevokeAccessForType(RestrictedClass);
        ++I;
        // [Loop Continue]
        goto J0x6E;
    }
    //return;    
}

function GetFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL SurroundRes;

    // End:0x15
    if(!bReady)
    {
        return 0.0000000;
    }
    Index = GetResourceGroupIndex(ResourceName);
    // End:0x9A
    if(Index > -1)
    {
        SurroundRes = LPAIResSurroundFormation(ResourceGroup[Index]);
        // End:0x9A
        if(SurroundRes != none)
        {
            return SurroundRes.GetMaxFormationRadius();
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

function IsFormationBlockedByPawns()
{
    local /*0x97E50000-0x00000000*/ private name ResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL SurroundRes;

    // End:0x11
    if(!bReady)
    {
        return false;
    }
    Index = GetResourceGroupIndex(ResourceName);
    // End:0x96
    if(Index > -1)
    {
        SurroundRes = LPAIResSurroundFormation(ResourceGroup[Index]);
        // End:0x96
        if(SurroundRes != none)
        {
            return SurroundRes.IsFormationBlockedByPawns();
        }
    }
    return false;
    //return ReturnValue;    
}

function SetupResourcesFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SetupResourcesForClass()
{
    local /*0x97E50000-0x00000000*/ private class AIClass[8388609];

    //return;    
}

function RemoveResourcesForClass()
{
    local /*0x97E50000-0x00000000*/ private class AIClass[8388609];

    //return;    
}

function NotifyPlayersOnly()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA3 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x95
        if((Resource[I] != none) && !Resource[I].IsDestroyed())
        {
            Resource[I].NotifyPlayersOnly();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0xAE:

    // End:0x146 [Loop If]
    if(I < ResourceGroup.Length)
    {
        // End:0x138
        if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
        {
            ResourceGroup[I].NotifyPlayersOnly();
        }
        ++I;
        // [Loop Continue]
        goto J0xAE;
    }
    I = 0;
    J0x151:

    // End:0x1B9 [Loop If]
    if(I < CountDownTimer.Length)
    {
        // End:0x1AB
        if(CountDownTimer[I] != none)
        {
            CountDownTimer[I].NotifyPlayersOnly();
        }
        ++I;
        // [Loop Continue]
        goto J0x151;
    }
    //return;    
}

function HasLeechAround()
{
    local /*0x97E50000-0x00000000*/ private float MinDistance[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Leeches;
    local /*0x97E50000-0x00000000*/ private float SqMinDistance;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x24
    if(!GetAllUsers('LeechAttack', Leeches))
    {
        return false;
    }
    SqMinDistance = MinDistance * MinDistance;
    I = 0;
    J0x4D:

    // End:0xCD [Loop If]
    if(I < Leeches.Length)
    {
        // End:0xBF
        if(VSizeSq(Owner.Location - Leeches[I].Location) < SqMinDistance)
        {
            return true;
        }
        ++I;
        // [Loop Continue]
        goto J0x4D;
    }
    return false;
    //return ReturnValue;    
}

function GetTimeSinceLastUsed()
{
    local /*0x97E50000-0x00000000*/ private name InResourceName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    Res = GetResource(InResourceName);
    // End:0x32
    if(Res == none)
    {
        return 0.0000000;
    }
    return Owner.WorldInfo.TimeSeconds - Res.LastHadUserTime;
    //return ReturnValue;    
}
