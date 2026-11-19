class LPLadder extends SPLadder
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: KynapseLadderPathObjectComponent'Default__LPLadder.KynapseLadder'
    begin object name=KynapseLadder
    end object
    kynapseLadderPOComponent=KynapseLadder
    // Reference: CylinderComponent'Default__LPLadder.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseLadder
    CollisionComponent=CollisionCylinder
}