class SkelControlBase extends AnimObject
    abstract
    hidecategories(Object,Object);

enum EBoneControlSpace
{
    BCS_WorldSpace,                 // 0
    BCS_ActorSpace,                 // 1
    BCS_ComponentSpace,             // 2
    BCS_ParentBoneSpace,            // 3
    BCS_BoneSpace,                  // 4
    BCS_OtherBoneSpace,             // 5
    BCS_BaseMeshSpace,              // 6
    BCS_MAX                         // 7
};

var(*) /*0x146A0000-0x00000000*/ private name ControlName[65537];
var(*) /*0x146A0000-0x00000000*/ private float ControlStrength[65537];
var(*) /*0x146A0000-0x00000000*/ private float BlendInTime[65537];
var(*) /*0x146A0000-0x00000000*/ private float BlendOutTime[65537];
var(*) /*0x146A0000-0x00000000*/ private byte BlendType[65537];
var(*) /*0x146A0000-0x00000000*/ private bool bPostPhysicsController[65537];
var(*) /*0x146A0000-0x00000000*/ private bool bSetStrengthFromAnimNode[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bInitializedCachedNodeList[536870913];
var(*) /*0x146A0000-0x00000000*/ private bool bControlledByAnimMetada[65537];
var(*) /*0x146A0000-0x00000000*/ private bool bInvertMetadataWeight[65537];
var(*) /*0x146A0000-0x00000000*/ private bool bPropagateSetActive[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bIgnoreWhenNotRendered[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldTickInScript;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldTickOwner;
var(*) /*0x47750000-0x00000000*/ private const transient bool bEnableEaseInOut[65537];
var(*) /*0x35EA0000-0x00000000*/ private float StrengthTarget;
var(*) /*0x35EA0000-0x00000000*/ private float BlendTimeToGo[536870913];
var(*) /*0x146A0000-0x00000000*/ private editfixedsize array StrengthAnimNodeNameList[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedNodeList[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float AnimMetadataWeight[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int AnimMetaDataUpdateTag[537001985];
var(*) /*0x146A0000-0x00000000*/ private float BoneScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private int ControlTickTag[536870913];
var(*) /*0x3BF40000-0x00000000*/ private int IgnoreAtOrAboveLOD[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextControl;
var(*) /*0x35EA0000-0x00000000*/ private transient int ControlPosX;
var(*) /*0x35EA0000-0x00000000*/ private transient int ControlPosY;

// Export USkelControlBase::execSetSkelControlActive(FFrame&, void* const)
native final function SetSkelControlActive()
{
    local /*0x35EA0000-0x00000000*/ private bool bInActive[8388609];


}

// Export USkelControlBase::execSetSkelControlStrength(FFrame&, void* const)
native final function SetSkelControlStrength()
{
    local /*0x35EA0000-0x00000000*/ private float NewStrength[8388609], InBlendTime;


}

event @NULL TickSkelControl()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelComp[8388609];

    //return;    
}

// Export USkelControlBase::execGetControlMetadataWeight(FFrame&, void* const)
native final function GetControlMetadataWeight()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

defaultproperties
{
    ControlStrength=1.0000000
    BlendInTime=0.2000000
    BlendOutTime=0.2000000
    StrengthTarget=1.0000000
    BoneScale=1.0000000
    IgnoreAtOrAboveLOD=1000
}