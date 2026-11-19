class LPSkelControlSingleBoneBlendFromRefPose extends LPSkelControlSingleBone
    hidecategories(Object,Object);

var(0.25_Pct) /*0x84550000-0x00000000*/ private float RefPoseStrength[65537];
var(0.25_Pct) /*0x84550000-0x00000000*/ private @NULL BaseBoneTranslation[65537];
var(0.25_Pct) /*0x84550000-0x00000000*/ private @NULL BaseBoneRotation[65537];

function SetRefPoseStrength()
{
    local /*0x97E50000-0x00000000*/ private float S[8388609];

    RefPoseStrength = S;
    //return;    
}

defaultproperties
{
    bApplyTranslation=true
    BoneTranslationSpace=EBoneControlSpace.BCS_ParentBoneSpace
    BoneRotationSpace=EBoneControlSpace.BCS_ParentBoneSpace
}