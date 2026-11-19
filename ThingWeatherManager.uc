
//=============================================================================
// ThingWeatherManager.uc
//
// Environmental weather simulation for The Thing (Postal 2).
//
// RESPONSIBILITIES:
// - Manage environmental weather conditions.
// - Control wind speed and direction.
// - Calculate wind chill.
// - Control ambient temperature.
// - Support changing weather conditions.
// - Provide environmental information to other systems.
//
// OTHER SYSTEMS:
// - ThingTemperatureManager
// - ThingHeatingManager
// - ThingColdExposure
// - ThingFrozenObject
//
//=============================================================================

//=============================================================================
// FUTURE EXTENSIONS - WEATHER SYSTEM
//=============================================================================
//
// 1. DYNAMIC WEATHER
//    Weather should change naturally over time.
//
// 2. BLIZZARD EVENTS
//    Random or scripted blizzards should reduce visibility
//    and dramatically increase environmental exposure.
//
// 3. WIND PHYSICS
//    Wind should interact with existing ThingFireWindPhysics
//    functionality where appropriate.
//
// 4. WIND CHILL
//    Stronger wind should increase player and NPC heat loss.
//
// 5. SNOW ACCUMULATION
//    Snow should accumulate on terrain, objects and structures.
//
// 6. VISIBILITY
//    Heavy snow and blizzards should reduce visibility.
//
// 7. BUILDING PROTECTION
//    Buildings should protect characters from wind exposure.
//
// 8. OBJECT FREEZING
//    Extreme weather should accelerate freezing of exposed objects.
//
// 9. WEATHER AUDIO
//    Wind, snowstorms and blizzards should have dynamic audio.
//
// 10. WEATHER TRANSITIONS
//     Weather conditions should transition gradually rather
//     than changing instantaneously.
//
// 11. LOCAL WEATHER
//     Different level areas should eventually support different
//     wind exposure and environmental conditions.
//
// 12. ENVIRONMENTAL HEATING
//     Weather should influence heating requirements and
//     generator or engine usage.
//
//=============================================================================

class ThingWeatherManager extends Actor
    placeable;

//=============================================================================
// WEATHER CONFIGURATION
//=============================================================================

// Environmental temperature in Celsius.

var() float AmbientTemperature;

// Current simulated wind speed.

var() float WindSpeed;

// Wind direction in Unreal world coordinates.

var() vector WindDirection;

// Maximum wind speed.

var() float MaximumWindSpeed;

//=============================================================================
// WIND CHILL CONFIGURATION
//=============================================================================

// Calculated wind chill temperature.

var float WindChillTemperature;

// Wind chill multiplier for gameplay calculations.

var() float WindChillMultiplier;

//=============================================================================
// WEATHER STATES
//=============================================================================

enum EThingWeatherState
{
    TWS_Clear,
    TWS_LightSnow,
    TWS_HeavySnow,
    TWS_Blizzard,
    TWS_ExtremeBlizzard
};

var() EThingWeatherState WeatherState;

//=============================================================================
// WEATHER TRANSITIONS
//=============================================================================

// Target environmental temperature.

var float TargetTemperature;

// Target wind speed.

var float TargetWindSpeed;

// Rate of environmental temperature change.

var() float TemperatureChangeRate;

// Rate of wind speed change.

var() float WindChangeRate;

//=============================================================================
// UPDATE CONFIGURATION
//=============================================================================

var() float UpdateInterval;

var float AccumulatedTime;

//=============================================================================
// TEMPERATURE MANAGER
//=============================================================================

var ThingTemperatureManager TemperatureManager;

//=============================================================================
// INITIALIZATION
//=============================================================================

function PostBeginPlay()
{
    Super.PostBeginPlay();

    TargetTemperature = AmbientTemperature;
    TargetWindSpeed = WindSpeed;

    AccumulatedTime = 0.0;

    FindTemperatureManager();

    UpdateWeatherState();
}

//=============================================================================
// FIND TEMPERATURE MANAGER
//=============================================================================

function FindTemperatureManager()
{
    foreach AllActors(
        class'ThingTemperatureManager',
        TemperatureManager
    )
    {
        break;
    }
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

    AccumulatedTime -= UpdateInterval;

    UpdateWeather();
    UpdateWindChill();
    UpdateWeatherState();
}

//=============================================================================
// WEATHER SIMULATION
//=============================================================================

function UpdateWeather()
{
    local float MaxTemperatureChange;
    local float MaxWindChange;

    MaxTemperatureChange =
        TemperatureChangeRate * UpdateInterval;

    MaxWindChange =
        WindChangeRate * UpdateInterval;

    AmbientTemperature += FClamp(
        TargetTemperature - AmbientTemperature,
        -MaxTemperatureChange,
        MaxTemperatureChange
    );

    WindSpeed += FClamp(
        TargetWindSpeed - WindSpeed,
        -MaxWindChange,
        MaxWindChange
    );

    WindSpeed = FClamp(
        WindSpeed,
        0.0,
        MaximumWindSpeed
    );

    if (TemperatureManager == None)
        FindTemperatureManager();

    if (TemperatureManager != None)
    {
        TemperatureManager.SetAmbientTemperature(
            AmbientTemperature
        );
    }
}

//=============================================================================
// WIND CHILL CALCULATION
//=============================================================================

// Calculates approximate wind chill in Celsius.
//
// WindSpeed is expressed in kilometres per hour.
//
// The formula is intended for temperatures at or below 10°C
// and wind speeds above 4.8 km/h.
//
// Outside those conditions, ambient temperature is returned.

function float CalculateWindChill(
    float Temperature,
    float WindVelocity
)
{
    local float WindFactor;

    if (Temperature > 10.0 || WindVelocity <= 4.8)
        return Temperature;

    WindFactor = Sqrt(WindVelocity);

    return 13.12
        + (0.6215 * Temperature)
        - (11.37 * (WindFactor ** 0.16))
        + (0.3965 * Temperature * (WindFactor ** 0.16));
}

//=============================================================================
// UPDATE WIND CHILL
//=============================================================================

function UpdateWindChill()
{
    WindChillTemperature = CalculateWindChill(
        AmbientTemperature,
        WindSpeed
    );
}

//=============================================================================
// WEATHER STATE
//=============================================================================

function UpdateWeatherState()
{
    if (WindSpeed >= 90.0)
    {
        WeatherState = TWS_ExtremeBlizzard;
    }
    else if (WindSpeed >= 65.0)
    {
        WeatherState = TWS_Blizzard;
    }
    else if (WindSpeed >= 30.0)
    {
        WeatherState = TWS_HeavySnow;
    }
    else if (WindSpeed >= 10.0)
    {
        WeatherState = TWS_LightSnow;
    }
    else
    {
        WeatherState = TWS_Clear;
    }
}

//=============================================================================
// WEATHER CONTROL
//=============================================================================

// Sets the target environmental temperature.

function SetWeatherTemperature(float NewTemperature)
{
    TargetTemperature = NewTemperature;
}

// Sets the target wind speed.

function SetWindSpeed(float NewWindSpeed)
{
    TargetWindSpeed = FClamp(
        NewWindSpeed,
        0.0,
        MaximumWindSpeed
    );
}

// Sets wind direction.

function SetWindDirection(vector NewDirection)
{
    if (VSize(NewDirection) > 0.0)
        WindDirection = Normal(NewDirection);
}

//=============================================================================
// WEATHER PRESETS
//=============================================================================

function SetClearWeather()
{
    SetWeatherTemperature(-5.0);
    SetWindSpeed(5.0);
}

function SetLightSnow()
{
    SetWeatherTemperature(-10.0);
    SetWindSpeed(15.0);
}

function SetHeavySnow()
{
    SetWeatherTemperature(-20.0);
    SetWindSpeed(35.0);
}

function SetBlizzard()
{
    SetWeatherTemperature(-30.0);
    SetWindSpeed(70.0);
}

function SetExtremeBlizzard()
{
    SetWeatherTemperature(-40.0);
    SetWindSpeed(100.0);
}

//=============================================================================
// WEATHER INFORMATION
//=============================================================================

function float GetAmbientTemperature()
{
    return AmbientTemperature;
}

function float GetWindSpeed()
{
    return WindSpeed;
}

function vector GetWindDirection()
{
    return WindDirection;
}

function float GetWindChillTemperature()
{
    return WindChillTemperature;
}

function EThingWeatherState GetWeatherState()
{
    return WeatherState;
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
    AmbientTemperature=-15.0

    WindSpeed=10.0

    WindDirection=(X=1.0,Y=0.0,Z=0.0)

    MaximumWindSpeed=150.0

    WindChillMultiplier=1.0

    TemperatureChangeRate=1.0

    WindChangeRate=5.0

    UpdateInterval=1.0

    WeatherState=TWS_LightSnow

    bStatic=False
}
