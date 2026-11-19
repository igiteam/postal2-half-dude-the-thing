class LPLiftCenter extends SPLiftCenter
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPLiftCenter.CollisionCylinder'
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