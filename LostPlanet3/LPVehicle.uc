class LPVehicle extends SPVehicle
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPVehicle.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}