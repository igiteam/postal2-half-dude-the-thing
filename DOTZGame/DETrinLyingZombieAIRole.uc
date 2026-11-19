// Modifed for DE use, all credit goes to Trin.
// REVISED: 9-25-2008

class DETrinLyingZombieAIRole extends DETrinZombieAIRole;

var() float AwarenessRange;
var() float CurrentAwarenessRange;

var bool bAwake;

var DETrinLyingZombieAIController myLyingController;

const AWAKEN_TIMER = 55;

event TriggerEx( Actor other, Pawn instigator, Name handler )
{
    switch ( handler )
	{
	case 'AWAKEN_EVENT':
        if (bAwake == false)
        {
            bAwake=true;
            if (myLyingController.LyingAwakenDelay > 0.0)
            {
                // Set up a timer to do the actual wakeup.
                // LogMessage("TriggerEx - Setting AWAKEN_TIMER");
                SetMultiTimer( AWAKEN_TIMER, myLyingController.LyingAwakenDelay, false );
            }
            else
            {
                // Set the zombie to have its supplied AwarenessRange now and wake it up.
                // LogMessage("TriggerEx - Calling TryWakeUp(self)");
                CurrentAwarenessRange=AwarenessRange;
                TryWakeUp(self);
            }
        }
        break;

    default:
        break;
    }
}

function MultiTimer( int timerID ) {
    switch ( timerID ) {

    case AWAKEN_TIMER:
        // Set the zombie to have its supplied AwarenessRange now and wake it up.
        // LogMessage("MultiTimer - AWAKEN_TIMER called");
        CurrentAwarenessRange=AwarenessRange;
        TryWakeUp(self);

        SetMultiTimer( AWAKEN_TIMER, 0, false);
        break;

    default:
        super.MultiTimer( timerID );
    }
}

function init(VGSPAIController c) {
    // LogMessage("DETrinLyingZombieAIRole.init Called");
    super.init( c );
    myLyingController = DETrinLyingZombieAIController( c );
    // LogMessage("DETrinLyingZombieAIRole.init Ended");
}

auto state LyingDown {

    function OnHeardNoise( float loudness, Actor noiseMaker ) {
        TryWakeUp( noiseMaker );
    }

    function OnThreatHeard( Pawn threat ) {
                    // Log( self @ "ignoring OnThreatHeard"  )    ;
    }

    function OnThreatSpotted( Pawn threat ) {
        TryWakeUp( threat );
    }

    /**
     */
    function BeginState(){
       // LogMessage("State LyingDown BeginState Called");
    }

    function EndState(){
        // LogMessage("State LyingDown EndState Called");
    }

BEGIN:
    // LogMessage("State LyingDown BEGIN - Calling controller.Perform_LieDown.");
    myLyingController.Perform_LieDown();
    // LogMessage("State LyingDown BEGIN - After Perform_LieDown.");
    // sit in this state until TryWakeup succeeds.
}

function TryWakeup( Actor a ) 
{
    if ( VSize(a.location - bot.pawn.location) < CurrentAwarenessRange ) 
    {
        // LogMessage("TryWakeup inside location check. Calling controller.perform_getup.");
        myLyingController.Perform_GetUp();
        // LogMessage("TryWakeup inside location check. After perform_getup. Gotostate wander.");
        GotoState( 'Wander' );
        // LogMessage("TryWakeup inside location check. Ending.");
    }
}


//===========================================================================
// Default Properties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    AwarenessRange=350.0000000
}