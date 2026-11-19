class KynapseModifierGoto_GapDynamicAvoidance extends KynapseModifierGoto
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierGoto_GapDynamicAvoidance);

var(accidentRatio) /*0x01740000-0x00000000*/ private float DistMax[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float DiagramMaxLength[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float DiagramHalfWidth[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float DiagramRefreshPeriod[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float CandidateSpacing[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float extraGap[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private bool bContinuousSpeed[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private bool bAllowCrowding[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float MinSpeed[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float Courtesy[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float QueueingDelay[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float PushingDelay[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float StuckDelay[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private float MaxAngularSpeed[65537];
var(accidentRatio) /*0x01740000-0x00000000*/ private int MaxCollisionTestsPerFrame[65537];

defaultproperties
{
    DistMax=20.0000000
    DiagramMaxLength=3.0000000
    DiagramHalfWidth=5.0000000
    DiagramRefreshPeriod=0.1000000
    CandidateSpacing=0.1000000
    extraGap=0.1000000
    bContinuousSpeed=true
    MinSpeed=1.0000000
    Courtesy=0.8000000
    QueueingDelay=0.5000000
    PushingDelay=1.0000000
    StuckDelay=0.5000000
    MaxAngularSpeed=360.0000000
    MaxCollisionTestsPerFrame=100
    ClassName="Modifier::Goto_GapDynamicAvoidance"
}