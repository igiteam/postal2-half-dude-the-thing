class ActorComponent extends Component
    abstract
    noexport;

var(*) /*0x35EA0000-0x00000000*/ private @NULL Scene[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bAttached[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bTickInEditor[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bTickIsDisabled[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsReattach[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsUpdateTransform[537001985];
var(*) /*0x35EA0000-0x00000000*/ private byte TickGroup[131073];

// Export UActorComponent::execSetTickGroup(FFrame&, void* const)
native final function SetTickGroup()
{
    local /*0x35EA0000-0x00000000*/ private byte NewTickGroup[8388609];


}

// Export UActorComponent::execSetComponentRBFixed(FFrame&, void* const)
native final function SetComponentRBFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool bFixed[8388609];


}

// Export UActorComponent::execForceUpdate(FFrame&, void* const)
native final function ForceUpdate()
{
    local /*0x35EA0000-0x00000000*/ private bool bTransformOnly[8388609];


}

// Export UActorComponent::execDetachFromAny(FFrame&, void* const)
native final function DetachFromAny();
