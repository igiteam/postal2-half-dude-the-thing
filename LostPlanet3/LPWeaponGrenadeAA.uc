class LPWeaponGrenadeAA extends LPWeaponGrenade
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGrenadeAA.PreviewComponentA'
    begin object name=PreviewComponentA
    end object
    PreviewComponent=PreviewComponentA
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeAA.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeAA.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenadeAntiArmor"
    FriendlyName="Anti-Armor Grenades"
    Description="Does high damage to enemy deployables and Vital Suits."
    // Reference: SkeletalMeshComponent'Default__LPWeaponGrenadeAA.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Anti-Armor Grenade(s)"
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeAA.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}