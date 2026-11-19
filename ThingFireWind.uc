
//=============================================================================
// ThingFireWind.uc
//
// Environmental wind simulation for The Thing (Postal 2).
//
// Inspired by Project Borealis WADS (Wind and Air Drag System).
//
// FEATURES:
// - Global wind direction and intensity.
// - Smooth periodic wind gusts.
// - Position-dependent gust variation.
// - Optional vertical wind.
// - Wind sampling API for other systems.
// - Lightweight UE2-compatible calculations.
//
// NOTE:
// This class provides environmental wind data.
// Physics interaction with movable actors is handled separately
// by ThingWindPhysics.
//
//=============================================================================


//=============================================================================
// INTEGRATION NOTES
//
// 2. HOW OTHER SYSTEMS WILL USE IT
//
// Other classes do not need to know how wind is calculated.
// They simply request wind information from the wind manager.
//
// Example: ThingFireGrid.uc
//
// local vector LocalWind;
//
// LocalWind = WindManager.GetWindAt(Cells[CellIdx].WorldPos);
//
// WindDirection = Normal(LocalWind);
//
// Example: ThingWindPhysics.uc
//
// local vector LocalWind;
//
// LocalWind = WindManager.GetWindAt(OtherActor.Location);
//
// This allows fire, smoke and physics systems to receive wind
// information from the same environmental wind source.
//
//
// 3. INITIAL CONFIGURATION
//
// Suggested starting values:
//
// BaseWindSpeed       = 250.0
// GustStrength        = 150.0
// GustFrequency       = 0.08
// VerticalWindSpeed   = 0.0
// SpatialGustScale    = 0.0005
// UpdateInterval      = 0.1
//
// IMPORTANT:
// These are experimental Unreal-unit values, not measured
// Antarctic wind speeds. They will require gameplay tuning.
//
//
// 4. IMPORTANT LIMITATIONS
//
// This is a first-stage implementation, not a complete WADS port.
//
// Current limitations:
//
// - Uses global directional wind with spatially varying gust timing,
//   not a true three-dimensional vector field.
//
// - Does not yet support independently registered wind sources.
//
// - Does not calculate aerodynamic drag.
//
// - Does not move physics objects.
//
// - Does not calculate building occlusion or wind corridors.
//
// FUTURE DEVELOPMENT:
//
// The long-term design is inspired by Project Borealis WADS
// (Wind and Air Drag System).
//
// The system should eventually provide shared environmental wind
// data to physics objects, fire propagation, smoke and particles.
//
// ThingFireGrid.uc is the initial fire integration target.
//
// Future ThingWindPhysics.uc should handle aerodynamic forces,
// object movement and rotational behaviour separately.
//
//=============================================================================


class ThingFireWind extends Actor
    placeable;

//=============================================================================
// WIND CONFIGURATION
//=============================================================================

// Main environmental wind direction.
var() vector WindDirection;

// Normal wind speed (Unreal units per second).
var() float BaseWindSpeed;

// Additional speed during gusts.
var() float GustStrength;

// Number of gust cycles per second.
var() float GustFrequency;

// Initial phase offset for gust animation.
var() float GustPhase;

// Additional vertical wind velocity.
// Positive = upward.
// Negative = downward.
var() float VerticalWindSpeed;

//=============================================================================
// SPATIAL VARIATION
//=============================================================================

// Controls how quickly gust timing changes across space.
//
// This is a lightweight approximation of spatial wind variation.
// It is NOT a full 3D vector field like Project Borealis WADS.
var() float SpatialGustScale;

//=============================================================================
// UPDATE CONFIGURATION
//=============================================================================

var() float UpdateInterval;

//=============================================================================
// RUNTIME DATA
//=============================================================================

// Current wind sampled at this actor's location.
var vector CurrentWind;

var float AccumulatedTime;

//=============================================================================
// INITIALIZATION
//=============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Prevent an invalid zero-length wind direction.
    if (VSize(WindDirection) < 0.001)
        WindDirection = vect(1,0,0);

    WindDirection = Normal(WindDirection);

    // Initialize wind immediately.
    CurrentWind = GetWindAt(Location);

    AccumulatedTime = 0.0;
}

//=============================================================================
// MAIN UPDATE
//=============================================================================

function Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);

    AccumulatedTime += DeltaTime;

    if (AccumulatedTime < UpdateInterval)
        return;

    // Preserve leftover time rather than resetting the accumulator.
    AccumulatedTime -= UpdateInterval;

    // Update the cached wind sample.
    CurrentWind = GetWindAt(Location);
}

//=============================================================================
// WIND SAMPLING
//=============================================================================

// Returns the wind velocity at a given world position.
//
// Other systems should use this function rather than maintaining
// their own wind calculations.
//
// SampleLocation:
// World position where wind should be evaluated.
//
// Returns:
// Wind velocity vector.
function vector GetWindAt(vector SampleLocation)
{
    local vector Direction;

    local float GustWave;
    local float SamplePhase;
    local float SampleSpeed;

    // Validate direction.
    Direction = Normal(WindDirection);

    if (VSize(Direction) < 0.001)
        Direction = vect(1,0,0);

    // Calculate a position-dependent gust phase.
    SamplePhase =
        (Level.TimeSeconds * GustFrequency * 6.28318)
        + GustPhase
        + ((SampleLocation Dot Direction) * SpatialGustScale);

    // Smooth periodic gust modulation.
    // Result ranges from 0.0 to 1.0.
    GustWave = 0.5 + (0.5 * Sin(SamplePhase));

    // Calculate current wind speed.
    SampleSpeed = BaseWindSpeed + (GustStrength * GustWave);

    // Wind speed cannot become negative.
    SampleSpeed = FMax(0.0, SampleSpeed);

    // Combine horizontal wind with optional vertical airflow.
    return
        (Direction * SampleSpeed)
        + vect(0,0,1) * VerticalWindSpeed;
}

//=============================================================================
// WIND DIRECTION
//=============================================================================

// Returns normalized wind direction at a world position.
function vector GetWindDirectionAt(vector SampleLocation)
{
    return Normal(GetWindAt(SampleLocation));
}

//=============================================================================
// WIND SPEED
//=============================================================================

// Returns wind velocity magnitude at a world position.
function float GetWindSpeedAt(vector SampleLocation)
{
    return VSize(GetWindAt(SampleLocation));
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
    WindDirection=(X=1.0,Y=0.0,Z=0.0)

    BaseWindSpeed=250.0
    GustStrength=150.0
    GustFrequency=0.08
    GustPhase=0.0

    VerticalWindSpeed=0.0

    SpatialGustScale=0.0005

    UpdateInterval=0.1

    bStatic=False
}
