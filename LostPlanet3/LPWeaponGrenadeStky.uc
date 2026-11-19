class LPWeaponGrenadeStky extends LPWeaponGrenade
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGrenadeStky.PreviewComponentA'
    begin object name=PreviewComponentA
    end object
    PreviewComponent=PreviewComponentA
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeStky.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeStky.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenadeSticky"
    FriendlyName="Sticky Grenades"
    Description="Fragmentation grenade that will stick to enemies and damage any target within the blast radius."
    // Reference: SkeletalMeshComponent'Default__LPWeaponGrenadeStky.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Sticky Grenades"
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeStky.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}