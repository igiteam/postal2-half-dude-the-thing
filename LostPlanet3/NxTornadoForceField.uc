class NxTornadoForceField extends NxForceField
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36E10000-0x00000000*/ private editconst float RadialStrength[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float RotationalStrength[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float LiftStrength[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float ForceTopRadius[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float LiftFalloffHeight[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float EscapeVelocity[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float ForceHeight[65537];
var(*) /*0x36E10000-0x00000000*/ private editconst float HeightOffset[65537];
var(*) /*0x36E10000-0x00000000*/ private bool BSpecialRadialForceMode[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Kernel[805437441];

defaultproperties
{
    ForceRadius=200.0000000
}