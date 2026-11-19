class ActorFactoryApexDestructible extends ActorFactory
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x00A30000-0x00000000*/ private bool bStartAwake[65537];
var(*) /*0x00A30000-0x00000000*/ private byte RBChannel[65537];
var(*) /*0x00A30000-0x00000000*/ private @NULL CollideWithChannels[196609];
var(*) /*0x00A30000-0x00000000*/ private @NULL DestructibleAsset[65537];

defaultproperties
{
    RBChannel=ERBCollisionChannel.RBCC_EffectPhysics
    CollideWithChannels=(Default=true,Nothing=false,Pawn=false,Vehicle=false,Water=false,GameplayPhysics=true,EffectPhysics=true,Untitled1=false,Untitled2=false,Untitled3=false,Untitled4=false,Cloth=false,FluidDrain=false,SoftBody=false,FracturedMeshPart=false,BlockingVolume=true,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    GameplayActorClass=Class'ApexDestructibleActorSpawnable'
    MenuName="Add ApexDestructibleActor"
    NewActorClass=Class'ApexDestructibleActor'
}