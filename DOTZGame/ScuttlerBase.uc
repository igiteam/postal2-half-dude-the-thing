/**
 * ScuttlingZombie - base class for zombies that scuttle around on all fours.
 *
 * @version $Rev: 5551 $
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Aug 2004
 */
class ScuttlerBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;

/**
 * Hack out the bone-specific damage stuff, since these zombies need all of
 * their limbs to move, and switch animation sets.
 */

function BeginPlay() {
    local int ArmHackOffset;
 /*
    SwapAnimationSet( "DOTZACharacters.Scuttler" );
    // use regular walk anims...
    walks.length = 1;
    walks[0] = 'WalkF';
   */
    // now that we're suitably hacked up, let the parent do it's magic.
    Super.BeginPlay();

    // If all of this proves to complicated, just set
    //bUseSpecialDamage=false;

    MeleeAttacks.remove(7,1);
    MeleeAttacks.remove(0,6); //?
    //MeleeAttacks(7)=(MeleeAttackAnim=AttackBite,bFunctional=true);
   // MeleeAttacks.remove(1,1);

    //NOTE: Hack out the info for legs, so that this guy can always walk
    SpecialDamage.Remove( 6, 2 );

    //NOTE: randomly select an invincible arm, so that you can at least blow one
    //      off.
    ArmHackOffset = Rand( 2 );
    SpecialDamage.Remove( ArmHackOffset, 1 );
    SpecialDamage.Remove( 1 + ArmHackOffset, 1 );
}


/*****************************************************************
 * SpawmShadow
 *****************************************************************
 */
simulated function SpawnProjectorShadow(bool blob) {
    if ( fancyShadow == none ) {
        FancyShadow = Spawn(class'AdvancedShadowProjector', self, '', location);
        FancyShadow.ShadowActor        = self;
        FancyShadow.LightDirection     = Normal(vect(0,0,1));
        FancyShadow.LightDistance      = 380;
        FancyShadow.MaxTraceDistance   = 350;
        FancyShadow.bBlobShadow        = blob;
        FancyShadow.bShadowActive      = true;
        FancyShadow.bProjectStaticMesh = false;
        FancyShadow.bProjectParticles  = false;
        FancyShadow.InitShadow();
    }
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    AdditionalAnimPkg=/* Array type was not detected. */
    bAllowedToFall=false
    GroundSpeed=600.0000000
    WalkingPct=0.1700000
    BaseMovementRate=600.0000000
    CollisionHeight=40.0000000
}