class NxGenericForceFieldCapsule extends NxGenericForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x36DC0000-0x00000000*/ private float CapsuleHeight[65537];
var(*) /*0x36DC0000-0x00000000*/ private float CapsuleRadius[65537];

defaultproperties
{
    // Reference: DrawCapsuleComponent'Default__NxGenericForceFieldCapsule.DrawCapsule0'
    begin object name=DrawCapsule0 class=Class'DrawCapsuleComponent'
    end object
    RenderComponent=DrawCapsule0
    CapsuleHeight=200.0000000
    CapsuleRadius=200.0000000
    Components[0]=DrawCapsule0
    Components[1]=none
}