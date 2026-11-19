class KynapseModifierComputeTargetPoint_Queue extends KynapseModifierComputeTargetPoint
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierComputeTargetPoint_Queue);

var(accidentRatio) /*0x015F0000-0x00000000*/ private float MaxDist[65537];
var(accidentRatio) /*0x015F0000-0x00000000*/ private float maxBotDist[65537];
var(accidentRatio) /*0x015F0000-0x00000000*/ private float extraGap[65537];
var(accidentRatio) /*0x015F0000-0x00000000*/ private float maxDeltaHeightRatio[65537];

defaultproperties
{
    MaxDist=10.0000000
    maxBotDist=2.5000000
    extraGap=0.2500000
    maxDeltaHeightRatio=1.0000000
    ClassName="Modifier::ComputeTargetPoint_Queue"
}