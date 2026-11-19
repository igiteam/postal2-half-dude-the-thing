class LPCoverSlotMarker extends SPGFCoverSlotMarker
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,VehicleUsage,Collision,Attachment,Physics,Advanced,Interaction,Destruct);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPCoverSlotMarker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=none
    CollisionComponent=CollisionCylinder
}