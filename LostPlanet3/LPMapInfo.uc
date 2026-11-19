class LPMapInfo extends SPAIKynapseMapInfo
    config(Game)
    editinlinenew
    hidecategories(Object,Object,Object);

struct native ContractsMapDisplayInfoStruct
{
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private @NULL MapSwfMovie[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private editfixedsize string movieClipName[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private bool bShowOnMinimap[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private float MapScaleOverride[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private name MapZoneName[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private float IconHeightThreshold[65537];
    var(0.25_Pct) /*0x26CD0000-0x00000000*/ private int NorthAngle[65537];

    structdefaultproperties
    {
        MapSwfMovie=none
        movieClipName=""
        bShowOnMinimap=true
        MapScaleOverride=27.0000000
        MapZoneName="None"
        IconHeightThreshold=1000.0000000
        NorthAngle=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000100*/ private @NULL HighestPriorityWeatherVolume[537001985];
var(0.25_Pct) /*0x80A80000-0x00000000*/ private @NULL DefaultWeatherSettings[65537];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array WaypointMovies[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array ThermalEnergyPocketActors[536870913];
var(0.25_Pct) /*0x97E50000-0x00000500*/ private editfixedsize export array RepairableComponentActors[537395201];
var(0.25_Pct) /*0x97E50000-0x00000500*/ private editfixedsize export array HackableComponentActors[537395201];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array ThermalPickupList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array GrenadeActorList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array CourierItemList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array SeizeControlItemList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array DisableRepairItemList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array BombActorList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array ShopMarkerList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array MapMarkerList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array KillObjectiveList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array SnowcatActorList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array ProtoHarmonizerList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private editfixedsize array PathTargetPointList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize transient @NULL ContractsMapDisplayInfo;
var(0.25_Pct) /*0x8B940000-0x00000000*/ private editfixedsize array ContractsMapDisplayEntries[65537];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private @NULL AIResManMapMaster[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPAIResManMapMasterClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ActivateAIResourceArray[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AllowedAiPawnClassTypesForAIResourceArray[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrapplePointOctree[536870913];
var(0.25_Pct) /*0x80A80000-0x00000000*/ private bool bDisableVSGameMusicPlaybackForMap[65537];
var(0.25_Pct) /*0x80A80000-0x00000000*/ private bool bDisableVSUserMusicPlaybackForMap[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapExtent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BreadcrumbManagerClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BreadcrumbManager;

// Export ULPMapInfo::execBeginInit(FFrame&, void* const)
native function BeginInit();

// Export ULPMapInfo::execGetGrapplePointOctree(FFrame&, void* const)
native static final function GetGrapplePointOctree()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPMapInfo::execRegisterAiPawnActivateAIResource(FFrame&, void* const)
native function RegisterAiPawnActivateAIResource()
{
    local /*0x97E50000-0x00000000*/ private class InputAiClass[8388609];


}

// Export ULPMapInfo::execUnregisterAiPawnActivateAIResource(FFrame&, void* const)
native function UnregisterAiPawnActivateAIResource()
{
    local /*0x97E50000-0x00000000*/ private class InputAiClass[8388609];


}

// Export ULPMapInfo::execBroadcastActiveAIResourceToPawns(FFrame&, void* const)
native function BroadcastActiveAIResourceToPawns();

// Export ULPMapInfo::execDeactiveAllAiResourcesToForAllPawns(FFrame&, void* const)
native function DeactiveAllAiResourcesToForAllPawns();

// Export ULPMapInfo::execHaveTheAiResourcesForAiPawnBeenActivated(FFrame&, void* const)
native function HaveTheAiResourcesForAiPawnBeenActivated()
{
    local /*0x97E50000-0x00000000*/ private class InputAiClassToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPMapInfo::execIsThisAnAllowedAiPawnClassForAIResourceArray(FFrame&, void* const)
native function IsThisAnAllowedAiPawnClassForAIResourceArray()
{
    local /*0x97E50000-0x00000000*/ private class InputAiClassToTest[8388609], OutAiClassToUse;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function IsValidMapZone()
{
    local /*0x97E50000-0x00000000*/ private name ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x67 [Loop If]
    if(I < ContractsMapDisplayEntries.Length)
    {
        // End:0x59
        if(ContractsMapDisplayEntries[I].MapZoneName == ZoneName)
        {
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function GetZoneIDFromIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689], Zone;

    // End:0x59
    if((Index >= 0) && Index < ContractsMapDisplayEntries.Length)
    {
        Zone = ContractsMapDisplayEntries[Index].MapZoneName;
    }
    return Zone;
    //return ReturnValue;    
}

function GetNorthAngleFromIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609], ReturnValue;

    // End:0x50
    if((Index >= 0) && Index < ContractsMapDisplayEntries.Length)
    {
        return ContractsMapDisplayEntries[Index].NorthAngle;
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    LPAIResManMapMasterClass=Class'LPAIResManMapMaster'
    AllowedAiPawnClassTypesForAIResourceArray=/* Array type was not detected. */
    BreadcrumbManagerClass=Class'LPBreadcrumbManager'
}