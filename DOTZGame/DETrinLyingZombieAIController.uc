// Modifed for DE use, all credit goes to Trin.
// REVISED: 9-25-2008

class DETrinLyingZombieAIController extends DETrinNoChargeZombieController;

var LyingZombieAIRole myLyingRole;
var XDOTZPawnBase myDotzPawn;
var name LyingAwakenEvent; // Trigger name for lying down zombies to activate.
var float LyingAwarenessRange; // Awareness range for lying down zombies to activate.
var float LyingAwakenDelay; // Delay before waking up.

function SetLyingVars(name inLyingAwakenEvent, float inLyingAwarenessRange, float inLyingAwakenDelay)
{
   LyingAwakenEvent=inLyingAwakenEvent;
   LyingAwarenessRange=inLyingAwarenessRange;
   LyingAwakenDelay=inLyingAwakenDelay;
}

function InitAIRole() 
{
   local DETrinLyingZombieAIRole trinLyingRole;

   // LogMessage("DETrinLyingZombieAIController.InitAIRole Called");

   super.InitAIRole();
   myLyingRole = LyingZombieAIRole( myAIRole );
   myDotzPawn  = XDOTZPawnBase( pawn );

   trinLyingRole = DETrinLyingZombieAIRole(myAIRole);

   if (trinLyingRole != None)
   {
      trinLyingRole.AwarenessRange=LyingAwarenessRange;

      if (LyingAwakenEvent != 'None')
      {
         // Set up an event handler on the Role to handle the wake up.
         trinLyingRole.CurrentAwarenessRange=0;
         trinLyingRole.EventBindings.Insert(0,1);
         trinLyingRole.EventBindings[0].EventName=LyingAwakenEvent;
         trinLyingRole.EventBindings[0].HandledBy='AWAKEN_EVENT';
      }
      else
      {
         trinLyingRole.CurrentAwarenessRange=LyingAwarenessRange;
      }
   }
   // LogMessage("DETrinLyingZombieAIController.InitAIRole Ended");
}


//===========================================================================
// LieDown - lie there and do nothing.
//===========================================================================

/**
 */
function Perform_LieDown() {
    // LogMessage("DETrinLyingZombieAIController.Perform_LieDown Called");
    if ( myDotzPawn == None ) {
        Warn( pawn @ "cannot lie down" );
        return;
    }
    MoveTarget = None;
    Focus = None;
    // LogMessage("DETrinLyingZombieAIController.Perform_LieDown Calling MyDotzPawn.LieDown()");
    myDotzPawn.LieDown();
    // LogMessage("DETrinLyingZombieAIController.Perform_LieDown After MyDotzPawn.LieDown()");
    // LogMessage("DETrinLyingZombieAIController.Perform_LieDown GotoState LyingDown");
    GotoState( 'LyingDown' );
    // LogMessage("DETrinLyingZombieAIController.Perform_LieDown Ended");
}

/**
 */
state LyingDown {
    ignores DamageAttitudeTo, KilledBy, EnemyNotVisible;

    function BeginState() {
        curBehaviour = "Lie down";
    }
}


//===========================================================================
// GetUp -
//===========================================================================

/**
 */
function Perform_GetUp() {
    // LogMessage("DETrinLyingZombieAIController.Perform_GetUp Called");
    if ( myDotzPawn == None ) {
        Warn( pawn @ "cannot get up" );
        return;
    }
    myDotzPawn.GetUp();
    // LogMessage("DETrinLyingZombieAIController.Perform_GetUp GotoState blank");
    GotoState( '' );
    // LogMessage("DETrinLyingZombieAIController.Perform_GetUp Ended");
}

//===============================================================
// DefaultProperties
//===============================================================


// Decompiled with UE Explorer.
defaultproperties
{
    AIType=Class'DETrinLyingZombieAIRole'
}