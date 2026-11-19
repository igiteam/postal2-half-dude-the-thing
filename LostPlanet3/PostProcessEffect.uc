class PostProcessEffect extends Object
    hidecategories(Object);

var(*) /*0x3DB80000-0x00000000*/ private bool bShowInEditor[65537];
var(*) /*0x3DB80000-0x00000000*/ private bool bShowInGame[65537];
var(*) /*0x3DB80000-0x00000000*/ private bool bUseWorldSettings[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAffectsLightingOnly;
var(*) /*0x3DB80000-0x00000000*/ private name EffectName[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NodePosY;
var(*) /*0x35EA0000-0x00000000*/ private int NodePosX;
var(*) /*0x35EA0000-0x00000000*/ private int DrawWidth;
var(*) /*0x35EA0000-0x00000000*/ private int DrawHeight;
var(*) /*0x35EA0000-0x00000000*/ private int OutDrawY;
var(*) /*0x35EA0000-0x00000000*/ private int InDrawY;
var(*) /*0x3DB80000-0x00000000*/ private byte SceneDPG[65537];

defaultproperties
{
    bShowInEditor=true
    bShowInGame=true
    SceneDPG=ESceneDepthPriorityGroup.SDPG_PostProcess
}