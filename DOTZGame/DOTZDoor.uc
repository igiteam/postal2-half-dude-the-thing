/**
 * DOTZDoor - All the DOTZAI specific stuff is in here.
 *
 * @version $Revision: 1.70 $
 * @author  Jesse (jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 */
class DOTZDoor extends DestructableMover
   Implements( Smashable );


//===========================================================================
// Configurable
//===========================================================================
var() bool bTakesDamageFromZombies;
var() bool bShowAttackPoint;
var() vector FrontAttackLocation;
var() vector RearAttackLocation;



//===========================================================================
// Internal
//===========================================================================
var AttackPoint FrontAttackPoint;
var AttackPoint RearAttackPoint;


//===========================================================================
// Smashable interface
//===========================================================================

/**
 */
function AttackPoint getAttackPoint( Actor attacker ) {
    //FIXME: does this ensure front=+x, rear=-x?  Maybe use closest attack pt.
    if ( isInFront(attacker) ) {
        if ( FrontAttackPoint != None && FrontAttackPoint.bEnabled ) {
            return FrontAttackPoint;
        }
    }
    else {
        if ( RearAttackPoint != None && RearAttackPoint.bEnabled ) {
            return RearAttackPoint;
        }
    }
    // no valid attack point available...
    return None;
}

/**
 */
function Actor getSmashActor() {
    return self;
}

/**
 */
function bool DoSmash( Pawn instigator ) {
    if (DamageCapacity > 0){
        TakeDamage( 100, instigator, location, vect(0,0,0), class'SmashDamage' );
    }
    return (DamageCapacity <= 0);
}


//===========================================================================
//===========================================================================

/*****************************************************************
 * PostBeginPlay
 * Drop an attactpoint so the bots will know what they can break
 *****************************************************************
 */
function PostBeginPlay(){
   BecomeAttractive();
   Super.PostBeginPlay();
}


/*****************************************************************
 * BecomeAttractive
 * Sorry Neil, this won't help you!
 *****************************************************************
 */
function BecomeAttractive(){
    local vector adjustment;

    if (bTakesDamageFromZombies == true) {
        // Spawn attack points as needed...
        if (FrontAttackPoint == None) {
            // set up front attack point...
            adjustment = (FrontAttackLocation >> rotation) + location;
            FrontAttackPoint = Spawn(class'FrontAttackPoint',,,adjustment);
        }
        if (RearAttackPoint == None) {
            // set up rear attack point...
            adjustment = (RearAttackLocation >> rotation) + location;
            RearAttackPoint = Spawn(class'RearAttackPoint',,,adjustment);
        }
        // Enable attack points...
        if (FrontAttackPoint != None) {
            FrontAttackPoint.EnableMe();
            FrontAttackPoint.bHidden = !bShowAttackPoint;
        }
        if (RearAttackPoint != None) {
            RearAttackPoint.EnableMe();
            RearAttackPoint.bHidden = !bShowAttackPoint;
        }
    }
}

/*****************************************************************
 * DisableAttraction
 *****************************************************************
 */
function DisableAttraction(){
    if (FrontAttackPoint != None) {
        FrontAttackPoint.DisableMe();
    }
    if (RearAttackPoint != None ) {
        RearAttackPoint.DisableMe();
    }
}

/*****************************************************************
 * Open
 *****************************************************************
 */
function Open(){
   Super.Open();
   DisableAttraction();
   if (Activator != None){
      Activator.MakeNoise(0.3);
   }
}


/*****************************************************************
 * Close
 *****************************************************************
 */
function Close(){
   Super.Close();
   BecomeAttractive();
   if (Activator != None){
      Activator.MakeNoise(0.3);
   }
}


/*****************************************************************
 * BlowUp
 *****************************************************************
 */
function BlowUp(){
   Super.BlowUp();
   DisableAttraction();
}



//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    bTakesDamageFromZombies=true
    FrontAttackLocation=(X=100.0000000,Y=-50.0000000,Z=78.0000000)
    RearAttackLocation=(X=-100.0000000,Y=-50.0000000,Z=78.0000000)
    DestructionSound=/* Array type was not detected. */
    CollisionRadius=60.0000000
    CollisionHeight=100.0000000
}