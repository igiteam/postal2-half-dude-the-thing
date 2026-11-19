class LPVSInteractionPoint_Rocker extends LPVSInteractionPoint_WristTurning_Base
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name PropFinishedAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name AdditiveRotationShakeAnimationName[65537];

defaultproperties
{
    PropFinishedAnimationName="PRP_VS_DoorHandle_InteractionPoint_FinalTwist_Core"
    AdditiveRotationShakeAnimationName="ADD_CHA_VS_InteractionPoint_Vibration_Core"
    NumRotationForCompleteMove=4.0000000
    RetractFromFinishedName="CHA_VS_InteractionPoint_FinalTwist_Core"
    VSSpecialMoveClass=Class'LPSM_VSIP_Rocker'
    // Reference: CylinderComponent'Default__LPVSInteractionPoint_Rocker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}