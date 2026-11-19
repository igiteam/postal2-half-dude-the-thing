class NxRadialForceField extends NxForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x36DE0000-0x00000000*/ private editconst float ForceStrength[65537];
var(*) /*0x36DE0000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x36DE0000-0x00000000*/ private export byte ForceFalloff[589825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LinearKernel[805437441];

defaultproperties
{
    // Reference: DrawSphereComponent'Default__NxRadialForceField.DrawSphere0'
    begin object name=DrawSphere0 class=Class'DrawSphereComponent'
    end object
    RenderComponent=DrawSphere0
    ForceStrength=10.0000000
    ForceRadius=200.0000000
    Components[0]=DrawSphere0
    Components[1]=none
}