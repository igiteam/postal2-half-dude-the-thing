class LPWeaponGrenadeEMP extends LPWeaponGrenade
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGrenadeEMP.PreviewComponentA'
    begin object name=PreviewComponentA
    end object
    PreviewComponent=PreviewComponentA
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeEMP.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeEMP.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenadeEMP"
    FriendlyName="EMP Grenades"
    Description="Emits an electromagnetic pulse (EMP) on contact that causes any machinery in its blast radius to malfunction."
    // Reference: SkeletalMeshComponent'Default__LPWeaponGrenadeEMP.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="EMP Grenade(s)"
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeEMP.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}