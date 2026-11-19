class StaticMeshCollectionActor extends StaticMeshActorBase
    config(Engine)
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array StaticMeshComponents[655361];
var(*) /*0x35EA0000-0x00000000*/ private int MaxStaticMeshComponents[1073741825];

defaultproperties
{
    MaxStaticMeshComponents=3000
}