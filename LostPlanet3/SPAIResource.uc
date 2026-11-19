class SPAIResource extends SPAIObject within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TIME_UNUSED_FOR_REMOVAL[131073];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name UniqueName;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array AllowedRequesterClass;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int MaxUsers;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CreationTime;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array ResourceAccess;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAccessAllowed;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDebugRender;
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bAiResLogging[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bAiResLogToWindow[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bFlushAiResLogEachLine[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bMapBasedLogName[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastHadUserTime;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float SortKey;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL MyResourceManager[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Red;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Green;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Blue;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL AiResLogFile[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private float DebugTextMaxLen[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private editfixedsize array AiResLogFilter[1073807361];

// Export USPAIResource::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResource::execGetMaxUsers(FFrame&, void* const)
native final function GetMaxUsers()
{
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResource::execCompactResourceAccessList(FFrame&, void* const)
private native final function CompactResourceAccessList();

// Export USPAIResource::execCleanResourceAccessList(FFrame&, void* const)
private native final function CleanResourceAccessList();

// Export USPAIResource::execAddResourceAccess(FFrame&, void* const)
private native final function AddResourceAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewResourceAccess[8388609];


}

// Export USPAIResource::execGetAUser(FFrame&, void* const)
native function GetAUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResource::execIsLocked(FFrame&, void* const)
native function IsLocked()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResource::execNumUsers(FFrame&, void* const)
native final function NumUsers()
{
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResource::execGetAllUsers(FFrame&, void* const)
native function GetAllUsers()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[25165825];
    local /*0x03A30000-0x00000000*/ private bool bAppendToList[9437185];

    false                
}

// Export USPAIResource::execGetAllRevokableUsers(FFrame&, void* const)
native final function GetAllRevokableUsers()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[25165825], RevokeRatings;


}

// Export USPAIResource::execGetUserIndex(FFrame&, void* const)
protected native final function GetUserIndex()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResource::execHasResourceAccess(FFrame&, void* const)
native final function HasResourceAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Access[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResource::execHasCurrentAccessForAtLeastOneUser(FFrame&, void* const)
native final function HasCurrentAccessForAtLeastOneUser()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResource::execAgeInSeconds(FFrame&, void* const)
native function AgeInSeconds()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResource::execHasUser(FFrame&, void* const)
native final function HasUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResource::execFindUserThatCanBeRevokedInFavourOf(FFrame&, void* const)
protected native event FindUserThatCanBeRevokedInFavourOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;


}

// Export USPAIResource::execGetUserMaxSpeed(FFrame&, void* const)
protected native final function GetUserMaxSpeed()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResource::execGetUserCurSpeed(FFrame&, void* const)
protected native final function GetUserCurSpeed()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResource::execGetUserAcceleration(FFrame&, void* const)
protected native final function GetUserAcceleration()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResource::execFindClassIndexFor(FFrame&, void* const)
private native final function FindClassIndexFor()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

function Init()
{
    super.Init();
    CreationTime = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    LastHadUserTime = 0.0000000;
    MyResourceManager = Outer;
    bAccessAllowed = true;
    //return;    
}

function ShutDown()
{
    RevokeAllAccess();
    CleanResourceAccessList();
    //return;    
}

function Destroy()
{
    super.Destroy();
    ShutDown();
    //return;    
}

// Export USPAIResource::execIsUsable(FFrame&, void* const)
native event IsUsable()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

event GetLastHadUserTime()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return LastHadUserTime;
    //return ReturnValue;    
}

function NotifyAIResourceAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];

    //return;    
}

// Export USPAIResource::execIsAllowedAccess(FFrame&, void* const)
protected native function IsAllowedAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function GetResourceOwner()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.ResourceManagerOuter;
    //return ReturnValue;    
}

// Export USPAIResource::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResource::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

event SetMaxUsers()
{
    local /*0x03A30000-0x00000000*/ private int NewMaxUsers[8388609], I;

    // End:0x1A
    if(NewMaxUsers < 0)
    {
        NewMaxUsers = 0;
    }
    // End:0xD5
    if(NewMaxUsers < MaxUsers)
    {
        CleanResourceAccessList();
        I = NewMaxUsers;
        J0x4E:

        // End:0xCB [Loop If]
        if(I < ResourceAccess.Length)
        {
            // End:0xBD
            if(ResourceAccess[I] != none)
            {
                ResourceAccess[I].Destroy();
                ResourceAccess[I] = none;
            }
            ++I;
            // [Loop Continue]
            goto J0x4E;
        }
        CleanResourceAccessList();
    }
    MaxUsers = NewMaxUsers;
    //return;    
}

// Export USPAIResource::execRevokeAccessForUser(FFrame&, void* const)
protected native function RevokeAccessForUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResource::execAttemptRevokeOldAccess(FFrame&, void* const)
protected native function AttemptRevokeOldAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResource::execRevokeAllAccess(FFrame&, void* const)
native function RevokeAllAccess()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function RevokeAccessForType()
{
    local /*0x03A30000-0x00000000*/ private class ActorClass[8388609];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users;
    local /*0x03A30000-0x00000000*/ private @NULL User;

    GetAllUsers(Users);
    I = 0;
    J0x1F:

    // End:0xB3 [Loop If]
    if(I < Users.Length)
    {
        User = Users[I];
        // End:0xA5
        if((User != none) && ClassIsChildOf(User.Class, ActorClass))
        {
            RevokeAccessForUser(User);
        }
        ++I;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

static function @NULL CreateSPAIResource()
{
    local /*0x03A30000-0x00000000*/ private name InName[8388609];
    local /*0x03A30000-0x00000000*/ private int InMaxUsers[8388609];
    local /*0x03A30000-0x00000400*/ private @NULL ResourceManager[8388609], ReturnValue, NewSPAIResource;

    NewSPAIResource = new (ResourceManager) default.Class;
    // End:0x7F
    if(NewSPAIResource != none)
    {
        NewSPAIResource.UniqueName = InName;
        NewSPAIResource.MaxUsers = InMaxUsers;
    }
    return NewSPAIResource;
    //return ReturnValue;    
}

protected final function GetRequesterCylinder()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float CollisionRadius[25165825], CollisionHeight;

    Requester.GetBoundingCylinder(CollisionRadius, CollisionHeight);
    //return;    
}

protected function GetRequesterSpeed()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL RequesterPawn;

    RequesterPawn = SPPawn(Requester);
    // End:0x4D
    if(RequesterPawn != none)
    {
        return RequesterPawn.GroundSpeed;        
    }
    else
    {
        return 1.0000000;
    }
    //return ReturnValue;    
}

protected function GetRequesterRotationSpeed()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL RequesterPawn;

    RequesterPawn = SPPawn(Requester);
    // End:0x69
    if(RequesterPawn != none)
    {
        return float(RequesterPawn.RotationRate.Yaw) * 0.0000959;        
    }
    else
    {
        return 1.0000000;
    }
    //return ReturnValue;    
}

// Export USPAIResource::execNotifyAIResourceChanged(FFrame&, void* const)
protected native final function NotifyAIResourceChanged();

function AllowAccess()
{
    local /*0x03A30000-0x00000000*/ private bool bAllow[8388609];

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

function ToggleAccess()
{
    AllowAccess(!bAccessAllowed);
    //return;    
}

static function @NULL CreateNew()
{
    local /*0x03A30000-0x00000400*/ private @NULL OuterAIResourceManager[8388609];
    local /*0x03A30000-0x00000000*/ private name InUniqueName[8388609];
    local /*0x03A30000-0x00000000*/ private int InMaxUsers[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array InAllowedRequesterClass[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689], NewResource;

    // End:0xC5
    if(OuterAIResourceManager != none)
    {
        NewResource = new (OuterAIResourceManager) default.Class;
        NewResource.UniqueName = InUniqueName;
        NewResource.MaxUsers = InMaxUsers;
        // End:0xB8
        if(InAllowedRequesterClass.Length > 0)
        {
            NewResource.SetAllowedRequesterClass(InAllowedRequesterClass);
        }
        return NewResource;        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

function SetAllowedRequesterClass()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array InAllowedRequesterClass[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    AllowedRequesterClass.Length = 0;
    I = 0;
    J0x17:

    // End:0x5D [Loop If]
    if(I < InAllowedRequesterClass.Length)
    {
        AllowedRequesterClass.AddItem(InAllowedRequesterClass[I]);        
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

// Export USPAIResource::execSetSortKey(FFrame&, void* const)
native function SetSortKey()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];

    OutLocation = Outer.ResourceManagerOuter.Location;
    OutRadius = 0.0000000;
    //return;    
}

function GetWorldPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.ResourceManagerOuter.Location;
    //return ReturnValue;    
}

function IsUnused()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsPendingKill())
    {
        return true;
    }
    // End:0x71
    if((AgeInSeconds()) > TIME_UNUSED_FOR_REMOVAL)
    {
        // End:0x71
        if((GetAUser()) == none)
        {
            // End:0x71
            if((Outer.GetTimeSeconds() - LastHadUserTime) > TIME_UNUSED_FOR_REMOVAL)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function HandleSequenceAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609];

    //return;    
}

function SetFromTuneData()
{
    //return;    
}

function BeginPlay()
{
    //return;    
}

function IsInFront()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorToSeeIfResourceIsInFrontOf[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyPlayersOnly()
{
    //return;    
}

event AiResLog_Internal()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string LogText[142606337];
    local /*0x03A30000-0x00000000*/ private name LogCategory[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForce[9437185];

    //return;    
}

defaultproperties
{
    TIME_UNUSED_FOR_REMOVAL=2.0000000
    MaxUsers=1
    CreationTime=-1.0000000
    bAccessAllowed=true
    Red=255
}