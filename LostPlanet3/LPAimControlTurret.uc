class LPAimControlTurret extends SPGFAimControlBase
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTurretPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TurretTrackingMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScanningLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScanForEnemiesPauseTime;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    PawnOuter = inPawn;
    MyTurretPawn = LPAIPawnTurret(inPawn);
    WorldAimRotator = PawnOuter.Rotation;
    WorldAimDir = Vector(WorldAimRotator);
    //return;    
}

function SetTurretTrackingMode()
{
    local /*0x97E50000-0x00000000*/ private byte NewMode[8388609];

    ScanForEnemiesPauseTime = 0.0000000;
    TurretTrackingMode = NewMode;
    MyTurretPawn.ReplicatedAimControllerTrackingMode = NewMode;
    //return;    
}

function GetTurretTrackingMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return TurretTrackingMode;
    //return ReturnValue;    
}

event UpdateAim()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x9D
    if(int(MyTurretPawn.WorldInfo.NetMode) != int(NM_Client))
    {
        switch(TurretTrackingMode)
        {
            // End:0x59
            case 0:
                // End:0x9A
                break;
            // End:0x61
            case 1:
                // End:0x9A
                break;
            // End:0x7C
            case 2:
                UpdateAim_ScanForEnemies(DeltaTime);
                // End:0x9A
                break;
            // End:0x97
            case 3:
                UpdateAim_TrackTarget(DeltaTime);
                // End:0x9A
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        UpdateAim_Client(DeltaTime);
    }
    //return;    
}

function UpdateAim_ScanForEnemies()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL RotationLimit, RotationDir;

    // End:0x29
    if(ScanForEnemiesPauseTime > 0.0000000)
    {
        ScanForEnemiesPauseTime -= DeltaTime;
        return;
    }
    RotationLimit = MyTurretPawn.Rotation;
    // End:0xAD
    if(bScanningLeft)
    {
        RotationLimit.Yaw -= int((MyTurretPawn.FiringArc * 0.5000000) * 182.0444000);        
    }
    else
    {
        RotationLimit.Yaw += int((MyTurretPawn.FiringArc * 0.5000000) * 182.0444000);
    }
    RotationDir = Vector(RotationLimit);
    AdjustAimDirection(DeltaTime, RotationDir, MyTurretPawn.TuneDataTurret.WeaponIdleTrackingRate.GetValue());
    // End:0x1E5
    if((RotationDir Dot WorldAimDir) >= 0.9000000)
    {
        bScanningLeft = !bScanningLeft;
        ScanForEnemiesPauseTime = MyTurretPawn.TuneDataTurret.PauseAtExtremeTimeWhileScanning;
    }
    //return;    
}

function UpdateAim_TrackTarget()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCtrl, MyWeapon, DesiredAimDir, WeaponLoc;

    myCtrl = LPAIController(PawnOuter.Controller);
    // End:0x9B
    if((myCtrl.Enemy != none) && !myCtrl.IsEnemyVisible(myCtrl.Enemy))
    {
        return;
    }
    MyWeapon = LPWeapon(PawnOuter.Weapon);
    // End:0x261
    if((myCtrl != none) && MyWeapon != none)
    {
        // End:0x190
        if(MyTurretPawn.Mesh.GetSocketWorldLocationAndRotation('ChainGunSocket', WeaponLoc))
        {
            DesiredAimDir = Vector(MyWeapon.GetBaseAIAimRotation(WeaponLoc, myCtrl.GetAimLocation(true, 0)));            
        }
        else
        {
            DesiredAimDir = Vector(MyWeapon.GetBaseAIAimRotation(PawnOuter.GetWeaponStartTraceLocation(), myCtrl.GetAimLocation(true)));
        }
        AdjustAimDirection(DeltaTime, DesiredAimDir, MyTurretPawn.TuneDataTurret.WeaponAttackTrackingRate.GetValue());
    }
    //return;    
}

function UpdateAim_Client()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DesiredAimDir;
    local /*0x97E50000-0x00000000*/ private float Rate;

    TurretTrackingMode = MyTurretPawn.ReplicatedAimControllerTrackingMode;
    // End:0x92
    if(int(TurretTrackingMode) == int(3))
    {
        Rate = MyTurretPawn.TuneDataTurret.WeaponAttackTrackingRate.GetValue();        
    }
    else
    {
        Rate = MyTurretPawn.TuneDataTurret.WeaponIdleTrackingRate.GetValue();
    }
    DesiredAimDir = Vector(MyTurretPawn.ReplicatedDesiredWorldAimDir);
    AdjustAimDirection(DeltaTime, DesiredAimDir, Rate);
    //return;    
}

function AdjustAimDirection()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DesiredAimDir[25296897];
    local /*0x97E50000-0x00000000*/ private float AimSpeed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WorldAimRotatorTemp;

    WorldAimDir = Class'SPEngine.SPUtil'.static.RotateVectorTowardsVector(WorldAimDir, DesiredAimDir, DeltaTime, AimSpeed);
    WorldAimRotatorTemp = Rotator(WorldAimDir);
    WorldAimRotatorTemp.Yaw = ClampRotAxisFromBase(WorldAimRotatorTemp.Yaw, MyTurretPawn.Rotation.Yaw, int((MyTurretPawn.TuneDataTurret.VisionAngleHorizontal.GetValue() * 0.5000000) * 182.0444000));
    WorldAimRotatorTemp.Pitch = ClampRotAxisFromBase(WorldAimRotatorTemp.Pitch, MyTurretPawn.Rotation.Pitch, int((MyTurretPawn.TuneDataTurret.VisionAngleVertical.GetValue() * 0.5000000) * 182.0444000));
    WorldAimDir = VInterpTo(WorldAimDir, Vector(WorldAimRotatorTemp), DeltaTime, 6.0000000);
    WorldAimRotator = Rotator(WorldAimDir);
    // End:0x2AF
    if(int(MyTurretPawn.WorldInfo.NetMode) != int(NM_Client))
    {
        MyTurretPawn.ReplicatedDesiredWorldAimDir = Rotator(DesiredAimDir);
    }
    //return;    
}

simulated function GetAdjustedAimFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609], StartFireLoc, ReturnValue;

    return super.GetAdjustedAimFor(W, StartFireLoc);
    //return ReturnValue;    
}
