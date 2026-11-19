class NxForceFieldRadial extends NxForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36D40000-0x00000400*/ private @NULL Shape[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DrawComponent[524289];
var(*) /*0x36D40000-0x00000000*/ private editconst float ForceStrength[65537];
var(*) /*0x36D40000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x36D40000-0x00000000*/ private editconst float SelfRotationStrength[65537];
var(*) /*0x36D40000-0x00000000*/ private export byte ForceFalloff[589825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Kernel[805437441];

// Export UNxForceFieldRadial::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

defaultproperties
{
    ForceRadius=200.0000000
    Components[0]=none
}