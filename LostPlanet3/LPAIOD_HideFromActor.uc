class LPAIOD_HideFromActor extends LPAIKismetObjectiveData
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x7A490000-0x00000000*/ private const @NULL ActorToHideFrom[65537];
var(0.25_Pct) /*0x7A490000-0x00000000*/ private float MaxDistanceToSearchForHidingPlace[65537];
var(0.25_Pct) /*0x7A490000-0x00000000*/ private float HidingTime[65537];

defaultproperties
{
    MaxDistanceToSearchForHidingPlace=10000.0000000
    HidingTime=120.0000000
    GeneratedObjectiveClass=Class'LPAIObjectiveHideFromActor'
}