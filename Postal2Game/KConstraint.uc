//=============================================================================
// The Basic constraint class.
//=============================================================================

class KConstraint extends KActor
    abstract
	placeable
	native;

#exec Texture Import File=Textures\S_KConstraint.pcx Name=S_KConstraint Mips=Off MASKED=1

// Used internally for Karma stuff - DO NOT CHANGE!
var transient const int KConstraintData;

// Actors joined effected by this constraint (could be NULL for 'World')
var(KarmaConstraint) edfindable Actor KConstraintActor1;
var(KarmaConstraint) edfindable Actor KConstraintActor2;

// Disable collision between joined
var(KarmaConstraint) const bool bKDisableCollision;


// Constraint position/orientation, as defined in each body's local reference frame
// These are in KARMA scale!

// Body1 ref frame
var vector KPos1;
var vector KPriAxis1;
var vector KSecAxis1;

// Body2 ref frame
var vector KPos2;
var vector KPriAxis2;
var vector KSecAxis2;

// Force constraint to re-calculate its position/axis in local ref frames
// Usually true for constraints saved out of UnrealEd, false for everything else
var const bool bKForceFrameUpdate;

// [see KForceExceed below]
var(KarmaConstraint) float KForceThreshold;


// This function is used to re-sync constraint parameters (eg. stiffness) with Karma.
// Call when you change a parameter to get it to actually take effect.
native function KUpdateConstraintParams();

native final function KGetConstraintForce(out vector Force);
native final function KGetConstraintTorque(out vector Torque);

// Event triggered when magnitude of constraint (linear) force exceeds KForceThreshold
event KForceExceed(float forceMag);


// Decompiled with UE Explorer.
defaultproperties
{
    bKDisableCollision=true
    KPriAxis1=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    KSecAxis1=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    KPriAxis2=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    KSecAxis2=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    bHidden=true
    DrawType=1
    Texture=Texture'S_KConstraint'
    bCollideActors=false
    bBlockActors=false
    bBlockPlayers=false
    bProjTarget=false
    bBlockKarma=false
}