
//=============================================================================
// ThingFrozenObject.uc
//
// Environmental freezing and thawing system for The Thing (Postal 2).
//
// RESPONSIBILITIES:
// - Track individual object temperature.
// - Simulate gradual freezing.
// - Simulate gradual thawing.
// - Detect frozen and operational states.
// - Support interactive environmental objects.
// - Allow nearby heating sources to thaw objects.
//
// OTHER SYSTEMS:
// - ThingTemperatureManager
// - ThingHeatingManager
// - ThingWeatherManager
//
//=============================================================================

//=============================================================================
// FUTURE EXTENSIONS - FROZEN OBJECTS
//=============================================================================
//
// 1. DOOR INTEGRATION
//    Frozen doors should become difficult or impossible to open.
//
// 2. GENERATOR INTEGRATION
//    Frozen generators should require thawing before starting.
//
// 3. VEHICLE INTEGRATION
//    Frozen engines should require external heating before operation.
//
// 4. MACHINERY
//    Industrial equipment should stop functioning when frozen.
//
// 5. OBJECT MATERIALS
//    Metal, wood and other materials should have different
//    freezing and thawing characteristics.
//
// 6. HEAT DISTRIBUTION
//    Heat sources should thaw nearby objects according to
//    distance and heating strength.
//
// 7. VISUAL EFFECTS
//    Ice accumulation, frost overlays and melting effects.
//
// 8. SOUND EFFECTS
//    Ice cracking, frozen machinery and thawing sounds.
//
// 9. INTERACTION
//    Players should be able to use alternative methods to
//    thaw objects, including portable heaters and fire.
//
// 10. PHYSICS INTEGRATION
//     Frozen objects should interact with the existing
//     Karma physics system where appropriate.
//
//=============================================================================

class ThingFrozenObject extends Actor
  placeable;

//=============================================================================
// FREEZING CONFIGURATION
//=============================================================================

// Current object temperature.

var float ObjectTemperature;

// Temperature below which freezing begins.

var() float FreezingTemperature;

// Temperature at which the object is considered fully frozen.

var() float FullyFrozenTemperature;

// Temperature at which thawing is considered complete.

var() float ThawedTemperature;

//=============================================================================
// FREEZING AND THAWING RATES
//=============================================================================

// Rate at which the object loses temperature.

var() float FreezingRate;

// Rate at which the object gains temperature.

var() float ThawingRate;

//=============================================================================
// FREEZING STATE
//=============================================================================

var bool bFrozen;

var bool bFreezing;

var bool bThawing;

var bool bOperational;

//=============================================================================
// OBJECT CONFIGURATION
//=============================================================================

// Whether this object can freeze.

var() bool bCanFreeze;

// Whether this object requires heating to thaw.

var() bool bRequiresHeat;

// Whether this object starts frozen.

var() bool bStartsFrozen;

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

  AccumulatedTime = 0.0;

  FindTemperatureManager();

  if (bStartsFrozen)
  {
      ObjectTemperature = FullyFrozenTemperature;

      bFrozen = True;
      bOperational = False;
  }
  else
  {
      bFrozen = False;
      bOperational = True;
  }
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

  if (!bCanFreeze)
      return;

  AccumulatedTime += DeltaTime;

  if (AccumulatedTime < UpdateInterval)
      return;

  AccumulatedTime -= UpdateInterval;

  UpdateObjectTemperature();
  UpdateFreezingState();
}

//=============================================================================
// OBJECT TEMPERATURE SIMULATION
//=============================================================================

function UpdateObjectTemperature()
{
  local float EnvironmentalTemperature;

  if (TemperatureManager == None)
      FindTemperatureManager();

  if (TemperatureManager == None)
      return;

  EnvironmentalTemperature =
      TemperatureManager.GetTemperatureAt(Location);

  if (EnvironmentalTemperature < ObjectTemperature)
  {
      bFreezing = True;
      bThawing = False;

      ObjectTemperature -=
          FreezingRate * UpdateInterval;
  }
  else if (EnvironmentalTemperature > ObjectTemperature)
  {
      if (bRequiresHeat && !IsNearHeatSource())
          return;

      bFreezing = False;
      bThawing = True;

      ObjectTemperature +=
          ThawingRate * UpdateInterval;
  }
  else
  {
      bFreezing = False;
      bThawing = False;
  }
}

//=============================================================================
// HEAT SOURCE DETECTION
//=============================================================================

// Initial placeholder for heating integration.
//
// The heating manager will eventually provide spatial heat
// detection and temperature contributions.

function bool IsNearHeatSource()
{
  local ThingHeatingManager HeatingManager;

  foreach AllActors(
      class'ThingHeatingManager',
      HeatingManager
  )
  {
      if (HeatingManager.IsHeating())
      {
          if (VSize(HeatingManager.Location - Location)
              <= HeatingManager.HeatingRadius)
          {
              return True;
          }
      }
  }

  return False;
}

//=============================================================================
// FREEZING STATE
//=============================================================================

function UpdateFreezingState()
{
  if (ObjectTemperature <= FullyFrozenTemperature)
  {
      if (!bFrozen)
          OnObjectFrozen();

      bFrozen = True;
      bOperational = False;
  }
  else if (ObjectTemperature >= ThawedTemperature)
  {
      if (bFrozen)
          OnObjectThawed();

      bFrozen = False;
      bOperational = True;
  }
}

//=============================================================================
// FREEZING EVENTS
//=============================================================================

function OnObjectFrozen()
{
  // Override in child classes.
  //
  // Example:
  // - Lock a door.
  // - Disable machinery.
  // - Stop an engine.
}

function OnObjectThawed()
{
  // Override in child classes.
  //
  // Example:
  // - Unlock a door.
  // - Restore machinery functionality.
  // - Allow an engine to start.
}

//=============================================================================
// MANUAL FREEZING AND THAWING
//=============================================================================

function FreezeObject()
{
  ObjectTemperature = FullyFrozenTemperature;

  bFrozen = True;
  bOperational = False;

  OnObjectFrozen();
}

function ThawObject()
{
  ObjectTemperature = ThawedTemperature;

  bFrozen = False;
  bOperational = True;

  OnObjectThawed();
}

//=============================================================================
// OBJECT STATE
//=============================================================================

function bool IsFrozen()
{
  return bFrozen;
}

function bool IsOperational()
{
  return bOperational;
}

function float GetObjectTemperature()
{
  return ObjectTemperature;
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
  FreezingTemperature=0.0

  FullyFrozenTemperature=-15.0

  ThawedTemperature=0.0

  FreezingRate=0.5

  ThawingRate=0.25

  UpdateInterval=1.0

  bCanFreeze=True

  bRequiresHeat=True

  bStartsFrozen=False

  bFrozen=False

  bFreezing=False

  bThawing=False

  bOperational=True

  bStatic=False
}
