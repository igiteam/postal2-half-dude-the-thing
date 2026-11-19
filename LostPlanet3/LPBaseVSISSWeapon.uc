class LPBaseVSISSWeapon extends LPBaseVSWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ISSWeaponSlotID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bQuickFinish[536870913];

simulated function QuickFinish()
{
    bQuickFinish = true;
    //return;    
}

simulated function AttachSAWeaponTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP[8388609], VSISS;

    super.AttachSAWeaponTo(SPIP);
    VSISS = LPAIPawnVSISS(SPIP);
    // End:0x6A
    if(VSISS != none)
    {
        VSISS.VSWeapons[int(ISSWeaponSlotID)] = self;
    }
    //return;    
}

simulated function DetachWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSISS;

    super.DetachWeapon();
    VSISS = LPAIPawnVSISS(MyPawn);
    // End:0x61
    if(VSISS != none)
    {
        VSISS.VSWeapons[int(ISSWeaponSlotID)] = none;
    }
    //return;    
}

auto state Active
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            CacheAIController();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bSkipCheckToKeepFiringOnStartFire=true
    // Reference: StaticMeshComponent'Default__LPBaseVSISSWeapon.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPBaseVSISSWeapon.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    // Reference: SkeletalMeshComponent'Default__LPBaseVSISSWeapon.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPBaseVSISSWeapon.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}