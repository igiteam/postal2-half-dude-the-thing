class PathTargetPoint extends Keypoint
    placeable
    hidecategories(AnimDependency,Navigation);

// Export UPathTargetPoint::execShouldBeHiddenBySHOW_NavigationNodes(FFrame&, void* const)
native function ShouldBeHiddenBySHOW_NavigationNodes()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    Components[0]=none
    Components[1]=none
    // Reference: CylinderComponent'Default__PathTargetPoint.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    Components[2]=CollisionCylinder
    bStatic=false
    bHidden=false
    bNoDelete=true
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}