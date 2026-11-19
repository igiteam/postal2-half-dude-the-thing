class Vehicle extends Pawn
    abstract
    nativereplication
    config(Game)
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Vehicles);

var(*) /*0x35EA0000-0x00000000*/ private travel @NULL Driver[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bDriving[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bDriverIsVisible;
var(*) /*0x35EA0000-0x00000000*/ private bool bAttachDriver;
var(*) /*0x35EA0000-0x00000000*/ private bool bTurnInPlace;
var(*) /*0x35EA0000-0x00000000*/ private bool bSeparateTurretFocus;
var(*) /*0x35EA0000-0x00000000*/ private bool bFollowLookDir;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasHandbrake;
var(*) /*0x35EA0000-0x00000000*/ private bool bScriptedRise;
var(*) /*0x35EA0000-0x00000000*/ private bool bDuckObstacles;
var(*) /*0x35EA0000-0x00000000*/ private bool bAvoidReversing;
var(*) /*0x35EA0000-0x00000000*/ private bool bRetryPathfindingWithDriver;
var(*) /*0x4F610000-0x00000000*/ private bool bIgnoreStallZ[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDoExtraNetRelevancyTraces;
var(*) /*0x4F610000-0x00000000*/ private editfixedsize array ExitPositions[65537];
var(*) /*0x35EA0000-0x00000000*/ private float ExitRadius;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExitOffset;
var(*) /*0x4F610000-0x00000000*/ private float Steering[65537];
var(*) /*0x4F610000-0x00000000*/ private float Throttle[65537];
var(*) /*0x4F610000-0x00000000*/ private float Rise[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TargetLocationAdjustment;
var(*) /*0x35EA0000-0x00000000*/ private float DriverDamageMult;
var(*) /*0x4F610000-0x00000000*/ private float MomentumMult[65537];
var(*) /*0x35EA0000-0x00000000*/ private class CrushedDamageType;
var(*) /*0x35EA0000-0x00000000*/ private float MinCrushSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float ForceCrushPenetration;
var(*) /*0x35EA0000-0x00000000*/ private byte StuckCount;
var(*) /*0x35EA0000-0x00000000*/ private float ThrottleTime;
var(*) /*0x35EA0000-0x00000000*/ private float StuckTime;
var(*) /*0x35EA0000-0x00000000*/ private float OldSteering;
var(*) /*0x35EA0000-0x00000000*/ private float OnlySteeringStartTime;
var(*) /*0x35EA0000-0x00000000*/ private float OldThrottle;
var(*) /*0x35EA0000-0x00000000*/ private float AIMoveCheckTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float VehicleMovingTime;
var(*) /*0x35EA0000-0x00000000*/ private float TurnTime;

simulated function NotifyTeamChanged()
{
    // End:0x3F
    if((PlayerReplicationInfo != none) && Driver != none)
    {
        Driver.NotifyTeamChanged();
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DriverText;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    HUD.Canvas.SetDrawColor(255, 255, 255);
    HUD.Canvas.DrawText((((("Steering " $ string(Steering)) $ " throttle ") $ string(Throttle)) $ " rise ") $ string(Rise));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    HUD.Canvas.SetDrawColor(255, 0, 0);
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    // End:0x1F2
    if(Driver == none)
    {
        DriverText = "NO DRIVER";        
    }
    else
    {
        DriverText = (("Driver Mesh " $ string(Driver.Mesh)) $ " hidden ") $ string(Driver.bHidden);
    }
    HUD.Canvas.DrawText(DriverText);
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

function Suicide()
{
    // End:0x3A
    if(Driver != none)
    {
        Driver.KilledBy(Driver);        
    }
    else
    {
        KilledBy(self);
    }
    //return;    
}

// Export UVehicle::execGetMaxRiseForce(FFrame&, void* const)
native function GetMaxRiseForce()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UVehicle::execGetTargetLocation(FFrame&, void* const)
native simulated function GetTargetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestedBy[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bRequestAlternateLoc[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


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

    1.0000000
    // End:0xD2
    if(int(Role) == int(ROLE_Authority))
    {
        super(Actor).TakeRadiusDamage(InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
        // End:0xD2
        if(Health > 0)
        {
            DriverRadiusDamage(BaseDamage, DamageRadius, InstigatedBy, DamageType, Momentum, HurtOrigin, DamageCauser);
        }
    }
    //return;    
}

function DriverRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private float DamageAmount[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185];

    1.0000000
    // End:0xEC
    if(((((EventInstigator != none) && Driver != none) && bAttachDriver) && !Driver.bCollideActors) && !Driver.bBlockActors)
    {
        Driver.TakeRadiusDamage(EventInstigator, DamageAmount, DamageRadius, DamageType, Momentum, HitLocation, false, DamageCauser, DamageFalloffExponent);
    }
    //return;    
}

function PlayerChangedTeam()
{
    // End:0x3A
    if(Driver != none)
    {
        Driver.KilledBy(Driver);        
    }
    else
    {
        super.PlayerChangedTeam();
    }
    //return;    
}

simulated function SetBaseEyeheight()
{
    BaseEyeHeight = default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
    //return;    
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x23
    if(!bDeleteMe)
    {
        AddDefaultInventory();
    }
    //return;    
}

function CheatWalk()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CheatGhost()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CheatFly()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    // End:0x19
    if(Driver != none)
    {
        Destroyed_HandleDriver();
    }
    super.Destroyed();
    //return;    
}

simulated function Destroyed_HandleDriver()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldDriver;

    Driver.LastRenderTime = LastRenderTime;
    // End:0x95
    if(int(Role) == int(ROLE_Authority))
    {
        OldDriver = Driver;
        Driver = none;
        OldDriver.DrivenVehicle = none;
        OldDriver.Destroy();        
    }
    else
    {
        // End:0xD9
        if(Driver.DrivenVehicle == self)
        {
            Driver.StopDriving(self);
        }
    }
    //return;    
}

function CanEnterVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((((((!bDeleteMe && AnySeatAvailable()) && !bAttachDriver || !P.bIsCrouched) && P.DrivenVehicle == none) && P.Controller != none) && P.Controller.bIsPlayer) && !P.IsA('Vehicle')) && Health > 0;
    //return ReturnValue;    
}

function AnySeatAvailable()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Driver == none;
    //return ReturnValue;    
}

function TryToDrive()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(!CanEnterVehicle(P))
    {
        return false;
    }
    return DriverEnter(P);
    //return ReturnValue;    
}

function DriverEnter()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    C = P.Controller;
    Driver = P;
    Driver.StartDriving(self);
    // End:0x8C
    if(Driver.Health <= 0)
    {
        Driver = none;
        return false;
    }
    SetDriving(true);
    C.UnPossess();
    Driver.SetOwner(self);
    C.Possess(self, true);
    // End:0x17B
    if((PlayerController(C) != none) && !C.IsChildState(C.GetStateName(), LandMovementState))
    {
        PlayerController(C).GotoState(LandMovementState);
    }
    WorldInfo.Game.DriverEnteredVehicle(self, P);
    return true;
    //return ReturnValue;    
}

function PossessedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    EntryAnnouncement(C);
    NetPriority = 3.0000000;
    NetUpdateFrequency = 100.0000000;
    ThrottleTime = WorldInfo.TimeSeconds;
    OnlySteeringStartTime = WorldInfo.TimeSeconds;
    //return;    
}

function EntryAnnouncement()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];

    //return;    
}

simulated function AttachDriver()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x11
    if(!bAttachDriver)
    {
        return;
    }
    P.SetCollision(false, false);
    P.bCollideWorld = false;
    P.SetBase(none);
    P.SetHardAttach(true);
    P.SetPhysics(0);
    // End:0x115
    if((P.Mesh != none) && Mesh != none)
    {
        P.Mesh.SetShadowParent(Mesh);
    }
    // End:0x165
    if(!bDriverIsVisible)
    {
        P.SetHidden(true);
        P.SetLocation(Location);
    }
    P.SetBase(self);
    P.SetPhysics(0);
    //return;    
}

simulated function DetachDriver()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    //return;    
}

event ContinueOnFoot()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x27
    if(AIController(Controller) != none)
    {
        return DriverLeave(false);        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function GetExitRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609], ReturnValue, Rot;

    Rot.Yaw = C.Rotation.Yaw;
    return Rot;
    //return ReturnValue;    
}

event DriverLeave()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceLeave[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL C, PC, ExitRotation;

    // End:0x20
    if(int(Role) < int(ROLE_Authority))
    {
        ScriptTrace();
        return false;
    }
    // End:0x76
    if(!bForceLeave && !WorldInfo.Game.CanLeaveVehicle(self, Driver))
    {
        return false;
    }
    // End:0x87
    if(Controller == none)
    {
        return false;
    }
    // End:0x196
    if(Driver != none)
    {
        Driver.SetHardAttach(false);
        Driver.bCollideWorld = true;
        Driver.SetCollision(true, true);
        // End:0x196
        if(!PlaceExitingDriver())
        {
            // End:0x172
            if(!bForceLeave)
            {
                Driver.SetHardAttach(true);
                Driver.bCollideWorld = false;
                Driver.SetCollision(false, false);
                return false;                
            }
            else
            {
                Driver.SetLocation(GetTargetLocation());
            }
        }
    }
    ExitRotation = GetExitRotation(Controller);
    SetDriving(false);
    C = Controller;
    // End:0x215
    if(C.RouteGoal == self)
    {
        C.RouteGoal = none;
    }
    // End:0x259
    if(C.MoveTarget == self)
    {
        C.MoveTarget = none;
    }
    Controller.UnPossess();
    // End:0x393
    if((Driver != none) && Driver.Health > 0)
    {
        Driver.SetRotation(ExitRotation);
        Driver.SetOwner(C);
        C.Possess(Driver, true);
        PC = PlayerController(C);
        // End:0x373
        if(PC != none)
        {
            PC.ClientSetViewTarget(Driver);
        }
        Driver.StopDriving(self);
    }
    // End:0x3B5
    if(C == Controller)
    {
        Controller = none;
    }
    WorldInfo.Game.DriverLeftVehicle(self, Driver);
    DriverLeft();
    return true;
    //return ReturnValue;    
}

simulated function SetInputs()
{
    local /*0x35EA0000-0x00000000*/ private float InForward[8388609], InStrafe, InUp;

    Throttle = InForward;
    Steering = InStrafe;
    Rise = InUp;
    //return;    
}

function DriverLeft()
{
    Driver = none;
    SetDriving(false);
    //return;    
}

function PlaceExitingDriver()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExitingDriver[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL tryPlace, Extent, HitLocation, HitNormal, ZOffset;

    // End:0x23
    if(ExitingDriver == none)
    {
        ExitingDriver = Driver;
    }
    // End:0x34
    if(ExitingDriver == none)
    {
        return false;
    }
    Extent = ExitingDriver.GetCollisionRadius() * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = ExitingDriver.GetCollisionHeight();
    ZOffset = Extent.Z * vect(0.0000000, 0.0000000, 1.0000000);
    // End:0x289
    if(ExitPositions.Length > 0)
    {
        I = 0;
        J0xF8:

        // End:0x286 [Loop If]
        if(I < ExitPositions.Length)
        {
            // End:0x170
            if(ExitPositions[0].Z != float(0))
            {
                ZOffset = vect(0.0000000, 0.0000000, 1.0000000) * ExitPositions[0].Z;                
            }
            else
            {
                ZOffset = ExitingDriver.CylinderComponent.default.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000);
            }
            tryPlace = (Location + ((ExitPositions[I] - ZOffset) >> Rotation)) + ZOffset;
            // End:0x24D
            if(Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, false, Extent) != none)
            {                
            }
            else
            {
                // End:0x276
                if(!ExitingDriver.SetLocation(tryPlace))
                {                    
                }
                else
                {
                    return true;
                }
            }
            I++;
            // [Loop Continue]
            goto J0xF8;
        }        
    }
    else
    {
        return FindAutoExit(ExitingDriver);
    }
    return false;
    //return ReturnValue;    
}

function FindAutoExit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExitingDriver[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL FacingDir, CrossProduct;
    local /*0x35EA0000-0x00000000*/ private float PlaceDist;

    FacingDir = Vector(Rotation);
    CrossProduct = Normal(FacingDir Cross vect(0.0000000, 0.0000000, 1.0000000));
    // End:0x7E
    if(ExitRadius == float(0))
    {
        ExitRadius = (GetCollisionRadius()) + ExitingDriver.VehicleCheckRadius;
    }
    PlaceDist = ExitRadius + ExitingDriver.GetCollisionRadius();
    return (((TryExitPos(ExitingDriver, ((GetTargetLocation()) + ExitOffset) + (PlaceDist * CrossProduct), false)) || TryExitPos(ExitingDriver, ((GetTargetLocation()) + ExitOffset) - (PlaceDist * CrossProduct), false)) || TryExitPos(ExitingDriver, ((GetTargetLocation()) + ExitOffset) - (PlaceDist * FacingDir), false)) || TryExitPos(ExitingDriver, ((GetTargetLocation()) + ExitOffset) + (PlaceDist * FacingDir), false);
    //return ReturnValue;    
}

function TryExitPos()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExitingDriver[8388609], ExitPos;
    local /*0x35EA0000-0x00000000*/ private bool bMustFindGround[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Slice, HitLocation, HitNormal, StartLocation, NewActorPos, HitActor;

    Slice = ExitingDriver.GetCollisionRadius() * vect(1.0000000, 1.0000000, 0.0000000);
    Slice.Z = 2.0000000;
    StartLocation = GetTargetLocation();
    // End:0xAB
    if(Trace(HitLocation, HitNormal, ExitPos, StartLocation, false, Slice) != none)
    {
        return false;
    }
    HitActor = Trace(HitLocation, HitNormal, ExitPos - (ExitingDriver.GetCollisionHeight() * vect(0.0000000, 0.0000000, 5.0000000)), ExitPos, true, Slice);
    // End:0x149
    if(HitActor == none)
    {
        // End:0x136
        if(bMustFindGround)
        {
            return false;
        }
        HitLocation = ExitPos;
    }
    NewActorPos = HitLocation + ((ExitingDriver.GetCollisionHeight() + ExitingDriver.MaxStepHeight) * vect(0.0000000, 0.0000000, 1.0000000));
    // End:0x1EC
    if(PointCheckComponent(Mesh, NewActorPos, ExitingDriver.GetCollisionExtent()))
    {
        return false;
    }
    return ExitingDriver.SetLocation(NewActorPos);
    //return ReturnValue;    
}

function UnPossessed()
{
    NetPriority = default.NetPriority;
    bForceNetUpdate = true;
    NetUpdateFrequency = 8.0000000;
    super.UnPossessed();
    //return;    
}

function SetKillInstigator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return InstigatedBy;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    bForceNetUpdate = true;
    // End:0x7C
    if(DamageType != none)
    {
        Damage *= DamageType.static.VehicleDamageScalingFor(self);
        Momentum *= (DamageType.default.VehicleMomentumScaling * MomentumMult);
    }
    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function AdjustDriverDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[25165825];
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];

    // End:0x1B
    if(InGodMode())
    {
        Damage = 0;        
    }
    else
    {
        Damage *= DriverDamageMult;
    }
    //return;    
}

function ThrowActiveWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bDestroyWeap[9437185];

    //return;    
}

function Died()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(super.Died(Killer, DamageType, HitLocation))
    {
        SetDriving(false);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function DriverDied()
{
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C, RealPRI;

    // End:0x11
    if(Driver == none)
    {
        return;
    }
    WorldInfo.Game.DiscardInventory(Driver);
    C = Controller;
    Driver.StopDriving(self);
    Driver.Controller = C;
    Driver.DrivenVehicle = self;
    // End:0xDB
    if(Controller == none)
    {
        return;
    }
    // End:0x178
    if(PlayerController(Controller) != none)
    {
        Controller.SetLocation(Location);
        PlayerController(Controller).SetViewTarget(Driver);
        PlayerController(Controller).ClientSetViewTarget(Driver);
    }
    Controller.UnPossess();
    // End:0x1B9
    if(Controller == C)
    {
        Controller = none;
    }
    C.Pawn = Driver;
    RealPRI = Driver.PlayerReplicationInfo;
    // End:0x255
    if(RealPRI == none)
    {
        Driver.PlayerReplicationInfo = C.PlayerReplicationInfo;
    }
    WorldInfo.Game.DriverLeftVehicle(self, Driver);
    Driver.PlayerReplicationInfo = RealPRI;
    DriverLeft();
    //return;    
}

simulated function PlayDying()
{
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLoc[8388609];

    //return;    
}

simulated function GetDefaultCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x82
    if(((RequestedBy != none) && RequestedBy.PlayerCamera != none) && RequestedBy.PlayerCamera.CameraStyle == 'Fixed')
    {
        return 'Fixed';
    }
    return 'ThirdPerson';
    //return ReturnValue;    
}

simulated function FaceRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

event EncroachedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

function GetCollisionDamageInstigator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1C
    if(Controller != none)
    {
        return Controller;        
    }
    else
    {
        return ((Instigator != none) ? Instigator.Controller : none);
    }
    //return ReturnValue;    
}

event EncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL P, PushVelocity, CheckExtent;
    local /*0x35EA0000-0x00000000*/ private bool bSlowEncroach, bDeepEncroach;

    P = Pawn(Other);
    // End:0x2D
    if(P == none)
    {
        return false;
    }
    bSlowEncroach = VSize(Velocity) < MinCrushSpeed;
    // End:0x18F
    if(bSlowEncroach)
    {
        CheckExtent.X = P.CylinderComponent.CollisionRadius - ForceCrushPenetration;
        CheckExtent.Y = CheckExtent.X;
        CheckExtent.Z = P.CylinderComponent.CollisionHeight - ForceCrushPenetration;
        bDeepEncroach = PointCheckComponent(CollisionComponent, P.Location, CheckExtent);
    }
    // End:0x353
    if((((((Other == Instigator) && !bDeepEncroach) || Vehicle(Other) != none) || int(Other.Role) != int(ROLE_Authority)) || !Other.bCollideActors && !Other.bBlockActors) || bSlowEncroach && !bDeepEncroach)
    {
        // End:0x351
        if((P.Velocity Dot (Location - P.Location)) > float(0))
        {
            PushVelocity = Normal(P.Location - Location) * float(200);
            PushVelocity.Z = 100.0000000;
            P.AddVelocity(PushVelocity, Location, CrushedDamageType);
        }
        return false;
    }
    // End:0x3F3
    if(P.Base == self)
    {
        RanInto(P);
        // End:0x3CD
        if(P.Base != none)
        {
            P.JumpOffPawn();
        }
        // End:0x3F3
        if(P.Base == none)
        {
            return false;
        }
    }
    PancakeOther(P);
    return false;
    //return ReturnValue;    
}

function PancakeOther()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    Other.TakeDamage(10000, GetCollisionDamageInstigator(), Other.Location, Velocity * Other.Mass, CrushedDamageType);
    //return;    
}

function CrushedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OtherPawn[8388609];

    //return;    
}

simulated event GetEntryLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

simulated function SetDriving()
{
    local /*0x35EA0000-0x00000000*/ private bool B[8388609];

    // End:0x38
    if(bDriving != B)
    {
        bDriving = B;
        DrivingStatusChanged();
    }
    //return;    
}

simulated function DrivingStatusChanged()
{
    // End:0x3C
    if(!bDriving)
    {
        Throttle = 0.0000000;
        Steering = 0.0000000;
        Rise = 0.0000000;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x24
    if(VarName == 'bDriving')
    {
        DrivingStatusChanged();        
    }
    else
    {
        // End:0x7D
        if(VarName == 'Driver')
        {
            // End:0x7A
            if((PlayerReplicationInfo != none) && Driver != none)
            {
                Driver.NotifyTeamChanged();
            }            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

function NotifyDriverTakeHit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609];

    //return;    
}

simulated function ZeroMovementVariables()
{
    super.ZeroMovementVariables();
    Steering = 0.0000000;
    Rise = 0.0000000;
    Throttle = 0.0000000;
    //return;    
}

defaultproperties
{
    bAttachDriver=true
    bRetryPathfindingWithDriver=true
    bDoExtraNetRelevancyTraces=true
    MomentumMult=1.0000000
    CrushedDamageType=Class'DmgType_Crushed'
    MinCrushSpeed=20.0000000
    ForceCrushPenetration=10.0000000
    TurnTime=2.0000000
    bCanBeBaseForPawns=true
    bDontPossess=true
    bPathfindsAsVehicle=true
    bReplicateHealthToAll=true
    LandMovementState="PlayerDriving"
    // Reference: CylinderComponent'Default__Vehicle.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}