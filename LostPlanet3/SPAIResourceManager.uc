class SPAIResourceManager extends ActorComponent
    editinlinenew;

const SPAIRESMAN_MAX_DEBUG_LEVEL = 4;

struct native SPAIResFormationRadius
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x05240000-0x00000000*/ private float MinRadius[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x05240000-0x00000000*/ private float IdealRadius[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x05240000-0x00000000*/ private float MaxRadius[65537];

    structdefaultproperties
    {
        MinRadius=0.0000000
        IdealRadius=0.0000000
        MaxRadius=0.0000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize array Resource[537395201];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize array ResourceGroup[537395201];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize array CountDownTimer[537395201];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bReady;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAccessAllowed;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bBeginPlay;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDebugRenderEnable[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL ResourceManagerOuter;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL ResourceManagerOwner;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int DebugLevel[536870913];

// Export USPAIResourceManager::execGetTimeSeconds(FFrame&, void* const)
native final function GetTimeSeconds()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                        
}

// Export USPAIResourceManager::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResourceManager::execGetOuterLocation(FFrame&, void* const)
native final function GetOuterLocation()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetMyActor(FFrame&, void* const)
protected native final function GetMyActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceManager::execIsValidResourceAccess(FFrame&, void* const)
native final function IsValidResourceAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL SPAIResAccess[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetAIResourceManager(FFrame&, void* const)
native static final function @NULL GetAIResourceManager()
{
    local /*0x03A30000-0x00000000*/ private @NULL TheActor[8388609], ReturnValue;


}

// Export USPAIResourceManager::execAllManagersToggleDebugForResource(FFrame&, void* const)
native static function AllManagersToggleDebugForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];


}

// Export USPAIResourceManager::execAllManagersEnableDebugForResource(FFrame&, void* const)
native static function AllManagersEnableDebugForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609];


}

// Export USPAIResourceManager::execAllManagersToggleAccessForResource(FFrame&, void* const)
native static function AllManagersToggleAccessForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];


}

// Export USPAIResourceManager::execAllManagersDisableDebug(FFrame&, void* const)
native static function AllManagersDisableDebug();

// Export USPAIResourceManager::execAllManagersSetDebugLevel(FFrame&, void* const)
native static function AllManagersSetDebugLevel()
{
    local /*0x03A30000-0x00000000*/ private int InLevel[8388609];


}

// Export USPAIResourceManager::execAllManagersAdjustDebugLevel(FFrame&, void* const)
native static function AllManagersAdjustDebugLevel()
{
    local /*0x03A30000-0x00000000*/ private int Increment[8388609];


}

// Export USPAIResourceManager::execIsValidResource(FFrame&, void* const)
native final function IsValidResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL SPAIRes[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execAddResource(FFrame&, void* const)
native function AddResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewResource[8388609];


}

// Export USPAIResourceManager::execAddResourceGroup(FFrame&, void* const)
native function AddResourceGroup()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewGroup[8388609];


}

// Export USPAIResourceManager::execAddTimer(FFrame&, void* const)
native function AddTimer()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewTimer[8388609];


}

// Export USPAIResourceManager::execRemoveResource(FFrame&, void* const)
native function RemoveResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewResource[8388609];


}

// Export USPAIResourceManager::execRemoveResourceGroup(FFrame&, void* const)
native function RemoveResourceGroup()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewGroup[8388609];


}

// Export USPAIResourceManager::execRemoveTimer(FFrame&, void* const)
native function RemoveTimer()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewTimer[8388609];


}

// Export USPAIResourceManager::execIsClient(FFrame&, void* const)
native function IsClient()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetResourceIndex(FFrame&, void* const)
protected native final function GetResourceIndex()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetResourceGroupIndex(FFrame&, void* const)
protected native final function GetResourceGroupIndex()
{
    local /*0x03A30000-0x00000000*/ private name ResourceGroupName[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetResource(FFrame&, void* const)
native final function GetResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetResourceGroup(FFrame&, void* const)
native final function GetResourceGroup()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceManager::execNumUsers(FFrame&, void* const)
native final function NumUsers()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResourceManager::execDoesResourceHaveUser(FFrame&, void* const)
native final function DoesResourceHaveUser()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execHasResource(FFrame&, void* const)
native final function HasResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execIsAccessAllowed(FFrame&, void* const)
native event IsAccessAllowed()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execIsOuterValid(FFrame&, void* const)
native final function IsOuterValid()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceManager::execGetUserRadiusAndHeight(FFrame&, void* const)
native static final function GetUserRadiusAndHeight()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float UserRadius[25165825], UserHeight;


}

// Export USPAIResourceManager::execGetResourceManagerOwner(FFrame&, void* const)
native final function GetResourceManagerOwner()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event Init()
{
    local /*0x03A30000-0x00000000*/ private int I;

    // End:0x0F
    if(bReady)
    {
        return;
    }
    ResourceManagerOuter = GetMyActor();
    // End:0x208
    if((ResourceManagerOuter != none) && !IsClient())
    {
        I = 0;
        J0x4E:

        // End:0xE6 [Loop If]
        if(I < Resource.Length)
        {
            // End:0xD8
            if((Resource[I] != none) && !Resource[I].IsDestroyed())
            {
                Resource[I].Init();
            }
            ++I;
            // [Loop Continue]
            goto J0x4E;
        }
        I = 0;
        J0xF1:

        // End:0x189 [Loop If]
        if(I < ResourceGroup.Length)
        {
            // End:0x17B
            if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
            {
                ResourceGroup[I].Init();
            }
            ++I;
            // [Loop Continue]
            goto J0xF1;
        }
        I = 0;
        J0x194:

        // End:0x1FC [Loop If]
        if(I < CountDownTimer.Length)
        {
            // End:0x1EE
            if(CountDownTimer[I] != none)
            {
                CountDownTimer[I].Init();
            }
            ++I;
            // [Loop Continue]
            goto J0x194;
        }
        bReady = true;
    }
    ResourceManagerOwner = Actor(Outer);
    //return;    
}

event ShutDown()
{
    local /*0x03A30000-0x00000000*/ private int I;

    bBeginPlay = false;
    // End:0x1D
    if(!bReady)
    {
        return;
    }
    bReady = false;
    I = 0;
    J0x34:

    // End:0xCC [Loop If]
    if(I < Resource.Length)
    {
        // End:0xBE
        if((Resource[I] != none) && !Resource[I].IsDestroyed())
        {
            Resource[I].ShutDown();
        }
        ++I;
        // [Loop Continue]
        goto J0x34;
    }
    I = 0;
    J0xD7:

    // End:0x16F [Loop If]
    if(I < ResourceGroup.Length)
    {
        // End:0x161
        if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
        {
            ResourceGroup[I].ShutDown();
        }
        ++I;
        // [Loop Continue]
        goto J0xD7;
    }
    I = 0;
    J0x17A:

    // End:0x1E2 [Loop If]
    if(I < CountDownTimer.Length)
    {
        // End:0x1D4
        if(CountDownTimer[I] != none)
        {
            CountDownTimer[I].ShutDown();
        }
        ++I;
        // [Loop Continue]
        goto J0x17A;
    }
    //return;    
}

event OnTeleport()
{
    // End:0x2B
    if(bReady)
    {
        ShutDown();
        Init();
        BeginPlay();
    }
    //return;    
}

function GetWorldInfo()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ResourceManagerOuter.WorldInfo;
    //return ReturnValue;    
}

function IsResourceValid()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x32
    if(Index > -1)
    {
        return true;
    }
    Index = GetResourceGroupIndex(ResourceName);
    // End:0x64
    if(Index > -1)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

// Export USPAIResourceManager::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function RevokeAccessForType()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private class ActorClass[8388609];
    local /*0x03A30000-0x00000000*/ private int Index;

    // End:0xD1
    if(IsAccessAllowed())
    {
        Index = GetResourceIndex(ResourceName);
        // End:0x6F
        if(Index > -1)
        {
            Resource[Index].RevokeAccessForType(ActorClass);
        }
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xD1
        if(Index > -1)
        {
            ResourceGroup[Index].RevokeAccessForType(ActorClass);
        }
    }
    //return;    
}

final function GetLastHadUserTime()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x5A
    if(Index > -1)
    {
        return Resource[Index].GetLastHadUserTime();
    }
    Index = GetResourceGroupIndex(ResourceName);
    // End:0xB4
    if(Index > -1)
    {
        return ResourceGroup[Index].GetLastHadUserTime();
    }
    return -1.0000000;
    //return ReturnValue;    
}

final event GetAUser()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x5A
    if(Index > -1)
    {
        return Resource[Index].GetAUser();
    }
    Index = GetResourceGroupIndex(ResourceName);
    // End:0xB4
    if(Index > -1)
    {
        return ResourceGroup[Index].GetAUser();
    }
    return none;
    //return ReturnValue;    
}

final function HandleSequenceAction()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x03A30000-0x00000000*/ private int Index;

    // End:0xD3
    if(inAction != none)
    {
        Index = GetResourceIndex(ResourceName);
        // End:0x71
        if(Index > -1)
        {
            Resource[Index].HandleSequenceAction(inAction);
        }
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xD3
        if(Index > -1)
        {
            ResourceGroup[Index].HandleSequenceAction(inAction);
        }
    }
    //return;    
}

event IsUsable()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Index;

    // End:0x11
    if(!bReady)
    {
        return false;
    }
    // End:0xF5
    if((Requester != none) && IsAccessAllowed())
    {
        Index = GetResourceIndex(ResourceName);
        // End:0x92
        if(Index > -1)
        {
            return Resource[Index].IsUsable(Requester);
        }
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xF5
        if(Index > -1)
        {
            return ResourceGroup[Index].IsUsable(Requester);
        }
    }
    return false;
    //return ReturnValue;    
}

function GetResourceLocationExtents()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Location[25165825];
    local /*0x03A30000-0x00000000*/ private float Radius[25165825];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Index;

    // End:0x11
    if(!IsAccessAllowed())
    {
        return false;
    }
    Index = GetResourceIndex(ResourceName);
    // End:0x81
    if(Index > -1)
    {
        Resource[Index].GetResourceExtents(Location, Radius);
        return true;        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xEE
        if(Index > -1)
        {
            ResourceGroup[Index].GetResourceExtents(Location, Radius);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetAllUsers()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[25165825];
    local /*0x03A30000-0x00000000*/ private bool bAppendToList[9437185], ReturnValue;
    local /*0x03A30000-0x00000000*/ private int Index;

    false
    // End:0x20
    if(!bAppendToList)
    {
        Users.Length = 0;
    }
    Index = GetResourceIndex(ResourceName);
    // End:0x91
    if(Index > -1)
    {
        Resource[Index].GetAllUsers(Users, bAppendToList);
        return true;        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xFF
        if(Index > -1)
        {
            ResourceGroup[Index].GetAllUsers(Users, bAppendToList);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetAllResourcesUsers()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[25165825];
    local /*0x03A30000-0x00000000*/ private @NULL Item, Group;

    Users.Length = 0;
    // End:0x4D
    foreach Resource(Item)
    {
        Item.GetAllUsers(Users, true);        
    }    
    // End:0x8F
    foreach ResourceGroup(Group)
    {
        Group.GetAllUsers(Users, true);        
    }    
    //return;    
}

function AllowAccess()
{
    local /*0x03A30000-0x00000000*/ private bool bAllow[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    // End:0x11
    if(!bReady)
    {
        return;
    }
    // End:0x199
    if(bAccessAllowed != bAllow)
    {
        bAccessAllowed = bAllow;
        I = 0;
        J0x4A:

        // End:0xEC [Loop If]
        if(I < Resource.Length)
        {
            // End:0xDE
            if((Resource[I] != none) && !Resource[I].IsDestroyed())
            {
                Resource[I].AllowAccess(bAllow);
            }
            ++I;
            // [Loop Continue]
            goto J0x4A;
        }
        I = 0;
        J0xF7:

        // End:0x199 [Loop If]
        if(I < ResourceGroup.Length)
        {
            // End:0x18B
            if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
            {
                ResourceGroup[I].AllowAccess(bAllow);
            }
            ++I;
            // [Loop Continue]
            goto J0xF7;
        }
    }
    //return;    
}

final event AllowAccessForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool bAllow[9437185];
    local /*0x03A30000-0x00000000*/ private int Index;

    true
    Index = GetResourceIndex(ResourceName);
    // End:0x6B
    if(Index > -1)
    {
        Resource[Index].AllowAccess(bAllow);        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xCE
        if(Index > -1)
        {
            ResourceGroup[Index].AllowAccess(bAllow);
        }
    }
    //return;    
}

final event ToggleAccessForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x5C
    if(Index > -1)
    {
        Resource[Index].ToggleAccess();        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xB5
        if(Index > -1)
        {
            ResourceGroup[Index].ToggleAccess();
        }
    }
    //return;    
}

function HasTimerExpired()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;

    I = GetTimerIndex(TimerName);
    // End:0x5D
    if(I > -1)
    {
        return CountDownTimer[I].HasExpired();        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}

function GetTimeLeft()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;

    I = GetTimerIndex(TimerName);
    // End:0x5A
    if(I > -1)
    {
        return CountDownTimer[I].GetTimeLeft();
    }
    return 0.0000000;
    //return ReturnValue;    
}

function ResetTimerRange()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private float DesiredCountDownTimeMin[9437185], DesiredCountDownTimeMax;
    local /*0x03A30000-0x00000000*/ private int I;

    -1.0000000
    -1.0000000
    I = GetTimerIndex(TimerName);
    // End:0x7D
    if(I > -1)
    {
        CountDownTimer[I].Reset(DesiredCountDownTimeMin, DesiredCountDownTimeMax);
    }
    //return;    
}

function ResetTimer()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private float DesiredCountDownTime[9437185];
    local /*0x03A30000-0x00000000*/ private int I;

    -1.0000000
    I = GetTimerIndex(TimerName);
    // End:0x74
    if(I > -1)
    {
        CountDownTimer[I].Reset(DesiredCountDownTime, DesiredCountDownTime);
    }
    //return;    
}

function ClearTimer()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    I = GetTimerIndex(TimerName);
    // End:0x59
    if(I > -1)
    {
        CountDownTimer[I].Clear();
    }
    //return;    
}

private final function GetTimerIndex()
{
    local /*0x03A30000-0x00000000*/ private name TimerName[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < CountDownTimer.Length)
    {
        // End:0x7E
        if((CountDownTimer[I] != none) && CountDownTimer[I].UniqueName == TimerName)
        {
            return I;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function GetOuterRadiusAndHeight()
{
    local /*0x03A30000-0x00000000*/ private float UserRadius[25165825], UserHeight;

    GetUserRadiusAndHeight(Actor(Outer), UserRadius, UserHeight);
    //return;    
}

event SetFromTuneData()
{
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA3 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x95
        if((Resource[I] != none) && !Resource[I].IsDestroyed())
        {
            Resource[I].SetFromTuneData();
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
            ResourceGroup[I].SetFromTuneData();
        }
        ++I;
        // [Loop Continue]
        goto J0xAE;
    }
    I = 0;
    J0x151:

    // End:0x1A0 [Loop If]
    if(I < CountDownTimer.Length)
    {
        CountDownTimer[I].SetFromTuneData();
        ++I;
        // [Loop Continue]
        goto J0x151;
    }
    //return;    
}

event BeginPlay()
{
    local /*0x03A30000-0x00000000*/ private int I;

    bBeginPlay = true;
    I = 0;
    J0x17:

    // End:0xAF [Loop If]
    if(I < Resource.Length)
    {
        // End:0xA1
        if((Resource[I] != none) && !Resource[I].IsDestroyed())
        {
            Resource[I].BeginPlay();
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    I = 0;
    J0xBA:

    // End:0x152 [Loop If]
    if(I < ResourceGroup.Length)
    {
        // End:0x144
        if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
        {
            ResourceGroup[I].BeginPlay();
        }
        ++I;
        // [Loop Continue]
        goto J0xBA;
    }
    I = 0;
    J0x15D:

    // End:0x1AC [Loop If]
    if(I < CountDownTimer.Length)
    {
        CountDownTimer[I].BeginPlay();
        ++I;
        // [Loop Continue]
        goto J0x15D;
    }
    //return;    
}

event HasBegunPlay()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return bBeginPlay;
    //return ReturnValue;    
}

event EnableDebug()
{
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609];

    bDebugRenderEnable = bEnable;
    //return;    
}

event IsDebugEnabled()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return bDebugRenderEnable;
    //return ReturnValue;    
}

event ToggleDebug()
{
    bDebugRenderEnable = !bDebugRenderEnable;
    //return;    
}

event EnableDebugForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609];
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x67
    if(Index > -1)
    {
        Resource[Index].bDebugRender = bEnable;        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xCB
        if(Index > -1)
        {
            ResourceGroup[Index].bDebugRender = bEnable;
        }
    }
    // End:0xF8
    if((Index > -1) && bEnable)
    {
        EnableDebug(true);
    }
    //return;    
}

event IsDebugEnabledForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609], ReturnValue;
    local /*0x03A30000-0x00000000*/ private int Index;

    Index = GetResourceIndex(ResourceName);
    // End:0x5D
    if(Index > -1)
    {
        return Resource[Index].bDebugRender;        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0xB7
        if(Index > -1)
        {
            return ResourceGroup[Index].bDebugRender;
        }
    }
    return false;
    //return ReturnValue;    
}

event ToggleDebugForResource()
{
    local /*0x03A30000-0x00000000*/ private name ResourceName[8388609];
    local /*0x03A30000-0x00000000*/ private int Index;
    local /*0x03A30000-0x00000000*/ private bool bEnable;

    Index = GetResourceIndex(ResourceName);
    // End:0xBC
    if(Index > -1)
    {
        Resource[Index].bDebugRender = !Resource[Index].bDebugRender;
        bEnable = Resource[Index].bDebugRender;        
    }
    else
    {
        Index = GetResourceGroupIndex(ResourceName);
        // End:0x175
        if(Index > -1)
        {
            ResourceGroup[Index].bDebugRender = !ResourceGroup[Index].bDebugRender;
            bEnable = ResourceGroup[Index].bDebugRender;
        }
    }
    // End:0x1A2
    if((Index > -1) && bEnable)
    {
        EnableDebug(true);
    }
    //return;    
}

event DisableDebugForAllResource()
{
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA5 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x97
        if((Resource[I] != none) && !Resource[I].IsDestroyed())
        {
            Resource[I].bDebugRender = false;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0xB0:

    // End:0x14A [Loop If]
    if(I < ResourceGroup.Length)
    {
        // End:0x13C
        if((ResourceGroup[I] != none) && !ResourceGroup[I].IsDestroyed())
        {
            ResourceGroup[I].bDebugRender = false;
        }
        ++I;
        // [Loop Continue]
        goto J0xB0;
    }
    EnableDebug(false);
    //return;    
}

defaultproperties
{
    bAccessAllowed=true
}