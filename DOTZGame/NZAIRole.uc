class NZAIRole extends DOTZAIRole;

//===========================================================================
// Settings
//===========================================================================
var int AttackRange;
var float MinWanderDelay;
var float MaxWanderDelay;


//===========================================================================
// internal data
//===========================================================================

// wander
var protected int numLooks;

// seek
var protected Vector SeekLocation;
var protected Actor  LastSeekInstigator;
var protected float LastSeekRefreshTime;

// obstacle smashing
var protected Smashable CurrentObstacle;
var protected AttackPoint CurrentAttackPoint;
var protected int NumClearAttempts;
var protected float ClearStartTime;

// eating
var protected Actor EatTarget;
const MAX_EAT_DIST = 100;
var protected int FailedEatAttempts;
var protected float DistToEatTarget;
var int EatingTime;
const MAX_EAT_TIME = 10;

// enemy mgmt
var protected float LastHeardEnemyTime;
const REACQUIRE_DELAY       = 1.5;

// charging
var protected int NumChargingZombies; // using default value as a class var.
var protected const int MaxChargingZombies;
var protected const float MaxChargeDist;
var protected const float MinChargeDist;
var protected float MinTimeBetweenCharges;
var protected float MaxTimeBetweenCharges;
var protected float LastChargeTime;
var protected float ChargeStartTime;
var protected bool bIsCharging;
var protected float ChargeDuration;
var protected bool bIgnoreBumps;
var() bool bAllowedToCharge;

// other
var protected bool bActivated;
const START_REACQUIRE_TIMER = 68694;
const CHARGE_TIMER          = 8375093;
const PRE_CHARGE_TIMER      = 8375094;
const THINK_AGAIN_TIMER     = 92843;
const MELEE_RANGE           = 150;
const DONT_BE_STUPID_TIMER    = 29384;
var NAIController zombieBot;

function OnTakingDamage(Pawn Other, float Damage) {
    super.OnTakingDamage( other, damage );
    //in multiplayer, if some other human shoots you then go after them instead
    if (Level.NetMode != NM_StandAlone && ZombieAIController(Other.Controller)==None){
      bot.enemy = Other;
    }
}


/**
 * Called whenever an enemy pawn is in sight.
 */
function OnThreatSpotted( Pawn threat ) {
    //            // Log( self @ "OnThreatSpotted" @ threat  )    ;
    if ( threat == None ) return;

    //TODO: this probably needs fancying up.  Possibly only switch if
    //      closer, or human controlled...



    if ( threat != bot.Enemy ) {
        bot.AcquireEnemy(threat, true);

    }
   // GotoState( 'Attacking' );
}

function OnThreatHeard( Pawn threat ){
   if ( threat == None ) return;

  if ( threat != bot.Enemy ) {
        bot.AcquireEnemy(threat, true);

    }
}

function OnKilled( Controller killer ) {
   // super.OnKilled( killer );
    bot.pawn.health = 100;
    //EndCharge();
}

//===============================================================
// Default Properties
//===============================================================


// Decompiled with UE Explorer.
defaultproperties
{
    AttackRange=11150
    MinWanderDelay=10.0000000
    MaxWanderDelay=30.0000000
    LastSeekRefreshTime=-10.0000000
    MaxChargingZombies=1
    MaxChargeDist=1750.0000000
    MinChargeDist=100.0000000
    MinTimeBetweenCharges=15.0000000
    MaxTimeBetweenCharges=30.0000000
    bAllowedToCharge=true
    DebugFlags=1
}