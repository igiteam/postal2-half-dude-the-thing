class LPDroppedPickup extends SPInventoryDroppedPickup
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    Components[0]=none
    // Reference: CylinderComponent'Default__LPDroppedPickup.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[1]=CollisionCylinder
    bIgnoreEncroachers=true
    bPushedByEncroachers=false
    bAlwaysRelevant=true
    CollisionComponent=CollisionCylinder
}