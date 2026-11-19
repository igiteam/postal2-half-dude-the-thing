class Trigger_Dynamic extends Trigger
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__Trigger_Dynamic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__Trigger_Dynamic.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}