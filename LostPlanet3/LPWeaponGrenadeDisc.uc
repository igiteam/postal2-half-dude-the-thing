class LPWeaponGrenadeDisc extends LPWeaponGrenade
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeploySound;

simulated function ReleaseGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool bDropped[9437185];

    super.ReleaseGrenade(bDropped);
    // End:0x4D
    if(!bDropped && DeploySound != none)
    {
        PlaySound(DeploySound);
    }
    //return;    
}

defaultproperties
{
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGrenadeDisc.PreviewComponentA'
    begin object name=PreviewComponentA
    end object
    PreviewComponent=PreviewComponentA
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeDisc.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeDisc.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenadeDisk"
    FriendlyName="Disc Grenades"
    Description="An aerodynamic fragmentation grenade capable of being tossed long distances.  Explodes on contact."
    // Reference: SkeletalMeshComponent'Default__LPWeaponGrenadeDisc.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Disc Grenade(s)"
    // Reference: StaticMeshComponent'Default__LPWeaponGrenadeDisc.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}