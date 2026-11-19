class PortalMarker extends NavigationPoint
    notplaceable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x35EA0000-0x00000000*/ private @NULL MyPortal;

// Export UPortalMarker::execCanTeleport(FFrame&, void* const)
native function CanTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    // Reference: CylinderComponent'Default__PortalMarker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bCollideWhenPlacing=false
    bHiddenEd=true
    CollisionComponent=CollisionCylinder
}