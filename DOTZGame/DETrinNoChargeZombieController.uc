// Modifed for DE use, all credit goes to Trin.
// REVISED: 9-25-2008

class DETrinNoChargeZombieController extends DENoChargeZombieController;

var float WanderPercent; // % change (0.0 - 1.0) that zombies will wander between invasion path seeks.

var int iRunningMode; // Running zombie mode. 0=Never, 1=Run in attack state, 2=Run always
var bool bUseAlternateAttackSystem; // Use the BD/Trin alternate attack system of grab/bite.
var float AttackDirectPercent; // % chance (0.0 - 1.0) that the zombies will attack directly instead of using pathnodes.
var float fAttackDelay; // Time spent between attacks.

// Internal use.
var array<PathNode> InvasionPathNodes; // list of actual PathNode objects that pair up with the names entered by the map creator.

// Rewritten adjust around to move further and to limit the number of
// successive move attempts within a given time period.
var float LastAdjustAroundTime;
var int iLastAdjustAroundBackwards;

// Used to force a zombie to move even though the pathing isn't there.
var bool bMoveForced;

// Various variables to help movement code.
var Vector PerformMoveStuckLocation;
var float PerformMoveStuckTime;
var float LastFailedMoveTime;

// This code was added for LastManIN to keep the zombies from attacking player zombies.
//function bool SameTeamAs(Controller C)
//{
//   if (c == None)
//      return false;
//
//   if (ZombieAIController(c) != None)
//      return true;
//
//   if (c.Pawn != None)
//   {
//      if(c.Pawn.IsA('LMZombiePlayerPawnBase'))
//      {
//         return true;
//      }
//   }
//
//   return false;
//}

// This fixes the problem where multiple spawn animations on the server do not work 
// correctly on the client.
//function configure( OpponentFactory f, Stage initialStage )
//{
//    local int i;
//
//    bConfigured = true;
//    super(VGSPAIController).configure( f, initialStage );
//
//    if (Pawn != None)
//    {
//       if (bVomiter)
//       {
//         Pawn.GiveWeapon ( VomitWeaponType );
//       }
//       else
//       {
//         Pawn.GiveWeapon( DefaultWeaponType );
//       }
//
//       // Instead of assigning all the spawn animations to a zombie this only assigns
//       // one.
//       if (AdvancedPawn(Pawn) != none &&
//           ZombieFactory(f) != none &&
//           ZombieFactory(f).xSpawnAnims.length > 0)
//       {
//          // Get an index into the zombie factory spawn anims.
//          i=Frand() * ZombieFactory(f).xSpawnAnims.Length;
//
//         AdvancedPawn(Pawn).AnimSpawn[0] = ZombieFactory(f).xSpawnAnims[i].Animation;
//          AdvancedPawn(Pawn).AddAnimationPackage(ZombieFactory(f).xSpawnAnims[i].Package);
//
//          TrinV2ZombiePawnBase(Pawn).SpawnAnimationSet=ZombieFactory(f).xSpawnAnims[i].Package;
//
//          AdvancedPawn(Pawn).PlaySpawnAnim();
//       }
//    }
//}

// Used to propogate the Invasion Paths from the zombie factory.
function SetRoleInvasionPathNodes(array<PathNode> inInvasionPathNodes, float inWanderPercent) 
{
   local int i;

   WanderPercent = inWanderPercent;

   // Set up the InvasionPathNodes on the controller.
   for (i=0;i<inInvasionPathNodes.length;i++)
   {
      if (inInvasionPathNodes[i] != None)
      {
         InvasionPathNodes[i] = inInvasionPathNodes[i];
      }
   }
}

// Used to propogate the Invasion Paths to the AI Role.
function InitAIRole() 
{
   local DETrinZombieAIRole trinRole;
   local int i;

   super(VGSPAIController).InitAIRole();

   trinRole = DETrinZombieAIRole(myAIRole);

   if (trinRole != None)
   {
      // Set up the InvasionPathNodes on the role.
      //for (i=0;i<ArrayCount(InvasionPathNodes)-1;i++)
      for (i=0;i<InvasionPathNodes.length;i++)
      {
         if (InvasionPathNodes[i] != None)
         {
            trinRole.InvasionPathNodes[i] = InvasionPathNodes[i];
         }
      }

      // Set the various parameters to the Role.
      trinRole.WanderPercent = WanderPercent;
      trinRole.iRunningMode = iRunningMode;
      trinRole.bUseAlternateAttackSystem=bUseAlternateAttackSystem;
      trinRole.AttackDirectPercent=AttackDirectPercent;
   }
}

// Rewrote the movement code to allow a forced move where the pathing does not exist.
function Perform_MoveToLocationForced( vector location, optional float slop ) 
{
   moveDestination = location;
   moveSlop = slop;
   bMoveForced = true;
   PerformMoveStuckLocation = pawn.Location;
   PerformMoveStuckTime = Level.TimeSeconds;
   GotoState( 'MoveToLocation' );
}

function Perform_MoveToLocation( vector location, optional float slop) 
{
   bMoveForced=false;
   moveDestination = location;
   moveSlop = slop;
   PerformMoveStuckLocation = pawn.Location;
   PerformMoveStuckTime = Level.TimeSeconds;
   GotoState( 'MoveToLocation' );
}

function Continue_MoveToLocation() 
{
   if ( VSize(pawn.location - moveDestination) < pawn.CollisionRadius + 8 + moveSlop ) 
   {
        // reached destination...
        GotoState( 'MoveToLocation', 'DONE' );
        myAIRole.MoveToLocationSucceeded();
        return;
    }
    else
    {
      if (Level.TimeSeconds - PerformMoveStuckTime > 5)
      {
         if (VSize(pawn.Location - PerformMoveStuckLocation) < 128)
         {
            // Haven't actually moved in some time.  Try to break out of being stuck.

            // Let the AIRole respond to events and try something different.
            GotoState ( 'MoveToLocation', 'DONE');
            MyAIRole.MoveToLocationSucceeded();
         }
         else
         {
            // We're in a different spot than the last check.  Reset location and timing and go on.
            PerformMoveStuckTime = Level.TimeSeconds;
            PerformMoveStuckLocation = pawn.Location;
         }
      }

      GotoState( 'MoveToLocation', 'MOVE' );
    }
}

state MoveToLocation 
{
   function BeginState()
   {
   }

   function EndState() 
   {
      bMoveForced=false;
   }

BEGIN:
    curBehaviour = "MoveToLocation";
MOVE:
    // Removed the FinishRotation() call to make them stop spinning before attacking.
    //FinishRotation();
    if ( pointReachable(moveDestination) ) 
    {
        FocalPoint = moveDestination;
        moveTo( moveDestination,, ShouldWalk() );
    }
    else
    {
      if (bMoveForced == true)
      {
         FocalPoint = moveDestination;
         moveTo( moveDestination,, ShouldWalk() );
      }
      else 
      {
         moveTarget = FindPathTo( moveDestination );
         if ( moveTarget == none ) 
         {
            // Added in the FinishRotation() here to keep failed moves from resulting 
            // in an infinite loop!!
            FinishRotation();

            if (myAIRole != none)
            {
               myAIRole.MoveToLocationFailed();
            }
            Goto( 'DONE' );
         }
         if (MoveTarget !=None)
         {
            // if we didn't hit the Goto, moveTarget should be okay now...
            FocalPoint = moveTarget.location;
            moveToward( moveTarget,,,ShouldStrafe(), ShouldWalk() );
         }
      }
   }
    Sleep( RandRange(0.1, 0.3) );
    Continue_MoveToLocation();

DONE:
    curBehaviour      = "DoneMovingToLocation";
    Pawn.Acceleration = vect(0,0,0);
    Pawn.Velocity     = vect(0,0,0);
}

// Rewrote this to allow a trimmer and more effective wander behavior.
function Perform_NotEngaged_Wander()
{
    local int i;
    local PathNode pn;
    local array<PathNode> pna;

    curBehaviour = "Wander";
    wanderDestination = None;

    i=0;

	 foreach RadiusActors( class 'PathNode', PN, 2048, Location)
	 {
       // Build an array of all the possible PathNodes to choose from.
       pna[i] = pn;
       i++;
    }

    wanderDestination=pna[frand() * pna.Length];

    ContinueWander();
}

// Rewrote this to keep the zombies from creating a log jam when they're trying to do 
// things like go through doors and such.
function bool AdjustAround(Pawn Other)
{
   local rotator rot;

   // Don't do this routine too often.
   if (Level.TimeSeconds - LastAdjustAroundTime < 2)
   {
      return false;
   }

   // Make sure Other is a friend.
   if( SameTeamAs(Other.Controller) )
   {
      // Found another zombie.

      //   //B is in relation to A
      //      actor A, B;
      //      vector aFacing,aToB;
      //
      //      // What direction is A facing in?
      //      aFacing=Normal(Vector(A.Rotation));
      //      // Get the vector from A to B
      //      aToB=B.Location-A.Location;
      // 
      //      orientation = aFacing dot aToB;
      //        // > 0.0  B is in front of A
      //        // = 0.0  B is exactly to the right/left of A 
      //        // < 0.0  B is behind A


      // Determine if the other zombie is in front of me.
      if ( (Normal(Vector(Pawn.Rotation)) dot (Other.Location - Pawn.Location) ) > 0 )
      {
         // Other zombie is in front of me.  I'll try to move around.

         // // AB left/right
         // local vector lateral;
         //
         // // Get facing vector
         // lateral=vector(B.Controller.GetViewRotation());
         // // Rotate 90 degrees in XZ, I'm going to assume (probably wrongly) that this lateral vector will point to the left of the facing, but it COULD be facing to the right
         // // in which case the answers below are the wrong way round...
         // lateral=lateral cross vect(0,0,1);
         // 
         // orientation = lateral dot Normal(A.Location - B.Location);
         //   // > 0.0  A sits to the left of B
         //   // = 0.0  A is in front of/behind B (exactly 90? between A and B)
         //   // < 0.0  A sits to the right of B

         // Get my view rotation.
         rot = Pawn.GetViewRotation();

         //if (FRand() > 0.90)
         if (iLastAdjustAroundBackwards++ == 50)
            {
                // Move backwards instead of sideways.
                rot.Yaw += 32768;
                iLastAdjustAroundBackwards=0;
            }
            else
            {
             // Determine if other zombie is left or right.
             if (  ( (vector(Other.GetViewRotation()) cross vect(0,0,1)) dot Normal(Other.Location - Pawn.Location) ) > 0)
             {
                // Now turn right.
                rot.Yaw -= 16384;
             }
             else
             {
                // Other zombie is to the right or exactly in front.
                // Now turn left
                rot.Yaw += 16384;
             }
            }

         // Set Adjusting to true to notify movement routines.
         bAdjusting = true;

         // Set a new move destination based on the new rotation and the size of the zombie collision radius.
         AdjustLoc = Pawn.Location + vector(rot) * Other.CollisionRadius * 4;
      }
      else
      {
         // Other zombie beside or behind me.  Should never happen?
      }
   }

   return true;
}

event SeePlayer( Pawn Seen )
{
    if ( Enemy == Seen ) 
    {
      myAIRole.OnRegainedSight();
      UpdateEnemyInfo();
    }
    else TrySpotEnemy(Seen, true);
}

function UpdateEnemyInfo()
{
    // Enemy was not previously visible, update lastseen visibility info
    if (EnemyInSightTime == -1) 
    {
        EnemyInSightTime = Level.TimeSeconds;
        // check if we're re-sighting the same enemy from earlier...
        if ( VisibleEnemy == Enemy && TimeElapsed(LastSeenTime, 1.0) ) 
        {
            myAIRole.OnRegainedSight();
            if( currentStage != none
                    && currentStage.Request_PercentEyeSighted(self) == 0 ) {
                exclaimMgr.Exclaim(EET_NoticeEnemy, 0);
            }
        }
        //only need to update the stage if we were actually unsighted until now
        if (currentStage != None) {
            currentStage.Report_EyeSighted(self, Enemy);
        }
    }

    // freshen visibility stats...
    LastSeenTime         = Level.TimeSeconds;
    bEnemyInfoValid      = true;
    VisibleEnemy         = Enemy;
    bEnemyIsVisibleCache = true;
    EnemyVisibilityCacheTime = Level.TimeSeconds;
}

function bool shouldWalk() 
{
   local AdvancedPawn ap;

   ap = AdvancedPawn( Pawn );

   // make sure crawlers don't try to force through a run...
   if ( ap != none && ap.bIsCrawling ) 
      return true;

   switch ( iRunningMode ) 
   {
      case 0:
         return true;
         break;
      case 1:
         return (Enemy==none);
         break;
      case 2:
         return false;
         break;
      default:
         return true;
         break;
   }

   return true;
}

state MeleeAttack 
{
BEGIN:
   curBehaviour = "MeleeAttack";
   if ( Enemy != none ) 
   {
      updateFocus( Enemy, true );
   }
   
   FinishRotation();
   
   Pawn.Acceleration = vect(0,0,0);
   Pawn.Velocity     = vect(0,0,0);
   
   WeaponFireAgain(Pawn.Weapon.RefireRate(),false);
   
   // Sync up with completion of the attack animation...
   //FinishAnim();

   //sleep( 2 + FRand() * 1 );

   sleep( fAttackDelay + FRand() * 1 );
   
   //TODO: if we had feedback from the weapon about hit/miss, the role callback
   //      would be more meaningful...
   myAiRole.MeleeAttackSucceeded();
   curBehaviour = "MeleeAttack-done";
}


// Decompiled with UE Explorer.
defaultproperties
{
    WanderPercent=0.0100000
    bUseAlternateAttackSystem=true
    AttackDirectPercent=0.9900000
    fAttackDelay=0.8500000
}