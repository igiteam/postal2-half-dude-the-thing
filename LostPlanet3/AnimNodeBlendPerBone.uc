class AnimNodeBlendPerBone extends AnimNodeBlend
    hidecategories(Object,Object,Object,Object);

var(*) /*0x02D70000-0x00000000*/ private bool bForceLocalSpaceBlend[196609];
var(*) /*0x02D70000-0x00000000*/ private editfixedsize array BranchStartBoneName[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Child2PerBoneWeight;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalToCompReqBones;

// Export UAnimNodeBlendPerBone::execSetBlendTarget(FFrame&, void* const)
native function SetBlendTarget()
{
    local /*0x35EA0000-0x00000000*/ private float BlendTarget[8388609], BlendTime;


}

defaultproperties
{
    Children=/* Array type was not detected. */
}