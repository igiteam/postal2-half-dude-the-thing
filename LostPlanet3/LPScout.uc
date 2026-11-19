class LPScout extends SPKyScout
    transient
    config(Game)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    CoverLinkClass=Class'LPCoverLink'
    bBuildReachSpecs=false
    // Reference: CylinderComponent'Default__LPScout.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}