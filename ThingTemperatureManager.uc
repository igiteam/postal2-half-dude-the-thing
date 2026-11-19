
//=============================================================================
// ThingTemperatureManager.uc
//
// Central environmental temperature manager for The Thing (Postal 2).
//
// RESPONSIBILITIES:
// - Maintain global ambient temperature.
// - Support gradual temperature transitions.
// - Provide temperature queries for other systems.
// - Allow weather and environmental systems to modify temperature.
//
// OTHER SYSTEMS:
// - ThingHeatingManager
// - ThingColdExposure
// - ThingFrozenObject
// - ThingWeatherManager
//
// This is the central temperature provider.
// Heating and freezing calculations are handled separately.
//
//=============================================================================

//=============================================================================
// USAGE EXAMPLE - WEATHER TEMPERATURE CHANGES
//=============================================================================
//
// A weather event can change the target ambient temperature:
//
// TemperatureManager.SetAmbientTemperature(-35.0);
//
// The temperature will gradually move towards -35°C rather than
// instantly changing.
//
//=============================================================================
// DESIGN DECISIONS
//=============================================================================
//
// Temperature Unit:             Celsius
// Normal Update Interval:       0.25 seconds
// Default Ambient Temperature:  -15°C
// Temperature Transition Rate:  1°C per second
// Spatial Temperature:          Future extension
// Heating Calculations:         Separate manager
// Hypothermia:                  Separate manager
//
//=============================================================================
// FUTURE EXTENSION - LOCAL TEMPERATURE ZONES
//=============================================================================
//
// Version 1 uses a global ambient temperature.
//
// A future version should introduce local temperature zones,
// allowing different areas of the level to maintain independent
// temperatures.
//
// Example:
//
// Exterior:       -35°C
// Engine Room:    +20°C
// Generator Room: +15°C
// Storage Room:   -10°C
//
// This would allow engines, generators, radiators and other
// heating systems to physically influence their surroundings.
//
// IMPORTANT:
// Local temperature zones are essential for achieving the
// Cryostasis-style environmental survival gameplay.
//
//=============================================================================

class ThingTemperatureManager extends Actor
    placeable;

//=============================================================================
// TEMPERATURE CONFIGURATION
//=============================================================================

// Target ambient world temperature.
// Negative values represent freezing conditions.

var() float AmbientTemperature;

// Current simulated world temperature.

var float CurrentTemperature;

// Target temperature that the simulation approaches.

var float TargetTemperature;

// Maximum temperature change per second.

var() float TemperatureChangeRate;

//=============================================================================
// UPDATE CONFIGURATION
//=============================================================================

// Time between simulation updates.

var() float UpdateInterval;

// Internal update accumulator.

var float AccumulatedTime;

//=============================================================================
// INITIALIZATION
//=============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Initialize temperature values.

    CurrentTemperature = AmbientTemperature;
    TargetTemperature = AmbientTemperature;

    AccumulatedTime = 0.0;
}

//=============================================================================
// MAIN UPDATE
//=============================================================================

function Tick(float DeltaTime)
{
    local float MaxChange;

    Super.Tick(DeltaTime);

    AccumulatedTime += DeltaTime;

    if (AccumulatedTime < UpdateInterval)
        return;

    // Preserve remaining accumulated time.

    AccumulatedTime -= UpdateInterval;

    // Calculate maximum temperature change this update.

    MaxChange = TemperatureChangeRate * UpdateInterval;

    // Gradually approach the target temperature.

    CurrentTemperature += FClamp(
        TargetTemperature - CurrentTemperature,
        -MaxChange,
        MaxChange
    );
}

//=============================================================================
// TEMPERATURE QUERY
//=============================================================================

// Returns the current ambient temperature.
//
// SampleLocation is reserved for future spatial temperature
// calculations. Version 1 uses a global ambient temperature.

function float GetTemperatureAt(vector SampleLocation)
{
    return CurrentTemperature;
}

// Returns the current global ambient temperature.

function float GetAmbientTemperature()
{
    return CurrentTemperature;
}

// Returns the target ambient temperature.

function float GetTargetTemperature()
{
    return TargetTemperature;
}

//=============================================================================
// TEMPERATURE CONTROL
//=============================================================================

// Sets a new target ambient temperature.
//
// The world gradually approaches this temperature.

function SetAmbientTemperature(float NewTemperature)
{
    TargetTemperature = NewTemperature;
}

// Immediately changes the current and target temperature.
//
// Useful for initialization, scripted events and debugging.

function SetTemperatureImmediate(float NewTemperature)
{
    CurrentTemperature = NewTemperature;
    TargetTemperature = NewTemperature;
}

// Adds or removes heat from the target ambient temperature.

function ModifyTemperature(float TemperatureDelta)
{
    TargetTemperature += TemperatureDelta;
}

//=============================================================================
// TEMPERATURE STATE
//=============================================================================

// Returns true if the environment is below freezing.

function bool IsFreezing()
{
    return CurrentTemperature <= 0.0;
}

// Returns true if the environment is extremely cold.

function bool IsExtremelyCold()
{
    return CurrentTemperature <= -20.0;
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
    AmbientTemperature=-15.0

    TemperatureChangeRate=1.0

    UpdateInterval=0.25

    bStatic=False
}
