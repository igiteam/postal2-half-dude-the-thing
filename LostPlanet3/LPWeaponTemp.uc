class LPWeaponTemp extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponTemp.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponTemp.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    // Reference: SkeletalMeshComponent'Default__LPWeaponTemp.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponTemp.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}