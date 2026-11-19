class KynapseModifierComputeTargetPoint_ShortCut extends KynapseModifierComputeTargetPoint
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierComputeTargetPoint_ShortCut);

var(accidentRatio) /*0x01600000-0x00000000*/ private float samplingStep[65537];
var(accidentRatio) /*0x01600000-0x00000000*/ private float MaxDist[65537];
var(accidentRatio) /*0x01600000-0x00000000*/ private float maxDeltaHeight[65537];
var(accidentRatio) /*0x01600000-0x00000000*/ private float updatePeriod[65537];

defaultproperties
{
    samplingStep=0.5000000
    MaxDist=0.5000000
    maxDeltaHeight=1000000000.0000000
    updatePeriod=0.5000000
    ClassName="Modifier::ComputeTargetPoint_ShortCut"
}