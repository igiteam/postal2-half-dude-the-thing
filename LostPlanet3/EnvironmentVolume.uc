class EnvironmentVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display)
    implements(Interface_NavMeshPathObstacle,Interface_NavMeshPathObject);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavMeshPathObstacle[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavMeshPathObject[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bSplitNavMesh[537001985];

// Export UEnvironmentVolume::execSetSplitNavMesh(FFrame&, void* const)
native final function SetSplitNavMesh()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewValue[8388609];


}

defaultproperties
{
    // Reference: BrushComponent'Default__EnvironmentVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}