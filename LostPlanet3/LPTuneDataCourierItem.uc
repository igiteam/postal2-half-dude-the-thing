class LPTuneDataCourierItem extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x90420000-0x00000400*/ private export @NULL SkeletalMeshComponent[589825];
var(0.25_Pct) /*0x90420000-0x00000400*/ private export @NULL StaticMeshComponent[589825];
var(0.25_Pct) /*0x25870000-0x00000000*/ private float CollisionHeight[65537];
var(0.25_Pct) /*0x25870000-0x00000000*/ private float CollisionRadius[65537];
var(0.25_Pct) /*0x25870000-0x00000000*/ private @NULL CollisionOffset[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private bool bInteractToPickup[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private bool bInteractToDeliver[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private bool bHideWhileCarried[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private bool bHideWhileCarriedByAkrid[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private bool bShowUI[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private bool bShowUIWhileCarriedByAkrid[65537];
var(0.25_Pct) /*0xC99B0000-0x00000000*/ private bool bTeamColorEnabled[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private name PickUpSocket[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private class PickUpSpecialMoveClass[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private float PickupLowZThreshold[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private float PickupHighZThreshold[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private name DeliverSocket[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private class DeliverSpecialMoveClass[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private name CarriedSocket[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private name CarriedBone[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private @NULL CarriedOffset[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private @NULL CarriedRotation[65537];
var(0.25_Pct) /*0x1D260000-0x00000000*/ private @NULL DropMaxVelocity[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private float IconZOffsetHome[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private float IconZOffsetCarried[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private name PickupFXEventName[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private name DeliverFXEventName[65537];
var(0.25_Pct) /*0x5AAD0000-0x00000000*/ private name ReturnFXEventName[65537];
var(0.25_Pct) /*0xBB430000-0x00000000*/ private name PickupSoundEventName[65537];
var(0.25_Pct) /*0xBB430000-0x00000000*/ private name DeliverSoundEventName[65537];
var(0.25_Pct) /*0xBB430000-0x00000000*/ private name ReturnSoundEventName[65537];
var(0.25_Pct) /*0xC99B0000-0x00000000*/ private editfixedsize @NULL TeamColorNevec[65537];
var(0.25_Pct) /*0xC99B0000-0x00000000*/ private editfixedsize @NULL TeamColorPirates[65537];
var(0.25_Pct) /*0xC99B0000-0x00000000*/ private @NULL TeamColorPhysMaterial[65537];

defaultproperties
{
    CollisionHeight=10.0000000
    CollisionRadius=50.0000000
    bInteractToPickup=true
    bHideWhileCarriedByAkrid=true
    bShowUI=true
    bShowUIWhileCarriedByAkrid=true
    PickupLowZThreshold=-40.0000000
    PickupHighZThreshold=40.0000000
    DropMaxVelocity=(X=400.0000000,Y=400.0000000,Z=600.0000000)
    IconZOffsetHome=30.0000000
    IconZOffsetCarried=110.0000000
}