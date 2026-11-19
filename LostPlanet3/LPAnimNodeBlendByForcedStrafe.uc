class LPAnimNodeBlendByForcedStrafe extends SPAnimNodeBlendList
    hidecategories(Object,Object,Object,Object,ChildBlendTimes);

var(0.25_Pct) /*0x7B940000-0x00000000*/ private float BlendTime_Child1[65537];
var(0.25_Pct) /*0x7B940000-0x00000000*/ private float BlendTime_Child2[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastActiveChildIndex[536870913];

defaultproperties
{
    BlendTime_Child1=0.2000000
    BlendTime_Child2=0.2000000
    bSynchronizeWithLikeNodesInEditor=true
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}