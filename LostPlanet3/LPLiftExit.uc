class LPLiftExit extends SPLiftExit
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: KynapseLiftPathObjectComponent'Default__LPLiftExit.KynapseLift'
    begin object name=KynapseLift
    end object
    kynapseLiftPOComponent=KynapseLift
    // Reference: CylinderComponent'Default__LPLiftExit.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseLift
    CollisionComponent=CollisionCylinder
}