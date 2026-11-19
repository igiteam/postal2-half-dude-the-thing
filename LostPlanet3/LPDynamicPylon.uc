class LPDynamicPylon extends SPDynamicPylon
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPDynamicPylon.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=none
    Components[6]=none
    Components[7]=none
    CollisionComponent=CollisionCylinder
}