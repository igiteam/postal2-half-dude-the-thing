class LPAIOD_PackHunterTacticalWait extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private @NULL LocationToWaitAt[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private float HowCloseToLocationToTryAndStay[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000400*/ private editfixedsize array MovesToPlay[589825];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private bool bRandomizeWhichMovesToPlay[65537];
var(0.25_Pct) /*0x7A4D0000-0x00000000*/ private bool bUseAggressiveIndicator[65537];

defaultproperties
{
    HowCloseToLocationToTryAndStay=200.0000000
    HowCloseToLetEnemiesGetBeforeAttacking=2000.0000000
    DamageThresholdBeforeEndingCommand=20.0000000
    MovesToPlay=/* Array type was not detected. */
    HowCloseToLetGrenadesGetBeforeAttacking=1000.0000000
    bUseAggressiveIndicator=true
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetPackHunterTacticalWait'
    AllowedControllerClasses=/* Array type was not detected. */
}