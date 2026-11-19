class SkelControlSingleBone extends SkelControlBase
    hidecategories(Object,Object);

var(*) /*0x019E0000-0x00000000*/ private bool bApplyTranslation[65537];
var(*) /*0x019E0000-0x00000000*/ private bool bApplyRotation[65537];
var(*) /*0x4DA10000-0x00000000*/ private bool bAddTranslation[65537];
var(*) /*0x42510000-0x00000000*/ private bool bAddRotation[65537];
var(*) /*0x42510000-0x00000000*/ private bool bRemoveMeshRotation[65537];
var(*) /*0x4DA10000-0x00000000*/ private @NULL BoneTranslation[65537];
var(*) /*0x4DA10000-0x00000000*/ private byte BoneTranslationSpace[65537];
var(*) /*0x42510000-0x00000000*/ private byte BoneRotationSpace[65537];
var(*) /*0x4DA10000-0x00000000*/ private name TranslationSpaceBoneName[65537];
var(*) /*0x42510000-0x00000000*/ private @NULL BoneRotation[65537];
var(*) /*0x42510000-0x00000000*/ private name RotationSpaceBoneName[65537];
