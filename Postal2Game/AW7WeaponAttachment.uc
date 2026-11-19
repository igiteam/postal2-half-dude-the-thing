///////////////////////////////////////////////////////////////////////////////
// AW7WeaponAttachment
// Preserve a desired relative rotation/location so the thing in his hand
// looks right
///////////////////////////////////////////////////////////////////////////////
class AW7WeaponAttachment extends P2WeaponAttachment;

var() vector RelLoc;	// Relative location of attachment
var() rotator RelRot;	// Relative rotation of attachment

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();
	SetRelativeLocation(RelLoc);
	SetRelativeRotation(RelRot);
}
