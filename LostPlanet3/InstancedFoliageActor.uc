class InstancedFoliageActor extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation,Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL FoliageMeshes[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedMesh[537001985];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array InstancedStaticMeshComponents[537526273];

defaultproperties
{
    bStatic=true
}