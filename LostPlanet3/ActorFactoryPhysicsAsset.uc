class ActorFactoryPhysicsAsset extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x00B60000-0x00000000*/ private @NULL PhysicsAsset[65537];
var(*) /*0x00B60000-0x00000000*/ private @NULL SkeletalMesh[65537];
var(*) /*0x00B60000-0x00000000*/ private bool bStartAwake[65537];
var(*) /*0x00B60000-0x00000000*/ private bool bDamageAppliesImpulse[65537];
var(*) /*0x00B60000-0x00000000*/ private bool bNotifyRigidBodyCollision[65537];
var(*) /*0x00B60000-0x00000000*/ private bool bUseCompartment[65537];
var(*) /*0x00B60000-0x00000000*/ private bool bCastDynamicShadow[65537];
var(*) /*0x00B60000-0x00000000*/ private @NULL InitialVelocity[65537];
var(*) /*0x00B60000-0x00000000*/ private @NULL DrawScale3D[65537];

defaultproperties
{
    bStartAwake=true
    bDamageAppliesImpulse=true
    bCastDynamicShadow=true
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    GameplayActorClass=Class'KAssetSpawnable'
    MenuName="Add PhysicsAsset"
    NewActorClass=Class'KAsset'
}