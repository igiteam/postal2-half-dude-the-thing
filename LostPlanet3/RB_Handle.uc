class RB_Handle extends ActorComponent
    collapsecategories
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL GrabbedComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private name GrabbedBoneName;
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bInHardware[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bRotationConstrained[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bInterpolating;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HandleData[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL KinActorData[805437441];
var(*) /*0x3FE60000-0x00000000*/ private float LinearDamping[65537];
var(*) /*0x3FE60000-0x00000000*/ private float LinearStiffness[65537];
var(*) /*0x3FE60000-0x00000000*/ private @NULL LinearStiffnessScale3D[65537];
var(*) /*0x3FE60000-0x00000000*/ private @NULL LinearDampingScale3D[65537];
var(*) /*0x3FE60000-0x00000000*/ private float AngularDamping[65537];
var(*) /*0x3FE60000-0x00000000*/ private float AngularStiffness[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Destination;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StepSize;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;

// Export URB_Handle::execGrabComponent(FFrame&, void* const)
native function @NULL GrabComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Component[8388609];
    local /*0x35EA0000-0x00000000*/ private name InBoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL GrabLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bConstrainRotation[8388609];


}

// Export URB_Handle::execReleaseComponent(FFrame&, void* const)
native function ReleaseComponent();

// Export URB_Handle::execSetLocation(FFrame&, void* const)
native function SetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609];


}

// Export URB_Handle::execSetSmoothLocation(FFrame&, void* const)
native function SetSmoothLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private float MoveTime[8388609];


}

// Export URB_Handle::execUpdateSmoothLocation(FFrame&, void* const)
native function UpdateSmoothLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[25296897];


}

// Export URB_Handle::execSetOrientation(FFrame&, void* const)
native function SetOrientation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewOrientation[25296897];


}

// Export URB_Handle::execGetOrientation(FFrame&, void* const)
native function GetOrientation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}
