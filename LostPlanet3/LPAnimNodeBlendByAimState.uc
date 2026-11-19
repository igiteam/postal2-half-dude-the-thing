class LPAnimNodeBlendByAimState extends SPAnimNodeBlendList
    hidecategories(Object,Object,Object,Object,ChildBlendTimes);

var(0.25_Pct) /*0x12F40000-0x00000000*/ private float NoAimToAimBlendTime[65537];
var(0.25_Pct) /*0x12F40000-0x00000000*/ private float AimToAimBlendTime[65537];
var(0.25_Pct) /*0x12F40000-0x00000000*/ private float AimToNoAimBlendTime[65537];
var(0.25_Pct) /*0x12F40000-0x00000000*/ private float BackAimToBackAimBlendTime[65537];
var(0.25_Pct) /*0x7B8D0000-0x00000000*/ private float ChildFullyBlendedThreshold[65537];
var(0.25_Pct) /*0x7B8D0000-0x00000000*/ private float MinTotalWeightForFiring[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastActiveChildIndex[536870913];
var(0.25_Pct) /*0x7B8D0000-0x00000000*/ private bool bCanDelayFiring[65537];

defaultproperties
{
    NoAimToAimBlendTime=0.1000000
    AimToAimBlendTime=0.2500000
    AimToNoAimBlendTime=0.2500000
    BackAimToBackAimBlendTime=0.5000000
    ChildFullyBlendedThreshold=0.9000000
    MinTotalWeightForFiring=0.9000000
    bSynchronizeWithLikeNodesInEditor=true
    bNoBlendWhenChildrenPointToSameNode=true
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}