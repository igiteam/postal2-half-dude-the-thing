/**
 * ScreamerZombie - base class for zombies that scream and attract more zombies.
 *
 * @version $Rev: 5123 $
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    July 2004
 */
class ScreamerBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;



var() Name AnimStartScream;
var() Name AnimContinueScream;
var() Sound StartScreamSound;
var() sound ContinueScreamSound;
var() sound EndScreamSound;

var protected name PreviousState;
var protected bool bContinueScream;


/**
 * Hack out some of the bone-specific damage stuff, so that it doesn't
 * interfere with the screaming stuff.
 */
function BeginPlay() {
    Super.BeginPlay();
    SpecialDamage.Remove( 6, 2 );
}

/**
 * Called externally to make the pawn scream.
 */
function StartScream() {
    //TODO: Pawn magic for the screaming... anim + sound?
                // Log( self @ "SCREAMING!!!!"  )    ;
    SetBoredomTimer(false);
    Velocity        = vect(0,0,0);
    Acceleration    = vect(0,0,0);
    PreviousState   = GetStateName();
    bContinueScream = true;
    if ( PreviousState == 'Screaming' ) PreviousState = '';
    GotoState( 'Screaming' );
    AnimBlendParams(FOCUSCHANNEL,1); // take over the channel
    PlayAnim( AnimStartScream, 1, 0, FOCUSCHANNEL );
    PlaySound( StartScreamSound, SLOT_Interact, 1.0, false );
}

/**
 */
function StopScream() {
                // Log( self @ "Not screaming"  )    ;
    // set the flag, and the scream will end once the animation is complete...
    bContinueScream = false;
}

/**
 */
function EndScreamAudio() {
                // Log( self @ "Ending scream sound"  )    ;
    AmbientSound = none;
    PlaySound( EndScreamSound, SLOT_Interact, 1, false );
}


function FallDownAnimEnd(){
    super.FallDownAnimEnd();
    if ( bContinueScream ) StartScream();
}

function Destroyed() {
    EndScreamAudio();
    super.Destroyed();
}

/**
 * Handle animation while screaming...
 */
state Screaming {

    /**
     */
    function EndState() {
        EndScreamAudio();
        // release the focus channel...
        AnimBlendToAlpha(FOCUSCHANNEL, 0, 0.1);
    }

    /**
     * Keep playing the continue anim until
     */
    simulated event AnimEnd(int Channel) {
        if (Channel == FOCUSCHANNEL) {
            if ( bContinueScream ) {
                AnimBlendToAlpha(FOCUSCHANNEL, 0, 0.1);
                AnimBlendParams(FOCUSCHANNEL,1);
                PlayAnim( AnimContinueScream, 1, 0, FOCUSCHANNEL );
               // PlaySound( ContinueScreamSound, SLOT_Interact, 1.0, false );
                AmbientSound = ContinueScreamSound;
            }
            else {
                GotoState( PreviousState );
                AnimBlendToAlpha(FOCUSCHANNEL, 0, 0.1);
            }
        }
        else {
            super.AnimEnd(Channel);
        }
    }

    /**
     * Bored anims strictly prohibited.
     */
    function MultiTimer( int timerID ) {
        if ( timerID == BORED_TIMER ) return;
        else super.MultiTimer( timerID );
    }

}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    AnimStartScream="AttackScreamerIn"
    AnimContinueScream="AttackScreamerLoop"
    StartScreamSound=Sound'DOTZXCharacters.ZombieActivateSounds.ActiveMaleScreamerIn'
    ContinueScreamSound=Sound'DOTZXCharacters.ZombieActivateSounds.ActiveMaleScreamerLoop'
    EndScreamSound=Sound'DOTZXCharacters.ZombieActivateSounds.ActiveMaleScreamerOut'
    AdditionalAnimPkg=/* Array type was not detected. */
    TransientSoundRadius=300.0000000
}