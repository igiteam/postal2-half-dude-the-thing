class LPTrigger_Dynamic extends SPTrigger_Dynamic
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPTrigger_Dynamic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__LPTrigger_Dynamic.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}