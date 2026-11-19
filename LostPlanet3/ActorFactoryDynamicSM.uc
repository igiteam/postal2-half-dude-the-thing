class ActorFactoryDynamicSM extends ActorFactory
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x00AB0000-0x00000000*/ private @NULL StaticMesh[65537];
var(*) /*0x00AB0000-0x00000000*/ private @NULL DrawScale3D[65537];
var(*) /*0x00AB0000-0x00000000*/ private bool bNoEncroachCheck[65537];
var(*) /*0x00AB0000-0x00000000*/ private bool bNotifyRigidBodyCollision[65537];
var(*) /*0x00AB0000-0x00000000*/ private bool bBlockRigidBody[65537];
var(*) /*0x00AB0000-0x00000000*/ private bool bUseCompartment[65537];
var(*) /*0x00AB0000-0x00000000*/ private bool bCastDynamicShadow[65537];
var(*) /*0x00AB0000-0x00000000*/ private byte CollisionType[65537];

defaultproperties
{
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    bCastDynamicShadow=true
    CollisionType=ECollisionType.COLLIDE_NoCollision
}