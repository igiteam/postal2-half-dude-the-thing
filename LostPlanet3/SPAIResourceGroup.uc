class SPAIResourceGroup extends SPAIObject within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name UniqueName;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array AllowedRequesterClass;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int MaxUsers;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAccessAllowed;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDebugRender;
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bAiResLogging[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bAiResLogToWindow[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bFlushAiResLogEachLine[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private bool bMapBasedLogName[1073807361];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array Resource;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array SortedResource;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL AiResMgrOwner[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Red;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Green;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Blue;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL AiResLogFile[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private float DebugTextMaxLen[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x01490000-0x00000000*/ private editfixedsize array AiResLogFilter[1073807361];

// Export USPAIResourceGroup::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResourceGroup::execIsAllowedAccess(FFrame&, void* const)
protected native function IsAllowedAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceGroup::execFindClassIndexFor(FFrame&, void* const)
private native final function FindClassIndexFor()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResourceGroup::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export USPAIResourceGroup::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceGroup::execGetExistingAccess(FFrame&, void* const)
native final function GetExistingAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;


}

// Export USPAIResourceGroup::execRevokeAllAccess(FFrame&, void* const)
native final function RevokeAllAccess();

// Export USPAIResourceGroup::execAssignSortKeys(FFrame&, void* const)
protected native function AssignSortKeys()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResourceGroup::execSortResource(FFrame&, void* const)
protected native final function SortResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];


}

// Export USPAIResourceGroup::execDoSort(FFrame&, void* const)
private native final function DoSort();

// Export USPAIResourceGroup::execNumUsers(FFrame&, void* const)
native final function NumUsers()
{
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIResourceGroup::execHasUser(FFrame&, void* const)
native final function HasUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    local /*0x03A30000-0x00000000*/ private int Idx;

    AiResMgrOwner = Outer;
    super.Init();
    Idx = 0;
    J0x28:

    // End:0xA0 [Loop If]
    if(Idx < Resource.Length)
    {
        // End:0x92
        if(Outer.IsValidResource(Resource[Idx]))
        {
            InitResource(Resource[Idx]);
        }
        ++Idx;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

function ShutDown()
{
    local /*0x03A30000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x8F [Loop If]
    if(Idx < Resource.Length)
    {
        // End:0x81
        if(Outer.IsValidResource(Resource[Idx]))
        {
            Resource[Idx].ShutDown();
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function InitResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];

    // End:0xC2
    if(Outer.IsValidResource(Res))
    {
        Res.UniqueName = UniqueName;
        Res.SetMaxUsers(MaxUsers);
        Res.SetAllowedRequesterClass(AllowedRequesterClass);
        Res.Init();
    }
    //return;    
}

function AddResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];

    // End:0x52
    if((Res != none) && !HasResource(Res))
    {
        Resource.AddItem(Res);        
        InitResource(Res);
    }
    //return;    
}

function Destroy()
{
    super.Destroy();
    ShutDown();
    //return;    
}

function RemoveAllResources()
{
    local /*0x03A30000-0x00000000*/ private int Idx;

    RevokeAllAccess();
    Idx = 0;
    J0x15:

    // End:0xD7 [Loop If]
    if(Idx < Resource.Length)
    {
        // End:0xC9
        if(Outer.IsValidResource(Resource[Idx]))
        {
            Resource[Idx].RevokeAllAccess();
            Resource[Idx].Destroy();
            Resource[Idx] = none;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x15;
    }
    Resource.Length = 0;
    //return;    
}

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

event IsUsable()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return bAccessAllowed;
    //return ReturnValue;    
}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private @NULL ResLocation;
    local /*0x03A30000-0x00000000*/ private float ResRadius, MaxRadius, CandidateRadius;

    MaxRadius = 0.0000000;
    OutLocation = GetWorldPos();
    I = 0;
    J0x2E:

    // End:0x119 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x10B
        if(Outer.IsValidResource(Resource[I]))
        {
            Resource[I].GetResourceExtents(ResLocation, ResRadius);
            CandidateRadius = VSize(ResLocation - OutLocation) + ResRadius;
            // End:0x10B
            if(CandidateRadius > MaxRadius)
            {
                MaxRadius = CandidateRadius;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x2E;
    }
    OutRadius = MaxRadius;
    //return;    
}

function GetAllUsers()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users[25165825];
    local /*0x03A30000-0x00000000*/ private bool bAppendToList[9437185];
    local /*0x03A30000-0x00000000*/ private int I;

    false
    // End:0x20
    if(!bAppendToList)
    {
        Users.Length = 0;
    }
    I = 0;
    J0x2B:

    // End:0xB9 [Loop If]
    if(I < Resource.Length)
    {
        // End:0xAB
        if(Outer.IsValidResource(Resource[I]))
        {
            Resource[I].GetAllUsers(Users, true);
        }
        ++I;
        // [Loop Continue]
        goto J0x2B;
    }
    //return;    
}

protected function GetWorldPos()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.GetOuterLocation();
    //return ReturnValue;    
}

function GetWorldPosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetWorldPos();
    //return ReturnValue;    
}

protected function NumResources()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return float(Resource.Length);
    //return ReturnValue;    
}

event GetLastHadUserTime()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private float HadTime, ShortestTime;

    ShortestTime = 2147484000.0000000;
    I = 0;
    J0x1A:

    // End:0xD2 [Loop If]
    if(I < Resource.Length)
    {
        // End:0xC4
        if(Outer.IsValidResource(Resource[I]))
        {
            HadTime = Resource[I].GetLastHadUserTime();
            // End:0xC4
            if(HadTime < ShortestTime)
            {
                ShortestTime = HadTime;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x1A;
    }
    return ShortestTime;
    //return ReturnValue;    
}

protected function GetResourceIndex()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689], I;

    // End:0xA2
    if(Res != none)
    {
        I = 0;
        J0x1A:

        // End:0xA2 [Loop If]
        if(I < Resource.Length)
        {
            // End:0x94
            if(Outer.IsValidResource(Resource[I]) && Resource[I] == Res)
            {
                return I;
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    return -1;
    //return ReturnValue;    
}

private final function HasResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return (GetResourceIndex(Res)) > -1;
    //return ReturnValue;    
}

function GetAUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private @NULL User;

    I = 0;
    J0x0B:

    // End:0x7D [Loop If]
    if(I < Resource.Length)
    {
        User = Resource[I].GetAUser();
        // End:0x6F
        if(User != none)
        {
            return User;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

static function @NULL CreateNew()
{
    local /*0x03A30000-0x00000400*/ private @NULL OuterAIResourceManager[8388609];
    local /*0x03A30000-0x00000000*/ private name InUniqueName[8388609];
    local /*0x03A30000-0x00000000*/ private int InMaxUsers[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array InAllowedRequesterClass[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689], NewResourceGroup;

    // End:0xC5
    if(OuterAIResourceManager != none)
    {
        NewResourceGroup = new (OuterAIResourceManager) default.Class;
        NewResourceGroup.UniqueName = InUniqueName;
        NewResourceGroup.MaxUsers = InMaxUsers;
        // End:0xB8
        if(InAllowedRequesterClass.Length > 0)
        {
            NewResourceGroup.SetAllowedRequesterClass(InAllowedRequesterClass);
        }
        return NewResourceGroup;        
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

function HandleSequenceAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x8D [Loop If]
    if(I < Resource.Length)
    {
        // End:0x7F
        if((Resource[I] != none) && !Resource[I].IsPendingKill())
        {
            HandleSequenceAction(inAction);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetFromTuneData()
{
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA3 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x95
        if((Resource[I] != none) && !Resource[I].IsPendingKill())
        {
            Resource[I].SetFromTuneData();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function BeginPlay()
{
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA3 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x95
        if((Resource[I] != none) && !Resource[I].IsPendingKill())
        {
            Resource[I].BeginPlay();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function RevokeAccessForType()
{
    local /*0x03A30000-0x00000000*/ private class ActorClass[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xAC [Loop If]
    if(I < Resource.Length)
    {
        // End:0x9E
        if((Resource[I] != none) && !Resource[I].IsPendingKill())
        {
            Resource[I].RevokeAccessForType(ActorClass);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
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
    MaxUsers=1
    bAccessAllowed=true
    Red=255
}