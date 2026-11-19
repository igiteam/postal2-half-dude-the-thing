class PathNode_Dynamic extends PathNode
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

simulated event GetDebugAbbrev()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "DynPN";
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__PathNode_Dynamic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bStatic=false
    CollisionComponent=CollisionCylinder
}