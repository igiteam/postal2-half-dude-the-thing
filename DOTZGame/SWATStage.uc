//=============================================================================
//  SWAT Stage
//  Use this for when you want a SWAT guy to stay in that area for a time and
//  take out enemies. Note, this only works for pawns with a SWATAIController.
//  Script by Gamefan74
//  February 18th, 2007
//=============================================================================
class SWATStage extends EntrenchStage;




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
                if ( !(SWATAIController(c) != None ) ) {            Log( "(" $ self $ ") assertion violated: (SWATAIController(c) != None )", 'DEBUG' );           assert( SWATAIController(c) != None  );        }//    ;
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

