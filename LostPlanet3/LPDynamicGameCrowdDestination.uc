class LPDynamicGameCrowdDestination extends SPDynamicGameCrowdDestination
    hidecategories(AnimDependency,Navigation,Advanced,Collision,Display,Actor,Movement,Physics);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPDynamicGameCrowdDestination.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=none
    Components[2]=none
    CollisionComponent=CollisionCylinder
}