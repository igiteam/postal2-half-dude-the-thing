class LPBreadcrumbManager extends Object
    config(Game);

enum EBreadcrumbDisplayMode
{
    EBDM_Off,                       // 0
    EBDM_ForcedOn,                  // 1
    EBDM_RequestedOn,               // 2
    EBDM_MAX                        // 3
};

enum EBreadcrumbUmbilicalDisplayType
{
    EBDT_InVS,                      // 0
    EBDT_POFInUmbilical,            // 1
    EBDT_OutOfUmbilical,            // 2
    EBDT_MAX                        // 3
};

struct native BreadcrumbPathInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetObjective;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PathArray;

    structdefaultproperties
    {
        TargetObjective=none
        PathArray=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte BreadcrumbDisplayMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Breadcrumbs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ObjectiveMarkers[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExitPoints[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VisibleObjectiveMarkers[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectedJobLogObjective[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastActivatedObjective[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentPathInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToNextPathCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoTurnOffBreadcrumbTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxBreadcrumbsToShow_POF[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxBreadcrumbsToShow_VS[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAlphaForLastBreadcrumb[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PathUpdateDelay[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float POFShowPathDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowDistanceAlongPath[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoTrackOptionalQuests[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoTrackOptionalObjectives[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDraw[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ObjectiveMarkerUpdateDelay[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BreadcrumbPingSoundEvent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BreadcrumbPingFXEvent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToNextObjectiveMarkerUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FirstDisplayedBreadcrumb[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceForFirstBreadcrumb_VS[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceForFirstBreadcrumb_POF[1073741825];

// Export ULPBreadcrumbManager::execSetSelectedJobLogObjective(FFrame&, void* const)
native final function SetSelectedJobLogObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL InQuestObject[8388609];


}

// Export ULPBreadcrumbManager::execNewQuestObjectiveActivated(FFrame&, void* const)
native final function NewQuestObjectiveActivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL InQuestObject[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private bool bAutoPulse[9437185];

    true                    
}

// Export ULPBreadcrumbManager::execUpdate(FFrame&, void* const)
native final function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPBreadcrumbManager::execRequestShowPath(FFrame&, void* const)
native final function RequestShowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];


}

// Export ULPBreadcrumbManager::execSetObjectiveMarkerDisplayType(FFrame&, void* const)
native final function SetObjectiveMarkerDisplayType()
{
    local /*0x97E50000-0x00000000*/ private byte InType[8388609];


}

// Export ULPBreadcrumbManager::execGetObjectiveToTrack(FFrame&, void* const)
native final function GetObjectiveToTrack()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPBreadcrumbManager::execForceUpdateObjectMarkers(FFrame&, void* const)
native final function ForceUpdateObjectMarkers();

// Export ULPBreadcrumbManager::execNotifyObjectMarkerVisibilityStateChange(FFrame&, void* const)
native final function NotifyObjectMarkerVisibilityStateChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Marker[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];


}

// Export ULPBreadcrumbManager::execDebugDraw(FFrame&, void* const)
native final function DebugDraw()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCanvas[8388609];


}

// Export ULPBreadcrumbManager::execGetMapNameForObjective(FFrame&, void* const)
native final function GetMapNameForObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetObjective[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];


}

// Export ULPBreadcrumbManager::execFindPathEndBreadcrumb(FFrame&, void* const)
native final function FindPathEndBreadcrumb()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetObjective[8388609], LPPC, ReturnValue;


}

static function GetBreadcrumbManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MapInfo;

    MapInfo = LPMapInfo(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo());
    return MapInfo.BreadcrumbManager;
    //return ReturnValue;    
}

static function DebugDrawBreadcrumbs()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCanvas[8388609];

    GetBreadcrumbManager().DebugDraw(InCanvas);
    //return;    
}

defaultproperties
{
    MaxBreadcrumbsToShow_POF=1
    MaxBreadcrumbsToShow_VS=2
    MinAlphaForLastBreadcrumb=0.3000000
    PathUpdateDelay=1.0000000
    POFShowPathDuration=7.0000000
    bShowDistanceAlongPath=true
    ObjectiveMarkerUpdateDelay=1.0000000
    BreadcrumbPingSoundEvent="BreadcrumbPing"
    BreadcrumbPingFXEvent="BreadcrumbPing"
    MinDistanceForFirstBreadcrumb_VS=1200.0000000
    MinDistanceForFirstBreadcrumb_POF=200.0000000
}