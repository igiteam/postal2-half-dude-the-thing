class SPAIResGroupLocationDynamic extends SPAIResGroupLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool LocationsMoved;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array UnreachableLocations;

// Export USPAIResGroupLocationDynamic::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResGroupLocationDynamic::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000                        
}

// Export USPAIResGroupLocationDynamic::execIsUnused(FFrame&, void* const)
private native final function IsUnused()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResGroupLocationDynamic::execIsUnreachable(FFrame&, void* const)
private native final function IsUnreachable()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResGroupLocationDynamic::execRemoveUnused(FFrame&, void* const)
private native final function RemoveUnused()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIResGroupLocationDynamic::execProcessUnusedLocation(FFrame&, void* const)
private native final function ProcessUnusedLocation();

// Export USPAIResGroupLocationDynamic::execHandleLocationChange(FFrame&, void* const)
protected native function HandleLocationChange();

// Export USPAIResGroupLocationDynamic::execHandleLocationsRemoved(FFrame&, void* const)
protected native function HandleLocationsRemoved();

// Export USPAIResGroupLocationDynamic::execHandleLocationAddRequest(FFrame&, void* const)
protected native function HandleLocationAddRequest()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super.Init();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    //return;    
}

protected event NotifyChangeLocation()
{
    super.NotifyChangeLocation();
    LocationsMoved = true;
    //return;    
}

protected function NotifyUnreachable()
{
    local /*0x03A30000-0x00000000*/ private @NULL AIResLocation[8388609];

    // End:0x25
    if(AIResLocation != none)
    {
        UnreachableLocations.AddItem(AIResLocation);        
    }
    //return;    
}
