class LPTrigger_LOS extends SPTrigger_LOS
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPTrigger_LOS.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__LPTrigger_LOS.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}