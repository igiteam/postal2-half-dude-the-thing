class LPAIResManHuman extends LPAIResourceManager
    editinlinenew;

const OverLapPriority_Leech = 10;
const OverLapPriority_Phadyr = 10;
const OverLapPriority_PackHunter = 20;
const OverLapPriority_IceCrab = 30;
const OverLapPriority_MedFlyer = 10;
const OverLapPriority_Sepia = 10;
const OverLapPriority_VsLaroche = 30;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStruggle[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceLeechStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceLeechAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaLobStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaMassRetreatMgr[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResAdHocSquadMgr[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPackHunterMelee[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPackHunterAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPackHunterTimeInPaternBeforeFirstAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPackHunterCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResIceCrabStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabDismemberedWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerCrabTauntAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResIceLeechStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerLeechStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerLeechStruggleMode[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResPhadyrSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerPhadyrStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResMedFlyerSurroundOrbitFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderSwarmOrbitFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResNushiSporeSwarmFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResFireWaspFromOrbitSlotEngagement[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderRogueFromOrbitSlotEngagement[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResNushiSporeFromOrbitSlotEngagement[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerStaticMeleeFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerBurrowerStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSentinelCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSentinelSearch[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSentinelStealthStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDongoSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoWithDrawAndCharge[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AITimerDongoFrenzyAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResCarrierLoiterFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResCarrierDefenderCombatManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceHumanSoldierFire[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceHumanSoldierStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSpitterRangedFormationPlayer[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResVsLarocheSurroundFormation[537395201];

event Init()
{
    AddResource(AIResourceStrike);
    AddResource(AIResourceStruggle);
    AddResourceGroup(AIResIceCrabStaticMeleeFormation);
    AddTimer(AITimerCrabStrike);
    AddTimer(AITimerCrabWithDrawAndCharge);
    AddTimer(AITimerCrabDismemberedWithDrawAndCharge);
    AddTimer(AITimerCrabTauntAttack);
    AddResourceGroup(AIResPackHunterMelee);
    AddTimer(AITimerPackHunterAttack);
    AddTimer(AITimerPackHunterTimeInPaternBeforeFirstAttack);
    AddResource(AIResPackHunterCombatManager);
    AddResourceGroup(AIResIceLeechStaticMeleeFormation);
    AddTimer(AITimerLeechStrike);
    AddTimer(AITimerLeechStruggleMode);
    AddResource(AIResourceLeechStrike);
    AddResource(AIResourceLeechAttack);
    AddResourceGroup(AIResSepiaSurroundFormation);
    AddResource(AIResourceSepiaAttack);
    AddResource(AIResourceSepiaStrike);
    AddResource(AIResourceSepiaLobStrike);
    AddResource(AIResSepiaMassRetreatMgr);
    AddResource(AIResAdHocSquadMgr);
    AddResourceGroup(AIResMedFlyerSurroundOrbitFormation);
    AddResourceGroup(AIResDefenderSwarmOrbitFormation);
    AddResourceGroup(AIResNushiSporeSwarmFormation);
    AddResource(AIResFireWaspFromOrbitSlotEngagement);
    AddResource(AIResDefenderRogueFromOrbitSlotEngagement);
    AddResource(AIResNushiSporeFromOrbitSlotEngagement);
    AddResourceGroup(AIResPhadyrSurroundFormation);
    AddTimer(AITimerPhadyrStrike);
    AddResourceGroup(AIResBurrowerStaticMeleeFormation);
    AddResource(AIResBurrowerStrike);
    AddTimer(AITimerBurrowerStrike);
    AddResource(AIResSentinelCombatManager);
    AddResource(AIResourceSentinelSearch);
    AddResource(AIResSentinelStealthStrike);
    AddResourceGroup(AIResDongoSurroundFormation);
    AddTimer(AITimerDongoStrike);
    AddTimer(AITimerDongoWithDrawAndCharge);
    AddTimer(AITimerDongoFrenzyAttack);
    AddResourceGroup(AIResCarrierLoiterFormation);
    AddResource(AIResCarrierDefenderCombatManager);
    AddResource(AIResourceHumanSoldierFire);
    AddResource(AIResourceHumanSoldierStrike);
    AddResourceGroup(AIResSpitterRangedFormationPlayer);
    AddResourceGroup(AIResVsLarocheSurroundFormation);
    super(SPAIResourceManager).Init();
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

defaultproperties
{
    // Reference: LPAIResourceStrike'Default__LPAIResManHuman.SPAIResource_Strike'
    begin object name=SPAIResource_Strike class=Class'LPAIResourceStrike'
        Red=0
    end object
    AIResourceStrike=SPAIResource_Strike
    // Reference: LPAIResourceStruggle'Default__LPAIResManHuman.SPAIResource_Struggle'
    begin object name=SPAIResource_Struggle class=Class'LPAIResourceStruggle'
        Red=1
    end object
    AIResourceStruggle=SPAIResource_Struggle
    // Reference: LPAIResLeechStrikeHumanNPC'Default__LPAIResManHuman.LPAIResourceDensityControlledStrike_DO'
    begin object name=LPAIResourceDensityControlledStrike_DO class=Class'LPAIResLeechStrikeHumanNPC'
        MaxUsers=10
        Red=0
    end object
    AIResourceLeechStrike=LPAIResourceDensityControlledStrike_DO
    // Reference: LPAIResourceLeechAttackHumanNPC'Default__LPAIResManHuman.LPAIResourceLeechAttack'
    begin object name=LPAIResourceLeechAttack class=Class'LPAIResourceLeechAttackHumanNPC'
        Attributes=(Radius=100.0000000,Height=100.0000000)
        Red=0
    end object
    AIResourceLeechAttack=LPAIResourceLeechAttack
    // Reference: LPAIResSepiaStrikeHumanNPC'Default__LPAIResManHuman.LPAIResourceSepiaDensityControlledStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledStrike_DO class=Class'LPAIResSepiaStrikeHumanNPC'
        Red=0
    end object
    AIResourceSepiaStrike=LPAIResourceSepiaDensityControlledStrike_DO
    // Reference: LPAIResSepiaLobStrikePlayer'Default__LPAIResManHuman.LPAIResourceSepiaDensityControlledLobStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledLobStrike_DO class=Class'LPAIResSepiaLobStrikePlayer'
        UniqueName="SepiaLobStrike"
        Red=0
    end object
    AIResourceSepiaLobStrike=LPAIResourceSepiaDensityControlledLobStrike_DO
    // Reference: LPAIResourceSepiaAttackHumanNPC'Default__LPAIResManHuman.LPAIResourceSepiaAttack'
    begin object name=LPAIResourceSepiaAttack class=Class'LPAIResourceSepiaAttackHumanNPC'
        Attributes=(Radius=100.0000000,Height=100.0000000)
        Red=0
    end object
    AIResourceSepiaAttack=LPAIResourceSepiaAttack
    // Reference: LPAIResSepiaMassRetreatMgrHumanNPC'Default__LPAIResManHuman.LPAIResSepiaMassRetreatMgrHumanNPC_D0'
    begin object name=LPAIResSepiaMassRetreatMgrHumanNPC_D0 class=Class'LPAIResSepiaMassRetreatMgrHumanNPC'
        Red=0
    end object
    AIResSepiaMassRetreatMgr=LPAIResSepiaMassRetreatMgrHumanNPC_D0
    // Reference: LPAIResAdHocSquadMgrHumanNPC'Default__LPAIResManHuman.LPAIResAdHocSquadMgrHumanNPC_D0'
    begin object name=LPAIResAdHocSquadMgrHumanNPC_D0 class=Class'LPAIResAdHocSquadMgrHumanNPC'
        MaxUsers=100
        Red=0
    end object
    AIResAdHocSquadMgr=LPAIResAdHocSquadMgrHumanNPC_D0
    // Reference: LPAIResPackHunterSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResPackHunterSurroundFormation_HumanNPC'
    begin object name=LPAIResPackHunterSurroundFormation_HumanNPC class=Class'LPAIResPackHunterSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResPackHunterMelee=LPAIResPackHunterSurroundFormation_HumanNPC
    // Reference: LPAITimerPackHunterAttackHumanNPC'Default__LPAIResManHuman.LPAITimerPackHunterAttackHumanNPC'
    begin object name=LPAITimerPackHunterAttackHumanNPC class=Class'LPAITimerPackHunterAttackHumanNPC'
        UniqueName="PackHunterAttackTimer"
    end object
    AITimerPackHunterAttack=LPAITimerPackHunterAttackHumanNPC
    // Reference: LPAITimerPackHunterTimeInPaternBeforeFirstAttackHumanNPC'Default__LPAIResManHuman.AITimerPackHunterTimeInPaternBeforeFirstAttackHumanNPC'
    begin object name=AITimerPackHunterTimeInPaternBeforeFirstAttackHumanNPC class=Class'LPAITimerPackHunterTimeInPaternBeforeFirstAttackHumanNPC'
        UniqueName="PackHunterTimeInPaternBeforeFirstAttackTimer"
    end object
    AITimerPackHunterTimeInPaternBeforeFirstAttack=AITimerPackHunterTimeInPaternBeforeFirstAttackHumanNPC
    // Reference: LPAIResPackHunterCombatManagerHumanNPC'Default__LPAIResManHuman.LPAIResPackHunterStaticEngagement_HumanNPC'
    begin object name=LPAIResPackHunterStaticEngagement_HumanNPC class=Class'LPAIResPackHunterCombatManagerHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResPackHunterCombatManager=LPAIResPackHunterStaticEngagement_HumanNPC
    // Reference: LPAIResIceCrabStaticMeleeFormationHumanNPC'Default__LPAIResManHuman.LPAIResIceCrabStaticMeleeFormationHumanNPC'
    begin object name=LPAIResIceCrabStaticMeleeFormationHumanNPC class=Class'LPAIResIceCrabStaticMeleeFormationHumanNPC'
        Attributes=(OverlapPriority=30)
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResIceCrabStaticMeleeFormation=LPAIResIceCrabStaticMeleeFormationHumanNPC
    // Reference: LPAITimerCrabStrikeHumanNPC'Default__LPAIResManHuman.LPAITimerCrabStrikeHumanNPC'
    begin object name=LPAITimerCrabStrikeHumanNPC class=Class'LPAITimerCrabStrikeHumanNPC'
        UniqueName="IceCrabStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabStrike=LPAITimerCrabStrikeHumanNPC
    // Reference: LPAITimerCrabWithDrawAndChargeHumanNPC'Default__LPAIResManHuman.AITimerCrabWithDrawAndCharge'
    begin object name=AITimerCrabWithDrawAndCharge class=Class'LPAITimerCrabWithDrawAndChargeHumanNPC'
        UniqueName="IceCrabWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabWithDrawAndCharge=AITimerCrabWithDrawAndCharge
    // Reference: LPAITimerCrabDismemberedWithDrawAndChargeHumanNPC'Default__LPAIResManHuman.AITimerCrabDismemberedWithDrawAndCharge'
    begin object name=AITimerCrabDismemberedWithDrawAndCharge class=Class'LPAITimerCrabDismemberedWithDrawAndChargeHumanNPC'
        UniqueName="IceCrabDismemberedWithdrawChargeTimerPoF"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabDismemberedWithDrawAndCharge=AITimerCrabDismemberedWithDrawAndCharge
    // Reference: LPAITimerCrabTauntAttackHumanNPC'Default__LPAIResManHuman.AITimerCrabTauntAttack'
    begin object name=AITimerCrabTauntAttack class=Class'LPAITimerCrabTauntAttackHumanNPC'
        UniqueName="IceCrabTauntAttackTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabTauntAttack=AITimerCrabTauntAttack
    // Reference: LPAIResIceLeechStaticMeleeFormationHumanNPC'Default__LPAIResManHuman.LPAIResIceLeechStaticMeleeFormationHumanNPC'
    begin object name=LPAIResIceLeechStaticMeleeFormationHumanNPC class=Class'LPAIResIceLeechStaticMeleeFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResIceLeechStaticMeleeFormation=LPAIResIceLeechStaticMeleeFormationHumanNPC
    // Reference: LPAITimerLeechStrikeHumanNPC'Default__LPAIResManHuman.LPAITimerLeechStrikeHumanNPC'
    begin object name=LPAITimerLeechStrikeHumanNPC class=Class'LPAITimerLeechStrikeHumanNPC'
        UniqueName="LeechStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerLeechStrike=LPAITimerLeechStrikeHumanNPC
    // Reference: LPAITimerLeechStruggleModeHumanNPC'Default__LPAIResManHuman.LPAITimerLeechStruggleModeHumanNPC'
    begin object name=LPAITimerLeechStruggleModeHumanNPC class=Class'LPAITimerLeechStruggleModeHumanNPC'
        UniqueName="LeechStruggleModeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerLeechStruggleMode=LPAITimerLeechStruggleModeHumanNPC
    // Reference: LPAIResSepiaSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResSepiaSurroundFormationHumanNPCD0'
    begin object name=LPAIResSepiaSurroundFormationHumanNPCD0 class=Class'LPAIResSepiaSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResSepiaSurroundFormation=LPAIResSepiaSurroundFormationHumanNPCD0
    // Reference: LPAIResPhadyrSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResPhadyrSurroundFormationHumanNPCD0'
    begin object name=LPAIResPhadyrSurroundFormationHumanNPCD0 class=Class'LPAIResPhadyrSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResPhadyrSurroundFormation=LPAIResPhadyrSurroundFormationHumanNPCD0
    // Reference: LPAITimerPhadyrStrikeHumanNPC'Default__LPAIResManHuman.LPAITimerPhadyrStrikeHumanNPC'
    begin object name=LPAITimerPhadyrStrikeHumanNPC class=Class'LPAITimerPhadyrStrikeHumanNPC'
        UniqueName="PhadyrStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerPhadyrStrike=LPAITimerPhadyrStrikeHumanNPC
    // Reference: LPAIResMedFlyerSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResMedFlyerSurroundFormationHumanNPC'
    begin object name=LPAIResMedFlyerSurroundFormationHumanNPC class=Class'LPAIResMedFlyerSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResMedFlyerSurroundOrbitFormation=LPAIResMedFlyerSurroundFormationHumanNPC
    // Reference: LPAIResDefenderSwarmFormationHumanNPC'Default__LPAIResManHuman.LPAIResDefenderSwarmFormationHumanNPC'
    begin object name=LPAIResDefenderSwarmFormationHumanNPC class=Class'LPAIResDefenderSwarmFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResDefenderSwarmOrbitFormation=LPAIResDefenderSwarmFormationHumanNPC
    // Reference: LPAIResNushiSporeSwarmFormationHumanNPC'Default__LPAIResManHuman.LPAIResNushiSporeSwarmFormationHumanNPC'
    begin object name=LPAIResNushiSporeSwarmFormationHumanNPC class=Class'LPAIResNushiSporeSwarmFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResNushiSporeSwarmFormation=LPAIResNushiSporeSwarmFormationHumanNPC
    // Reference: LPAIResFireWaspFromOrbitSlotEngagementHumanNPC'Default__LPAIResManHuman.LPAIResFireWaspFromOrbitSlotEngagementHumanNPC'
    begin object name=LPAIResFireWaspFromOrbitSlotEngagementHumanNPC class=Class'LPAIResFireWaspFromOrbitSlotEngagementHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResFireWaspFromOrbitSlotEngagement=LPAIResFireWaspFromOrbitSlotEngagementHumanNPC
    // Reference: LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC'Default__LPAIResManHuman.LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC'
    begin object name=LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC class=Class'LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResDefenderRogueFromOrbitSlotEngagement=LPAIResDefenderRogueFromOrbitSlotEngagementHumanNPC
    // Reference: LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC'Default__LPAIResManHuman.LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC'
    begin object name=LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC class=Class'LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=40
    end object
    AIResNushiSporeFromOrbitSlotEngagement=LPAIResNushiSporeFromOrbitSlotEngagementHumanNPC
    // Reference: LPAIResBurrowerStaticMeleeFormationHumanNPC'Default__LPAIResManHuman.LPAIResBurrowerStaticMeleeFormationHumanNPC'
    begin object name=LPAIResBurrowerStaticMeleeFormationHumanNPC class=Class'LPAIResBurrowerStaticMeleeFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResBurrowerStaticMeleeFormation=LPAIResBurrowerStaticMeleeFormationHumanNPC
    // Reference: LPAIResBurrowerStrikeHumanNPC'Default__LPAIResManHuman.LPAIResBurrowerStrikeHumanNPC_DO'
    begin object name=LPAIResBurrowerStrikeHumanNPC_DO class=Class'LPAIResBurrowerStrikeHumanNPC'
        Red=0
    end object
    AIResBurrowerStrike=LPAIResBurrowerStrikeHumanNPC_DO
    // Reference: LPAITimerBurrowerStrikeHumanNPC'Default__LPAIResManHuman.LPAITimerBurrowerStrikeHumanNPC'
    begin object name=LPAITimerBurrowerStrikeHumanNPC class=Class'LPAITimerBurrowerStrikeHumanNPC'
        UniqueName="BurrowerStrikeTimer"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerBurrowerStrike=LPAITimerBurrowerStrikeHumanNPC
    // Reference: LPAIResSentinelCombatManagerPlayer'Default__LPAIResManHuman.LPAIResSentinelCombatManager_HumanNPC'
    begin object name=LPAIResSentinelCombatManager_HumanNPC class=Class'LPAIResSentinelCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResSentinelCombatManager=LPAIResSentinelCombatManager_HumanNPC
    // Reference: LPAIResSentinelSearch'Default__LPAIResManHuman.LPAIResSentinelSearch'
    begin object name=LPAIResSentinelSearch class=Class'LPAIResSentinelSearch'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResourceSentinelSearch=LPAIResSentinelSearch
    // Reference: LPAIResSentinelStealthStrike'Default__LPAIResManHuman.LPAIResSentinelSearchStrike'
    begin object name=LPAIResSentinelSearchStrike class=Class'LPAIResSentinelStealthStrike'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResSentinelStealthStrike=LPAIResSentinelSearchStrike
    // Reference: LPAIResDongoSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResDongoSurroundFormation_HumanNPC'
    begin object name=LPAIResDongoSurroundFormation_HumanNPC class=Class'LPAIResDongoSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResDongoSurroundFormation=LPAIResDongoSurroundFormation_HumanNPC
    // Reference: LPAITimerDongoStrikeHumanNPC'Default__LPAIResManHuman.LPAITimerDongoStrikeHumanNPC'
    begin object name=LPAITimerDongoStrikeHumanNPC class=Class'LPAITimerDongoStrikeHumanNPC'
        UniqueName="DongoStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoStrike=LPAITimerDongoStrikeHumanNPC
    // Reference: LPAITimerDongoWithDrawAndChargeHumanNPC'Default__LPAIResManHuman.AITimerDongoWithDrawAndCharge'
    begin object name=AITimerDongoWithDrawAndCharge class=Class'LPAITimerDongoWithDrawAndChargeHumanNPC'
        UniqueName="DongoWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoWithDrawAndCharge=AITimerDongoWithDrawAndCharge
    // Reference: LPAITimerDongoFrenzyAttack'Default__LPAIResManHuman.LPAITimerDongoFrenzyAttack'
    begin object name=LPAITimerDongoFrenzyAttack class=Class'LPAITimerDongoFrenzyAttack'
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoFrenzyAttack=LPAITimerDongoFrenzyAttack
    // Reference: LPAIResCarrierLoiterFormationHumanNpc'Default__LPAIResManHuman.LPAIResCarrierLoiterFormation'
    begin object name=LPAIResCarrierLoiterFormation class=Class'LPAIResCarrierLoiterFormationHumanNpc'
    end object
    AIResCarrierLoiterFormation=LPAIResCarrierLoiterFormation
    // Reference: LPAIResCarrierDefenderCombatManagerHumanNPC'Default__LPAIResManHuman.LPAIResCarrierDefenderCombatManagerHumanNPC_HumanNPC'
    begin object name=LPAIResCarrierDefenderCombatManagerHumanNPC_HumanNPC class=Class'LPAIResCarrierDefenderCombatManagerHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResCarrierDefenderCombatManager=LPAIResCarrierDefenderCombatManagerHumanNPC_HumanNPC
    // Reference: LPAIResHumanSoldierFireHumanNPC'Default__LPAIResManHuman.LPAIResHumanSoldierFireHumanNPC'
    begin object name=LPAIResHumanSoldierFireHumanNPC class=Class'LPAIResHumanSoldierFireHumanNPC'
    end object
    AIResourceHumanSoldierFire=LPAIResHumanSoldierFireHumanNPC
    // Reference: LPAIResHumanSoldierStrike'Default__LPAIResManHuman.LPAIResHumanSoldierStrike'
    begin object name=LPAIResHumanSoldierStrike class=Class'LPAIResHumanSoldierStrike'
    end object
    AIResourceHumanSoldierStrike=LPAIResHumanSoldierStrike
    // Reference: LPAIResSpitterRangedFormationPlayer'Default__LPAIResManHuman.LPAIResSpitterRangedFormationPlayer'
    begin object name=LPAIResSpitterRangedFormationPlayer class=Class'LPAIResSpitterRangedFormationPlayer'
    end object
    AIResSpitterRangedFormationPlayer=LPAIResSpitterRangedFormationPlayer
    // Reference: LPAIResVsLarocheSurroundFormationHumanNPC'Default__LPAIResManHuman.LPAIResVsLarocheSurroundFormationHumanNPC'
    begin object name=LPAIResVsLarocheSurroundFormationHumanNPC class=Class'LPAIResVsLarocheSurroundFormationHumanNPC'
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResVsLarocheSurroundFormation=LPAIResVsLarocheSurroundFormationHumanNPC
}