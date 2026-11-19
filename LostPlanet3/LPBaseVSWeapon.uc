class LPBaseVSWeapon extends SPGFWeaponStandalone
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

enum EVSWeaponSlotID
{
    VSID_PrimaryWeapon,             // 0
    VSID_AlternateWeapon,           // 1
    VSID_MAX                        // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WeaponSlotID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CameraShake;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ReloadAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReloadAnimDuration;

// Export ULPBaseVSWeapon::execGetPhysicalFireStartLoc(FFrame&, void* const)
native simulated event GetPhysicalFireStartLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimDir[9437185], ReturnValue;


}

// Export ULPBaseVSWeapon::execUpdateWeaponAccuracy(FFrame&, void* const)
native simulated function UpdateWeaponAccuracy()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609], TuneDataBaseVSWeapon;

    super(SPGFWeapon).InitTuneData(TuneData);
    TuneDataBaseVSWeapon = LPTuneDataBaseVSWeapon(TuneData);
    CameraShake = TuneDataBaseVSWeapon.CameraShake;
    //return;    
}

simulated function AttachSAWeaponTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP[8388609], VSFuturePlayerPawn;

    super.AttachSAWeaponTo(SPIP);
    VSFuturePlayerPawn = LPVSFuturePlayerPawn(SPIP);
    // End:0x6A
    if(VSFuturePlayerPawn != none)
    {
        VSFuturePlayerPawn.VSWeapons[int(WeaponSlotID)] = self;
    }
    //return;    
}

simulated function DetachWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSFuturePlayerPawn;

    super.DetachWeapon();
    VSFuturePlayerPawn = LPVSFuturePlayerPawn(MyPawn);
    // End:0x61
    if(VSFuturePlayerPawn != none)
    {
        VSFuturePlayerPawn.VSWeapons[int(WeaponSlotID)] = none;
    }
    //return;    
}

simulated function ProcessInstantHit()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impact[8388609];
    local /*0x97E50000-0x00000000*/ private int NumHits[9437185];

    // End:0xE3
    if((((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled()) && Instigator.Weapon == self)
    {
        LPHUD(PlayerController(Instigator.Controller).myHUD).NotifyInstantHit(Impact);
    }
    super(SPInventoryWeapon).ProcessInstantHit(FiringMode, Impact, NumHits);
    //return;    
}

function PerformReload()
{
    AmmoLeftForWeapon = GetMagazineCapacity();
    super(SPInventoryWeapon).PerformReload();
    AmmoLeftForWeapon = 1;
    //return;    
}

reliable client simulated function ClientPerformReload()
{
    local /*0x97E50000-0x00000000*/ private bool bCanGoActive[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoLeft[8388609];

    AmmoLeftInMagazine = AmmoLeft;
    // End:0xA0
    if(MyPawn.IsLocallyControlled() && MyPawn.IsHumanControlled())
    {
        LPPlayerController(MyPawn.Controller).UnPauseVSFire(WeaponSlotID);
    }
    //return;    
}

simulated function PlayWeaponReloading()
{
    // End:0xAF
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        RemoteClientFireInfo.FlashLocation += vect(0.0000000, 0.0000000, 1.0000000);
        RemoteClientFireInfo.FireMode = CurrentFireMode;
        ClearFlashLocation();
    }
    // End:0xF8
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(LPTuneDataBaseVSWeapon(TuneDataBaseWeapon).ReloadTime, false, 'PerformReload');
    }
    // End:0x185
    if(MyPawn.IsLocallyControlled() && MyPawn.IsHumanControlled())
    {
        LPPlayerController(MyPawn.Controller).PauseVSFire(WeaponSlotID);
    }
    // End:0x211
    if(WeaponAnimInfo.AnimNodeSlot == none)
    {
        WeaponAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkeletalMeshComponent(Mesh).FindAnimNode(WeaponAnimInfo.AnimNodeSlotName));
    }
    ReloadAnimDuration = PlayCustomWeaponAnimation(ReloadAnimName,, 0.1000000, 0.2500000);
    //return;    
}

simulated function GetReloadAnimDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ReloadAnimDuration;
    //return ReturnValue;    
}

simulated function GetPlayerAimError()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Error;

    Error = Lerp(WeaponAimError.X, WeaponAimError.Y, Accuracy);
    return Error;
    return 0.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPBaseVSWeapon.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPBaseVSWeapon.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    ClientSideHitLeeway=2.5000000
    // Reference: SkeletalMeshComponent'Default__LPBaseVSWeapon.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPBaseVSWeapon.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}