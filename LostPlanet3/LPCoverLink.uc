class LPCoverLink extends SPGFCoverLink
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(0.25_Pct) /*0x7CD70000-0x00000000*/ private @NULL ForceSwatLeft[65537];
var(0.25_Pct) /*0x7CD70000-0x00000000*/ private @NULL ForceSwatRight[65537];
var(0.25_Pct) /*0x8B880000-0x00000000*/ private bool bDisableSprintMantle[65537];

defaultproperties
{
    CoverSlotMarkerClass=Class'LPCoverSlotMarker'
    AnimPathProperty=LPAnimatedPathProperty'AnimatedPathProperties.Human.HUM_CoverMantle'
    AnimatedPathHelperClass=Class'LPAnimatedPathHelper'
    AlignDist=28.0000000
    StandingLeanOffset=(X=0.0000000,Y=60.0000000,Z=59.0000000)
    CrouchLeanOffset=(X=0.0000000,Y=80.0000000,Z=19.0000000)
    PopupOffset=(X=0.0000000,Y=0.0000000,Z=75.0000000)
    // Reference: CylinderComponent'Default__LPCoverLink.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}