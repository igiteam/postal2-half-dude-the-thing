class ActorFactoryRigidBody extends ActorFactoryDynamicSM
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x00B90000-0x00000000*/ private bool bStartAwake[65537];
var(*) /*0x00B90000-0x00000000*/ private bool bDamageAppliesImpulse[65537];
var(*) /*0x00B90000-0x00000000*/ private bool bLocalSpaceInitialVelocity[65537];
var(*) /*0x00B90000-0x00000000*/ private bool bEnableStayUprightSpring[65537];
var(*) /*0x00B90000-0x00000000*/ private @NULL InitialVelocity[65537];
var(*) /*0x00B90000-0x00000400*/ private export @NULL AdditionalVelocity[589825];
var(*) /*0x00B90000-0x00000400*/ private export @NULL InitialAngularVelocity[589825];
var(*) /*0x00B90000-0x00000000*/ private byte RBChannel[65537];
var(*) /*0x00B90000-0x00000000*/ private float StayUprightTorqueFactor[65537];
var(*) /*0x00B90000-0x00000000*/ private float StayUprightMaxTorque[65537];

defaultproperties
{
    bStartAwake=true
    bDamageAppliesImpulse=true
    RBChannel=ERBCollisionChannel.RBCC_GameplayPhysics
    StayUprightTorqueFactor=1000.0000000
    StayUprightMaxTorque=1500.0000000
    bNoEncroachCheck=true
    bBlockRigidBody=true
    CollisionType=ECollisionType.COLLIDE_BlockAll
    GameplayActorClass=Class'KActorSpawnable'
    MenuName="Add RigidBody"
    MenuPriority=15
    NewActorClass=Class'KActor'
}