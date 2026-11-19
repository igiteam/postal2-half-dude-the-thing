class LPVSInteractionPointTwist extends LPVSInteractionPoint_WristTurning_Base
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name PropFinishedAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name AdditiveRotationShakeAnimationName[65537];

defaultproperties
{
    VSSpecialMoveClass=Class'LPSM_VSIP_Twist'
    // Reference: CylinderComponent'Default__LPVSInteractionPointTwist.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}