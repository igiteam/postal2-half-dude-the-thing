class NxForceFieldTornado extends NxForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36D70000-0x00000400*/ private @NULL Shape[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DrawComponent[524289];
var(*) /*0x36D70000-0x00000000*/ private editconst float RadialStrength[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float RotationalStrength[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float LiftStrength[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float ForceTopRadius[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float LiftFalloffHeight[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float EscapeVelocity[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float ForceHeight[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float HeightOffset[65537];
var(*) /*0x36D70000-0x00000000*/ private bool BSpecialRadialForceMode[65537];
var(*) /*0x36D70000-0x00000000*/ private editconst float SelfRotationStrength[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Kernel[805437441];

// Export UNxForceFieldTornado::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

defaultproperties
{
    ForceRadius=200.0000000
    ForceTopRadius=200.0000000
    ForceHeight=200.0000000
    Components[0]=none
}