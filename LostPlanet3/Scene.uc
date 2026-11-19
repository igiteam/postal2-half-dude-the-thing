class Scene extends Object;

const SDPG_NumBits = 3;

enum ESceneDepthPriorityGroup
{
    SDPG_UnrealEdBackground,        // 0
    SDPG_World,                     // 1
    SDPG_Foreground,                // 2
    SDPG_UnrealEdForeground,        // 3
    SDPG_PostProcess,               // 4
    SDPG_MAX                        // 5
};

enum EDetailMode
{
    DM_Low,                         // 0
    DM_Medium,                      // 1
    DM_High,                        // 2
    DM_MAX                          // 3
};
