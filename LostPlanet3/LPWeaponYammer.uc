class LPWeaponYammer extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

simulated function CalcRemoteImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GivenHitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    AbortWeaponReload(true);
    super(SPInventoryWeapon).CalcRemoteImpactEffects(FireModeNum, GivenHitLocation, bViaReplication);
    //return;    
}

defaultproperties
{
    bAllowLinePatternShooting=true
    bAllowTracers=true
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponYammer.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponYammer.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="assaultRifle"
    HUDReticleName_SecondaryAmmomode="assaultRifle"
    FriendlyName="Assault Rifle"
    Description="Standard issue NEVEC assault rifle. A versatile weapon well-suited for a variety of tactical engagements."
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponYammer.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Assault Rifle Rounds"
    // Reference: StaticMeshComponent'Default__LPWeaponYammer.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}