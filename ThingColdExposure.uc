
//=============================================================================
// ThingColdExposure.uc
//
// Body temperature and hypothermia system for The Thing (Postal 2).
//
// RESPONSIBILITIES:
// - Track individual body temperature.
// - Simulate environmental heat loss.
// - Simulate body heat recovery.
// - Calculate hypothermia severity.
// - Support player and NPC exposure.
// - Provide temperature information to other gameplay systems.
//
// OTHER SYSTEMS:
// - ThingTemperatureManager
// - ThingHeatingManager
// - ThingWeatherManager
//
//=============================================================================

//=============================================================================
// FUTURE EXTENSIONS - COLD EXPOSURE
//=============================================================================
//
// 1. PLAYER INTEGRATION
//    Attach cold exposure simulation to the player.
//
// 2. NPC INTEGRATION
//    Allow NPCs to experience hypothermia independently.
//
// 3. WIND CHILL
//    Increase heat loss when exposed to strong environmental wind.
//
// 4. CLOTHING INSULATION
//    Different clothing should provide different levels of protection.
//
// 5. HEAT SOURCES
//    Nearby engines, generators, fireplaces and radiators should
//    accelerate body temperature recovery.
//
// 6. HYPOTHERMIA EFFECTS
//    Mild: Reduced stamina and movement efficiency.
//    Moderate: Shivering, impaired movement and reduced accuracy.
//    Severe: Significant movement impairment and unconsciousness.
//    Critical: Potential death.
//
// 7. VISUAL EFFECTS
//    Screen effects, frost overlays, breathing condensation
//    and character shivering.
//
// 8. RECOVERY
//    Characters should gradually recover when entering warm areas.
//
// 9. EXPOSURE HISTORY
//    Prolonged exposure should have cumulative gameplay consequences.
//
//=============================================================================

class ThingColdExposure extends Actor
  placeable;

//=============================================================================
// BODY TEMPERATURE CONFIGURATION
//=============================================================================

// Normal human body temperature in Celsius.

var() float NormalBodyTemperature;

// Current body temperature.

var float CurrentBodyTemperature;

// Minimum survivable body temperature.

var() float CriticalBodyTemperature;

//=============================================================================
// COLD EXPOSURE
//=============================================================================

// Rate of body heat loss under normal freezing conditions.

var() float HeatLossRate;

// Rate of body heat recovery.

var() float HeatRecoveryRate;

// Additional heat loss caused by wind.

var() float WindChillMultiplier;

//=============================================================================
// EXPOSURE STATE
//=============================================================================

var bool bExposedToCold;

var bool bNearHeatSource;

var bool bHypothermic;

var bool bCriticalHypothermia;

//=============================================================================
// HYPOTHERMIA THRESHOLDS
//=============================================================================

// Mild hypothermia begins below 35°C.

var() float MildHypothermiaThreshold;

// Moderate hypothermia begins below 32°C.

var() float ModerateHypothermiaThreshold;

// Severe hypothermia begins below 28°C.

var() float SevereHypothermiaThreshold;

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

  CurrentBodyTemperature = NormalBodyTemperature;

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

  AccumulatedTime += DeltaTime;

  if (AccumulatedTime < UpdateInterval)
      return;

  AccumulatedTime -= UpdateInterval;

  UpdateBodyTemperature();
  UpdateHypothermiaState();
}

//=============================================================================
// BODY TEMPERATURE SIMULATION
//=============================================================================

function UpdateBodyTemperature()
{
  local float EnvironmentalTemperature;
  local float HeatChange;

  if (TemperatureManager == None)
      FindTemperatureManager();

  if (TemperatureManager == None)
      return;

  EnvironmentalTemperature =
      TemperatureManager.GetTemperatureAt(Location);

  HeatChange = 0.0;

  if (EnvironmentalTemperature < 0.0)
  {
      bExposedToCold = True;

      HeatChange -= HeatLossRate *
          (Abs(EnvironmentalTemperature) / 20.0);
  }
  else
  {
      bExposedToCold = False;
  }

  if (bNearHeatSource)
  {
      HeatChange += HeatRecoveryRate;
  }

  CurrentBodyTemperature +=
      HeatChange * UpdateInterval;

  // Body temperature cannot exceed normal temperature
  // through this simplified recovery system.

  CurrentBodyTemperature = FMin(
      CurrentBodyTemperature,
      NormalBodyTemperature
  );

  CurrentBodyTemperature = FMax(
      CurrentBodyTemperature,
      20.0
  );
}

//=============================================================================
// HYPOTHERMIA STATE
//=============================================================================

function UpdateHypothermiaState()
{
  bHypothermic =
      CurrentBodyTemperature <= MildHypothermiaThreshold;

  bCriticalHypothermia =
      CurrentBodyTemperature <= SevereHypothermiaThreshold;
}

//=============================================================================
// HEATING INTERACTION
//=============================================================================

function SetNearHeatSource(bool bNearSource)
{
  bNearHeatSource = bNearSource;
}

//=============================================================================
// BODY TEMPERATURE ACCESS
//=============================================================================

function float GetBodyTemperature()
{
  return CurrentBodyTemperature;
}

function bool IsHypothermic()
{
  return bHypothermic;
}

function bool IsCriticalHypothermia()
{
  return bCriticalHypothermia;
}

//=============================================================================
// HYPOTHERMIA SEVERITY
//=============================================================================

function int GetHypothermiaLevel()
{
  if (CurrentBodyTemperature <= SevereHypothermiaThreshold)
      return 3;

  if (CurrentBodyTemperature <= ModerateHypothermiaThreshold)
      return 2;

  if (CurrentBodyTemperature <= MildHypothermiaThreshold)
      return 1;

  return 0;
}

//=============================================================================
// DEFAULT CONFIGURATION
//=============================================================================

defaultproperties
{
  NormalBodyTemperature=37.0

  CriticalBodyTemperature=20.0

  HeatLossRate=0.15

  HeatRecoveryRate=0.5

  WindChillMultiplier=1.0

  MildHypothermiaThreshold=35.0

  ModerateHypothermiaThreshold=32.0

  SevereHypothermiaThreshold=28.0

  UpdateInterval=1.0

  bExposedToCold=False

  bNearHeatSource=False

  bHypothermic=False

  bCriticalHypothermia=False

  bStatic=False
}
