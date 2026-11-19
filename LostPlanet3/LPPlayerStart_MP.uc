class LPPlayerStart_MP extends LPPlayerStart
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Collision,Collision,Collision,Collision);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPPlayerStart_MP.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    CollisionComponent=CollisionCylinder
}