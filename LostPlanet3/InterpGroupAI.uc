class InterpGroupAI extends InterpGroup
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x2BC80000-0x00000000*/ private class PreviewPawnClass[65537];
var(*) /*0x2BC80000-0x00000000*/ private name StageMarkGroup[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool SnapToRootBoneLocationWhenFinished[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bNoEncroachmentCheck[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bLeaveCollideActorsAlone[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bIgnoreStageMarkPosition[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bIgnoreStageMarkHeight[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bAllowNonYawValuesWhenIgnoringStageMarkHeight[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bDisableWorldCollision[65537];
var(*) /*0x2BC80000-0x00000000*/ private bool bIgnoreLegacyHeightAdjust[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRecreatePreviewPawn[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bRefreshStageMarkGroup[536870913];
var(*) /*0x47F30000-0x00000000*/ private bool SnapToRootBoneRotationWhenFinished[65537];
var(*) /*0x47F30000-0x00000000*/ private bool bResetRotationOnFinished[65537];
var(*) /*0x47F30000-0x00000000*/ private bool bOverrideSnapToBone[65537];
var(*) /*0x47F30000-0x00000000*/ private bool bOverrideSnapYaw[65537];
var(*) /*0x47F30000-0x00000000*/ private name OverrideSnapToBoneName[65537];
var(*) /*0x47F30000-0x00000000*/ private float OverridSnapYawValue[65537];
var(*) /*0x2BC80000-0x00000000*/ private float AnimBlendOutTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private class InterpGroupInstAIClass;

event InitFromInterpAction()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpAction[8388609], InGroupActor;

    //return;    
}

defaultproperties
{
    AnimBlendOutTime=0.2000000
    InterpGroupInstAIClass=Class'InterpGroupInstAI'
    GroupName="AIGroup"
}