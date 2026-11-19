/**
 * VomitterZombie - base class for zombies that vomit and infect.
 *
 * @version $Rev$
 * @author  Jesse LaChapelle (jesse@digitalextremes.com)
 * @date    July 2004
 */
class VomiterBase extends ZombiePawnBase
abstract;



var int iVomitDistance;
var int iVomitDamageRadius;
var int iVomitDamageAmount;
var class<emitter> VomitEmitterClass;
var name VomitBone;
var float VomitTime;
var float RunningTotal;
var float VomitFreq;
var name AnimVomit;
var bool bVomiting;

//var() bool ConstantVomit;

const VOMIT_ID = 22;
const DEBUG_VOMIT = 23;


/*****************************************************************
 *
 *****************************************************************
 */
function Melee_Attack(){
   if ( IsAnimating(SPECIAL_FIRE_CHANNEL) == False) {
      super.Melee_Attack();
   }
}

function Notify_MeleeDamage(){
  if ( IsAnimating(SPECIAL_FIRE_CHANNEL) == False) {
      super.Notify_MeleeDamage();
   }
}

/**
 * Called externally to make the pawn vomit-attack.
 */
function DoVomit() {
    //don't do anything while playing focus or in the crawling pose.
    if ( IsAnimating(FOCUSCHANNEL) == true || bIsCrawling ) {
                    // Log( self @ "invalid attempt to vomit" )    ;
        return;
    }
    AnimBlendParams( SPECIAL_FIRE_CHANNEL, 1,,, FIRINGBLENDBONE );
    AdvancedPlayAnim(AnimVomit, 1, 0.8, SPECIAL_FIRE_CHANNEL);
    //PlayAnim( AnimVomit, 1, 0.8, SPECIAL_FIRE_CHANNEL );
}

/**
 */
function AnimEnd( int channel ) {
    if ( channel == SPECIAL_FIRE_CHANNEL ) {
        AnimBlendToAlpha( SPECIAL_FIRE_CHANNEL, 0, 0.05 );
    }
    else super.AnimEnd( channel );
}

/*****************************************************************
 * PostBeginPlay
 *****************************************************************
 */
function PostBeginPlay(){
    super.PostBeginPlay();
//    if (ConstantVomit == true){
  //      SetMultiTimer(DEBUG_VOMIT, 4, true);
//    }
}

/*****************************************************************
 * MakeVomit
 * Emittery stuff
 *****************************************************************
 */
/* //done on the animation now!!!!
function MakeVomit() {
    local actor temp;
    temp = Spawn(VomitEmitterClass);
    temp.bHardAttach = false;
    AttachToBone(temp, 'Jaw');
}
*/

/*****************************************************************
 * Notify_MeleeDamage
 *****************************************************************
 */
function Notify_VomitDamage() {
    //Log("VomitDamage");
    AttemptVomitDamage();
    //MakeVomit();
    SetMultiTimer(VOMIT_ID, VomitFreq, true);
}

/*****************************************************************
 * MultiTimer
 *****************************************************************
 */
function MultiTimer(int ID) {

   if (ID == VOMIT_ID){
      AttemptVomitDamage();
   } else if (ID == DEBUG_VOMIT){
      //MakeVomit();
   } else {
      Super.MultiTimer(ID);
   }

   //check to shut off the damage part
   RunningTotal += VomitFreq;
   if (RunningTotal >= VomitTime){
      SetMultiTimer(VOMIT_ID,0,false);
      RunningTotal = 0;
   }
}

/*****************************************************************
 * AttemptBurstDamage
 *****************************************************************
 */
function AttemptVomitDamage() {
   local actor temp;
   local vector DamageLocation;
   //do damage to a radius (including yourself)
   DamageLocation = Location + (Normal(vector(Rotation))* iVomitDistance);
   Foreach CollidingActors(class'actor', temp,
                           iVomitDamageRadius, Location){
      if (temp != self){
         if (FastTrace(Location, temp.Location)){
            temp.TakeDamage(iVomitDamageAmount, self,vect(0,0,0),
                         vect(0,0,0),class'DOTZInfectionDamage' );
         }
      }
   }
}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    iVomitDistance=200
    iVomitDamageRadius=300
    VomitEmitterClass=Class'BBParticles.BBPZombieVomit'
    VomitBone="Jaw"
    VomitTime=3.0000000
    VomitFreq=0.5000000
    AnimVomit="AttackVomit"
    bInfectious=true
    AdditionalAnimPkg=/* Array type was not detected. */
}