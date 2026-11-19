class PillsWeapon extends DEHealthWeapon
    config(user);


// Decompiled with UE Explorer.
defaultproperties
{
    HealAmount=10
    PawnAnimationPackage="DOTZAHumans.3PGrenade"
    FireAnimName="GrenadeFire"
    StandIdleAnimName="GrenadeStandIdle"
    CrouchIdleAnimName="GrenadeCrouchIdle"
    HitAnimName="GrenadeHit"
    WeaponMode=1
    HitSpread=0.0000000
    FireAnim="Use"
    OfficialName="Pills"
    AmmoName=Class'PillsAmmunition'
    ReloadCount=1
    AutoSwitchPriority=-1
    FireOffset=(X=30.0000000,Y=40.0000000,Z=45.0000000)
    InventoryGroup=9
    PickupClass=Class'PillsPickup'
    AttachmentClass=Class'PillsAttachment'
    ItemName="Pills"
    Mesh=SkeletalMesh'DEItemsA.PillBottle_H'
}