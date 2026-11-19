class LPAIOD_PackHunterSoloAttack extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A4C0000-0x00000000*/ private float MinNumberOfStrikeAttemptsBetweenDamageAssessments[65537];
var(0.25_Pct) /*0x7A4C0000-0x00000000*/ private float MaxNumberOfStrikeAttemptsBetweenDamageAssessments[65537];

defaultproperties
{
    MinNumberOfStrikeAttemptsBetweenDamageAssessments=3.0000000
    MaxNumberOfStrikeAttemptsBetweenDamageAssessments=3.0000000
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetAttackPackHunterSolo'
    AllowedControllerClasses=/* Array type was not detected. */
    bUseAsGenerator=true
}