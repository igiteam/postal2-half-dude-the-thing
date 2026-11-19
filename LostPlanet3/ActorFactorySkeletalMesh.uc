class ActorFactorySkeletalMesh extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x00BA0000-0x00000000*/ private @NULL SkeletalMesh[65537];
var(*) /*0x00BA0000-0x00000000*/ private @NULL AnimSet[65537];
var(*) /*0x00BA0000-0x00000000*/ private name AnimSequenceName[65537];
var(*) /*0x00BA0000-0x00000000*/ private @NULL AnimTreeTemplate[65537];

defaultproperties
{
    GameplayActorClass=Class'SkeletalMeshActorSpawnable'
    MenuName="Add SkeletalMesh"
    MenuPriority=13
    NewActorClass=Class'SkeletalMeshActor'
}