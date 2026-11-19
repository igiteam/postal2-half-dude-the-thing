class LPWeaponVSRocketLauncher extends LPBaseVSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

simulated function AttachSAWeaponTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP[8388609];

    super.AttachSAWeaponTo(SPIP);
    //return;    
}

simulated function DetachWeapon()
{
    super.DetachWeapon();
    //return;    
}

static simulated function SpawnTracerEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609], InInstigator, SpawnLocation, SpawnRotation, TargetLoc;

    local /*0x97E50000-0x00000000*/ private float HitDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPWeaponVSRocketLauncher.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponVSRocketLauncher.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="iconRocket"
    WeaponFireTypes=/* Array type was not detected. */
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSRocketLauncher.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponVSRocketLauncher.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}