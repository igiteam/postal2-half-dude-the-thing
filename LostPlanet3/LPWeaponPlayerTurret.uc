class LPWeaponPlayerTurret extends LPBaseVSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

simulated function AttachSAWeaponTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP[8388609], TurretPawn;

    // End:0x6D
    if(SPIP != none)
    {
        // End:0x5E
        if(SPIP.Mesh != none)
        {
            Mesh = SPIP.Mesh;            
        }
        bAttached = true;        
    }
    TurretPawn = LPPlayerTurretPawn(SPIP);
    // End:0xC4
    if(TurretPawn != none)
    {
        TurretPawn.VSWeapons[int(WeaponSlotID)] = self;
    }
    //return;    
}

simulated function CanReload()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SPP;

    SPP = SPInventoryPawn(Instigator);
    // End:0x78
    if(SPP != none)
    {
        // End:0x78
        if(!SPP.IsDoingASpecialMove() && !IsReloading())
        {
            return !AmmoLeftInMagazine == (GetMagazineCapacity());
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponPlayerTurret.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponPlayerTurret.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="iconBullets"
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponPlayerTurret.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponPlayerTurret.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}