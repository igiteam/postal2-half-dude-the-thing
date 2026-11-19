/*****************************************************************
 * JackSlade -
 *
 * The mesh specification for the lead action figure
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    2004
 *****************************************************************
 */
class Otis extends HumanPawnBase
placeable;

/**
 */
function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
                        Vector momentum, class<DamageType> damageType) {
//    if ( JackSlade(instigatedBy) != none ) damage = 0;
    super.TakeDamage( damage, instigatedBy, hitlocation, momentum, damageType );
}


//===========================================================================
// default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    bUseNotifyFootStep=true
    RagdollLifeSpan=0.0000000
    FootStepVolume=0.5000000
    bCanCrouch=false
    GroundSpeed=460.0000000
    Health=200
    Mesh=SkeletalMesh'DOTZAHumans.Otis'
}