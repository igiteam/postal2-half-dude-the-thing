class LPAIOD_FlyerPhysicalAttack extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A450000-0x00000000*/ private float MinNumberOfStrikeAttemptsBetweenDamageAssessments[65537];
var(0.25_Pct) /*0x7A450000-0x00000000*/ private float MaxNumberOfStrikeAttemptsBetweenDamageAssessments[65537];
var(0.25_Pct) /*0x7A450000-0x00000000*/ private const @NULL TheEnemy[65537];

defaultproperties
{
    MinNumberOfStrikeAttemptsBetweenDamageAssessments=1.0000000
    MaxNumberOfStrikeAttemptsBetweenDamageAssessments=1.0000000
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetAttackPhysicalFlyer'
    AllowedControllerClasses=/* Array type was not detected. */
}