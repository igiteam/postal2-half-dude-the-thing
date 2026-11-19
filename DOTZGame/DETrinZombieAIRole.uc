// Trin Extended
// Modifed for DE use, all credit goes to Trin.
// REVISED: 9-25-2008

class DETrinZombieAIRole extends DOTZAIRole;

// NOTE: I had to re-implement the ZombiaAIRole class due to compiler
// errors I was getting trying to extend the ZombieAIRole class.  See the
// following note regarding extending classes outside of the .u that the original
// class resides in.  I also removed all the of the "protected" keywords from
// the declarations to avoid this problem if someone wants to extend my class.

// From http://wiki.beyondunreal.com/wiki/Compiler_Errors
// Error:Can't save class: Graph is linked to external private object object
// Explanation:   One of your classes is making a reference to an object in 
//      another package without the RF_Public flag set. This is not permitted 
//      in Unreal Packages. Check your class for references to private or 
//      variables in other classes or to other object constants. 
//      This error can also occur if you reference a variable in a 
//      superclass *if* your derived class resides in a different package from 
//      the class where the member is declared (even though this is
//      technically supposed to work).



// Percent chance a zombie will ignore InvasionPaths on each wander attempt.
var float WanderPercent;

//var PathNode InvasionPathNodes[8];
var array<PathNode> InvasionPathNodes;

var Actor moveTarget;

var float LastFailedMoveTime;

var float AttackDirectChance;
var bool bAttackVisibility;

var Vector LastFailedMoveTargetLocation;

var Vector LastFailedMoveNewTargetLocation;
var bool bLastFailedMoveForced;

var bool bLastMoveSucceeded;

var float LastOnHeardNoiseTime;
var float LastSwitchTargetTime;

var int iRunningMode; // Running zombie mode. 0=Never, 1=Run in attack state, 2=Run always
var bool bUseAlternateAttackSystem; // Use the BD/Trin alternate attack system of grab/bite.
var float AttackDirectPercent; // % chance (0.0 - 1.0) that the zombies will attack directly instead of using pathnodes.

// Vomiter
var bool bVomiter;
var float LastVomitTime;
var float VomitDelay;
var float VomitDuration;
const VOMIT_RANGE   = 512;

var int AttackRange;
var float MinWanderDelay;
var float MaxWanderDelay;

// wander
var int numLooks;

// seek
var Vector SeekLocation;
var Actor  LastSeekInstigator;
var float LastSeekRefreshTime;

// obstacle smashing
var Smashable CurrentObstacle;
var AttackPoint CurrentAttackPoint;
var int NumClearAttempts;
var float ClearStartTime;

// eating
var Actor EatTarget;
const MAX_EAT_DIST = 100;
var int FailedEatAttempts;
var float DistToEatTarget;
var int EatingTime;
const MAX_EAT_TIME = 10;

// enemy mgmt
var float LastHeardEnemyTime;
const REACQUIRE_DELAY       = 10.0;

// charging
var bool bIgnoreBumps;

// other
var bool bActivated;
const START_REACQUIRE_TIMER = 68694;
const THINK_AGAIN_TIMER     = 92843;
const MELEE_RANGE           = 150;
const DONT_BE_STUPID_TIMER    = 29384;
var ZombieAIController zombieBot;


function OnTakingDamage(Pawn Other, float Damage) 
{
    super.OnTakingDamage( other, damage );
    //in multiplayer, if some other human shoots you then go after them instead
    if (Level.NetMode != NM_StandAlone && ZombieAIController(Other.Controller)==None)
    {
      if (Other.Controller.Pawn != None && Other.Controller.Pawn.IsA('DETrinZombiePawnBase'))
      {
         return;
      }
      bot.enemy = Other;
    }
}

function OnThreatSpotted( Pawn threat ) 
{
   if (threat.IsA('DETrinZombiePawnBase'))
   {
      return;
   }

	if ( threat == None ) return;

   if ( threat != bot.Enemy ) 
   {
       bot.AcquireEnemy(threat, true);
   }
   GotoState( 'Attacking' );
}

function OnThreatHeard( Pawn threat ) 
{
}

function OnHeardNoise( float Loudness, Actor NoiseMaker )
{
	if (Level.timeSeconds - LastOnHeardNoiseTime < 0.5)
		return;

	LastOnHeardNoiseTime = Level.timeSeconds;

   if ( noiseMaker == None) return;

   if ( noiseMaker.IsA('DETrinZombiePawnBase')) return;

   if ( NoiseMaker == bot.Enemy ) 
   {
		lastHeardEnemyTime = Level.timeSeconds;
   }
   if ( NoiseMaker.isA('Attractor') || NoiseMaker.isA('HumanPawnBase') ) 
   {
        if ( TrySeekTarget(NoiseMaker) )
        {
		    GotoState( 'Seeking', 'BEGIN' );
		  }
    }
}

function OnKilled( Controller killer ) 
{
	super.OnKilled( killer );
}

function OnWitnessedKill( Controller killer, Pawn victim )
{
    super.OnWitnessedKill( killer, victim );
    
    if ( (victim.IsHumanControlled() || victim.IsA('Otis')) && !victim.IsA('DETrinZombiePawnBase'))
    {
        EatTarget = victim;
        GotoState( 'DoSpecial', 'EAT_STUFF' );
    }
}

function MoveToLocationFailed() 
{
	// The zombie has attempted to move in response to a noise or threat and
	// not found a valid path to the destination.  The destination is either
	// unreachable or the path is blocked or whatever.  With no path to the 
	// actor the default behavior is to give up.  That leaves the zombie 
	// standing motionless in whatever state it was in when it attempted the move.

	// This logic attempts to get the zombie closer to the failed destination.
	// The logic will take the best new target destination based on the following
	// precedence:
	//  1) Attempt to find a pathnode that is:
	//        a) Reachable, i.e. won't cause a MoveToLocationFailed,
	//        b) Closer to the target then the current zombie location,
	//        c) Visible to the target (so the zombie doesn't go out of LOS during attack).
	//     This will put the zombie as close to the destination as it 
	//     can get given the pathing of the level while still being able to "see"
	//     the location.
	//  2) Attempt to find a pathnode that is:
	//        a) Reachable, i.e. won't cause a MoveToLocationFailed,
	//        b) Closer to the target than the current zombie location,
	//        c) Visible to the zombie.
	//     This will put the zombie in motion toward a closer location.
	//  3) Set the destination by projecting the target location to the XY plane of the zombie.  
   //     That is, take out the height of the target and move there, even if the target location
   //     is unreachable. That puts the zombie in motion toward the target.

	// Each method will only choose a new destination that is closer to the intended target so 
	//   the zombie will always be moving toward the destination and won't get stuck in a loop.  
	// It is likely that as the zombie gets closer different methods will be chosen to keep moving.

	// Method 3 is very useful for when the target is a player standing atop a static mesh
	// that is unreachable to the zombie (i.e. the garbage can glitch).  

	// The function has a timer that only allows operation every 3 seconds per zombie to 
	// keep from massive CPU usage (especially when the target is visible).  There are also
	// several tests to make sure that computing a new destination would be useful.

	local PathNode PN;
	local Actor newMoveTarget;
	local float MinDistance;
	local float actorDistance;
	local Pawn targetPawn;
	local Vector newMoveTargetLocationXYPlane;

	// Without a moveTarget there's no way to move.
	if (moveTarget == None  ||  bot == none)
	{
		return;
	}

	// If the previous move attempt failed and the target hasn't moved the logic would return the same
	// result as before.  
	// If the last move attempt succeeded we might be close enough to attempt a direct move method.
	// If the target moved we need to recheck from scratch.
	if ((bLastMoveSucceeded == false)  && (VSize(moveTarget.Location - LastFailedMoveTargetLocation) < 128))
	{
		// Use previous results.
		seekLocation = LastFailedMoveNewTargetLocation;
		if (bLastFailedMoveForced == true)
		{
			DETrinNoChargeZombieController(bot).Perform_MoveToLocationForced( seekLocation, 128 );  
		}
		else
		{
			bot.Perform_MoveToLocation( seekLocation, 128 );  
		}
		return;
	}

	// Don't do this routine too often given the actor searches involved.
   if (Level.TimeSeconds - LastFailedMoveTime < 3)
	{
		return;
	}

	// Reset all test variables.
	bLastMoveSucceeded = false;
	LastFailedMoveTargetLocation = moveTarget.Location;
   LastFailedMoveTime = Level.TimeSeconds;
	bLastFailedMoveForced = false;

	newMoveTarget = None;
	MinDistance = 0.0;

	// Determine current distance to goal.
	MinDistance = VSize(bot.Pawn.Location - moveTarget.Location);

	targetPawn = Pawn(moveTarget);

	if (targetPawn == None)
	{
	}
	else
	{
      // This is method 1.  Find a PathNode that is within LOS of the target and is reachable
      // by the zombie and is closer than the current zombie position.

		foreach RadiusActors( class 'PathNode', PN, MinDistance - 128, moveTarget.Location)
		{
			// Check for visibility from the destination location.
			if (targetPawn.controller.LineOfSightTo(PN))
			{
				// Check to make sure we can go there at all.
				if (bot.PointReachable(PN.location) || bot.FindPathTo(PN.location) != None)
				{
					// Find the closest one to the intended destination.
					actorDistance = VSize(PN.location - moveTarget.Location);

					if ( actorDistance < MinDistance )
					{
						newMoveTarget = PN;
						MinDistance = actorDistance;
					}
				}
			}		
		}
	}

	if (newMoveTarget != None)
	{
		seekLocation = newMoveTarget.Location;
		LastFailedMoveNewTargetLocation = newMoveTarget.Location;
		bot.Perform_MoveToLocation( seekLocation, 128 );  
      return;
	}

   // This is method 2.  Find a PathNode that is within LOS of the zombie and is reachable and is closer to the
   // target than the current zombie location.
	foreach RadiusActors( class 'PathNode', PN, MinDistance - 128, bot.Pawn.Location)
	{
		// Check for visibility from the destination location.
		if (bot.LineOfSightTo(PN))
		{
			// Check to make sure we can go there at all.
			if (bot.PointReachable(PN.location) || bot.FindPathTo(PN.location) != None)
			{
				// Find the closest one to the intended destination.
				actorDistance = VSize(PN.location - moveTarget.Location);

				if ( actorDistance < MinDistance - 128 )
				{
					newMoveTarget = PN;
					MinDistance = actorDistance;
				}
			}
		}		
	}

	if (newMoveTarget != None)
	{
		seekLocation = newMoveTarget.Location;
		LastFailedMoveNewTargetLocation = newMoveTarget.Location;
		bot.Perform_MoveToLocation( seekLocation, 128 );  
      return;
	}


   // This is method 3.  Last resort - move to the target location projected to the zombie's XY plane.

	// Compute the move target location without respect to Z axis.

	newMoveTargetLocationXYPlane.x = moveTarget.Location.x;
	newMoveTargetLocationXYPlane.y = moveTarget.Location.y;
	newMoveTargetLocationXYPlane.z = bot.Pawn.Location.z;

	// Attempt to force a move to the intended XY Plane target location.

	// So go there.
	seekLocation = newMoveTargetLocationxYPlane;
	LastFailedMoveNewTargetLocation = newMoveTargetLocationxYPlane;
	bLastFailedMoveForced = true;
	DETrinNoChargeZombieController(bot).Perform_MoveToLocationForced( newMoveTargetLocationXYPlane, 128);

   return;
}

function MoveToLocationSucceeded() 
{
	super.MoveToLocationSucceeded();

	// Check to see if an InvasionPathNode was reached.
	InvasionPathNodeReached();

	bLastMoveSucceeded = true;
}

// Determine if the zombie's current location is near an InvasionPathNode.
// If it is remove that InvasionPathNode and all previous nodes.  The zombie
// arrived.
function InvasionPathNodeReached()
{
	local int i;

	for (i=0;i<InvasionPathNodes.length;i++)
	{
		// Check to see if the current position is near enough the current InvasionPathNode to declare
		// a successful move.
		if (VSize(InvasionPathNodes[i].Location - bot.Pawn.Location) < 512)
		{
			// Remove the node that was found and all previous nodes in the list.
			InvasionPathNodes.Remove(0,i+1);
			
			// Assume only one could be close enough.
			return;
		}
	}
}

function bool TrySeekTarget( Actor a ) 
{  
   // do some easy checks...
   if (a == None)
      return false;
   
   if (a.IsA('LMZombiePlayerPawnBase'))
   {
      return false;
   }

    if ( LastSeekInstigator == none     // if we don't have a seek target...
            || (LastSeekInstigator == a // or refreshing current target...
                    && Level.TimeSeconds - lastSeekRefreshTime > 3)
            || a.IsA('PlayerPawnBase') ) 
    {
        LastSeekInstigator  = a;
        LastSeekRefreshTime = Level.TimeSeconds;
        SeekLocation        = a.Location;
        return true;
    }

    // check for a zombie moan attractor which is considered the best noise around
    // or check if the new seek target is closer than the current seek target...
    if ( a.IsA('LMZombieMoanAttractor') || 
       (VSize(bot.Pawn.Location - a.location) <= VSize(bot.Pawn.Location - SeekLocation)) ) 
    {
        LastSeekInstigator = a;
        SeekLocation       = a.Location;
        bot.updateFocus( a );
        return true;
    }

    // new target didn't meet any criteria to override the current one.

    return false;
}

function TryClearObstacle( Actor obstacle ) 
{
    local Pawn potentialEnemy;

    // if it's an enemy, kill it!
    potentialEnemy = Pawn(obstacle);

    if ( potentialEnemy != None && !bot.SameTeamAs(potentialEnemy.controller) ) 
    {
        bot.acquireEnemy(potentialEnemy, true);

        GotoState( 'Attacking' );
        return;
    }

    // check if it's smashable...
    currentObstacle = Smashable(obstacle);
    if ( currentObstacle != None ) 
    {
        numClearAttempts = 0;
        GotoState( 'DoSpecial', 'SMASH_OBSTACLE' );
    }
    else 
    {
    }
}

function bool ShouldCharge() 
{
   return false;
}


state Scripting
{
    function OnHeardNoise( float loudness, Actor noiseMaker ) 
    {
    }

    function OnThreatHeard( Pawn threat ) {
    }

    function OnThreatSpotted( Pawn threat ) {
    }

    function OnTakingDamage(Pawn Other, float Damage) 
    {
    }

    function OnWitnessedKill( Controller killer, Pawn victim ) 
    {
    }
}

auto state Wander
{
    function BeginState() 
    {
    }

    function EndState() 
    {
    }

    function NotEngagedWanderFailed() 
    {
       if ( bot.Enemy != None )
       {
          GotoState( 'Attacking' );
       }
       else
       {
          // No enemy - retry the wander from the beginning.
          GotoState( 'Wander', 'BEGIN' );
       }
    }

    function OnBump( Actor other ) 
    {
        TryClearObstacle( other );
    }

    function OnHitWall( Actor other ) 
    {
        TryClearObstacle( other );
    }

    function OnHitMover( Actor other ) 
    {
        TryClearObstacle( other );
    }
BEGIN:
    // Trin - Massive rewrite here.
    // I added the default behavior of seeking toward invasion pathnodes.
    // In the situation where no more invasion pathnodes need to be reached
    //   the zombie will wander as usual, albeit with less standing around time.

    // Trin - This is a very important piece of code for Dedicated Server.
    // If the zombie is running a focused animation and the AI changes the state of the
    // pawn then the focused animation will not get an AnimEnd call. If that happens
    // the pawn will get stuck in the FocusedAnimation state. That causes all kinds of
    // havoc with the pawn.
    //
    // So we wait for any FocusedAnimations to complete.
    while (bot.pawn.GetStateName() == 'FocusedAnimation')
    {
      sleep(0.2);
    }

	while ( true )
   {
		// Are there invasion nodes?
		if ((InvasionPathNodes.length > 0) && (FRand() > WanderPercent))
		{
         // Attempt to follow an InvasionPath.

         // This sleep is very important for Dedicated Server. Without it the zombies enter wander state, 
         // find an invasion node, and immediately change the Pawn state with the move. That screws up the
         // pawn for further state changes.
         sleep(1.0);

         bot.Perform_MoveToLocation(InvasionPathNodes[0].Location, 128);

         WaitForNotification();
		}
      else
      {
		   Sleep( 1 );
		   
		   // look around randomly...
		   numLooks = RandRange( 1, 3 );
		   while ( numLooks > 0 ) 
         {
			   bot.SetRandomFocalPointLocation( 2000 );
			   --numLooks;
		   }
		   
		   // find a new place to stand around...
		   bot.Perform_NotEngaged_Wander();    
		   WaitForNotification();
      }
	}
}


state Seeking
{
    function BeginState() 
    {
      // entering this state implies there is something to seek
      // towards...
      if (LastSeekInstigator != None && LastSeekInstigator.IsA('LMZombiePlayerPawnBase'))
      {
         return;
      }
    }

    function EndState() 
    {
        // stop moving!
        bot.Perform_Error_Stop();
    }

    function OnBump( Actor other ) 
    {
        TryClearObstacle( other );
    }

    function OnHitWall( Actor other ) 
    {
        TryClearObstacle( other );
    }

    function OnHitMover( Actor other ) 
    {
        TryClearObstacle( other );
    }

	// Trin - Added this function to work on zombies failed move behavior.
	function MoveToLocationFailed() 
   {
      if (lastSeekInstigator != None)
      {
         moveTarget = lastSeekInstigator;
         global.MoveToLocationFailed();
      }
      else
      {
          GotoState( 'Wander' );
      }
	}

BEGIN:
    // move to SeekLocation...

    // Trin - This is a very important piece of code for Dedicated Server.
    // If the zombie is running a focused animation and the AI changes the state of the
    // pawn then the focused animation will not get an AnimEnd call. If that happens
    // the pawn will get stuck in the FocusedAnimation state. That causes all kinds of
    // havoc with the pawn.
    //
    // So we wait for any FocusedAnimations to complete.
    while (bot.pawn.GetStateName() == 'FocusedAnimation')
    {
      sleep(0.2);
    }

    bot.Perform_MoveToLocation( seekLocation, 128 );  
    
    WaitForNotification();

    //TODO: maybe we arrived at an eat point?  chow down!

    LastSeekInstigator = None;
    // if we didn't end up in the attack state already, go back to
    // wandering around until something new comes up to seek...

    GotoState( 'Wander' );
}

state Attacking
{
    function BeginState() 
    {
      if (bot.Enemy != None && bot.Enemy.IsA('DETrinZombiePawnBase'))
      {
         return;
      }

        bAttackVisibility=true;
        LastSeekInstigator = bot.enemy;
        bot.updateFocus( bot.enemy );
        bot.SetCombatTimer();
        
        // Trin - Set the initial AttackDirectChance randomly.
        AttackDirectChance = frand();
    }

    function EndState() 
    {
        bAttackVisibility=false;
        bot.SetTimer( 0, false );
    }

    function OnLostSight() 
    {
        bAttackVisibility=false;
        SetMultiTimer( START_REACQUIRE_TIMER, REACQUIRE_DELAY, false );
    }

    // Trin - Tried this and if failed. The global.OnRegainedSight was not called.
    function OnRegainedSight()
    {
       bAttackVisibility=true;
       SetMultiTimer( START_REACQUIRE_TIMER, 0, false );
    }

   function OnBump( Actor other ) 
   {
      local Pawn enemy;

      if ( bIgnoreBumps ) 
      {
         return;
      }

      enemy = Pawn( other );

      if (other.IsA('DETrinZombiePawnBase')) return;

      if ( enemy != none && enemy.IsHumanControlled() ) 
      {
         bIgnoreBumps = true;

         // should set it back again after some time...
         bot.WeaponFireAgain(bot.Pawn.Weapon.RefireRate(),false);
      }

      if (enemy == none)
      {
         TryClearObstacle(other);
      }
   }

    function OnThreatSpotted( Pawn threat ) 
    {
        local float threatDistance, enemyDistance;

        if (threat.IsA('DETrinZombiePawnBase'))
        {
           return;
        }

        if ( threat == bot.Enemy ) 
        {
            SetMultiTimer( START_REACQUIRE_TIMER, 0, false );
        }
        else 
        {
            // Don't switch targets too often.
            if (Level.timeSeconds - LastSwitchTargetTime < 1.5)
		         return;

            // Trin - Added this to switch targets more easily in Netplay.
            // Switch targets if new target is significantly closer.
            // OR
            // Just switch sometimes. Zombies are like that.
            if ( threat != bot.Enemy )
            {
                threatDistance = VSize(bot.Pawn.Location - threat.location);
                enemyDistance = VSize(bot.Pawn.Location - bot.enemy.location);

                if ((threatDistance <= (enemyDistance - 512) ) || ( Frand() < 0.35 ))
                {
                  LastSwitchTargetTime = Level.timeSeconds;
                  bot.AcquireEnemy(threat, true);
                  BeginState();
                }
            }
        }
    }

    function OnHeardNoise( float Loudness, Actor NoiseMaker) 
    {
        if ( NoiseMaker == bot.Enemy ) lastHeardEnemyTime = Level.timeSeconds;
    }

    function bool TrySeekTarget( Actor a ) 
    {
        return false;
    }

	// Trin - Added this function to work on zombies failed move behavior.
	function MoveToLocationFailed() 
   {
      if (bot != None)
      {
         if (bot.Enemy != None)
         {
		      moveTarget = bot.Enemy;
		      global.MoveToLocationFailed();
            return;
         }
      }

      GotoState( 'Wander' );
	}

   function MoveToLocationSucceeded() 
   {
	   super.MoveToLocationSucceeded();

	   // Check to see if an InvasionPathNode was reached.
	   InvasionPathNodeReached();

	   bLastMoveSucceeded = true;

      GotoState('Attacking', 'BEGIN');
   }

BEGIN:
    // Trin - This is a very important piece of code for Dedicated Server.
    // If the zombie is running a focused animation and the AI changes the state of the
    // pawn then the focused animation will not get an AnimEnd call. If that happens
    // the pawn will get stuck in the FocusedAnimation state. That causes all kinds of
    // havoc with the pawn.
    //
    // This happens most often with lying down zombies. They use focused animations to
    // 'rise up' and they also tend to rise up with players standing nearby, thus they
    // enter the Attack state very quickly. If they enter Attack state prior to the 
    // 'rise up' animation completion the AI will switch the role and cause the problem.
    //
    // So we wait for any FocusedAnimations to complete.
    while (bot.pawn.GetStateName() == 'FocusedAnimation')
    {
      sleep(0.2);
    }
      	
    while ( true ) 
	{
        if ( bVomiter && 
            (Level.TimeSeconds - LastVomitTime) > VomitDelay && 
            VSize(bot.enemy.location - bot.pawn.location) < VOMIT_RANGE)
        {
           // Vomit Attack
           bot.pawn.Weapon.CauseAltFire();
           LastVomitTime=Level.TimeSeconds;
        }
        else if ( (!bVomiter && VSize(bot.enemy.location - bot.pawn.location) < MELEE_RANGE ) || 
                   (bVomiter && (Level.TimeSeconds - LastVomitTime) < VomitDelay && 
                                (Level.TimeSeconds - LastVomitTime) > VomitDuration &&
                                VSize(bot.enemy.location - bot.pawn.location) < MELEE_RANGE ) )
        {
            // normal attack
            bIgnoreBumps = true;
            bot.Perform_MeleeAttack();
            WaitForNotification();
            bIgnoreBumps = false;
        }
        else 
        {
            // move to a spot in front of the enemy...

            // Trin - This is where the AttackDirectChance happens.  The chance is base 39%
            // to move directly toward the target.  59% chance to attack using pathing.  And 
            // 1% chance to recompute a new AttackDirectChance.
            // With each check the AttackDirectChance moves closer to the .4 breakpoint.  When
            // it reaches .4 a new AttackDirectChance is randomly computed.  In this way the
            // zombie will eventually try a new tactic to reach the target, but won't switch
            // tactics too often. 
			if (AttackDirectChance > (AttackDirectPercent-0.01) && AttackDirectChance < (AttackDirectPercent+0.01)) 
			{
				// Exact match on breakpoint.  Compute new.
				AttackDirectChance = frand();
			}

			if (bAttackVisibility && (AttackDirectChance < AttackDirectPercent))
			{
				// Trin - Sometimes we ignore better paths and just go straight for the target.
		      DETrinNoChargeZombieController(bot).Perform_MoveToLocationForced( bot.pawn.location + ( (bot.enemy.location - bot.pawn.location)*0.8 ), MELEE_RANGE);
				AttackDirectChance += 0.01;
			}
			else
			{
	         bot.Perform_MoveToLocation( bot.pawn.location + ( (bot.enemy.location - bot.pawn.location)*0.8 ), MELEE_RANGE );
				AttackDirectChance -= 0.01;
			}

            // wait a bit and then re-think this action, since moves can
            // take a really long time...
            if (iRunningMode < 1)
            {
               WaitForNotification( 2 );
            }
            else
            {
               // Recalculate a little more often for running zombies.
               WaitForNotification( 1 );
            }
        }

		//if you just killed enemy, eat 'im!
		//NOTE: should probably check range to the body here...
		if ( bot.Enemy.Health <= 0 ) 
      {
			EatTarget = bot.Enemy;
			GotoState( 'DoSpecial', 'EAT_STUFF' );
		}
		//FIXME: do we need this?
		Sleep( 0.3 );
	}
}

state DoSpecial
{
    function BeginState() 
    {
        EatingTime = Level.TimeSeconds;
    }

    function EndState()
    {
        bot.target = none;
        bot.Focus  = none;
        bot.updateFocus( None );
    }

    // Zombies are very single-minded, and ignore many inputs when
    // doing special stuff...

    function OnThreatSpotted( Pawn threat ) 
    {
      if (threat.IsA('DETrinZombiePawnBase'))
      {
         return;
      }

      if (Level.TimeSeconds - EatingTime > MAX_EAT_TIME)
      {
          super.OnThreatSpotted(threat);
      }
    }

    function OnHeardNoise( float Loudness, Actor NoiseMaker) 
    {
        if ( NoiseMaker == bot.Enemy ) lastHeardEnemyTime = Level.timeSeconds;
        if (Level.TimeSeconds - EatingTime > MAX_EAT_TIME){
            super.OnHeardNoise( Loudness, NoiseMaker);
        }
    }


BEGIN:
    // if you didn't pick a specific thing to do, we're done!
    Goto( 'DONE' );

SMASH_OBSTACLE:

    while (bot.pawn.GetStateName() == 'FocusedAnimation')
    {
      sleep(0.2);
    }

    // get into position...
    currentAttackPoint = currentObstacle.getAttackPoint( bot.pawn );

    if ( currentAttackPoint == None ) Goto( 'DONE' );

    bot.Perform_MoveToLocation( currentAttackPoint.getAttackLocation() );

    WaitForNotification(3);

    // face the right way...
    bot.Target = currentObstacle.getSmashActor();
    Bot.Focus = currentObstacle.getSmashActor();

    Sleep( 1 ); // wait for rotation

    // start attacking ...
    for ( numClearAttempts = 0; numClearAttempts < 5; ++numClearAttempts ) 
    {
        bot.Perform_MeleeAttack();      WaitForNotification();
        if ( currentObstacle.getAttackPoint(bot.pawn) == none ) break;
    }

    if ( currentObstacle.getAttackPoint(bot.pawn) != none ) 
    {
        // if the obstacle is still in place, smash it good!
        currentObstacle.doSmash( bot.pawn );
    }

    bot.target = none;
    bot.Focus  = none;
    goto( 'DONE' );

EAT_STUFF:
    while (bot.pawn.GetStateName() == 'FocusedAnimation')
    {
      sleep(0.2);
    }

    failedEatAttempts = 0;
    while ( failedEatAttempts < 5 ) {
        if ( EatTarget == none && bot.enemy.Health <= 0 ) {
            EatTarget = bot.enemy;
        }
        if ( EatTarget != none ) {
            distToEatTarget = VSize(EatTarget.location - bot.pawn.location);
            if ( distToEatTarget > MAX_EAT_DIST) {
                // zombies love to eat, so they run towards food.
                zombieBot.bForceRun = true;
                Sleep( RandRange( 0.1, 0.7 ) );
                bot.Perform_MoveToLocation( eatTarget.location, MAX_EAT_DIST );
                WaitForNotification( 1 );
                bot.Pawn.Velocity = vect( 0,0,0 );
                bot.Pawn.Acceleration = vect( 0,0,0 );
                zombieBot.bForceRun = false;
            }
            bot.target = eatTarget;
            bot.Focus  = eatTarget;
            if (VSize(EatTarget.location - bot.pawn.location ) <= MAX_EAT_DIST){
                DOTZAIController(bot).Perform_Eating();
            }
            else {
                // bail out if you're not getting any closer to the target...
                if ( distToEatTarget
                        - VSize(EatTarget.location - bot.Pawn.Location) < 128 ){
                    // a little hack to make the zombie walk away...
                    LastSeekInstigator = EatTarget;
                    SeekLocation
                        = Vect(0,0,1) * bot.Pawn.Location
                            + ( Vect(-1,-1,0)
                                * Normal(bot.Pawn.Location - eatTarget.location)
                                * RandRange(0.5, 1.5) * 512 );
                    goto( 'DONE' );
                }
                ++failedEatAttempts;
            }
            Sleep( 0.3 );
        }
        else goto( 'DONE' );
    }
    Goto( 'DONE' );

DONE:
    bot.Target = none;
    if ( bot.enemy != none ) GotoState( 'Attacking' );
    else if ( LastSeekInstigator != none ) GotoState( 'Seeking' );
    else GotoState( 'Wander' );
}


function init( VGSPAIController c ) 
{
    super.init( c );
    
    zombieBot = ZombieAIController( c );
    SetMultiTimer( DONT_BE_STUPID_TIMER, 6.0 + RandRange(0, 2.5), false );
}

function MultiTimer( int timerID ) 
{
    switch ( timerID ) {

    case START_REACQUIRE_TIMER:
        
		global.TrySeekTarget( bot.enemy );

      // Trin - Lost sight on target and did not require quickly enough.
      // Treat this as looking for the target all over again.
      bot.enemy = None;

		GotoState( 'Seeking' );
        break;

    case THINK_AGAIN_TIMER:
        // interrupt movement to allow bot a chance to reassess the situation.
        bot.MoveTimer = -1;
        break;

    case DONT_BE_STUPID_TIMER:
        DontBeStupid();
        break;

    default:
        super.MultiTimer( timerID );
    }
}

function DontBeStupid() 
{
    local Pawn player;
    if (Level.NetMode == NM_Standalone)
    {
       player = Level.GetLocalPlayerController().pawn;
       if ( player == none ) return;
       // ignore the player if he's too far up...
       if ( abs(player.location.z - bot.pawn.location.z) < 512 ) {
           // if the player IS the enemy, and you can attack, then get on it!
           if ( player == bot.Enemy && GetStateName() != 'Attacking'
                   &&  bot.actorReachable(bot.Enemy)) {
               GotoState( 'Attacking' );
           }
           // if the player isn't the enemy, but you can see and reach him, then
           // start attacking!
           if ( player != bot.Enemy
                   && bot.CanSee(player)
                   &&  bot.actorReachable(bot.Enemy))
           {
               bot.AcquireEnemy(player, true);
               GotoState( 'Attacking' );
           }
       }
       SetMultiTimer( DONT_BE_STUPID_TIMER, 4.0 + RandRange(0, 2.5), false );
   }
}


function bool InAttackRange(actor enemy)
{
   if(VSize(bot.pawn.location - enemy.location) < 150)
   {
      return true;
   } 
   else 
   {
      return false;
   }
}

function DisplayDebug( Canvas c, out float YL, out float YPos ) 
{
    super.DisplayDebug( c, YL, YPos );
    c.SetPos(4, YPos);
    C.DrawText( "LastSeekInstigator:" @ LastSeekInstigator
                    @ "SeekLocation:" @ SeekLocation );
    YPos += YL;
    C.SetPos(4,YPos);
}

function PreBeginPlay() 
{
    super.PreBeginPlay();
}


// Decompiled with UE Explorer.
defaultproperties
{
    AttackRange=150
    MinWanderDelay=2.0000000
    MaxWanderDelay=5.0000000
    LastSeekRefreshTime=-10.0000000
}