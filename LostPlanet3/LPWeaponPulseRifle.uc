class LPWeaponPulseRifle extends LPWeapon
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
    // Reference: StaticMeshComponent'Default__LPWeaponPulseRifle.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponPulseRifle.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="pulseRifle"
    HUDReticleName="pulseRifle"
    HUDReticleName_SecondaryAmmomode="pulseRifle"
    FriendlyName="Pulse Rifle"
    Description="Advanced NEVEC tactical rifle. Shoots rapid-fire bursts that are best controlled when aiming down sight."
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponPulseRifle.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Pulse Rifle Rounds"
    // Reference: StaticMeshComponent'Default__LPWeaponPulseRifle.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}