class LPAIResManPlayer extends LPAIResourceManager
    editinlinenew;

const OverLapPriority_Leech = 10;
const OverLapPriority_Phadyr = 10;
const OverLapPriority_PackHunter = 20;
const OverLapPriority_IceCrab = 30;
const OverLapPriority_MedFlyer = 10;
const OverLapPriority_Sepia = 10;
const OverLapPriority_VsLaroche = 30;

struct native HotloadAiResources
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSetup;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHotloaded;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AIClassForHotLoad;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ResourcesToHotload;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ResourceGroupsToHotload;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CountdownTimersToHotload;

    structdefaultproperties
    {
        bSetup=false
        bHotloaded=false
        AIClassForHotLoad=none
        ResourcesToHotload=none
        ResourceGroupsToHotload=none
        CountdownTimersToHotload=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStruggle[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerStruggle[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceLeechStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceLeechAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResIceLeechStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerLeechStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerLeechStruggleMode[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LeechHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPackHunterMelee[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPackHunterAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPackHunterTimeInPaternBeforeFirstAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPackHunterCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PackHunterHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResIceCrabStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabDismemberedWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabTauntAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL IceCrabHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaLobStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaMassRetreatMgr[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SepiaHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResMedFlyerSurroundOrbitFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResFireWaspFromOrbitSlotEngagement[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL FireWaspHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderSwarmOrbitFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderRogueFromOrbitSlotEngagement[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResAdHocSquadMgr[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DefenderHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceHumanSoldierMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private int NumCoverAIsUsingFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceHumanSoldierPlayer[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceHumanSoldierStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerHumanSoldierMinTimeNoMelee[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL HumanSoldierHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDongoSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoFrenzyAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DongoHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResCarrierLoiterFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResCarrierDefenderCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderCarrierSupportCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceDefenderStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CarrierHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStalkerFirePlayer[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStalkerStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerStalkerMinTimeNoAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerStalkerMaxTimeHaveToAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL StalkerHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSpitterRangedFormationPlayer[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSpitterFire[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SpitterHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResVsLarocheLoiterFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL VsLarocheHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceVSISSFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL VSISSHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSentinelCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSentinelSearch[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSentinelStealthStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SentinelHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerBurrowerStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL BurrowerHotloadAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPhadyrSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPhadyrStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PhadyHotloadAiResources[536870913];

event Init()
{
    super(SPAIResourceManager).Init();
    SetupLeech();
    SetupPackHunter();
    SetupSnowCrab();
    SetupSepia();
    SetupFireWasp();
    SetupDefender();
    SetupHumanSoldier();
    SetupDongo();
    SetupCarrier();
    SetupStalker();
    SetupSpitter();
    SetupVsLaroche();
    SetupVsISS();
    SetupSentinel();
    SetupBurrower();
    SetupPhadyr();
    AddNeededDefaultResources();
    //return;    
}

event AddNeededDefaultResources()
{
    // End:0x2F
    if(Resource.Find(AIResourceStrike) < )
    {        
        AddResource(AIResourceStrike);
    }
    // End:0x5E
    if(Resource.Find(AIResourceStruggle) < )
    {        
        AddResource(AIResourceStruggle);
    }
    // End:0x8D
    if(CountDownTimer.Find(AITimerStruggle) < )
    {        
        AddTimer(AITimerStruggle);
    }
    SetupResourcesFromTuneData();
    //return;    
}

function HotLoadThisResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL ObjToInit[8388609];

    // End:0x6C
    if(ObjToInit != none)
    {
        ObjToInit.Init();
        ObjToInit.BeginPlay();
        ObjToInit.SetFromTuneData();
    }
    //return;    
}

function SetupResourcesFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL BasePlayerOwner, lpCurMapInfo;

    BasePlayerOwner = LPBasePlayerPawn(GetMyActor());
    // End:0x2E
    if(BasePlayerOwner == none)
    {
        return false;
    }
    lpCurMapInfo = LPMapInfo(BasePlayerOwner.WorldInfo.GetMapInfo());
    // End:0x8A
    if(lpCurMapInfo == none)
    {
        return false;        
    }
    else
    {
        // End:0xB1
        if(lpCurMapInfo.ActivateAIResourceArray.Length == 0)
        {
            return false;
        }
    }
    I = 0;
    J0xBC:

    // End:0x13C [Loop If]
    if(I < lpCurMapInfo.ActivateAIResourceArray.Length)
    {
        SetupResourcesForClass(lpCurMapInfo.ActivateAIResourceArray[I].AiPawnClass);
        I++;
        // [Loop Continue]
        goto J0xBC;
    }
    return true;
    //return ReturnValue;    
}

function ProcessAiClassForPossibleSetup()
{
    local /*0x97E50000-0x00000000*/ private class InAIClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL HotloadData[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x84
    if(ClassIsChildOf(InAIClass, HotloadData.AIClassForHotLoad))
    {
        // End:0x82
        if(!HotloadData.bHotloaded && HotloadData.bSetup)
        {
            StartUpThisAiResourceHotLoad(HotloadData);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartUpThisAiResourceHotLoad()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL HotloadData[25165825];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xA4 [Loop If]
    if(iter < HotloadData.ResourcesToHotload.Length)
    {
        AddResource(HotloadData.ResourcesToHotload[iter]);
        HotLoadThisResource(HotloadData.ResourcesToHotload[iter]);
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    iter = 0;
    J0xAF:

    // End:0x148 [Loop If]
    if(iter < HotloadData.ResourceGroupsToHotload.Length)
    {
        AddResourceGroup(HotloadData.ResourceGroupsToHotload[iter]);
        HotLoadThisResource(HotloadData.ResourceGroupsToHotload[iter]);
        ++iter;
        // [Loop Continue]
        goto J0xAF;
    }
    iter = 0;
    J0x153:

    // End:0x1EC [Loop If]
    if(iter < HotloadData.CountdownTimersToHotload.Length)
    {
        AddTimer(HotloadData.CountdownTimersToHotload[iter]);
        HotLoadThisResource(HotloadData.CountdownTimersToHotload[iter]);
        ++iter;
        // [Loop Continue]
        goto J0x153;
    }
    HotloadData.bHotloaded = true;
    //return;    
}

function ProcessAiClassForPossibleShutdown()
{
    local /*0x97E50000-0x00000000*/ private class InAIClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL HotloadData[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x82
    if(ClassIsChildOf(InAIClass, HotloadData.AIClassForHotLoad))
    {
        // End:0x80
        if(HotloadData.bHotloaded && HotloadData.bSetup)
        {
            StopUpThisAiResourceHotLoad(HotloadData);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StopUpThisAiResourceHotLoad()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL HotloadData[25165825];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xB0 [Loop If]
    if(iter < HotloadData.ResourcesToHotload.Length)
    {
        RemoveResource(HotloadData.ResourcesToHotload[iter]);
        HotloadData.ResourcesToHotload[iter].ShutDown();
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    iter = 0;
    J0xBB:

    // End:0x160 [Loop If]
    if(iter < HotloadData.ResourceGroupsToHotload.Length)
    {
        RemoveResourceGroup(HotloadData.ResourceGroupsToHotload[iter]);
        HotloadData.ResourceGroupsToHotload[iter].ShutDown();
        ++iter;
        // [Loop Continue]
        goto J0xBB;
    }
    iter = 0;
    J0x16B:

    // End:0x210 [Loop If]
    if(iter < HotloadData.CountdownTimersToHotload.Length)
    {
        RemoveTimer(HotloadData.CountdownTimersToHotload[iter]);
        HotloadData.CountdownTimersToHotload[iter].ShutDown();
        ++iter;
        // [Loop Continue]
        goto J0x16B;
    }
    HotloadData.bHotloaded = false;
    //return;    
}

function SetupResourcesForClass()
{
    local /*0x97E50000-0x00000000*/ private class AIClass[8388609];

    // End:0x21
    if(ProcessAiClassForPossibleSetup(AIClass, LeechHotloadAiResources))
    {
        return;
    }
    // End:0x42
    if(ProcessAiClassForPossibleSetup(AIClass, PackHunterHotloadAiResources))
    {
        return;
    }
    // End:0x63
    if(ProcessAiClassForPossibleSetup(AIClass, SepiaHotloadAiResources))
    {
        return;
    }
    // End:0x84
    if(ProcessAiClassForPossibleSetup(AIClass, FireWaspHotloadAiResources))
    {
        return;
    }
    // End:0xA5
    if(ProcessAiClassForPossibleSetup(AIClass, DefenderHotloadAiResources))
    {
        return;
    }
    // End:0xC6
    if(ProcessAiClassForPossibleSetup(AIClass, HumanSoldierHotloadAiResources))
    {
        return;
    }
    // End:0xE7
    if(ProcessAiClassForPossibleSetup(AIClass, DongoHotloadAiResources))
    {
        return;
    }
    // End:0x108
    if(ProcessAiClassForPossibleSetup(AIClass, IceCrabHotloadAiResources))
    {
        return;
    }
    // End:0x129
    if(ProcessAiClassForPossibleSetup(AIClass, CarrierHotloadAiResources))
    {
        return;
    }
    // End:0x14A
    if(ProcessAiClassForPossibleSetup(AIClass, StalkerHotloadAiResources))
    {
        return;
    }
    // End:0x16B
    if(ProcessAiClassForPossibleSetup(AIClass, SpitterHotloadAiResources))
    {
        return;
    }
    // End:0x18C
    if(ProcessAiClassForPossibleSetup(AIClass, VsLarocheHotloadAiResources))
    {
        return;
    }
    // End:0x1AD
    if(ProcessAiClassForPossibleSetup(AIClass, VSISSHotloadAiResources))
    {
        return;
    }
    // End:0x1CE
    if(ProcessAiClassForPossibleSetup(AIClass, SentinelHotloadAiResources))
    {
        return;
    }
    // End:0x1EF
    if(ProcessAiClassForPossibleSetup(AIClass, BurrowerHotloadAiResources))
    {
        return;
    }
    // End:0x210
    if(ProcessAiClassForPossibleSetup(AIClass, PhadyHotloadAiResources))
    {
        return;
    }
    //return;    
}

function RemoveResourcesForClass()
{
    local /*0x97E50000-0x00000000*/ private class AIClass[8388609];

    // End:0x21
    if(ProcessAiClassForPossibleShutdown(AIClass, LeechHotloadAiResources))
    {
        return;
    }
    // End:0x42
    if(ProcessAiClassForPossibleShutdown(AIClass, PackHunterHotloadAiResources))
    {
        return;
    }
    // End:0x63
    if(ProcessAiClassForPossibleShutdown(AIClass, IceCrabHotloadAiResources))
    {
        return;
    }
    // End:0x84
    if(ProcessAiClassForPossibleShutdown(AIClass, SepiaHotloadAiResources))
    {
        return;
    }
    // End:0xA5
    if(ProcessAiClassForPossibleShutdown(AIClass, FireWaspHotloadAiResources))
    {
        return;
    }
    // End:0xC6
    if(ProcessAiClassForPossibleShutdown(AIClass, DefenderHotloadAiResources))
    {
        return;
    }
    // End:0xE7
    if(ProcessAiClassForPossibleShutdown(AIClass, HumanSoldierHotloadAiResources))
    {
        return;
    }
    // End:0x108
    if(ProcessAiClassForPossibleShutdown(AIClass, DongoHotloadAiResources))
    {
        return;
    }
    // End:0x129
    if(ProcessAiClassForPossibleShutdown(AIClass, CarrierHotloadAiResources))
    {
        return;
    }
    // End:0x14A
    if(ProcessAiClassForPossibleShutdown(AIClass, StalkerHotloadAiResources))
    {
        return;
    }
    // End:0x16B
    if(ProcessAiClassForPossibleShutdown(AIClass, SpitterHotloadAiResources))
    {
        return;
    }
    // End:0x18C
    if(ProcessAiClassForPossibleShutdown(AIClass, VsLarocheHotloadAiResources))
    {
        return;
    }
    // End:0x1AD
    if(ProcessAiClassForPossibleShutdown(AIClass, VSISSHotloadAiResources))
    {
        return;
    }
    // End:0x1CE
    if(ProcessAiClassForPossibleShutdown(AIClass, SentinelHotloadAiResources))
    {
        return;
    }
    // End:0x1EF
    if(ProcessAiClassForPossibleShutdown(AIClass, BurrowerHotloadAiResources))
    {
        return;
    }
    // End:0x210
    if(ProcessAiClassForPossibleShutdown(AIClass, PhadyHotloadAiResources))
    {
        return;
    }
    //return;    
}

function SetupLeech()
{
    // End:0x10E
    if(!LeechHotloadAiResources.bSetup)
    {
        LeechHotloadAiResources.ResourcesToHotload.AddItem(AIResourceLeechStrike);        
        LeechHotloadAiResources.ResourcesToHotload.AddItem(AIResourceLeechAttack);        
        LeechHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResIceLeechStaticMeleeFormation);        
        LeechHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerLeechStrike);        
        LeechHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerLeechStruggleMode);        
        LeechHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupPackHunter()
{
    // End:0xE5
    if(!PackHunterHotloadAiResources.bSetup)
    {
        PackHunterHotloadAiResources.ResourcesToHotload.AddItem(AIResPackHunterCombatManager);        
        PackHunterHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResPackHunterMelee);        
        PackHunterHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerPackHunterAttack);        
        PackHunterHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerPackHunterTimeInPaternBeforeFirstAttack);        
        PackHunterHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupSnowCrab()
{
    // End:0x10E
    if(!IceCrabHotloadAiResources.bSetup)
    {
        IceCrabHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResIceCrabStaticMeleeFormation);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabStrike);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabWithDrawAndCharge);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabDismemberedWithDrawAndCharge);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabTauntAttack);        
        IceCrabHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupSepia()
{
    // End:0x10E
    if(!SepiaHotloadAiResources.bSetup)
    {
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaStrike);        
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaLobStrike);        
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaAttack);        
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResSepiaMassRetreatMgr);        
        SepiaHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResSepiaSurroundFormation);        
        SepiaHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupFireWasp()
{
    // End:0x93
    if(!FireWaspHotloadAiResources.bSetup)
    {
        FireWaspHotloadAiResources.ResourcesToHotload.AddItem(AIResFireWaspFromOrbitSlotEngagement);        
        FireWaspHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResMedFlyerSurroundOrbitFormation);        
        FireWaspHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupDefender()
{
    // End:0xE5
    if(!DefenderHotloadAiResources.bSetup)
    {
        DefenderHotloadAiResources.ResourcesToHotload.AddItem(AIResDefenderRogueFromOrbitSlotEngagement);        
        DefenderHotloadAiResources.ResourcesToHotload.AddItem(AIResAdHocSquadMgr);        
        DefenderHotloadAiResources.ResourcesToHotload.AddItem(AIResourceDefenderStrike);        
        DefenderHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResDefenderSwarmOrbitFormation);        
        DefenderHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupHumanSoldier()
{
    // End:0xBC
    if(!HumanSoldierHotloadAiResources.bSetup)
    {
        HumanSoldierHotloadAiResources.ResourcesToHotload.AddItem(AIResourceHumanSoldierPlayer);        
        HumanSoldierHotloadAiResources.ResourcesToHotload.AddItem(AIResourceHumanSoldierStrike);        
        HumanSoldierHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerHumanSoldierMinTimeNoMelee);        
        HumanSoldierHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupDongo()
{
    // End:0xE5
    if(!DongoHotloadAiResources.bSetup)
    {
        DongoHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResDongoSurroundFormation);        
        DongoHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerDongoStrike);        
        DongoHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerDongoWithDrawAndCharge);        
        DongoHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerDongoFrenzyAttack);        
        DongoHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupCarrier()
{
    // End:0xBC
    if(!CarrierHotloadAiResources.bSetup)
    {
        CarrierHotloadAiResources.ResourcesToHotload.AddItem(AIResCarrierDefenderCombatManager);        
        CarrierHotloadAiResources.ResourcesToHotload.AddItem(AIResDefenderCarrierSupportCombatManager);        
        CarrierHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResCarrierLoiterFormation);        
        CarrierHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupStalker()
{
    // End:0xE5
    if(!StalkerHotloadAiResources.bSetup)
    {
        StalkerHotloadAiResources.ResourcesToHotload.AddItem(AIResourceStalkerFirePlayer);        
        StalkerHotloadAiResources.ResourcesToHotload.AddItem(AIResourceStalkerStrike);        
        StalkerHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerStalkerMinTimeNoAttack);        
        StalkerHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerStalkerMaxTimeHaveToAttack);        
        StalkerHotloadAiResources.bSetup = true;
    }
    //return;    
}

function UsingRangedCoverAIsFormation()
{
    // End:0x35
    if(NumCoverAIsUsingFormation <= 0)
    {
        AddResourceGroup(AIResourceHumanSoldierMeleeFormation);
        HotLoadThisResource(AIResourceHumanSoldierMeleeFormation);
    }
    NumCoverAIsUsingFormation++;
    //return;    
}

function StopUsingRangedCoverAIsFormation()
{
    NumCoverAIsUsingFormation--;
    // End:0x4C
    if(NumCoverAIsUsingFormation <= 0)
    {
        RemoveResourceGroup(AIResourceHumanSoldierMeleeFormation);
        AIResourceHumanSoldierMeleeFormation.ShutDown();
    }
    //return;    
}

function SetupSpitter()
{
    // End:0x93
    if(!SpitterHotloadAiResources.bSetup)
    {
        SpitterHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSpitterFire);        
        SpitterHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResSpitterRangedFormationPlayer);        
        SpitterHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupVsLaroche()
{
    // End:0x6A
    if(!VsLarocheHotloadAiResources.bSetup)
    {
        VsLarocheHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResVsLarocheLoiterFormation);        
        VsLarocheHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupVsISS()
{
    // End:0x6A
    if(!VSISSHotloadAiResources.bSetup)
    {
        VSISSHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResourceVSISSFormation);        
        VSISSHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupSentinel()
{
    // End:0xBC
    if(!SentinelHotloadAiResources.bSetup)
    {
        SentinelHotloadAiResources.ResourcesToHotload.AddItem(AIResSentinelCombatManager);        
        SentinelHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSentinelSearch);        
        SentinelHotloadAiResources.ResourcesToHotload.AddItem(AIResSentinelStealthStrike);        
        SentinelHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupBurrower()
{
    // End:0xE5
    if(!BurrowerHotloadAiResources.bSetup)
    {
        BurrowerHotloadAiResources.ResourcesToHotload.AddItem(AIResBurrowerStrike);        
        BurrowerHotloadAiResources.ResourcesToHotload.AddItem(AIResBurrowerCombatManager);        
        BurrowerHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResBurrowerStaticMeleeFormation);        
        BurrowerHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerBurrowerStrike);        
        BurrowerHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupPhadyr()
{
    // End:0x93
    if(!PhadyHotloadAiResources.bSetup)
    {
        PhadyHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResPhadyrSurroundFormation);        
        PhadyHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerPhadyrStrike);        
        PhadyHotloadAiResources.bSetup = true;
    }
    //return;    
}

event Update()
{
    super(SPAIResourceManager).Update();
    //return;    
}

function EnableStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceStrike.AllowAccess(bEnable);
    //return;    
}

function EnableLeechStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceLeechStrike.AllowAccess(bEnable);
    //return;    
}

function EnableSepiaStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceSepiaStrike.AllowAccess(bEnable);
    //return;    
}

function EnableStruggleAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceStruggle.AllowAccess(bEnable);
    //return;    
}

function NotfiySubscribedControllersOfPawnChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingTo[8388609], currentNpc, PawnSwitchingFrom;

    PawnSwitchingFrom = LPPawn(Owner);
    // End:0xA7
    if(PawnSwitchingFrom != none)
    {
        // End:0xA6
        foreach Owner.WorldInfo.AllControllers(Class'LPAIController', currentNpc)
        {
            currentNpc.NotfiyControllerOfPawnChange(PawnSwitchingFrom, PawnSwitchingTo);            
        }        
    }
    //return;    
}

defaultproperties
{
    // Reference: LPAIResourceStrike'Default__LPAIResManPlayer.SPAIResource_Strike'
    begin object name=SPAIResource_Strike class=Class'LPAIResourceStrike'
        Red=0
    end object
    AIResourceStrike=SPAIResource_Strike
    // Reference: LPAIResourceStruggle'Default__LPAIResManPlayer.SPAIResource_Struggle'
    begin object name=SPAIResource_Struggle class=Class'LPAIResourceStruggle'
        Red=1
    end object
    AIResourceStruggle=SPAIResource_Struggle
    // Reference: LPAITimerGlobalStruggle'Default__LPAIResManPlayer.LPAITimerStruggle'
    begin object name=LPAITimerStruggle class=Class'LPAITimerGlobalStruggle'
        CountDownTimeMin=90.0000000
        CountDownTimeMax=90.0000000
    end object
    AITimerStruggle=LPAITimerStruggle
    // Reference: LPAIResLeechStrikePlayer'Default__LPAIResManPlayer.LPAIResourceDensityControlledStrike_DO'
    begin object name=LPAIResourceDensityControlledStrike_DO class=Class'LPAIResLeechStrikePlayer'
        MaxUsers=5
        Red=0
    end object
    AIResourceLeechStrike=LPAIResourceDensityControlledStrike_DO
    // Reference: LPAIResourceLeechAttackPlayer'Default__LPAIResManPlayer.LPAIResourceLeechAttack'
    begin object name=LPAIResourceLeechAttack class=Class'LPAIResourceLeechAttackPlayer'
        Attributes=(Radius=100.0000000,Height=100.0000000)
        Red=0
    end object
    AIResourceLeechAttack=LPAIResourceLeechAttack
    // Reference: LPAIResIceLeechStaticMeleeFormationPlayer'Default__LPAIResManPlayer.LPAIResIceLeechStaticMeleeFormationPlayer'
    begin object name=LPAIResIceLeechStaticMeleeFormationPlayer class=Class'LPAIResIceLeechStaticMeleeFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResIceLeechStaticMeleeFormation=LPAIResIceLeechStaticMeleeFormationPlayer
    // Reference: LPAITimerLeechStrikePlayer'Default__LPAIResManPlayer.LPAITimerLeechStrikePlayer'
    begin object name=LPAITimerLeechStrikePlayer class=Class'LPAITimerLeechStrikePlayer'
        UniqueName="LeechStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerLeechStrike=LPAITimerLeechStrikePlayer
    // Reference: LPAITimerLeechStruggleModePlayer'Default__LPAIResManPlayer.LPAITimerLeechStruggleModePlayer'
    begin object name=LPAITimerLeechStruggleModePlayer class=Class'LPAITimerLeechStruggleModePlayer'
        UniqueName="LeechStruggleModeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerLeechStruggleMode=LPAITimerLeechStruggleModePlayer
    LeechHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnLeech',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResPackHunterSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResPackHunterSurroundFormation_Player'
    begin object name=LPAIResPackHunterSurroundFormation_Player class=Class'LPAIResPackHunterSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResPackHunterMelee=LPAIResPackHunterSurroundFormation_Player
    // Reference: LPAITimerPackHunterAttackPlayer'Default__LPAIResManPlayer.LPAITimerPackHunterAttackPlayer'
    begin object name=LPAITimerPackHunterAttackPlayer class=Class'LPAITimerPackHunterAttackPlayer'
        UniqueName="PackHunterAttackTimer"
    end object
    AITimerPackHunterAttack=LPAITimerPackHunterAttackPlayer
    // Reference: LPAITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'Default__LPAIResManPlayer.AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'
    begin object name=AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer class=Class'LPAITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'
        UniqueName="PackHunterTimeInPaternBeforeFirstAttackTimer"
    end object
    AITimerPackHunterTimeInPaternBeforeFirstAttack=AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer
    // Reference: LPAIResPackHunterCombatManagerPlayer'Default__LPAIResManPlayer.LPAIResPackHunterStaticEngagement_Player'
    begin object name=LPAIResPackHunterStaticEngagement_Player class=Class'LPAIResPackHunterCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResPackHunterCombatManager=LPAIResPackHunterStaticEngagement_Player
    PackHunterHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnPackHunter',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResIceCrabStaticMeleeFormationPlayer'Default__LPAIResManPlayer.LPAIResIceCrabStaticMeleeFormationPlayer'
    begin object name=LPAIResIceCrabStaticMeleeFormationPlayer class=Class'LPAIResIceCrabStaticMeleeFormationPlayer'
        Attributes=(OverlapPriority=30)
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResIceCrabStaticMeleeFormation=LPAIResIceCrabStaticMeleeFormationPlayer
    // Reference: LPAITimerCrabStrikePlayer'Default__LPAIResManPlayer.LPAITimerCrabStrikePlayer'
    begin object name=LPAITimerCrabStrikePlayer class=Class'LPAITimerCrabStrikePlayer'
        UniqueName="IceCrabStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabStrike=LPAITimerCrabStrikePlayer
    // Reference: LPAITimerCrabWithDrawAndChargePlayer'Default__LPAIResManPlayer.AITimerCrabWithDrawAndCharge'
    begin object name=AITimerCrabWithDrawAndCharge class=Class'LPAITimerCrabWithDrawAndChargePlayer'
        UniqueName="IceCrabWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabWithDrawAndCharge=AITimerCrabWithDrawAndCharge
    // Reference: LPAITimerCrabDismemberedWithDrawAndChargePlayer'Default__LPAIResManPlayer.AITimerCrabDismemberedWithDrawAndCharge'
    begin object name=AITimerCrabDismemberedWithDrawAndCharge class=Class'LPAITimerCrabDismemberedWithDrawAndChargePlayer'
        UniqueName="IceCrabDismemberedWithdrawChargeTimerPoF"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabDismemberedWithDrawAndCharge=AITimerCrabDismemberedWithDrawAndCharge
    // Reference: LPAITimerCrabTauntAttackPlayer'Default__LPAIResManPlayer.AITimerCrabTauntAttack'
    begin object name=AITimerCrabTauntAttack class=Class'LPAITimerCrabTauntAttackPlayer'
        UniqueName="IceCrabTauntAttackTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabTauntAttack=AITimerCrabTauntAttack
    IceCrabHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnBaseSnowCrab',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResSepiaStrikePlayer'Default__LPAIResManPlayer.LPAIResourceSepiaDensityControlledStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledStrike_DO class=Class'LPAIResSepiaStrikePlayer'
        Red=0
    end object
    AIResourceSepiaStrike=LPAIResourceSepiaDensityControlledStrike_DO
    // Reference: LPAIResSepiaLobStrikePlayer'Default__LPAIResManPlayer.LPAIResourceSepiaDensityControlledLobStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledLobStrike_DO class=Class'LPAIResSepiaLobStrikePlayer'
        UniqueName="SepiaLobStrike"
        Red=0
    end object
    AIResourceSepiaLobStrike=LPAIResourceSepiaDensityControlledLobStrike_DO
    // Reference: LPAIResourceSepiaAttackPlayer'Default__LPAIResManPlayer.LPAIResourceSepiaAttack'
    begin object name=LPAIResourceSepiaAttack class=Class'LPAIResourceSepiaAttackPlayer'
        Attributes=(Radius=100.0000000,Height=100.0000000)
        Red=0
    end object
    AIResourceSepiaAttack=LPAIResourceSepiaAttack
    // Reference: LPAIResSepiaSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResSepiaSurroundFormationPlayerD0'
    begin object name=LPAIResSepiaSurroundFormationPlayerD0 class=Class'LPAIResSepiaSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResSepiaSurroundFormation=LPAIResSepiaSurroundFormationPlayerD0
    // Reference: LPAIResSepiaMassRetreatMgrPlayer'Default__LPAIResManPlayer.LPAIResSepiaMassRetreatMgrPlayer_D0'
    begin object name=LPAIResSepiaMassRetreatMgrPlayer_D0 class=Class'LPAIResSepiaMassRetreatMgrPlayer'
        Red=0
    end object
    AIResSepiaMassRetreatMgr=LPAIResSepiaMassRetreatMgrPlayer_D0
    SepiaHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnSepia',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResMedFlyerSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResMedFlyerSurroundFormation'
    begin object name=LPAIResMedFlyerSurroundFormation class=Class'LPAIResMedFlyerSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResMedFlyerSurroundOrbitFormation=LPAIResMedFlyerSurroundFormation
    // Reference: LPAIResFireWaspFromOrbitSlotEngagementPlayer'Default__LPAIResManPlayer.LPAIResFireWaspFromOrbitSlotEngagementPlayer'
    begin object name=LPAIResFireWaspFromOrbitSlotEngagementPlayer class=Class'LPAIResFireWaspFromOrbitSlotEngagementPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=20
    end object
    AIResFireWaspFromOrbitSlotEngagement=LPAIResFireWaspFromOrbitSlotEngagementPlayer
    FireWaspHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnFireWasp',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResDefenderSwarmFormationPlayer'Default__LPAIResManPlayer.LPAIResDefenderSwarmFormationPlayer'
    begin object name=LPAIResDefenderSwarmFormationPlayer class=Class'LPAIResDefenderSwarmFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResDefenderSwarmOrbitFormation=LPAIResDefenderSwarmFormationPlayer
    // Reference: LPAIResDefenderRogueFromOrbitSlotEngagementPlayer'Default__LPAIResManPlayer.LPAIResDefenderRogueFromOrbitSlotEngagementPlayer'
    begin object name=LPAIResDefenderRogueFromOrbitSlotEngagementPlayer class=Class'LPAIResDefenderRogueFromOrbitSlotEngagementPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=40
    end object
    AIResDefenderRogueFromOrbitSlotEngagement=LPAIResDefenderRogueFromOrbitSlotEngagementPlayer
    // Reference: LPAIResAdHocSquadMgrPlayer'Default__LPAIResManPlayer.LPAIResAdHocSquadMgrPlayer_D0'
    begin object name=LPAIResAdHocSquadMgrPlayer_D0 class=Class'LPAIResAdHocSquadMgrPlayer'
        MaxUsers=100
        Red=0
    end object
    AIResAdHocSquadMgr=LPAIResAdHocSquadMgrPlayer_D0
    DefenderHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnDefender',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResHumanSoldierSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResHumanSoldierSurroungFormationPlayer'
    begin object name=LPAIResHumanSoldierSurroungFormationPlayer class=Class'LPAIResHumanSoldierSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=128
        Blue=128
    end object
    AIResourceHumanSoldierMeleeFormation=LPAIResHumanSoldierSurroungFormationPlayer
    // Reference: LPAIResHumanSoldierFirePlayer'Default__LPAIResManPlayer.LPAIResHumanSoldierFirePlayer'
    begin object name=LPAIResHumanSoldierFirePlayer class=Class'LPAIResHumanSoldierFirePlayer'
    end object
    AIResourceHumanSoldierPlayer=LPAIResHumanSoldierFirePlayer
    // Reference: LPAIResHumanSoldierStrike'Default__LPAIResManPlayer.LPAIResHumanSoldierStrike'
    begin object name=LPAIResHumanSoldierStrike class=Class'LPAIResHumanSoldierStrike'
    end object
    AIResourceHumanSoldierStrike=LPAIResHumanSoldierStrike
    // Reference: LPAITimerHSStrike'Default__LPAIResManPlayer.LPAITimerHSMinStrikeTime'
    begin object name=LPAITimerHSMinStrikeTime class=Class'LPAITimerHSStrike'
        UniqueName="HSMinTimeNoAttack"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerHumanSoldierMinTimeNoMelee=LPAITimerHSMinStrikeTime
    HumanSoldierHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnHumanSoldier',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResDongoSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResDongoSurroundFormation_Player'
    begin object name=LPAIResDongoSurroundFormation_Player class=Class'LPAIResDongoSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResDongoSurroundFormation=LPAIResDongoSurroundFormation_Player
    // Reference: LPAITimerDongoStrikePlayer'Default__LPAIResManPlayer.LPAITimerDongoStrikePlayer'
    begin object name=LPAITimerDongoStrikePlayer class=Class'LPAITimerDongoStrikePlayer'
        UniqueName="DongoStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoStrike=LPAITimerDongoStrikePlayer
    // Reference: LPAITimerDongoWithDrawAndChargePlayer'Default__LPAIResManPlayer.AITimerDongoWithDrawAndCharge'
    begin object name=AITimerDongoWithDrawAndCharge class=Class'LPAITimerDongoWithDrawAndChargePlayer'
        UniqueName="DongoWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoWithDrawAndCharge=AITimerDongoWithDrawAndCharge
    // Reference: LPAITimerDongoFrenzyAttack'Default__LPAIResManPlayer.LPAITimerDongoFrenzyAttack'
    begin object name=LPAITimerDongoFrenzyAttack class=Class'LPAITimerDongoFrenzyAttack'
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoFrenzyAttack=LPAITimerDongoFrenzyAttack
    DongoHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnDongo',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResCarrierLoiterFormationPlayer'Default__LPAIResManPlayer.LPAIResCarrierLoiterFormationPlayer'
    begin object name=LPAIResCarrierLoiterFormationPlayer class=Class'LPAIResCarrierLoiterFormationPlayer'
    end object
    AIResCarrierLoiterFormation=LPAIResCarrierLoiterFormationPlayer
    // Reference: LPAIResCarrierDefenderCombatManagerPlayer'Default__LPAIResManPlayer.LPAIResCarrierDefenderCombatManagerPlayer'
    begin object name=LPAIResCarrierDefenderCombatManagerPlayer class=Class'LPAIResCarrierDefenderCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=40
    end object
    AIResCarrierDefenderCombatManager=LPAIResCarrierDefenderCombatManagerPlayer
    // Reference: LPAIResDefenderCarrierSupportCombatManagerPlayer'Default__LPAIResManPlayer.LPAIResDefenderCarrierSupportCombatManagerPlayer'
    begin object name=LPAIResDefenderCarrierSupportCombatManagerPlayer class=Class'LPAIResDefenderCarrierSupportCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=40
    end object
    AIResDefenderCarrierSupportCombatManager=LPAIResDefenderCarrierSupportCombatManagerPlayer
    // Reference: LPAIResourceDefenderStrike'Default__LPAIResManPlayer.LPAIResourceDefenderStrike'
    begin object name=LPAIResourceDefenderStrike class=Class'LPAIResourceDefenderStrike'
    end object
    AIResourceDefenderStrike=LPAIResourceDefenderStrike
    CarrierHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnCarrier',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResStalkerFirePlayer'Default__LPAIResManPlayer.LPAIResStalkerFirePlayer'
    begin object name=LPAIResStalkerFirePlayer class=Class'LPAIResStalkerFirePlayer'
    end object
    AIResourceStalkerFirePlayer=LPAIResStalkerFirePlayer
    // Reference: LPAIResStalkerStrike'Default__LPAIResManPlayer.LPAIResStalkerStrike'
    begin object name=LPAIResStalkerStrike class=Class'LPAIResStalkerStrike'
    end object
    AIResourceStalkerStrike=LPAIResStalkerStrike
    // Reference: LPAITimerStalkerStrike'Default__LPAIResManPlayer.LPAITimerStalkerMinStrikeTime'
    begin object name=LPAITimerStalkerMinStrikeTime class=Class'LPAITimerStalkerStrike'
        UniqueName="StalkerMinTimeNoAttack"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerStalkerMinTimeNoAttack=LPAITimerStalkerMinStrikeTime
    // Reference: LPAITimerStalkerStrike'Default__LPAIResManPlayer.LPAITimerStalkerMaxStrikeTime'
    begin object name=LPAITimerStalkerMaxStrikeTime class=Class'LPAITimerStalkerStrike'
        UniqueName="StalkerMaxTimeHaveToAttack"
        CountDownTimeMin=7.0000000
        CountDownTimeMax=10.0000000
    end object
    AITimerStalkerMaxTimeHaveToAttack=LPAITimerStalkerMaxStrikeTime
    StalkerHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnStalker',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResSpitterRangedFormationPlayer'Default__LPAIResManPlayer.LPAIResSpitterRangedFormationPlayer'
    begin object name=LPAIResSpitterRangedFormationPlayer class=Class'LPAIResSpitterRangedFormationPlayer'
    end object
    AIResSpitterRangedFormationPlayer=LPAIResSpitterRangedFormationPlayer
    // Reference: LPAIResSpitterFire'Default__LPAIResManPlayer.LPAIResSpitterFire'
    begin object name=LPAIResSpitterFire class=Class'LPAIResSpitterFire'
    end object
    AIResourceSpitterFire=LPAIResSpitterFire
    SpitterHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnSpitter',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResVsLarocheSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResVsLarocheSurroundFormationPlayer'
    begin object name=LPAIResVsLarocheSurroundFormationPlayer class=Class'LPAIResVsLarocheSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=128
        Blue=128
    end object
    AIResVsLarocheLoiterFormation=LPAIResVsLarocheSurroundFormationPlayer
    VsLarocheHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnVsLaroche',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResVSISSSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResVSISSSurroundFormationPlayer'
    begin object name=LPAIResVSISSSurroundFormationPlayer class=Class'LPAIResVSISSSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=128
        Blue=128
    end object
    AIResourceVSISSFormation=LPAIResVSISSSurroundFormationPlayer
    VSISSHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnVSISS',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResSentinelCombatManagerPlayer'Default__LPAIResManPlayer.LPAIResSentinelCombatManager_Player'
    begin object name=LPAIResSentinelCombatManager_Player class=Class'LPAIResSentinelCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResSentinelCombatManager=LPAIResSentinelCombatManager_Player
    // Reference: LPAIResSentinelSearch'Default__LPAIResManPlayer.LPAIResSentinelSearch'
    begin object name=LPAIResSentinelSearch class=Class'LPAIResSentinelSearch'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResourceSentinelSearch=LPAIResSentinelSearch
    // Reference: LPAIResSentinelStealthStrike'Default__LPAIResManPlayer.LPAIResSentinelSearchStrike'
    begin object name=LPAIResSentinelSearchStrike class=Class'LPAIResSentinelStealthStrike'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResSentinelStealthStrike=LPAIResSentinelSearchStrike
    SentinelHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnSentinel',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResBurrowerStaticMeleeFormationPlayer'Default__LPAIResManPlayer.LPAIResBurrowerStaticMeleeFormationPlayer'
    begin object name=LPAIResBurrowerStaticMeleeFormationPlayer class=Class'LPAIResBurrowerStaticMeleeFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResBurrowerStaticMeleeFormation=LPAIResBurrowerStaticMeleeFormationPlayer
    // Reference: LPAIResBurrowerStrikePlayer'Default__LPAIResManPlayer.LPAIResBurrowerStrikePlayer_DO'
    begin object name=LPAIResBurrowerStrikePlayer_DO class=Class'LPAIResBurrowerStrikePlayer'
        MaxUsers=2
        Red=0
    end object
    AIResBurrowerStrike=LPAIResBurrowerStrikePlayer_DO
    // Reference: LPAITimerBurrowerStrikePlayer'Default__LPAIResManPlayer.LPAITimerBurrowerStrikePlayer'
    begin object name=LPAITimerBurrowerStrikePlayer class=Class'LPAITimerBurrowerStrikePlayer'
        UniqueName="BurrowerStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerBurrowerStrike=LPAITimerBurrowerStrikePlayer
    // Reference: LPAIResBurrowerCombatManagerPlayer'Default__LPAIResManPlayer.LPAIResBurrowerCombatManagerPlayer'
    begin object name=LPAIResBurrowerCombatManagerPlayer class=Class'LPAIResBurrowerCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResBurrowerCombatManager=LPAIResBurrowerCombatManagerPlayer
    BurrowerHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnBurrower',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
    // Reference: LPAIResPhadyrSurroundFormationPlayer'Default__LPAIResManPlayer.LPAIResPhadyrSurroundFormationPlayerD0'
    begin object name=LPAIResPhadyrSurroundFormationPlayerD0 class=Class'LPAIResPhadyrSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResPhadyrSurroundFormation=LPAIResPhadyrSurroundFormationPlayerD0
    // Reference: LPAITimerPhadyrStrikePlayer'Default__LPAIResManPlayer.LPAITimerPhadyrStrikePlayer'
    begin object name=LPAITimerPhadyrStrikePlayer class=Class'LPAITimerPhadyrStrikePlayer'
        UniqueName="PhadyrStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerPhadyrStrike=LPAITimerPhadyrStrikePlayer
    PhadyHotloadAiResources=(bSetup=false,bHotloaded=false,AIClassForHotLoad=Class'LPAIPawnPhadyr',ResourcesToHotload=none,ResourceGroupsToHotload=none,CountdownTimersToHotload=none)
}