class ActorFactoryStaticMesh extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x00BD0000-0x00000000*/ private @NULL StaticMesh[65537];
var(*) /*0x00BD0000-0x00000000*/ private @NULL DrawScale3D[65537];

defaultproperties
{
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    MenuName="Add StaticMesh"
    MenuPriority=30
    NewActorClass=Class'StaticMeshActor'
}