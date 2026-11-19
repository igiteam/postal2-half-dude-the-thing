class LandscapeGizmoActor extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x28470000-0x00000000*/ private float Width[65537];
var(*) /*0x28470000-0x00000000*/ private float Height[65537];
var(*) /*0x28470000-0x00000000*/ private float LengthZ[65537];
var(*) /*0x28470000-0x00000000*/ private float MarginZ[65537];
var(*) /*0x28470000-0x00000000*/ private float MinRelativeZ[65537];
var(*) /*0x28470000-0x00000000*/ private float RelativeScaleZ[65537];
var(*) /*0x28470000-0x00000000*/ private const @NULL TargetLandscapeInfo[536936449];

defaultproperties
{
    Components[0]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=true
    bMovable=false
    bEditable=false
}