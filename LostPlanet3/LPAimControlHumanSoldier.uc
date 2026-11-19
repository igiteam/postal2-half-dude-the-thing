class LPAimControlHumanSoldier extends SPGFAimControlBase
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAimYawDegreesSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAimPitchDegreesSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSmoothingAim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTargetTooClose[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTargetTooCloseThreshold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTargetTooCloseThreshold;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyLPPawn = LPPawn(inPawn);
    //return;    
}

// Export ULPAimControlHumanSoldier::execDebugDraw(FFrame&, void* const)
native function DebugDraw();

event GetAimCollisionStartPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myWeaponLoc;

    // End:0x55
    if(PawnOuter.Mesh.GetSocketWorldLocationAndRotation('WeaponSocket', myWeaponLoc))
    {
        return myWeaponLoc;
    }
    return PawnOuter.GetPawnViewLocation();
    //return ReturnValue;    
}

event UpdateAim()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myHumanCtrl, MyWeapon, myWeaponLoc, AimLoc, NewAimRotator, AimRotatorSmoothed;

    myHumanCtrl = LPAIControllerHumanSoldier(PawnOuter.Controller);
    MyWeapon = LPWeapon(PawnOuter.Weapon);
    // End:0x324
    if((myHumanCtrl != none) && MyWeapon != none)
    {
        // End:0xE4
        if(myHumanCtrl.bMovingInCover)
        {
            NewAimRotator = myHumanCtrl.HumanPawn.Rotation;            
        }
        else
        {
            // End:0x15B
            if(!PawnOuter.Mesh.GetSocketWorldLocationAndRotation('WeaponSocket', myWeaponLoc))
            {
                myWeaponLoc = PawnOuter.GetWeaponStartTraceLocation();
            }
            AimLoc = myHumanCtrl.GetAimLocation(true);
            // End:0x1D5
            if(!bTargetTooClose && VSizeSq(myWeaponLoc - AimLoc) < (MinTargetTooCloseThreshold * MinTargetTooCloseThreshold))
            {
                bTargetTooClose = true;                
            }
            else
            {
                // End:0x21F
                if(bTargetTooClose && VSizeSq(myWeaponLoc - AimLoc) > (MaxTargetTooCloseThreshold * MaxTargetTooCloseThreshold))
                {
                    bTargetTooClose = false;
                }
            }
            // End:0x2E9
            if(bTargetTooClose)
            {
                myWeaponLoc = PawnOuter.Location;
                myWeaponLoc.Z += (PawnOuter.CylinderComponent.CollisionHeight * 0.2500000);
                AimLoc = myHumanCtrl.FireTarget.Location;
            }
            NewAimRotator = MyWeapon.GetBaseAIAimRotation(myWeaponLoc, AimLoc);
        }
    }
    AimRotatorSmoothed.Yaw = int(LimitAimDegreesChange(float(NewAimRotator.Yaw), float(WorldAimRotator.Yaw), DeltaTime, MaxAimYawDegreesSpeed));
    AimRotatorSmoothed.Pitch = int(LimitAimDegreesChange(float(NewAimRotator.Pitch), float(WorldAimRotator.Pitch), DeltaTime, MaxAimPitchDegreesSpeed));
    bSmoothingAim = AimRotatorSmoothed != NewAimRotator;
    WorldAimRotator = AimRotatorSmoothed;
    WorldAimDir = Vector(WorldAimRotator);
    //return;    
}

protected event ScriptDebugDraw()
{
    //return;    
}

defaultproperties
{
    MaxAimYawDegreesSpeed=360.0000000
    MaxAimPitchDegreesSpeed=180.0000000
    MinTargetTooCloseThreshold=125.0000000
    MaxTargetTooCloseThreshold=175.0000000
}