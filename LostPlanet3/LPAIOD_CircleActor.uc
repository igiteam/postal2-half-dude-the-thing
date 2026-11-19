class LPAIOD_CircleActor extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A3E0000-0x00000000*/ private const @NULL ActorToCircle[65537];
var(0.25_Pct) /*0x7A3E0000-0x00000000*/ private float DistanceToCircle[65537];
var(0.25_Pct) /*0x7A3E0000-0x00000000*/ private float CirclingTime[65537];

defaultproperties
{
    DistanceToCircle=1000.0000000
    CirclingTime=5.0000000
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetCircleActor'
}