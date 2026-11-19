class NxForceFieldComponent extends PrimitiveComponent
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Collision,Lighting,Physics,Rendering,Object);

var(*) /*0x36D00000-0x00000400*/ private @NULL Shape[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DrawComponent[524289];
var(*) /*0x36D00000-0x00000000*/ private int ExcludeChannel[65537];
var(*) /*0x36D00000-0x00000000*/ private bool bForceActive[65537];
var(*) /*0x36D00000-0x00000000*/ private bool bDestroyWhenInactive[65537];
var(*) /*0x36D00000-0x00000000*/ private @NULL CollideWithChannels[196609];
var(*) /*0x36D00000-0x00000000*/ private float Duration[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ForceField[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ConvexMeshes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapePoses[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float ElapsedTime;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RBPhysScene[268435457];

// Export UNxForceFieldComponent::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();
