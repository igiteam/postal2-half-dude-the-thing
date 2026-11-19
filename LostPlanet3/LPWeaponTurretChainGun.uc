class LPWeaponTurretChainGun extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponTurretChainGun.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponTurretChainGun.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    EquipTime=0.0000000
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponTurretChainGun.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponTurretChainGun.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}