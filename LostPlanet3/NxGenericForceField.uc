class NxGenericForceField extends NxForceField
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36D90000-0x00000000*/ private byte Coordinates[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL Constant[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL PositionMultiplierX[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL PositionMultiplierY[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL PositionMultiplierZ[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL PositionTarget[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL VelocityMultiplierX[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL VelocityMultiplierY[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL VelocityMultiplierZ[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL VelocityTarget[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL Noise[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL FalloffLinear[65537];
var(*) /*0x36D90000-0x00000000*/ private @NULL FalloffQuadratic[65537];
var(*) /*0x36D90000-0x00000000*/ private float TorusRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LinearKernel[805437441];

defaultproperties
{
    TorusRadius=1.0000000
}