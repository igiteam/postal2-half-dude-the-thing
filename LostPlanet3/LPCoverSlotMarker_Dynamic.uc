class LPCoverSlotMarker_Dynamic extends SPGFCoverSlotMarker_Dynamic
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,VehicleUsage,Collision,Attachment,Physics,Advanced,Interaction,Destruct);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPCoverSlotMarker_Dynamic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=none
    Components[2]=none
    CollisionComponent=CollisionCylinder
}