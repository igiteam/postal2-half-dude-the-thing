class SPAIResourceAccess extends SPAIObject within SPAIResourceManager
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Resource[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL ResourceUser[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bLocked[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeGenerated[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RevokeTolerance[536870913];

// Export USPAIResourceAccess::execCreateNew(FFrame&, void* const)
native static final function @NULL CreateNew()
{
    local /*0x03A30000-0x00000000*/ private @NULL InResource[8388609], InResourceUser, ResourceManager, ReturnValue;


}

// Export USPAIResourceAccess::execGetRevokeTolerane(FFrame&, void* const)
native final function GetRevokeTolerane()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPAIResourceAccess::execSetRevokeTolerane(FFrame&, void* const)
native final function SetRevokeTolerane()
{
    local /*0x03A30000-0x00000000*/ private float Tolerance[8388609];


}

// Export USPAIResourceAccess::execHasResourceReference(FFrame&, void* const)
private native final function HasResourceReference()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceAccess::execGetResource(FFrame&, void* const)
native function GetResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceAccess::execGetResourceUser(FFrame&, void* const)
native function GetResourceUser()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIResourceAccess::execIsValid(FFrame&, void* const)
native function IsValid()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResourceAccess::execIsLocked(FFrame&, void* const)
native function IsLocked()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

event Lock()
{
    local /*0x03A30000-0x00000000*/ private bool bInLock[8388609];

    bLocked = bInLock;
    //return;    
}

function Destroy()
{
    local /*0x03A30000-0x00000000*/ private @NULL TheUser, Res;

    TheUser = SPPawn(ResourceUser);
    // End:0x4B
    if(TheUser != none)
    {
        TheUser.NotifyAIResourceAccessLost(self);
    }
    Res = GetResource();
    // End:0x8E
    if(Res != none)
    {
        Res.NotifyAIResourceAccessLost(self);
    }
    ResourceUser = none;
    Resource = none;
    super.Destroy();
    //return;    
}

final function AgeInSeconds()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.GetTimeSeconds() - TimeGenerated;
    //return ReturnValue;    
}

final function GetResourceName()
{
    local /*0x03A30000-0x00000000*/ private name ReturnValue[92274689], ResName;

    // End:0x36
    if(HasResourceReference())
    {
        ResName = GetResource().UniqueName;
    }
    return ResName;
    //return ReturnValue;    
}

function IsInFront()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorToSeeIfResourceIsInFrontOf[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL theRes;

    theRes = GetResource();
    // End:0x4C
    if(theRes != none)
    {
        return theRes.IsInFront(ActorToSeeIfResourceIsInFrontOf);
    }
    return true;
    //return ReturnValue;    
}
