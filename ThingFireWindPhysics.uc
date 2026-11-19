
//=============================================================================
// ThingFireWindPhysics.uc
//
// Wind-driven physics interaction for The Thing (Postal 2).
//
// Inspired by Project Borealis WADS
// (Wind and Air Drag System).
//
// FEATURES:
// - Explicit registration of wind-reactive actors.
// - Uses ThingFireWind as its environmental wind provider.
// - Approximate aerodynamic drag.
// - Object-orientation-dependent exposed area.
// - Off-centre impulses for approximate rotational behaviour.
// - Configurable wind resistance and drag strength.
// - Maximum impulse protection.
// - Configurable update frequency.
//
// IMPLEMENTATION:
// Uses UE2 Karma physics through KAddImpulse().
//
// This is a simplified aerodynamic approximation.
// It does NOT simulate individual mesh triangles.
//
//=============================================================================

//=============================================================================
// 2. HOW TO CONNECT IT
//
// Both managers should exist in the level:
//
// ThingFireWind
//     Environmental wind provider.
//
// ThingFireWindPhysics
//     Handles wind interaction with Karma physics objects.
//
// Objects that can be affected by wind include:
//     - Crates
//     - Barrels
//     - Debris
//
// Register an object from its own UnrealScript class.
//
// Example:
//
// function PostBeginPlay()
// {
//     Super.PostBeginPlay();
//
//     // Register this object with the wind physics manager.
//     WindPhysics.RegisterWindActor(Self);
// }
//
// WindPhysics must be a reference to the placed
// ThingFireWindPhysics actor.
//
//
// 3. IMPORTANT TECHNICAL NOTES
//
// INITIAL IMPLEMENTATION - REQUIRES TESTING
//
// There are three things to be aware of:
//
// 1. KARMA COMPATIBILITY
//
// KAddImpulse() is documented in the UE2 Karma API.
// Its availability and behaviour should still be verified
// against your exact Postal 2 executable and SDK.
//
// 2. AERODYNAMICS
//
// Orientation-dependent area is only an approximation.
// It does not reproduce WADS's per-triangle calculations.
//
// 3. REGISTRATION
//
// Objects are not automatically discovered.
// This is intentional to avoid processing hundreds of
// unnecessary actors.
//
//
// FUTURE IMPROVEMENT: PER-OBJECT CONFIGURATION
//
// After testing, consider adding per-object configuration.
//
// An empty can, newspaper and heavy barrel should have
// independent drag coefficients and wind resistance,
// rather than sharing the same global settings.
//
//=============================================================================


class ThingFireWindPhysics extends Actor
    placeable;

//=============================================================================
// WIND MANAGER
//=============================================================================

// Reference to the environmental wind provider.
//
// If not assigned manually, the system attempts to find
// a ThingFireWind actor when it starts.

var() ThingFireWind WindManager;

//=============================================================================
// PHYSICS CONFIGURATION
//=============================================================================

// Overall aerodynamic drag strength.
//
// This is a gameplay scaling factor, not a physical
// air-density measurement.
var() float WindDragScale;

// Aerodynamic drag coefficient.
var() float DragCoefficient;

// General resistance applied to registered objects.
//
// Higher values make objects harder to move.
var() float WindResistance;

// Minimum relative wind speed required before
// applying an impulse.
var() float MinimumWindSpeed;

// Maximum impulse allowed per update.
var() float MaxImpulseMagnitude;

//=============================================================================
// OBJECT ORIENTATION
//=============================================================================

// Enables approximate orientation-dependent exposed area.
//
// This uses the actor's forward direction and collision bounds.
// It is NOT a per-triangle aerodynamic calculation.
var() bool bUseOrientationApproximation;

// Minimum exposed-area multiplier.
var() float MinimumAreaFactor;

//=============================================================================
// ROTATIONAL BEHAVIOUR
//=============================================================================

// Enables approximate tumbling using off-centre impulses.
var() bool bApplyApproximateTorque;

// Controls the distance between the object centre
// and the impulse application point.
var() float TorqueOffsetScale;

//=============================================================================
// UPDATE CONFIGURATION
//=============================================================================

// Time between physics updates.
var() float UpdateInterval;

// Maximum elapsed time accepted by one physics update.
var() float MaxStepDelta;

// Maximum number of registered objects.
var() int MaxRegisteredActors;

//=============================================================================
// RUNTIME DATA
//=============================================================================

// Actors explicitly registered for wind interaction.
var array<Actor> WindActors;

// Accumulated time between updates.
var float AccumulatedTime;

//=============================================================================
// INITIALIZATION
//=============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Validate update interval.
    if (UpdateInterval <= 0.0)
        UpdateInterval = 0.1;

    if (MaxStepDelta <= 0.0)
        MaxStepDelta = 0.25;

    // Validate resistance.
    if (WindResistance <= 0.0)
        WindResistance = 1.0;

    // Find environmental wind manager if not assigned.
    if (WindManager == None)
    {
        foreach AllActors(class'ThingFireWind', WindManager)
        {
            break;
        }
    }

    AccumulatedTime = 0.0;
}

//=============================================================================
// MAIN UPDATE
//=============================================================================

function Tick(float DeltaTime)
{
    local float StepDelta;

    Super.Tick(DeltaTime);

    if (WindManager == None)
        return;

    AccumulatedTime += DeltaTime;

    if (AccumulatedTime < UpdateInterval)
        return;

    // Use elapsed time to scale the applied impulse.
    StepDelta = FMin(AccumulatedTime, MaxStepDelta);

    AccumulatedTime = 0.0;

    ApplyWindToRegisteredActors(StepDelta);
}

//=============================================================================
// ACTOR REGISTRATION
//=============================================================================

// Register an actor to receive environmental wind.
//
// Only explicitly registered actors are affected.
//
// The registered actor must use Karma physics.
//
// Example:
//
// WindPhysics.RegisterWindActor(MyBarrel);
//
// IMPORTANT:
// Do not register static world geometry.

function RegisterWindActor(Actor A)
{
    local int i;

    if (A == None)
        return;

    if (A.Physics != PHYS_Karma)
        return;

    // Avoid duplicate registrations.
    for (i = 0; i < WindActors.Length; i++)
    {
        if (WindActors[i] == A)
            return;
    }

    if (WindActors.Length >= MaxRegisteredActors)
        return;

    WindActors.AddItem(A);
}

//=============================================================================
// ACTOR UNREGISTRATION
//=============================================================================

// Remove an actor from wind simulation.
//
// Example:
//
// WindPhysics.UnregisterWindActor(MyBarrel);

function UnregisterWindActor(Actor A)
{
    local int i;

    for (i = WindActors.Length - 1; i >= 0; i--)
    {
        if (WindActors[i] == A)
        {
            WindActors.Remove(i, 1);
        }
    }
}

//=============================================================================
// APPLY WIND TO REGISTERED ACTORS
//=============================================================================

function ApplyWindToRegisteredActors(float DeltaTime)
{
    local int i;
    local Actor A;

    local vector LocalWind;
    local vector RelativeWind;
    local vector WindDirection;

    local vector ObjectForward;
    local vector TorqueDirection;
    local vector ApplicationPoint;

    local float WindSpeed;
    local float BaseArea;
    local float EffectiveArea;
    local float OrientationFactor;
    local float ImpulseMagnitude;

    local vector WindImpulse;

    // Iterate backwards so invalid registrations can be removed safely.
    for (i = WindActors.Length - 1; i >= 0; i--)
    {
        A = WindActors[i];

        // Remove invalid actors.
        if (A == None)
        {
            WindActors.Remove(i, 1);
            continue;
        }

        // Only process Karma actors.
        if (A.Physics != PHYS_Karma)
            continue;

        // Obtain environmental wind at the actor's position.
        LocalWind = WindManager.GetWindAt(A.Location);

        // Calculate air velocity relative to the object.
        RelativeWind = LocalWind - A.Velocity;

        WindSpeed = VSize(RelativeWind);

        // Ignore negligible wind.
        if (WindSpeed < MinimumWindSpeed)
            continue;

        WindDirection = Normal(RelativeWind);

        //=============================================================
        // APPROXIMATE EXPOSED SURFACE AREA
        //=============================================================

        // Use collision dimensions as a lightweight approximation
        // of the object's exposed surface area.
        //
        // This does not inspect individual mesh triangles.

        BaseArea = A.CollisionRadius * A.CollisionHeight * 2.0;

        BaseArea = FMax(1.0, BaseArea);

        EffectiveArea = BaseArea;

        //=============================================================
        // OBJECT ORIENTATION
        //=============================================================

        if (bUseOrientationApproximation)
        {
            ObjectForward = vector(A.Rotation);

            OrientationFactor =
                Abs(WindDirection Dot ObjectForward);

            // Avoid completely eliminating drag when the object
            // is oriented edge-on to the wind.
            OrientationFactor =
                FMax(MinimumAreaFactor, OrientationFactor);

            EffectiveArea = BaseArea * OrientationFactor;
        }

        //=============================================================
        // AERODYNAMIC DRAG
        //=============================================================

        // Simplified drag model:
        //
        // Impulse = Direction * Speed^2
        //           * DragCoefficient
        //           * EffectiveArea
        //           * WindDragScale
        //           * DeltaTime
        //
        // Karma naturally accounts for the object's mass
        // when processing the resulting impulse.

        ImpulseMagnitude =
            WindSpeed
            * WindSpeed
            * DragCoefficient
            * EffectiveArea
            * WindDragScale
            * DeltaTime;

        // Apply general object resistance.
        ImpulseMagnitude = ImpulseMagnitude / WindResistance;

        // Protect against excessively large impulses.
        ImpulseMagnitude =
            FMin(ImpulseMagnitude, MaxImpulseMagnitude);

        WindImpulse = WindDirection * ImpulseMagnitude;

        //=============================================================
        // ROTATIONAL BEHAVIOUR
        //=============================================================

        ApplicationPoint = A.Location;

        if (bApplyApproximateTorque)
        {
            // Calculate an approximate sideways offset.
            //
            // Applying an impulse away from the centre of mass
            // allows Karma to generate rotational movement.

            TorqueDirection =
                Normal(WindDirection Cross vect(0,0,1));

            // Fallback for predominantly vertical airflow.
            if (VSize(TorqueDirection) < 0.001)
                TorqueDirection = vect(0,1,0);

            ApplicationPoint =
                A.Location
                + TorqueDirection
                * A.CollisionRadius
                * TorqueOffsetScale;
        }

        //=============================================================
        // APPLY KARMA IMPULSE
        //=============================================================

        // ApplicationPoint is a world-space position.
        //
        // An off-centre impulse can produce both translation
        // and rotation.

        A.KAddImpulse(WindImpulse, ApplicationPoint);
    }
}

//=============================================================================
// PUBLIC CONTROL FUNCTIONS
//=============================================================================

// Remove every registered actor.
function ClearWindActors()
{
    WindActors.Length = 0;
}

// Returns the number of currently registered actors.
function int GetRegisteredActorCount()
{
    return WindActors.Length;
}

//=============================================================================
// DEVELOPMENT NOTES
//
// 1. HOW TO REGISTER OBJECTS
//
// Objects must be explicitly registered.
//
// Example:
//
// WindPhysics.RegisterWindActor(MyBarrel);
//
// To stop wind interaction:
//
// WindPhysics.UnregisterWindActor(MyBarrel);
//
//
// 2. OBJECT PHYSICS REQUIREMENTS
//
// Registered objects must use Karma physics.
//
// The object must have appropriate collision dimensions,
// mass and Karma physics parameters.
//
// This class does not automatically convert static objects
// into physics objects.
//
//
// 3. PROJECT BOREALIS WADS INSPIRATION
//
// This implementation borrows the following concepts:
//
// - Relative air velocity.
// - Aerodynamic drag.
// - Object orientation.
// - Exposed surface approximation.
// - Off-centre force application.
// - Shared environmental wind input.
//
// The implementation is deliberately simplified for UE2.
//
//
// 4. CURRENT LIMITATIONS
//
// - No per-triangle aerodynamic calculations.
// - No actual fluid simulation.
// - No complete Magnus effect.
// - No mesh-specific drag profiles.
// - No automatic object discovery.
// - No building or terrain wind occlusion.
// - No true aerodynamic lift.
// - Rotational behaviour is an approximation.
// - Uses periodic Karma impulses instead of continuous forces.
//
//
// 5. FUTURE DEVELOPMENT
//
// Potential improvements:
//
// - Per-object drag coefficients.
// - Individual object wind resistance.
// - Better exposed-area estimation.
// - Separate angular drag.
// - Magnus effect for spinning objects.
// - Wind shadow calculations.
// - Spatial wind-source interaction.
// - Optimized object update scheduling.
//
//=============================================================================

defaultproperties
{
    WindDragScale=0.000001

    DragCoefficient=1.0

    WindResistance=1.0

    MinimumWindSpeed=20.0

    MaxImpulseMagnitude=250.0

    bUseOrientationApproximation=True

    MinimumAreaFactor=0.25

    bApplyApproximateTorque=True

    TorqueOffsetScale=0.5

    UpdateInterval=0.1

    MaxStepDelta=0.25

    MaxRegisteredActors=64

    bStatic=False
}
