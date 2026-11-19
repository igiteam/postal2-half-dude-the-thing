class AnimSet extends Object
    hidecategories(Object);

struct native AnimSetMeshLinkup
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BoneToTrackTable;

    structdefaultproperties
    {
        BoneToTrackTable=none
    }
};

var(*) /*0x03050000-0x00000000*/ private bool bAnimRotationOnly[65537];
var(*) /*0x336A0000-0x00000000*/ private bool bCookOutUnknownMorphCurves[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bApplyUniformTrackOptimizationsOnPreSave[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TrackBoneNames;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Sequences;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SequenceCache[805306369];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LinkupCache[536870913];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SkelMesh2LinkupCache[805306369];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BoneUseAnimTranslation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ForceUseMeshTranslation[536870913];
var(*) /*0x03050000-0x00000000*/ private editfixedsize array UseTranslationBoneNames[65537];
var(*) /*0x03050000-0x00000000*/ private editfixedsize array ForceMeshTranslationBoneNames[65537];
var(*) /*0x35EA0000-0x00000000*/ private name PreviewSkelMeshName;
var(*) /*0x35EA0000-0x00000000*/ private name BestRatioSkelMeshName;
var(*) /*0x03050000-0x00000400*/ private editfixedsize @NULL GlobalPreviewValues[589825];
var(*) /*0x336A0000-0x00000000*/ private databinding editfixedsize array MorphTargetValidationSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UniformTrackTranslations;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UniformTrackRotations;
var(*) /*0x03050000-0x00000000*/ private databinding name ReducedTrackSetConfigSection[65537];
