class AmbientOcclusionEffect extends PostProcessEffect
    hidecategories(Object);

enum EAmbientOcclusionQuality
{
    AO_High,                        // 0
    AO_Medium,                      // 1
    AO_Low,                         // 2
    AO_MAX                          // 3
};

var(*) /*0x13860000-0x00000000*/ private editconst @NULL OcclusionColor[65537];
var(*) /*0x13860000-0x00000000*/ private float OcclusionPower[65537];
var(*) /*0x13860000-0x00000000*/ private float OcclusionScale[65537];
var(*) /*0x13860000-0x00000000*/ private float OcclusionBias[65537];
var(*) /*0x13860000-0x00000000*/ private float MinOcclusion[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool SSAO2;
var(*) /*0x37140000-0x00000000*/ private bool bAngleBasedSSAO[65537];
var(*) /*0x37140000-0x00000000*/ private float OcclusionRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float OcclusionAttenuation;
var(*) /*0x37140000-0x00000000*/ private byte OcclusionQuality[65537];
var(*) /*0x37140000-0x00000000*/ private float OcclusionFadeoutMinDistance[65537];
var(*) /*0x37140000-0x00000000*/ private float OcclusionFadeoutMaxDistance[65537];
var(*) /*0x28B20000-0x00000000*/ private float HaloDistanceThreshold[65537];
var(*) /*0x28B20000-0x00000000*/ private float HaloDistanceScale[65537];
var(*) /*0x28B20000-0x00000000*/ private float HaloOcclusion[65537];
var(*) /*0x22C60000-0x00000000*/ private float EdgeDistanceThreshold[65537];
var(*) /*0x22C60000-0x00000000*/ private float EdgeDistanceScale[65537];
var(*) /*0x22C60000-0x00000000*/ private float FilterDistanceScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient int FilterSize;
var(*) /*0x29370000-0x00000000*/ private float HistoryConvergenceTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private float HistoryWeightConvergenceTime;

defaultproperties
{
    OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    OcclusionPower=4.0000000
    OcclusionScale=20.0000000
    MinOcclusion=0.1000000
    OcclusionRadius=25.0000000
    OcclusionQuality=EAmbientOcclusionQuality.AO_Medium
    OcclusionFadeoutMinDistance=4000.0000000
    OcclusionFadeoutMaxDistance=4500.0000000
    HaloDistanceThreshold=40.0000000
    HaloDistanceScale=0.1000000
    HaloOcclusion=0.0400000
    EdgeDistanceThreshold=10.0000000
    EdgeDistanceScale=0.0030000
    FilterDistanceScale=10.0000000
    HistoryWeightConvergenceTime=0.0700000
    bAffectsLightingOnly=true
    SceneDPG=ESceneDepthPriorityGroup.SDPG_World
}