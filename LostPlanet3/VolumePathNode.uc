class VolumePathNode extends PathNode
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x50250000-0x00000000*/ private float StartingRadius[65537];
var(*) /*0x50250000-0x00000000*/ private float StartingHeight[65537];

defaultproperties
{
    StartingRadius=2000.0000000
    StartingHeight=2000.0000000
    bNoAutoConnect=true
    bNotBased=true
    bFlyingPreferred=true
    bVehicleDestination=true
    bBuildLongPaths=false
    // Reference: CylinderComponent'Default__VolumePathNode.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    CollisionComponent=CollisionCylinder
}