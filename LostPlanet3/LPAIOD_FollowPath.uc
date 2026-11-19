class LPAIOD_FollowPath extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A470000-0x00000000*/ private @NULL PathStartingPoint[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private bool bPickClosestPathPoint[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private bool bDestroyObjectiveWhenPathDone[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private float HowCloseToGetToEachPathPoint[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private float HowCloseToGetToFinalPathPoint[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private float MaxSpeedScale[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private @NULL FollowPathRotationScale[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A470000-0x00000000*/ private int MaxNumAttackersPerEnemy[65537];

defaultproperties
{
    bDestroyObjectiveWhenPathDone=true
    HowCloseToGetToEachPathPoint=100.0000000
    HowCloseToGetToFinalPathPoint=100.0000000
    MaxSpeedScale=1.2500000
    FollowPathRotationScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    HowCloseToLetEnemiesGetBeforeAttacking=2000.0000000
    MaxNumAttackersPerEnemy=2
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetFollowPath'
    bUseAsGenerator=true
}