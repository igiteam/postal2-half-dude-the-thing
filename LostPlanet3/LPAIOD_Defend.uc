class LPAIOD_Defend extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A3F0000-0x00000000*/ private @NULL DefendVolume[65537];
var(0.25_Pct) /*0x7A3F0000-0x00000000*/ private bool bIgnoreEnemiesUnlessInDefendVolume[65537];
var(0.25_Pct) /*0x7A3F0000-0x00000000*/ private bool bIgnoreEnemiesNotOnNAVMesh[65537];

defaultproperties
{
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetDefend'
    bUseAsGenerator=true
}