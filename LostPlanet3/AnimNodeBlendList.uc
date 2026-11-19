class AnimNodeBlendList extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TargetWeight;
var(*) /*0x35EA0000-0x00000000*/ private float BlendTimeToGo;
var(*) /*0x35EA0000-0x00000000*/ private int ActiveChildIndex;
var(*) /*0x02D50000-0x00000000*/ private bool bPlayActiveChild[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bForceChildFullWeightWhenBecomingRelevant[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bSkipBlendWhenNotRendered[65537];
var(*) /*0x02D50000-0x00000000*/ private bool bNoBlendWhenChildrenPointToSameNode[65537];
var(*) /*0x35EA0000-0x00000000*/ private float SliderPosition[131073];
var(*) /*0x02D50000-0x00000000*/ private int EditorActiveChildIndex[65537];

// Export UAnimNodeBlendList::execSetActiveChild(FFrame&, void* const)
native function SetActiveChild()
{
    local /*0x35EA0000-0x00000000*/ private int ChildIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float BlendTime[8388609];


}

defaultproperties
{
    bForceChildFullWeightWhenBecomingRelevant=true
    bSkipBlendWhenNotRendered=true
    Children=/* Array type was not detected. */
}