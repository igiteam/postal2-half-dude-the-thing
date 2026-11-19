class SVehicle extends Vehicle
    abstract
    nativereplication
    config(Game)
    placeable
    hidecategories(AnimDependency,Navigation);

struct native VehicleState
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RBState;
    var(*) /*0x35EA0000-0x00000000*/ private byte ServerBrake;
    var(*) /*0x35EA0000-0x00000000*/ private byte ServerGas;
    var(*) /*0x35EA0000-0x00000000*/ private byte ServerSteering;
    var(*) /*0x35EA0000-0x00000000*/ private byte ServerRise;
    var(*) /*0x35EA0000-0x00000000*/ private bool bServerHandbrake;
    var(*) /*0x35EA0000-0x00000000*/ private int ServerView;

    structdefaultproperties
    {
        RBState=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),Quaternion=(X=0.0000000,Y=0.0000000,Z=0.0000000,W=0.0000000),LinVel=(X=0.0000000,Y=0.0000000,Z=0.0000000),AngVel=(X=0.0000000,Y=0.0000000,Z=0.0000000),bNewData=0)
        ServerBrake=0
        ServerGas=0
        ServerSteering=0
        ServerRise=0
        bServerHandbrake=false
        ServerView=0
    }
};

var(*) /*0x4B0D0000-0x00000600*/ private export @NULL SimObj[720897];
var(*) /*0x4B0D0000-0x00000400*/ private editfixedsize export array Wheels[589825];
var(*) /*0x4B0D0000-0x00000000*/ private @NULL COMOffset[65537];
var(*) /*0x4B0D0000-0x00000000*/ private @NULL InertiaTensorMultiplier[65537];
var(*) /*0x4EEF0000-0x00000000*/ private bool bStayUpright[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSuspensionAxis;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateWheelShapes;
var(*) /*0x35EA0000-0x00000000*/ private bool bVehicleOnGround[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bVehicleOnWater[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsInverted[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bChassisTouchingGround[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasChassisTouchingGroundLastTick[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanFlip;
var(*) /*0x35EA0000-0x00000000*/ private bool bFlipRight;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsUprighting;
var(*) /*0x35EA0000-0x00000000*/ private bool bOutputHandbrake;
var(*) /*0x35EA0000-0x00000000*/ private bool bHoldingDownHandbrake;
var(*) /*0x4EEF0000-0x00000000*/ private float StayUprightRollResistAngle[65537];
var(*) /*0x4EEF0000-0x00000000*/ private float StayUprightPitchResistAngle[65537];
var(*) /*0x4EEF0000-0x00000000*/ private float StayUprightStiffness[65537];
var(*) /*0x4EEF0000-0x00000000*/ private float StayUprightDamping[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL StayUprightConstraintSetup[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL StayUprightConstraintInstance[524289];
var(*) /*0x35EA0000-0x00000000*/ private float HeavySuspensionShiftPercent;
var(*) /*0x4B0D0000-0x00000000*/ private float MaxSpeed[2162689];
var(*) /*0x4B0D0000-0x00000000*/ private float MaxAngularVelocity[65537];
var(*) /*0x35EA0000-0x00000000*/ private float TimeOffGround[131073];
var(*) /*0x4EF00000-0x00000000*/ private float UprightLiftStrength[65537];
var(*) /*0x4EF00000-0x00000000*/ private float UprightTorqueStrength[65537];
var(*) /*0x4EF00000-0x00000000*/ private float UprightTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private float UprightStartTime;
var(*) /*0x487A0000-0x00000400*/ private const export @NULL EngineSound[720897];
var(*) /*0x487A0000-0x00000400*/ private const export @NULL SquealSound[720897];
var(*) /*0x487A0000-0x00000000*/ private @NULL CollisionSound[65537];
var(*) /*0x487A0000-0x00000000*/ private @NULL EnterVehicleSound[65537];
var(*) /*0x487A0000-0x00000000*/ private @NULL ExitVehicleSound[65537];
var(*) /*0x487A0000-0x00000000*/ private float CollisionIntervalSecs[65537];
var(*) /*0x487A0000-0x00000000*/ private float SquealThreshold[196609];
var(*) /*0x487A0000-0x00000000*/ private float SquealLatThreshold[196609];
var(*) /*0x487A0000-0x00000000*/ private float LatAngleVolumeMult[196609];
var(*) /*0x487A0000-0x00000000*/ private float EngineStartOffsetSecs[196609];
var(*) /*0x487A0000-0x00000000*/ private float EngineStopOffsetSecs[196609];
var(*) /*0x35EA0000-0x00000000*/ private float LastCollisionSoundTime;
var(*) /*0x35EA0000-0x00000000*/ private float OutputBrake;
var(*) /*0x35EA0000-0x00000000*/ private float OutputGas;
var(*) /*0x35EA0000-0x00000000*/ private float OutputSteering;
var(*) /*0x35EA0000-0x00000000*/ private float OutputRise;
var(*) /*0x35EA0000-0x00000000*/ private float ForwardVel;
var(*) /*0x35EA0000-0x00000000*/ private int NumPoweredWheels;
var(*) /*0x4B0D0000-0x00000000*/ private @NULL BaseOffset[65537];
var(*) /*0x4B0D0000-0x00000000*/ private float CamDist[65537];
var(*) /*0x35EA0000-0x00000000*/ private int DriverViewPitch;
var(*) /*0x35EA0000-0x00000000*/ private int DriverViewYaw;
var(*) /*0x35EA0000-0x00000000*/ private VehicleState VState[270663681];
var(*) /*0x35EA0000-0x00000000*/ private float AngErrorAccumulator[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float RadialImpulseScaling;

// Export USVehicle::execAddForce(FFrame&, void* const)
native function AddForce()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Force[8388609];


}

// Export USVehicle::execAddImpulse(FFrame&, void* const)
native function AddImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Impulse[8388609];


}

// Export USVehicle::execAddTorque(FFrame&, void* const)
native function AddTorque()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Torque[8388609];


}

// Export USVehicle::execIsSleeping(FFrame&, void* const)
native function IsSleeping()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USVehicle::execSetWheelCollision(FFrame&, void* const)
native final function SetWheelCollision()
{
    local /*0x35EA0000-0x00000000*/ private int WheelNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bCollision[8388609];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3A
    if(EngineSound != none)
    {
        EngineSound.bShouldRemainActiveIfDropped = true;
    }
    // End:0xA7
    if((CollisionSound != none) && CollisionIntervalSecs <= 0.0000000)
    {
        CollisionIntervalSecs = CollisionSound.GetCueDuration() / WorldInfo.TimeDilation;
    }
    //return;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];
    local /*0x35EA0000-0x00000000*/ private int WheelIndex;
    local /*0x35EA0000-0x00000400*/ private @NULL Wheel;

    super(Pawn).PostInitAnimTree(SkelComp);
    // End:0xDD
    if(SkelComp == Mesh)
    {
        WheelIndex = 0;
        J0x35:

        // End:0xDD [Loop If]
        if(WheelIndex < Wheels.Length)
        {
            Wheel = Wheels[WheelIndex];
            Wheel.WheelControl = SkelControlWheel(Mesh.FindSkelControl(Wheel.SkelControlName));
            WheelIndex++;
            // [Loop Continue]
            goto J0x35;
        }
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    StopVehicleSounds();
    //return;    
}

simulated function TurnOff()
{
    super(Pawn).TurnOff();
    StopVehicleSounds();
    //return;    
}

simulated function StopVehicleSounds()
{
    // End:0x2E
    if(EngineSound != none)
    {
        EngineSound.Stop();
    }
    // End:0x5C
    if(SquealSound != none)
    {
        SquealSound.Stop();
    }
    //return;    
}

simulated function TakeRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation, Dir, NewDir;
    local /*0x35EA0000-0x00000000*/ private float Dist, DamageScale;
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo;

    1.0000000
    // End:0x1F
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    HitLocation = Location;
    Dir = Location - HurtOrigin;
    CheckHitInfo(HitInfo, Mesh, Dir, HitLocation);
    NewDir = HitLocation - HurtOrigin;
    Dist = VSize(NewDir);
    // End:0xD0
    if(bFullDamage)
    {
        DamageScale = 1.0000000;        
    }
    else
    {
        // End:0xEC
        if(Dist > DamageRadius)
        {
            return;            
        }
        else
        {
            DamageScale = FMax(0.0000000, 1.0000000 - (Dist / DamageRadius));
            DamageScale = DamageScale ** DamageFalloffExponent;
        }
    }
    RadialImpulseScaling = DamageScale;
    TakeDamage(int(BaseDamage * DamageScale), InstigatedBy, HitLocation, (DamageScale * Momentum) * Normal(Dir), DamageType, HitInfo, DamageCauser);
    RadialImpulseScaling = 1.0000000;
    // End:0x21F
    if(Health > 0)
    {
        DriverRadiusDamage(BaseDamage, DamageRadius, InstigatedBy, DamageType, Momentum, HurtOrigin, DamageCauser);
    }
    //return;    
}

// Export USVehicle::execInitVehicleRagdoll(FFrame&, void* const)
native function InitVehicleRagdoll()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RagdollMesh[8388609], RagdollPhysAsset, ActorMove;
    local /*0x35EA0000-0x00000000*/ private bool bClearAnimTree[8388609];


}

function AddVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVelocity[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185];

    // End:0x16E
    if(!IsZero(NewVelocity))
    {
        NewVelocity = (((RadialImpulseScaling * MomentumMult) * DamageType.default.VehicleMomentumScaling) * DamageType.default.KDamageImpulse) * Normal(NewVelocity);
        // End:0x16E
        if(!bIgnoreForces && !IsZero(NewVelocity))
        {
            // End:0x11E
            if(Location.Z > WorldInfo.StallZ)
            {
                NewVelocity.Z = FMin(NewVelocity.Z, 0.0000000);
            }
            // End:0x13B
            if(InGodMode())
            {
                NewVelocity *= 0.2500000;
            }
            Mesh.AddImpulse(NewVelocity, HitLocation);
        }
    }
    RadialImpulseScaling = 1.0000000;
    //return;    
}

function Died()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    if(super.Died(Killer, DamageType, HitLocation))
    {
        bDriving = false;
        AddVelocity(TearOffMomentum, HitLocation, DamageType);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function CalcCamera()
{
    local /*0x35EA0000-0x00000000*/ private float fDeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_CamLoc[25165825], out_CamRot;
    local /*0x35EA0000-0x00000000*/ private float out_FOV[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL pos, HitLocation, HitNormal;

    GetActorEyesViewPoint(out_CamLoc, out_CamRot);
    out_CamLoc += BaseOffset;
    pos = out_CamLoc - (Vector(out_CamRot) * CamDist);
    // End:0xBF
    if(Trace(HitLocation, HitNormal, pos, out_CamLoc, false, vect(0.0000000, 0.0000000, 0.0000000)) != none)
    {
        out_CamLoc = HitLocation + (HitNormal * float(2));        
    }
    else
    {
        out_CamLoc = pos;
    }
    return true;
    //return ReturnValue;    
}

simulated function GetDefaultCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    return 'Default';
    //return ReturnValue;    
}

function TryToDrive()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if((bIsInverted && !bVehicleOnGround) && VSize(Velocity) <= 0.1000000)
    {
        // End:0x76
        if(bCanFlip)
        {
            bIsUprighting = true;
            UprightStartTime = WorldInfo.TimeSeconds;
        }
        return false;
    }
    return super.TryToDrive(P);
    //return ReturnValue;    
}

// Export USVehicle::execHasWheelsOnGround(FFrame&, void* const)
native simulated function HasWheelsOnGround()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function StartEngineSound()
{
    // End:0x2E
    if(EngineSound != none)
    {
        EngineSound.Play();
    }
    ClearTimer('StartEngineSound');
    ClearTimer('StopEngineSound');
    //return;    
}

simulated function StartEngineSoundTimed()
{
    // End:0x41
    if(EngineStartOffsetSecs > 0.0000000)
    {
        ClearTimer('StopEngineSound');
        SetTimer(EngineStartOffsetSecs, false, 'StartEngineSound');        
    }
    else
    {
        StartEngineSound();
    }
    //return;    
}

simulated function StopEngineSound()
{
    // End:0x2E
    if(EngineSound != none)
    {
        EngineSound.Stop();
    }
    ClearTimer('StartEngineSound');
    ClearTimer('StopEngineSound');
    //return;    
}

simulated function StopEngineSoundTimed()
{
    // End:0x41
    if(EngineStopOffsetSecs > 0.0000000)
    {
        ClearTimer('StartEngineSound');
        SetTimer(EngineStopOffsetSecs, false, 'StopEngineSound');        
    }
    else
    {
        StopEngineSound();
    }
    //return;    
}

simulated function VehiclePlayEnterSound()
{
    // End:0x27
    if(EnterVehicleSound != none)
    {
        PlaySound(EnterVehicleSound);
    }
    StartEngineSoundTimed();
    //return;    
}

simulated function VehiclePlayExitSound()
{
    // End:0x27
    if(ExitVehicleSound != none)
    {
        PlaySound(ExitVehicleSound);
    }
    StopEngineSoundTimed();
    //return;    
}

simulated function DrivingStatusChanged()
{
    bUpdateWheelShapes = true;
    // End:0x26
    if(bDriving)
    {
        VehiclePlayEnterSound();        
    }
    else
    {
        // End:0x3F
        if(Health > 0)
        {
            VehiclePlayExitSound();
        }
    }
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x35EA0000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x35EA0000-0x00000000*/ private int ContactIndex[8388609];

    // End:0x88
    if((CollisionSound != none) && (WorldInfo.TimeSeconds - LastCollisionSoundTime) > CollisionIntervalSecs)
    {
        PlaySound(CollisionSound, true);
        LastCollisionSoundTime = WorldInfo.TimeSeconds;
    }
    //return;    
}

simulated event SuspensionHeavyShift()
{
    local /*0x35EA0000-0x00000000*/ private float Delta[8388609];

    //return;    
}

function PostTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutTeleporter[8388609];

    Mesh.SetRBPosition(Location);
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DebugInfo;
    local /*0x35EA0000-0x00000000*/ private int I;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    GetSVehicleDebug(DebugInfo);
    HUD.Canvas.SetDrawColor(0, 255, 0);
    I = 0;
    J0x7E:

    // End:0x14C [Loop If]
    if(I < DebugInfo.Length)
    {
        HUD.Canvas.DrawText("  " @ DebugInfo[I]);
        out_YPos += out_YL;
        HUD.Canvas.SetPos(4.0000000, out_YPos);
        I++;
        // [Loop Continue]
        goto J0x7E;
    }
    DisplayWheelsDebug(HUD, out_YL);
    //return;    
}

simulated function DisplayWheelsDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float YL[8388609];
    local /*0x35EA0000-0x00000000*/ private int I, J;
    local /*0x35EA0000-0x00000000*/ private @NULL WorldLoc, ScreenLoc, X, Y, Z, EndPoint,
	    ScreenEndPoint, SaveColor;

    local /*0x35EA0000-0x00000000*/ private float LastForceValue, GraphScale, ForceValue;
    local /*0x35EA0000-0x00000000*/ private @NULL ForceValueLoc;

    // End:0x11
    if(SimObj == none)
    {
        return;
    }
    GraphScale = 100.0000000;
    SaveColor = HUD.Canvas.DrawColor;
    I = 0;
    J0x68:

    // End:0x15DA [Loop If]
    if(I < Wheels.Length)
    {
        GetAxes(Rotation, X, Y, Z);
        WorldLoc = Location + (Wheels[I].WheelPosition >> Rotation);
        ScreenLoc = HUD.Canvas.Project(WorldLoc);
        // End:0x15CC
        if((((ScreenLoc.X >= float(0)) && ScreenLoc.X < HUD.Canvas.ClipX) && ScreenLoc.Y >= float(0)) && ScreenLoc.Y < HUD.Canvas.ClipY)
        {
            HUD.Canvas.DrawColor = MakeColor(255, 255, 0, 255);
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y);
            HUD.Canvas.DrawText("Force " $ string(Wheels[I].ContactForce));
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y - (float(1) * YL));
            HUD.Canvas.DrawText("SR " $ string(Wheels[I].LongSlipRatio));
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y - (float(2) * YL));
            HUD.Canvas.DrawText(((("SA " $ string(Wheels[I].LatSlipAngle * 57.2957800)) $ " (") $ string(Wheels[I].LatSlipAngle)) $ ")");
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y - (float(3) * YL));
            HUD.Canvas.DrawText("Torque " $ string(Wheels[I].MotorTorque));
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y - (float(4) * YL));
            HUD.Canvas.DrawText("SpinVel " $ string(Wheels[I].SpinVel));
            HUD.Canvas.DrawColor = HUD.RedColor;
            EndPoint = (WorldLoc + ((Wheels[I].LongImpulse * float(100)) * Wheels[I].LongDirection)) - (Wheels[I].WheelRadius * Z);
            ScreenEndPoint = HUD.Canvas.Project(EndPoint);
            DrawDebugLine(WorldLoc - (Wheels[I].WheelRadius * Z), EndPoint, 255, 0, 0);
            HUD.Canvas.SetPos(ScreenEndPoint.X, ScreenEndPoint.Y);
            HUD.Canvas.DrawText(string(Wheels[I].LongImpulse));
            HUD.Canvas.DrawColor = HUD.GreenColor;
            EndPoint = (WorldLoc + ((Wheels[I].LatImpulse * float(100)) * Wheels[I].LatDirection)) - (Wheels[I].WheelRadius * Z);
            ScreenEndPoint = HUD.Canvas.Project(EndPoint);
            DrawDebugLine(WorldLoc - (Wheels[I].WheelRadius * Z), EndPoint, 0, 255, 0);
            HUD.Canvas.SetPos(ScreenEndPoint.X, ScreenEndPoint.Y);
            HUD.Canvas.DrawText(string(Wheels[I].LatImpulse));
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y + YL);
            HUD.Canvas.DrawText(string(Wheels[I].LatImpulse));
            HUD.Canvas.DrawColor = MakeColor(255, 255, 255, 255);
            HUD.Draw2DLine(int(ScreenLoc.X), int(ScreenLoc.Y), int(ScreenLoc.X + GraphScale), int(ScreenLoc.Y), MakeColor(0, 0, 255, 255));
            HUD.Canvas.SetPos(ScreenLoc.X + GraphScale, ScreenLoc.Y);
            HUD.Canvas.DrawText(string(3.1415930 * 0.5000000));
            HUD.Draw2DLine(int(ScreenLoc.X), int(ScreenLoc.Y), int(ScreenLoc.X), int(ScreenLoc.Y - GraphScale), MakeColor(0, 0, 255, 255));
            HUD.Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y - GraphScale);
            HUD.Canvas.DrawText(string(SimObj.WheelLatExtremumValue));
            LastForceValue = 0.0000000;
            J = 0;
            J0x1021:

            // End:0x11AD [Loop If]
            if(float(J) <= GraphScale)
            {
                ForceValue = HermiteEval(float(J) * ((3.1415930 * 0.5000000) / GraphScale));
                ForceValue = (ForceValue / SimObj.WheelLatExtremumValue) * GraphScale;
                HUD.Draw2DLine(int(ScreenLoc.X + float(J - 1)), int(ScreenLoc.Y - LastForceValue), int(ScreenLoc.X + float(J)), int(ScreenLoc.Y - ForceValue), MakeColor(0, 255, 0, 255));
                LastForceValue = ForceValue;
                J++;
                // [Loop Continue]
                goto J0x1021;
            }
            ForceValue = HermiteEval(Abs(Wheels[I].LatSlipAngle));
            ForceValueLoc.X = ScreenLoc.X + ((Abs(Wheels[I].LatSlipAngle) / (3.1415930 * 0.5000000)) * GraphScale);
            ForceValueLoc.Y = ScreenLoc.Y - ((ForceValue / SimObj.WheelLatExtremumValue) * GraphScale);
            HUD.Draw2DLine(int(ForceValueLoc.X - float(5)), int(ForceValueLoc.Y), int(ForceValueLoc.X + float(5)), int(ForceValueLoc.Y), MakeColor(255, 0, 0, 255));
            HUD.Draw2DLine(int(ForceValueLoc.X), int(ForceValueLoc.Y - float(5)), int(ForceValueLoc.X), int(ForceValueLoc.Y + float(5)), MakeColor(255, 0, 0, 255));
            HUD.Canvas.SetPos(ScreenLoc.X, ForceValueLoc.Y);
            HUD.Canvas.DrawText(string(ForceValue));
            HUD.Canvas.SetPos(ForceValueLoc.X, ScreenLoc.Y + YL);
            HUD.Canvas.DrawText(string(Wheels[I].LatSlipAngle));
        }
        I++;
        // [Loop Continue]
        goto J0x68;
    }
    HUD.Canvas.DrawColor = SaveColor;
    //return;    
}

simulated function HermiteEval()
{
    local /*0x35EA0000-0x00000000*/ private float Slip[8388609], ReturnValue, LatExtremumSlip, LatExtremumValue, LatAsymptoteSlip, LatAsymptoteValue,
	    SlipSquared, SlipCubed, C0, C1, C3;

    LatExtremumSlip = SimObj.WheelLatExtremumSlip;
    LatExtremumValue = SimObj.WheelLatExtremumValue;
    LatAsymptoteSlip = SimObj.WheelLatAsymptoteSlip;
    LatAsymptoteValue = SimObj.WheelLatAsymptoteValue;
    // End:0x186
    if(Slip < LatExtremumSlip)
    {
        Slip /= LatExtremumSlip;
        SlipSquared = Slip * Slip;
        SlipCubed = SlipSquared * Slip;
        C3 = (-2.0000000 * SlipCubed) + (3.0000000 * SlipSquared);
        C1 = (SlipCubed - (2.0000000 * SlipSquared)) + Slip;
        return (C1 + C3) * LatExtremumValue;        
    }
    else
    {
        // End:0x1AA
        if(Slip > LatAsymptoteSlip)
        {
            return LatAsymptoteValue;            
        }
        else
        {
            Slip /= (LatAsymptoteSlip - LatExtremumSlip);
            Slip -= LatExtremumSlip;
            SlipSquared = Slip * Slip;
            SlipCubed = SlipSquared * Slip;
            C3 = (-2.0000000 * SlipCubed) + (3.0000000 * SlipSquared);
            C0 = ((2.0000000 * SlipCubed) - (3.0000000 * SlipSquared)) + 1.0000000;
            return (C0 * LatExtremumValue) + (C3 * LatAsymptoteValue);
        }
    }
    //return ReturnValue;    
}

simulated function GetSVehicleDebug()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DebugInfo[25165825];

    DebugInfo[DebugInfo.Length] = "----Vehicle----: ";
    DebugInfo[DebugInfo.Length] = ((("Speed: " $ string(VSize(Velocity))) $ " Unreal -- ") $ string(VSize(Velocity) * 0.0426125)) $ " MPH";
    // End:0xDA
    if(Wheels.Length > 0)
    {
        DebugInfo[DebugInfo.Length] = "MotorTorque: " $ string(Wheels[0].MotorTorque);
    }
    DebugInfo[DebugInfo.Length] = "Throttle: " $ string(OutputGas);
    DebugInfo[DebugInfo.Length] = "Brake: " $ string(OutputBrake);
    //return;    
}

defaultproperties
{
    InertiaTensorMultiplier=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    bCanFlip=true
    // Reference: RB_StayUprightSetup'Default__SVehicle.MyStayUprightSetup'
    begin object name=MyStayUprightSetup class=Class'RB_StayUprightSetup'
    end object
    StayUprightConstraintSetup=MyStayUprightSetup
    // Reference: RB_ConstraintInstance'Default__SVehicle.MyStayUprightConstraintInstance'
    begin object name=MyStayUprightConstraintInstance class=Class'RB_ConstraintInstance'
    end object
    StayUprightConstraintInstance=MyStayUprightConstraintInstance
    HeavySuspensionShiftPercent=0.5000000
    MaxSpeed=2500.0000000
    MaxAngularVelocity=75000.0000000
    UprightLiftStrength=225.0000000
    UprightTorqueStrength=50.0000000
    UprightTime=1.5000000
    SquealThreshold=250.0000000
    SquealLatThreshold=250.0000000
    LatAngleVolumeMult=1.0000000
    EngineStartOffsetSecs=2.0000000
    EngineStopOffsetSecs=1.0000000
    BaseOffset=(X=0.0000000,Y=0.0000000,Z=128.0000000)
    CamDist=512.0000000
    RadialImpulseScaling=1.0000000
    // Reference: SkeletalMeshComponent'Default__SVehicle.SVehicleMesh'
    begin object name=SVehicleMesh class=Class'SkeletalMeshComponent'
    end object
    Mesh=SVehicleMesh
    // Reference: CylinderComponent'Default__SVehicle.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=SVehicleMesh
    Physics=EPhysics.PHYS_RigidBody
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNetInitialRotation=true
    bBlocksTeleport=true
    bEdShouldSnap=true
    CollisionComponent=SVehicleMesh
}