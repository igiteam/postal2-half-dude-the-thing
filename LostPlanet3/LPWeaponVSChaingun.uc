class LPWeaponVSChaingun extends LPBaseVSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBarrelsSpinning;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBarrelsShouldSpinDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BarrelSkelController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BarrelSpinRate;

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPInventoryWeapon).Tick(DeltaTime);
    // End:0xAB
    if(BarrelSkelController != none)
    {
        // End:0x51
        if(bBarrelsSpinning)
        {
            UpdateBarrelSpin(DeltaTime);
            bBarrelsShouldSpinDown = true;            
        }
        else
        {
            // End:0xAB
            if(bBarrelsShouldSpinDown)
            {
                BarrelSpinRate -= (DeltaTime * float(8));
                // End:0x98
                if(BarrelSpinRate <= float(0))
                {
                    bBarrelsShouldSpinDown = false;                    
                }
                else
                {
                    UpdateBarrelSpin(DeltaTime);
                }
            }
        }
    }
    //return;    
}

simulated function UpdateBarrelSpin()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], BarrelRoll;

    BarrelRoll = float(BarrelSkelController.BoneRotation.Yaw);
    BarrelRoll = FInterpTo(BarrelRoll, 100000.0000000, DeltaTime, BarrelSpinRate);
    // End:0xA2
    if(BarrelRoll > float(65535))
    {
        BarrelRoll = BarrelRoll - float(65535);
    }
    BarrelSkelController.BoneRotation.Yaw = int(BarrelRoll);
    //return;    
}

simulated function PlayFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    super(SPInventoryWeapon).PlayFireEffects(FireModeNum, HitLocation);
    // End:0xD4
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x99
        if(BarrelSkelController == none)
        {
            BarrelSkelController = SkelControlSingleBone(SkeletalMeshComponent(Mesh).FindSkelControl('BarrelControl'));
        }
        bBarrelsSpinning = true;
        BarrelSpinRate = 5.0000000;
        BarrelSkelController.SetSkelControlActive(true);
    }
    //return;    
}

simulated function StopFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super(SPInventoryWeapon).StopFireEffects(FireModeNum);
    bBarrelsSpinning = false;
    //return;    
}

defaultproperties
{
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponVSChaingun.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponVSChaingun.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="iconBullets"
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSChaingun.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponVSChaingun.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}