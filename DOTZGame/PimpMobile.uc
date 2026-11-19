#exec OBJ LOAD FILE=..\meshes\Dcar.usx
#exec OBJ LOAD FILE=..\textures\DOTZTVehicles.utx

class PimpMobile extends KCar
    placeable;

// triggers used to get into the Bulldog
var const vector    FrontTriggerOffset;
var PimpMobileTrigger  FLTrigger, FRTrigger, FlipTrigger;



var const vector        HeadlightOffset;
//var  BulldogHeadlight    Headlight;
var bool                HeadlightOn;
//var Effect_TacLightProjector    Spotlight;

//var BulldogHeadlight    Headlight;
//var bool                HeadlightOn;

// Light materials
var Material            ReverseMaterial;
var Material            BrakeMaterial;
var Material            TailOffMaterial;

var Material            HeadlightOnMaterial;
var Material            HeadlightOffMaterial;

//var BulldogHeadlightCorona HeadlightCorona[8];
var (PimpMobile) vector  HeadlightCoronaOffset[8];

// Used to prevent triggering sounds continuously
var float           UntilNextImpact;

// Wheel dirt emitter
//var BulldogDust     Dust[4]; // FL, FR, RL, RR

// Distance below centre of tire to place dust.
var float           DustDrop;

// Ratio between dust kicked up and amount wheels are slipping
var (PimpMobile) float   DustSlipRate;
var (PimpMobile) float DustSlipThresh;

// Maximum speed at which you can get in the vehicle.
var (PimpMobile) float   TriggerSpeedThresh;
var bool            TriggerState; // true for on, false for off.
var bool            FlipTriggerState;

// Destroyed Buggy
var (PimpMobile) class<Actor>  DestroyedEffect;
var (PimpMobile) sound           DestroyedSound;

// Weapon
var           float FireCountdown;
var           float SinceLastTargetting;
var           Pawn  CurrentTarget;

var (PimpMobile) float       FireInterval;
var (PimpMobile) float       TargettingInterval;
var (PimpMobile) vector  RocketFireOffset; // Position (car ref frame) that rockets are launched from
var (PimpMobile) float     TargettingRange;
var (PimpMobile) Material    TargetMaterial;


// Bulldog sound things
var (Bulldog) float   EnginePitchScale;
var (PimpMobile) sound   PMStartSound;
var (PimpMobile) sound   PMIdleSound;
var (Bulldog) float   HitSoundThreshold;
var (pimpmobile) sound   PMSquealSound;
var (Bulldog) float   SquealVelThresh;
var (pimpmobile) sound   PMHitSound;



var (PimpMobile) String BulldogStartForce;
var (PimpMobile) String BulldogIdleForce;
var (PimpMobile) String BulldogSquealForce;
var (PimpMobile) String BulldogHitForce;

replication
{
    reliable if(Role == ROLE_Authority)
        HeadlightOn, CurrentTarget;
}

function PreBeginPlay()
{
    Super.PreBeginPlay();
    if ( Level.IsDemoBuild() )
        Destroy();
}

simulated function PostNetBeginPlay()
{
    local vector RotX, RotY, RotZ;
    //local int i;

    Super.PostNetBeginPlay();

    GetAxes(Rotation,RotX,RotY,RotZ);

    // Only have triggers on server
    if(Level.NetMode != NM_Client)
    {
        // Create triggers for gettting into the Bulldog
        FLTrigger = spawn(class'PimpMobileTrigger', self,, Location + FrontTriggerOffset.X * RotX + FrontTriggerOffset.Y * RotY + FrontTriggerOffset.Z * RotZ);
        FLTrigger.SetBase(self);
        FLTrigger.SetCollision(true, false, false);

        FRTrigger = spawn(class'PimpMobileTrigger', self,, Location + FrontTriggerOffset.X * RotX - FrontTriggerOffset.Y * RotY + FrontTriggerOffset.Z * RotZ);
        FRTrigger.SetBase(self);
        FRTrigger.SetCollision(true, false, false);

        TriggerState = true;

        // Create trigger for flipping the bulldog back over.
        FlipTrigger = spawn(class'PimpMobileTrigger', self,, Location);
        Fliptrigger.bCarFlipTrigger = true;
        FlipTrigger.SetBase(self);
        FlipTrigger.SetCollisionSize(350, 200);
        FlipTrigger.SetCollision(false, false, false);

        FlipTriggerState = false;
    }

         // Dont bother making emitters etc. on dedicated server
    if(Level.NetMode != NM_DedicatedServer)
    {
        // Create headlight projector. We make sure it doesn't project on the vehicle itself.
       //Headlight = spawn(class' BulldogHeadlight', self,, Location + HeadlightOffset.X * RotX + HeadlightOffset.Y * RotY + HeadlightOffset.Z * RotZ);
       // Headlight.SetBase(self);
        //Headlight.SetRelativeRotation(rot(-2000, 32768, 0));

        //Spotlight = spawn(class'Effect_TacLightGlow', self,, Location + HeadlightOffset.X * RotX + HeadlightOffset.Y * RotY + HeadlightOffset.Z * RotZ);
       /// Spotlight = spawn(class'Effect_TacLightProjector',self);
       //Spotlight.SetBase(self);
        //Spotlight.setowner(self);
        //Spotlight.SetRelativeRotation(rot(-2000, -32768, 0));

        // Set light materials
        Skins[1]=BrakeMaterial;
        Skins[2]=HeadlightOffMaterial;
    }

    // For KImpact event
    KSetImpactThreshold(HitSoundThreshold);

    // If this is not 'authority' version - don't destroy it if there is a problem.
    // The network should sort things out.
    if(Role != ROLE_Authority)
    {
        KarmaParams(KParams).bDestroyOnSimError = False;
        KarmaParams(frontLeft.KParams).bDestroyOnSimError = False;
        KarmaParams(frontRight.KParams).bDestroyOnSimError = False;
        KarmaParams(rearLeft.KParams).bDestroyOnSimError = False;
        KarmaParams(rearRight.KParams).bDestroyOnSimError = False;
    }
}

function exec ToggleView()
{
    local PlayerController DriverController;

    DriverController = PlayerController(Driver.Controller);

    if (DriverController.CameraDist != 0)
        DriverController.CameraDist = 0;
    else
        DriverController.CameraDist = DriverController.default.CameraDist;
}

simulated event Destroyed()
{
   // local int i;

    //Log("Bulldog Destroyed");

    // Clean up random stuff attached to the car
    if(Level.NetMode != NM_Client)
    {

        FLTrigger.Destroy();
        FRTrigger.Destroy();
        FlipTrigger.Destroy();
    }



    // This will destroy wheels & joints
    Super.Destroyed();

    // Trigger destroyed sound and effect
    if(Level.NetMode != NM_DedicatedServer)
    {
        spawn(DestroyedEffect, self, , Location );
        PlaySound(DestroyedSound);
    }
}

function KImpact(actor other, vector pos, vector impactVel, vector impactNorm)
{
    /* Only make noises for Bulldog-world impacts */
    if(other != None)
        return;


    if(UntilNextImpact < 0)
    {

         PlaySound(PMHitSound);
        // hack to stop the sound repeating rapidly on impacts
        UntilNextImpact = GetSoundDuration(PMHitSound);


    }else{
    PlaySound(PMHitSound);
    }
}

simulated function ClientKDriverEnter(PlayerController pc)
{
    Log("PimpMobile ClientKDriverEnter");

    Super.ClientKDriverEnter(pc);
}

simulated function ClientKDriverLeave(PlayerController pc)
{
    //Log("Bulldog ClientKDriverLeave");

    Super.ClientKDriverLeave(pc);
}

function bool KDriverLeave(bool bForceLeave)
{
    local Pawn OldDriver;

    //Log("Bulldog KDriverLeave");

    OldDriver = Driver;

    // If we succesfully got out of the car, make driver visible again.
    if( Super.KDriverLeave(bForceLeave) )
    {
        OldDriver.bHidden = false;
        AmbientSound = None;
        return true;
    }
    else
        return false;
}




simulated function Tick(float Delta)
{
    Local float BestAim, BestDist, TotalSlip, EnginePitch, VMag;
    Local vector RotX, RotY, RotZ, FireLocation;
    local pawn NewTarget;
    //local int i;

    Super.Tick(Delta);

    // Weapons (run on server and replicated to client)
    if(Role == ROLE_Authority)
    {
        // Only put headlights on when driver is in. Save batteries!
       //  if(Driver != None){
           // HeadlightOn=true;
             //Spotlight.bHasLight = true;
      //  else
           // HeadlightOn=false;

          // }
        // Do targetting (do nothing if no controller)
        SinceLastTargetting += Delta;
        if(Controller != None && SinceLastTargetting > TargettingInterval)
        {
            GetAxes(Rotation, RotX, RotY, RotZ);

            FireLocation = Location + (RocketFireOffset >> Rotation);

            // BestAim is zero - so we will only target things in front of the buggy
            BestAim = 0;
            NewTarget = Controller.PickTarget(BestAim, BestDist, -1.0 * RotX, FireLocation, TargettingRange);

            // If this is a new lock - play lock-on noise
            if(NewTarget != CurrentTarget)
            {

            }

            CurrentTarget = NewTarget;
            SinceLastTargetting = 0;
        }

        // Countdown to next shot
        FireCountdown -= Delta;

        // This is for sustained barrages.
        // Primary fire takes priority
        if(bVehicleIsFiring){
            }
    }

    // Dont bother doing effects on dedicated server.
    if(Level.NetMode != NM_DedicatedServer)
    {
        // Update brake light colors.
        if(Gear == -1 && OutputBrake == false)
        {
            // REVERSE
            Skins[1] = ReverseMaterial;
        }
        else if(Gear == 0 && OutputBrake == true)
        {
            // BRAKE
            Skins[1] = BrakeMaterial;
        }
        else
        {
            // OFF
            Skins[1] = TailOffMaterial;
        }

             // Set headlight projector state.
  //      Headlight.DetachProjector();
      //  if(HeadlightOn)
       // {
      //      Headlight.AttachProjector();

        //    Skins[2] = HeadlightOnMaterial;
           // for(i=0; i<8; i++)
              //  HeadlightCorona[i].bHidden = false;
       // }
      //  else
      //  {
       //     Skins[2] = HeadlightOffMaterial;
            //for(i=0; i<8; i++)
             //   HeadlightCorona[i].bHidden = true;
      //  }


    }

    UntilNextImpact -= Delta;

    // This assume the sound is an idle-ing sound, and increases with pitch
    // as wheels speed up.
    EnginePitch = 64 + ((WheelSpinSpeed/EnginePitchScale) * (255-64));
    SoundPitch = FClamp(EnginePitch, 0, 254);
    //Log("Engine Pitch:"$SoundPitch);
    //SoundVolume = 255;

    // Currently, just use rear wheels for slipping noise
    TotalSlip = rearLeft.GroundSlipVel + rearRight.GroundSlipVel;
    //log("TotalSlip:"$TotalSlip);
    if(TotalSlip > SquealVelThresh)
    {
        rearLeft.AmbientSound = PMSquealSound;
    }
    else
    {
        rearLeft.AmbientSound = None;
    }

    // Dont have triggers on network clients.
    if(Level.NetMode != NM_Client)
    {
        // If vehicle is moving, disable collision for trigger.
        VMag = VSize(Velocity);

        if(!bIsInverted && VMag < TriggerSpeedThresh && TriggerState == false)
        {
            FLTrigger.SetCollision(true, false, false);
            FRTrigger.SetCollision(true, false, false);
            TriggerState = true;
        }
        else if((bIsInverted || VMag > TriggerSpeedThresh) && TriggerState == true)
        {
            FLTrigger.SetCollision(false, false, false);
            FRTrigger.SetCollision(false, false, false);
            TriggerState = false;
        }

        // If vehicle is inverted, and slow, turn on big 'flip vehicle' trigger.
        if(bIsInverted && VMag < TriggerSpeedThresh && FlipTriggerState == false)
        {
            FlipTrigger.SetCollision(true, false, false);
            FlipTriggerState = true;
        }
        else if((!bIsInverted || VMag > TriggerSpeedThresh) && FlipTriggerState == true)
        {
            FlipTrigger.SetCollision(false, false, false);
            FlipTriggerState = false;
        }
    }
}

// Really simple at the moment!
function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation,
                        Vector momentum, class<DamageType> damageType)
{
    if(Damage < 0)
        return;

    // The vehicle is dead!
    if(Health <= 0)
    {
        if ( Controller != None )
        {
            if( Controller.bIsPlayer )
            {
                ClientKDriverLeave(PlayerController(Controller)); // Just to reset HUD etc.
                Controller.PawnDied(self); // This should unpossess the controller and let the player respawn
            }
            else
                Controller.Destroy();
        }

        Destroy(); // Destroy the vehicle itself (see Destroyed below)
    }

    //KAddImpulse(momentum, hitlocation);
}
////////////////////////////////////////////////////////////
//=========================================================
function KDriverEnter(Pawn p)
{
	local PlayerController pc;

    log("KVehicle KDriverEnter");

	// Set pawns current controller to control the vehicle pawn instead
	Driver = p;

	// Move the driver into position, and attach to car.
	Driver.SetCollision(false, false, false);
	Driver.bCollideWorld = false;
	Driver.bPhysicsAnimUpdate = false;
	Driver.Velocity = vect(0,0,0);
	Driver.SetPhysics(PHYS_None);
	Driver.SetBase(self);

	pc = PlayerController(p.Controller);
	//pc.ClientSetBehindView(true);
	//pc.ClientSetFixedCamera(false);

	// Disconnect PlyaerController from Driver and connect to KVehicle.
	pc.Unpossess();
	Driver.SetOwner(pc); // This keeps the driver relevant.
	pc.Possess(self);

	pc.ClientSetViewTarget(self); // Set playercontroller to view the vehicle

	// Change controller state to driver
    pc.GotoState('PlayerDriving');

	ClientKDriverEnter(pc);
	p.bHidden = True;
	 PlaySound(PMStartSound);
	AmbientSound=PMIdleSound;
}

// Tell it your current throttle, and it will give you an output torque
// This is currently like an electric motor
function float Engine(float Throttle)
{
    local float torque;
    //local float UUPH;
    //local float MPH;

    torque = Abs(Throttle) * Gear * InterpCurveEval(TorqueCurve, WheelSpinSpeed);
    //UUPH = VSize(Velocity) * 360;
    //MPH = UUPH / 5280;

    //GraphData("SpinSpeed", WheelSpinSpeed);
    GraphData("Speed", VSize(Velocity));
    GraphData("Torque", torque);

    return -1 * torque;
}

/////////////////////////////////////////////////////////////////////////////////
function ProcessCarInput()
{
    local vector worldForward, worldUp;

    //Log("PCI S:"$Steering$" T:"$Throttle);

    worldForward = vect(-1, 0, 0) >> Rotation;
    worldUp = vect(0, 0, 1) >> Rotation;

    ForwardVel = Velocity Dot worldUp;

    bIsInverted = worldUp.Z < 0.2;

    // 'ForwardVel' isn't very helpful if we are inverted, so we just pretend its positive.
    if(bIsInverted)
        ForwardVel = 2 * StopThreshold;

    //Log("F:"$ForwardVel$"IsI:"$bIsInverted);

    if( Driver == None )
    {
        if(bAutoDrive == true)
        {
            Gear = 1;
            OutputBrake = false;

            Throttle = 0.4;
            Steering = 1;

            //log("Thr:"$Throttle);

            KWake();
        }
        else
        {
            Gear = 0;
            OutputBrake = true;
        }
    }
    else
    {
        if(Throttle > 0.01) // pressing forwards
        {
            if(ForwardVel < -StopThreshold && Gear != 1) // going backwards - so brake first
            {
                //Log("F - Brake");
                Gear = 0;
                OutputBrake = true;
                IsDriving = false;
            }
            else // stopped or going forwards, so drive
            {
                //Log("F - Drive");
                Gear = 1;
                OutputBrake = false;
                IsDriving = true;
            }
        }
        else if(Throttle < -0.01) // pressing backwards
        {
            // We have to release the brakes and then press reverse again to go into reverse
            if(ForwardVel < StopThreshold && IsDriving == false)
            {
                //Log("B - Drive");
                Gear = -1;
                OutputBrake = false;
                IsDriving = false;
            }
            else // otherwise, we are going forwards, or still holding brake, so just brake
            {
                //Log("B - Brake");
                Gear = 0;
                OutputBrake = true;
                IsDriving = true;
            }
        }
        else // not pressing either
        {
            // If stationary, stick brakes on
            if(Abs(ForwardVel) < StopThreshold)
            {
                //Log("B - Brake");
                Gear = 0;
                OutputBrake = true;
                IsDriving = false;
                OutputHandbrakeOn = false; // force handbrake off if stopped.
            }
            else // otherwise, coast
            {
                //Log("Coast");
                Gear = 0;
                OutputBrake = false;
                IsDriving = false;
            }
        }

        KWake(); // currently, never let the car go to sleep whilst being driven.
    }

    // If we are going forwards, steering, and pressing the brake,
    // enable extra-slippy handbrake.
    if((ForwardVel > HandbrakeThresh || OutputHandbrakeOn == true) && Abs(Steering) > 0.01 && OutputBrake == true)
        OutputHandbrakeOn = true;
    else
        OutputHandbrakeOn = false;

    // Engine model
    OutputTorque = Engine(Throttle);
}

/////////////////////////////////////////////////////////////////////////////////


//////===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    FrontTriggerOffset=(X=0.0000000,Y=165.0000000,Z=10.0000000)
    HeadlightOffset=(X=-200.0000000,Y=0.0000000,Z=50.0000000)
    UntilNextImpact=500.0000000
    TriggerSpeedThresh=40.0000000
    FireInterval=0.9000000
    TargettingInterval=0.5000000
    RocketFireOffset=(X=0.0000000,Y=0.0000000,Z=180.0000000)
    TargettingRange=5000.0000000
    EnginePitchScale=655350.0000000
    PMIdleSound=Sound'DOTZXEnvironment.EngineSmall1'
    HitSoundThreshold=30.0000000
    SquealVelThresh=15.0000000
    FrontTireClass=Class'PimpMobileTire'
    RearTireClass=Class'PimpMobileTire'
    WheelFrontAlong=-170.0000000
    WheelFrontAcross=60.0000000
    WheelRearAlong=110.0000000
    WheelRearAcross=60.0000000
    WheelVert=10.0000000
    MaxSteerAngle=4000.0000000
    MaxBrakeTorque=55.0000000
    SteerPropGap=500.0000000
    SteerTorque=15000.0000000
    SteerSpeed=20000.0000000
    SuspStiffness=150.0000000
    SuspDamping=14.5000000
    SuspHighLimit=0.5000000
    SuspLowLimit=-0.5000000
    TireRollFriction=1.5000000
    TireLateralFriction=1.5000000
    TireRollSlip=0.0600000
    TireLateralSlip=0.0400000
    TireSlipRate=0.0070000
    TireSoftness=0.0000000
    TireHandbrakeSlip=0.2000000
    TireHandbrakeFriction=-1.2000000
    ChassisMass=8.0000000
    StopThreshold=40.0000000
    TorqueCurve=(Points=/* Array type was not detected. */)
    Gear=4
    OutputBrake=true
    ExitPositions=/* Array type was not detected. */
    DrivePos=(X=-165.0000000,Y=0.0000000,Z=-100.0000000)
    bSpecialHUD=true
    AirSpeed=5000.0000000
    Health=1000
    DrawType=8
    StaticMesh=StaticMesh'Dcar.pimpmobileSM'
    SoundRadius=128.0000000
    SoundVolume=128
    // Reference: KarmaParamsRBFull'PimpMobile.KParams0'
    begin object name=KParams0 class=Class'Engine.KarmaParamsRBFull'
        KInertiaTensor[0]=20.0000000
        KInertiaTensor[3]=30.0000000
        KInertiaTensor[5]=48.0000000
        KCOMOffset=(X=0.8000000,Y=0.0000000,Z=-0.7000000)
        KLinearDamping=0.0000000
        KAngularDamping=0.0000000
        KStartEnabled=true
        bHighDetailOnly=false
        bClientOnly=false
        bKDoubleTickRate=true
        KFriction=1.6000000
    end object
    KParams=KParams0
}