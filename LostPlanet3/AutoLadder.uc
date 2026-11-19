class AutoLadder extends Ladder
    notplaceable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: CylinderComponent'Default__AutoLadder.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bCollideWhenPlacing=false
    CollisionComponent=CollisionCylinder
}