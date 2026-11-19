class LPAIOD_MortarAttackBase extends LPAIKismetObjectiveData
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private bool bUseCombatManager[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private bool bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float RangeToAnyEnemyToQuitAttack[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MinDelayBetweenLobStrikes[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MaxDelayBetweenLobStrikes[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private int MinLobStrikesBetweenDamageAssessments[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private int MaxLobStrikesBetweenDamageAssessments[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MinDurationOfDamageAssessmentInSecs[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MaxDurationOfDamageAssessmentInSecs[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private const @NULL LocationToLaunchFrom[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MinRangeToLaunchFrom[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float MaxRangeToLaunchFrom[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private float DistanceErrorBuffer[65537];
var(0.25_Pct) /*0x7A4A0000-0x00000000*/ private const @NULL TheLobTarget[65537];

defaultproperties
{
    bUseCombatManager=true
    bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack=true
    RangeToAnyEnemyToQuitAttack=600.0000000
    MinDelayBetweenLobStrikes=-1.0000000
    MaxDelayBetweenLobStrikes=-1.0000000
    MinLobStrikesBetweenDamageAssessments=-1
    MaxLobStrikesBetweenDamageAssessments=-1
    MinDurationOfDamageAssessmentInSecs=3.0000000
    MaxDurationOfDamageAssessmentInSecs=4.0000000
    MinRangeToLaunchFrom=1000.0000000
    MaxRangeToLaunchFrom=2000.0000000
    DistanceErrorBuffer=50.0000000
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    bUseAsGenerator=true
}