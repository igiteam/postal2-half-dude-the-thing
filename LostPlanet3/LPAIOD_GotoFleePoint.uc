class LPAIOD_GotoFleePoint extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A480000-0x00000000*/ private const editfixedsize array FleePoints[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private const @NULL ActorToFaceWhileMoving[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private const @NULL ActorToAvoidWhileMoving[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private bool RotateToFaceSameDirectionAsFleePoint[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private bool InterpolateToExactPosition[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private bool bInvulnerableWhenFleeing[65537];
var(0.25_Pct) /*0x7A480000-0x00000000*/ private float PercentageSpeed[65537];

defaultproperties
{
    InterpolateToExactPosition=true
    PercentageSpeed=100.0000000
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetGotoFleePoint'
}