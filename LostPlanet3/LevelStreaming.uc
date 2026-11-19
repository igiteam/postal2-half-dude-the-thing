class LevelStreaming extends Object
    abstract
    editinlinenew;

var(*) /*0x2E770000-0x00000000*/ private const name PackageName[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LoadedLevel[537001985];
var(*) /*0x2E770000-0x00000000*/ private @NULL Offset[196609];
var(*) /*0x2E770000-0x00000000*/ private @NULL LevelTransform[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldOffset[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsVisible[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasLoadRequestPending[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasUnloadRequestPending[537001985];
var(*) /*0x2E770000-0x00000000*/ private bool bShouldBeVisibleInEditor[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bBoundingBoxVisible[131073];
var(*) /*0x2E770000-0x00000000*/ private bool bLocked[196609];
var(*) /*0x2E770000-0x00000000*/ private bool bIsFullyStatic[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBeLoaded[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBeVisible[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldBlockOnLoad[536870913];
var(*) /*0x2E770000-0x00000000*/ private bool bDrawOnLevelStatusMap[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRequestingUnloadAndRemoval[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRequestingInvisibleAndKeep[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRequestingVisibleAndKeep[537001985];
var(*) /*0x2E770000-0x00000000*/ private bool bShouldPersistWhenStreamedOut[196609];
var(*) /*0x2E770000-0x00000000*/ private @NULL DrawColor[196609];
var(*) /*0x2E770000-0x00000000*/ private const editfixedsize array EditorStreamingVolumes[196609];
var(*) /*0x2E770000-0x00000000*/ private float MinTimeBetweenVolumeUnloadRequests[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LastVolumeUnloadRequestTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Keywords;
var(*) /*0x2E770000-0x00000000*/ private const @NULL EditorGridVolume[196609];
var(*) /*0x2E770000-0x00000000*/ private const int GridPosition[196611];

defaultproperties
{
    bDrawOnLevelStatusMap=true
    DrawColor=(R=255,G=255,B=255,A=255)
    MinTimeBetweenVolumeUnloadRequests=2.0000000
}