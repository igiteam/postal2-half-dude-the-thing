//=============================================================================
//  Military Stage
//  Military guys, like everyone else will require a certain controller in
//  order for the pawn to use them correctly.
//  Script by Gamefan74
//  February 18th, 2007
//=============================================================================
class MilitaryStage extends EntrenchStage;




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
                if ( !(MilitaryAIController(c) != None ) ) {            Log( "(" $ self $ ") assertion violated: (MilitaryAIController(c) != None )", 'DEBUG' );           assert( MilitaryAIController(c) != None  );        }//    ;
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

