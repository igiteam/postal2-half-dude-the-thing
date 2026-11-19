//=============================================================================
//  Cop Stage
//  This is the cop stage. This is pretty much like the other stages only the
//  pawns have to have a CopAIController in order for this to work.
//  Script by Gamefan74
//  February 18th, 2007
//=============================================================================
class CopStage extends EntrenchStage;




//===========================================================================
// Internal data
//===========================================================================

// used to draw zombies into the action...
var Attractor myZombieAttractor;


//===========================================================================
// DEBAIT hooks
//===========================================================================

/**
 */
function joinStage( VGSPAIController c ) {
    warn( c @ "JOINING" @ self );
                if ( !(CopAIController(c) != None ) ) {            Log( "(" $ self $ ") assertion violated: (CopAIController(c) != None )", 'DEBUG' );           assert( CopAIController(c) != None  );        }//    ;
    super.joinStage( c );
    if ( myZombieAttractor == None ) {
        myZombieAttractor
            = Spawn(class'Attractor',,, stagePositions[0].location);
            //  = Spawn(class'CarAlarm',,, stagePositions[0].location);
    }
    myZombieAttractor.loudness = 1;
    myZombieAttractor.activate( c.Pawn );
    GotoState( 'Engaged');
}

function leaveStage( VGSPAIController c, EReason r ) {
    super.leaveStage( c, r );
    myZombieAttractor.deactivate();
}


auto state Init {

    /**
     * make sure to call initStage()!
     */
    function BeginState() {
        initStage();
    }

BEGIN:

}

