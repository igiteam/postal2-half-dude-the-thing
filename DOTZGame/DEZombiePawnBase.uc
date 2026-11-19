//================================================================
// Dead Epidemic Zombie Pawn Base
//
// This is the pawn base for ALL zombies in Dead Epidemic. This
// changes health, speed, and other features.
//
// 5/17/2008
//================================================================

class DEZombiePawnBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;

state FocusedAnimation
{
    ignores AdvancedPlayAnim,PlayFocusedAnimation,Fire,PlayFiring,PlayMoving,PlayJump,PlayHit;

    function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation,vector momentum, class<DamageType> damageType)
    {
         global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
    }
}


//===========================================================================
// Default Properties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    Walks=/* Array type was not detected. */
    AdditionalAnimPkg=/* Array type was not detected. */
    SplutEmitter=Class'DEParticles.DEZombieExplosion'
    SpecialDamage=/* Array type was not detected. */
    bCanCrouch=true
    bCanStrafe=true
    GroundSpeed=450.0000000
    JumpZ=384.0000000
    Health=500
    BaseMovementRate=450.0000000
}