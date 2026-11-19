class AnimNodeBlendByProperty extends AnimNodeBlendList
    hidecategories(Object,Object,Object,Object);

var(*) /*0x02D20000-0x00000000*/ private name PropertyName[65537];
var(*) /*0x02D20000-0x00000000*/ private bool bUseOwnersBase[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceUpdate[537001985];
var(*) /*0x02D20000-0x00000000*/ private bool bUseSpecificBlendTimes[65537];
var(*) /*0x1F1E0000-0x00000000*/ private bool bSynchronizeNodesInEditor[65537];
var(*) /*0x35EA0000-0x00000000*/ private name CachedPropertyName[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedFloatProperty[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBoolProperty[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedByteProperty[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedOwner[536870913];
var(*) /*0x02D20000-0x00000000*/ private float BlendTime[65537];
var(*) /*0x02D20000-0x00000000*/ private float FloatPropMin[65537];
var(*) /*0x02D20000-0x00000000*/ private float FloatPropMax[65537];
var(*) /*0x02D20000-0x00000000*/ private float BlendToChild1Time[65537];
var(*) /*0x02D20000-0x00000000*/ private float BlendToChild2Time[65537];

defaultproperties
{
    bSynchronizeNodesInEditor=true
    BlendTime=0.1000000
    FloatPropMax=1.0000000
    BlendToChild1Time=0.1000000
    BlendToChild2Time=0.1000000
    bForceChildFullWeightWhenBecomingRelevant=false
    Children=/* Array type was not detected. */
}