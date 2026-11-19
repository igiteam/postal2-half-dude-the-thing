class PylonSeed extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Navigation)
    implements(Interface_NavMeshPathObject);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavMeshPathObject[268566529];

defaultproperties
{
    // Reference: CylinderComponent'Default__PylonSeed.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    Components[0]=CollisionCylinder
    Components[1]=none
    CollisionComponent=CollisionCylinder
}