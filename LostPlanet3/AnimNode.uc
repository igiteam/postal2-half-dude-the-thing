class AnimNode extends AnimObject
    abstract
    hidecategories(Object,Object);

enum ESliderType
{
    ST_1D,                          // 0
    ST_2D,                          // 1
    ST_MAX                          // 2
};

struct CurveKey
{
    var(*) /*0x35EA0000-0x00000000*/ private name CurveName;
    var(*) /*0x35EA0000-0x00000000*/ private float Weight;

    structdefaultproperties
    {
        CurveName="None"
        Weight=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bRelevant[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bJustBecameRelevant[537001985];
var(*) /*0x3BF40000-0x00000000*/ private bool bTickDuringPausedAnims[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bEditorOnly[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableCaching[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bUnlinked;
var(*) /*0x02C80000-0x00000000*/ private bool bCallScriptEventOnInit[65537];
var(*) /*0x02C80000-0x00000000*/ private bool bCallScriptEventOnBecomeRelevant[65537];
var(*) /*0x02C80000-0x00000000*/ private bool bCallScriptEventOnCeaseRelevant[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NodeTickTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int NodeInitTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int NodeEndEventTick[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int TickArrayIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NodeCachedAtomsTag[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float NodeTotalWeight[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ParentNodes;
var(*) /*0x02C80000-0x00000000*/ private name NodeName[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedBoneAtoms[536870913];
var(*) /*0x35EA0000-0x00000000*/ private byte CachedNumDesiredBones[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedRootMotionDelta[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int bCachedHasRootMotion[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedCurveKeys[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int SearchTag[536870913];
var(*) /*0x336A0000-0x00000000*/ private const editfixedsize array LastUpdatedAnimMorphKeys[536936449];

event OnInit()
{
    //return;    
}

event OnBecomeRelevant()
{
    //return;    
}

event OnCeaseRelevant()
{
    //return;    
}

// Export UAnimNode::execFindAnimNode(FFrame&, void* const)
native final function FindAnimNode()
{
    local /*0x35EA0000-0x00000000*/ private name InNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimNode::execPlayAnim(FFrame&, void* const)
native function PlayAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185];
    local /*0x35EA0000-0x00000000*/ private float Rate[9437185], StartTime;

    false
    1.0000000
    0.0000000                    
}

// Export UAnimNode::execStopAnim(FFrame&, void* const)
native function StopAnim();

// Export UAnimNode::execReplayAnim(FFrame&, void* const)
native function ReplayAnim();

// Export UAnimNode::execFindAnimNodes(FFrame&, void* const)
native simulated function FindAnimNodes()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array NodeNames[8388609], OutNodes;
    local /*0x35EA0000-0x00000000*/ private class BaseClass[9437185];


}
