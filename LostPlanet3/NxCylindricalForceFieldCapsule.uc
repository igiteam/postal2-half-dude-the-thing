class NxCylindricalForceFieldCapsule extends NxCylindricalForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36C80000-0x00000400*/ private export @NULL RenderComponent[589825];

// Export UNxCylindricalForceFieldCapsule::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

defaultproperties
{
    // Reference: DrawCapsuleComponent'Default__NxCylindricalForceFieldCapsule.DrawCapsule0'
    begin object name=DrawCapsule0 class=Class'DrawCapsuleComponent'
    end object
    RenderComponent=DrawCapsule0
    ForceHeight=200.0000000
    Components[0]=DrawCapsule0
    Components[1]=none
}