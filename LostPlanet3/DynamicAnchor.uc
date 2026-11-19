class DynamicAnchor extends NavigationPoint
    notplaceable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentUser;

defaultproperties
{
    // Reference: CylinderComponent'Default__DynamicAnchor.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bStatic=false
    bNoDelete=false
    bCollideWhenPlacing=false
    CollisionComponent=CollisionCylinder
}