class ApexClothingAsset extends ApexAsset
    hidecategories(Object,Object);

struct native ClothingLodInfo
{
    var(*) /*0x13210000-0x00000010*/ private editfixedsize array LODMaterialMap[4390913];

    structdefaultproperties
    {
        LODMaterialMap=none
    }
};

var(*) /*0x03290000-0x00000000*/ private editfixedsize array LodMaterialInfo[4390913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MApexAsset[268435457];
var(*) /*0x03290000-0x00000000*/ private editfixedsize array Materials[4390913];
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL ApexClothingLibrary[131073];
var(*) /*0x03290000-0x00000000*/ private bool bUseHardwareCloth[196609];
var(*) /*0x03290000-0x00000000*/ private bool bFallbackSkinning[196609];
var(*) /*0x03290000-0x00000000*/ private bool bSlowStart[196609];
var(*) /*0x03290000-0x00000000*/ private bool bRecomputeNormals[196609];
var(*) /*0x03290000-0x00000000*/ private bool bAllowAdaptiveTargetFrequency[196609];
var(*) /*0x03290000-0x00000000*/ private bool bResetAfterTeleport[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasUniqueAssetMaterialNames;
var(*) /*0x48370000-0x00000000*/ private bool IgnoreInitialTrigger[65537];
var(*) /*0x03290000-0x00000000*/ private int UVChannelForTangentUpdate[196609];
var(*) /*0x03290000-0x00000000*/ private float MaxDistanceBlendTime[196609];
var(*) /*0x03290000-0x00000000*/ private float ContinuousRotationThreshold[196609];
var(*) /*0x03290000-0x00000000*/ private float ContinuousDistanceThreshold[196609];
var(*) /*0x03290000-0x00000000*/ private float LodWeightsMaxDistance[196609];
var(*) /*0x03290000-0x00000000*/ private float LodWeightsDistanceWeight[196609];
var(*) /*0x03290000-0x00000000*/ private float LodWeightsBias[196609];
var(*) /*0x03290000-0x00000000*/ private float LodWeightsBenefitsBias[196609];
var(*) /*0x03290000-0x00000000*/ private float LODDecayTime[196609];
var(*) /*0x48370000-0x00000000*/ private @NULL SoundOnMove[65537];
var(*) /*0x48370000-0x00000000*/ private @NULL SoundOnRest[65537];
var(*) /*0x48370000-0x00000000*/ private @NULL SoundWhileMoving[65537];
var(*) /*0x48370000-0x00000000*/ private float SpeedThresholdOnMove[65537];
var(*) /*0x48370000-0x00000000*/ private float SpeedThresholdOnRest[65537];

defaultproperties
{
    bUseHardwareCloth=true
    bSlowStart=true
    bResetAfterTeleport=true
    MaxDistanceBlendTime=1.0000000
    ContinuousRotationThreshold=84.0000000
    ContinuousDistanceThreshold=50.0000000
    LodWeightsMaxDistance=10000.0000000
    LodWeightsDistanceWeight=1.0000000
    LODDecayTime=10.0000000
}