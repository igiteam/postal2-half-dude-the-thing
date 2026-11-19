/**
 * BursterZombie - base class for zombies that burst and infect.
 *
 * @version $Rev$
 * @author  Jesse LaChapelle (jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    July 2004
 */
class BursterBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;



// internal
var int iBurstDamageRadius;
var int iBurstDamageAmount;
var class<emitter> BurstEmitterClass;
var name AnimBurst;

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
 * Called externally to make the pawn burst.
 */
function DoBurst() {
    //don't do anything while playing focus or in the crawling pose.
    if ( IsAnimating(FOCUSCHANNEL) == true || bIsCrawling ) {
                    // Log( self @ "invalid attempt to burst" )    ;
        return;
    }
    AnimBlendParams( SPECIAL_FIRE_CHANNEL, 1,,, FIRINGBLENDBONE );
    AdvancedPlayAnim(AnimBurst, 1, 0.8, SPECIAL_FIRE_CHANNEL);
//    PlayAnim( AnimBurst, 1, 0.8, SPECIAL_FIRE_CHANNEL );
    Velocity     = Vect(0,0,0);
    Acceleration = Vect(0,0,0);
}

/**
 */
function AnimEnd( int channel ) {
    if ( channel == SPECIAL_FIRE_CHANNEL ) {
        AnimBlendToAlpha( SPECIAL_FIRE_CHANNEL, 0, 0.05 );
    }
    else super.AnimEnd( channel );
}

/**
 * Called from the anim at the pivotal moment!
 */
function Notify_BurstDamage(){
   //Log("BurstDamage");
   AttemptBurstDamage();
}

/*****************************************************************
 * AttemptBurstDamage
 *****************************************************************
 */
function AttemptBurstDamage(){

   local actor temp;

   //do damage to a radius (including yourself)
   Foreach CollidingActors(class'actor', temp,
                           iBurstDamageRadius, Location){
      if (FastTrace(Location, temp.Location)){
         temp.TakeDamage(iBurstDamageAmount, self,vect(0,0,0),
                         vect(0,0,0),class'DOTZInfectionDamage');
      }
   }
   Spawn(BurstEmitterClass,,,Location);
   self.Died( controller, class'DOTZInfectionDamage', location );
   bHidden = true;
}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    iBurstDamageRadius=650
    BurstEmitterClass=Class'BBParticles.BBPBurster'
    AnimBurst="AttackBurst"
    bInfectious=true
    AdditionalAnimPkg=/* Array type was not detected. */
}