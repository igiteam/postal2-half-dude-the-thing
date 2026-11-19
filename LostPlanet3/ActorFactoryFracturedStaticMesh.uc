class ActorFactoryFracturedStaticMesh extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x00B00000-0x00000000*/ private @NULL FracturedStaticMesh[65537];
var(*) /*0x00B00000-0x00000000*/ private @NULL DrawScale3D[65537];

defaultproperties
{
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    MenuName="Add FracturedStaticMesh"
    MenuPriority=35
    NewActorClass=Class'FracturedStaticMeshActor'
}