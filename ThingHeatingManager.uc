
//=============================================================================
// ThingHeatingManager.uc
//
// Environmental heating system for The Thing (Postal 2).
//
// RESPONSIBILITIES:
// - Manage environmental heat sources.
// - Distribute heat around operational equipment.
// - Support generators, engines, radiators and heaters.
// - Gradually warm nearby environments.
// - Provide heat information to frozen objects.
//
// OTHER SYSTEMS:
// - ThingTemperatureManager
// - ThingFrozenObject
// - ThingColdExposure
//
//=============================================================================

//=============================================================================
// FUTURE EXTENSIONS - HEATING SYSTEM
//=============================================================================
//
// 1. LOCAL HEAT DISTRIBUTION
//    Heating should affect nearby areas rather than the entire level.
//
// 2. GENERATOR INTEGRATION
//    Generators should provide heat while operational.
//
// 3. VEHICLE ENGINE HEATING
//    Running vehicle engines should generate heat.
//
// 4. RADIATOR SYSTEM
//    Radiators should distribute heat into nearby rooms.
//
// 5. POWER DEPENDENCY
//    Electrical heaters should stop working when power is lost.
//
// 6. FUEL DEPENDENCY
//    Engines and generators should require fuel where applicable.
//
// 7. FROZEN OBJECT INTEGRATION
//    Nearby heat sources should gradually thaw frozen doors,
//    machinery and equipment.
//
// 8. TEMPERATURE LIMITS
//    Heating sources should respect their maximum heat output.
//
// 9. MULTIPLE HEAT SOURCES
//    Multiple operational sources should contribute independently
//    without overwriting each other's temperature values.
//
//=============================================================================

class ThingHeatingManager extends Actor
  placeable;

//=============================================================================
// HEATING CONFIGURATION
//=============================================================================

var() float HeatingRadius;

var() float HeatingStrength;

var() float MaximumTemperature;

var() float MinimumTemperature;

//=============================================================================
// HEATING STATE
//=============================================================================

var() bool bHeatingEnabled;

var() bool bRequiresPower;

var() bool bRequiresEngine;

var bool bOperational;

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

  bOperational = bHeatingEnabled;

  AccumulatedTime = 0.0;

  FindTemperatureManager();
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

  if (!bOperational)
      return;

  AccumulatedTime += DeltaTime;

  if (AccumulatedTime < UpdateInterval)
      return;

  AccumulatedTime -= UpdateInterval;

  ApplyHeating();
}

//=============================================================================
// APPLY HEATING
//=============================================================================

function ApplyHeating()
{
  local float CurrentTemperature;
  local float NewTemperature;
  local float HeatAmount;

  if (TemperatureManager == None)
      FindTemperatureManager();

  if (TemperatureManager == None)
      return;

  CurrentTemperature =
      TemperatureManager.GetTemperatureAt(Location);

  HeatAmount = HeatingStrength * UpdateInterval;

  NewTemperature = FMin(
      CurrentTemperature + HeatAmount,
      MaximumTemperature
  );

  NewTemperature = FMax(
      NewTemperature,
      MinimumTemperature
  );

  TemperatureManager.SetAmbientTemperature(NewTemperature);
}

//=============================================================================
// HEATING CONTROL
//=============================================================================

function EnableHeating()
{
  bHeatingEnabled = True;
  bOperational = True;
}

function DisableHeating()
{
  bHeatingEnabled = False;
  bOperational = False;
}

function SetHeatingStrength(float NewStrength)
{
  HeatingStrength = FMax(0.0, NewStrength);
}

function SetHeatingRadius(float NewRadius)
{
  HeatingRadius = FMax(0.0, NewRadius);
}

//=============================================================================
// HEATING STATE
//=============================================================================

function bool IsHeating()
{
  return bOperational;
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
  HeatingRadius=500.0

  HeatingStrength=2.0

  MaximumTemperature=20.0

  MinimumTemperature=-50.0

  UpdateInterval=0.25

  bHeatingEnabled=True

  bRequiresPower=False

  bRequiresEngine=False

  bOperational=True

  bStatic=False
}
