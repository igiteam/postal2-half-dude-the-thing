class SPAIResourceDensityControlled extends SPAIResLocation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native DensityAccessEvents
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float AccessTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL RequesterOfAccess;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bActive;

    structdefaultproperties
    {
        AccessTime=0.0000000
        RequesterOfAccess=none
        bActive=false
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array HisotryOfAccessTimes;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeToTrackAccessesOver;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxNumberOfAcceccessOverTrackedTime;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name AdHocTeamAccessToHoldAccessOnToWhileBeingUsedName;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL AdHocTeamAccessToHoldAccessOnToWhileBeingUsed[536870913];

// Export USPAIResourceDensityControlled::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResourceDensityControlled::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceDensityControlled::execIsDensityOfAccessesOverTimeTooHighToAllowAnotherAccess(FFrame&, void* const)
native final function IsDensityOfAccessesOverTimeTooHighToAllowAnotherAccess()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceDensityControlled::execIsAdHocTeamAccessToHoldAccessOnToWhileBeingUsedValidForTeam(FFrame&, void* const)
native final function IsAdHocTeamAccessToHoldAccessOnToWhileBeingUsedValidForTeam()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceDensityControlled::execAttemptRevokeOldAccess(FFrame&, void* const)
protected native function AttemptRevokeOldAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

function Init()
{
    super.Init();
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, Attributes.Radius, Attributes.Height);
    Attributes.Height *= float(2);
    Attributes.MoveThreshold = Attributes.Radius;
    //return;    
}

function NotifyAIResourceAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];

    AssignGroupAccessToNextInListIfNeededElseRelase(Res.GetResourceUser());
    //return;    
}

function AssignGroupAccessToNextInListIfNeededElseRelase()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorLettingGo[8388609];
    local /*0x03A30000-0x00000000*/ private int iaccess;
    local /*0x03A30000-0x00000000*/ private bool blettingGoEventDeactivated;
    local /*0x03A30000-0x00000000*/ private int numOfEvents;
    local /*0x03A30000-0x00000000*/ private @NULL groupResourcesCurrentUser;

    groupResourcesCurrentUser = ((AdHocTeamAccessToHoldAccessOnToWhileBeingUsed != none) ? AdHocTeamAccessToHoldAccessOnToWhileBeingUsed.GetResourceUser() : none);
    // End:0x227
    if((AdHocTeamAccessToHoldAccessOnToWhileBeingUsed != none) && groupResourcesCurrentUser == ActorLettingGo)
    {
        AdHocTeamAccessToHoldAccessOnToWhileBeingUsed.Destroy();
        AdHocTeamAccessToHoldAccessOnToWhileBeingUsed = none;
        blettingGoEventDeactivated = false;
        numOfEvents = HisotryOfAccessTimes.Length;
        iaccess = 0;
        J0xB8:

        // End:0x224 [Loop If]
        if(iaccess < numOfEvents)
        {
            // End:0x18C
            if((HisotryOfAccessTimes[iaccess].RequesterOfAccess != ActorLettingGo) && HisotryOfAccessTimes[iaccess].bActive)
            {
                AdHocTeamAccessToHoldAccessOnToWhileBeingUsed = Outer.GetAccess(AdHocTeamAccessToHoldAccessOnToWhileBeingUsedName, HisotryOfAccessTimes[iaccess].RequesterOfAccess);                
            }
            else
            {
                // End:0x1F5
                if(HisotryOfAccessTimes[iaccess].RequesterOfAccess == ActorLettingGo)
                {
                    HisotryOfAccessTimes[iaccess].bActive = false;
                    blettingGoEventDeactivated = true;
                }
            }
            // End:0x216
            if((AdHocTeamAccessToHoldAccessOnToWhileBeingUsed != none) && blettingGoEventDeactivated)
            {
                // [Explicit Break]
                goto J0x224;
            }
            ++iaccess;
            // [Loop Continue]
            goto J0xB8;
        }
        J0x224:
        
    }
    else
    {
        numOfEvents = HisotryOfAccessTimes.Length;
        iaccess = 0;
        J0x246:

        // End:0x2D7 [Loop If]
        if(iaccess < numOfEvents)
        {
            // End:0x2C9
            if(HisotryOfAccessTimes[iaccess].RequesterOfAccess == ActorLettingGo)
            {
                HisotryOfAccessTimes[iaccess].bActive = false;
                blettingGoEventDeactivated = true;
                // [Explicit Break]
                goto J0x2D7;
            }
            ++iaccess;
            // [Loop Continue]
            goto J0x246;
        }
    }
    J0x2D7:

    //return;    
}

function NotifyOfNeedToRecycleAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorGivingUpAccess[8388609];
    local /*0x03A30000-0x00000000*/ private int iaccess;

    AssignGroupAccessToNextInListIfNeededElseRelase(ActorGivingUpAccess);
    // End:0xA0
    if(HisotryOfAccessTimes.Length > 0)
    {
        iaccess = 0;
        J0x2E:

        // End:0xA0 [Loop If]
        if(iaccess < HisotryOfAccessTimes.Length)
        {
            // End:0x92
            if(HisotryOfAccessTimes[iaccess].RequesterOfAccess == ActorGivingUpAccess)
            {
                HisotryOfAccessTimes.Remove(iaccess, 1);                
                // [Explicit Break]
                goto J0xA0;
            }
            ++iaccess;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    J0xA0:

    //return;    
}

function CanRequesterRevokeUserAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], CurrentUser;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

protected event GetRevokeRating()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609], Requester;
    local /*0x03A30000-0x00000000*/ private float UserRevokeTimeTolerance[8388609], RequesterReachTime, ReturnValue;

    // End:0x51
    if(CanRequesterRevokeUserAccess(Requester, User))
    {
        return super.GetRevokeRating(User, Requester, UserRevokeTimeTolerance, RequesterReachTime);        
    }
    else
    {
        return float(-2147483647);
    }
    //return ReturnValue;    
}

defaultproperties
{
    TimeToTrackAccessesOver=13.4587600
    MaxNumberOfAcceccessOverTrackedTime=27.6800000
    AdHocTeamAccessToHoldAccessOnToWhileBeingUsedName="NeedsNane"
    Attributes=(RevokeReachTimeTolerance=0.1000000,TestForBlockers=false,bTestRechability=false,bTestForGround=false)
    UniqueName="NeedsName"
    MaxUsers=100
}