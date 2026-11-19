class LPCoverLink_Dynamic extends SPGFCoverLink_Dynamic
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    CoverSlotMarkerClass=Class'LPCoverSlotMarker_Dynamic'
    AlignDist=28.0000000
    StandingLeanOffset=(X=0.0000000,Y=50.0000000,Z=69.0000000)
    CrouchLeanOffset=(X=0.0000000,Y=50.0000000,Z=19.0000000)
    // Reference: CylinderComponent'Default__LPCoverLink_Dynamic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
}