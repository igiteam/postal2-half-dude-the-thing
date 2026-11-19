class ActorFactoryApexClothing extends ActorFactorySkeletalMesh
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x00A20000-0x00000000*/ private editfixedsize array ClothingAssets[65537];
var(*) /*0x00A20000-0x00000000*/ private byte ClothingRBChannel[196609];
var(*) /*0x00A20000-0x00000000*/ private @NULL ClothingRBCollideWithChannels[196609];

defaultproperties
{
    ClothingRBChannel=ERBCollisionChannel.RBCC_Clothing
    ClothingRBCollideWithChannels=(Default=true,Nothing=false,Pawn=false,Vehicle=false,Water=false,GameplayPhysics=true,EffectPhysics=true,Untitled1=false,Untitled2=false,Untitled3=false,Untitled4=false,Cloth=false,FluidDrain=false,SoftBody=false,FracturedMeshPart=false,BlockingVolume=true,DeadPawn=false,Clothing=false,ClothingCollision=true,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    MenuName="Add Clothing"
}