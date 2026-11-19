class LPGameCrowdBehaviorPoint extends SPGameCrowdBehaviorPoint
    config(Crowd)
    hidecategories(AnimDependency,Navigation,Advanced,Collision,Display,Actor,Movement,Physics);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPGameCrowdBehaviorPoint.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=none
    CollisionComponent=CollisionCylinder
}