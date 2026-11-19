class NxForceFieldGeneric extends NxForceField
    placeable
    hidecategories(AnimDependency,Navigation);

enum FFG_ForceFieldCoordinates
{
    FFG_CARTESIAN,                  // 0
    FFG_SPHERICAL,                  // 1
    FFG_CYLINDRICAL,                // 2
    FFG_TOROIDAL,                   // 3
    FFG_MAX                         // 4
};

var(*) /*0x36D20000-0x00000400*/ private @NULL Shape[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DrawComponent[524289];
var(*) /*0x36D20000-0x00000000*/ private float RoughExtentX[65537];
var(*) /*0x36D20000-0x00000000*/ private float RoughExtentY[65537];
var(*) /*0x36D20000-0x00000000*/ private float RoughExtentZ[65537];
var(*) /*0x36D20000-0x00000000*/ private byte Coordinates[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL Constant[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL PositionMultiplierX[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL PositionMultiplierY[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL PositionMultiplierZ[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL PositionTarget[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL VelocityMultiplierX[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL VelocityMultiplierY[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL VelocityMultiplierZ[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL VelocityTarget[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL Noise[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL FalloffLinear[65537];
var(*) /*0x36D20000-0x00000000*/ private @NULL FalloffQuadratic[65537];
var(*) /*0x36D20000-0x00000000*/ private float TorusRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LinearKernel[805437441];

// Export UNxForceFieldGeneric::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

defaultproperties
{
    RoughExtentX=200.0000000
    RoughExtentY=200.0000000
    RoughExtentZ=200.0000000
    TorusRadius=1.0000000
    Components[0]=none
}