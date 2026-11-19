class LPDoorMarker extends SPDoorMarker
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    // Reference: KynapseDoorPathObjectComponent'Default__LPDoorMarker.KynapseDoor'
    begin object name=KynapseDoor
    end object
    kynapseDoorPOComponent=KynapseDoor
    // Reference: CylinderComponent'Default__LPDoorMarker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseDoor
    Components[6]=none
    CollisionComponent=CollisionCylinder
}