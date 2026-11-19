//=============================================================================
// The Karma physics parameters class.
// This provides 'extra' parameters needed by Karma physics to the Actor class.
// Need one of these (or a subclass) to set Physics to PHYS_Karma.
// (see Actor.uc)
// NB: All parameters are in KARMA scale!
//=============================================================================

class KarmaParams extends KarmaParamsCollision
	editinlinenew
	native;


// Used internally for Karma stuff - DO NOT CHANGE!
var transient const int		KAng3;


var()    float   KMass;              // Mass used for Karma physics
var()    float   KLinearDamping;
var()    float   KAngularDamping;

var()    bool    KStartEnabled;      // Start simulating body as soon as PHYS_Karma starts

var ()	 bool	bKNonSphericalInertia;	// Simulate body without using sphericalised inertia tensor

// NB - these do not apply to skeletons
var()	 bool	bKStayUpright;		// Stop this object from being able to rotate (using Angular3 constraint)
var()	 bool	bKAllowRotate;		// Allow this object to rotate about a vertical axis. Ignored unless KStayUpright == true.

// default is sphere with mass 1 and radius 1

// Decompiled with UE Explorer.
defaultproperties
{
    KMass=1.0000000
    KLinearDamping=0.2000000
    KAngularDamping=0.2000000
}