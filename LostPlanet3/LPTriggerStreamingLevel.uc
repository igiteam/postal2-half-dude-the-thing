class LPTriggerStreamingLevel extends SPTriggerStreamingLevel
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPTriggerStreamingLevel.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__LPTriggerStreamingLevel.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}