class LPAIResManPlayerMP extends LPAIResManPlayer
    editinlinenew;

event AddNeededDefaultResources()
{
    // End:0x2F
    if(Resource.Find(AIResourceStrike) < )
    {        
        AddResource(AIResourceStrike);
    }
    SetupResourcesFromTuneData();
    //return;    
}

function SetupSepia()
{
    // End:0xE5
    if(!SepiaHotloadAiResources.bSetup)
    {
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaStrike);        
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaLobStrike);        
        SepiaHotloadAiResources.ResourcesToHotload.AddItem(AIResourceSepiaAttack);        
        SepiaHotloadAiResources.ResourceGroupsToHotload.AddItem(AIResSepiaSurroundFormation);        
        SepiaHotloadAiResources.bSetup = true;
    }
    //return;    
}

function SetupSnowCrab()
{
    // End:0xC6
    if(!IceCrabHotloadAiResources.bSetup)
    {
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabStrike);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabWithDrawAndCharge);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabDismemberedWithDrawAndCharge);        
        IceCrabHotloadAiResources.CountdownTimersToHotload.AddItem(AITimerCrabTauntAttack);        
    }
    //return;    
}

event Update()
{
    super.Update();
    //return;    
}

defaultproperties
{
    // Reference: LPAIResourceStrike'Default__LPAIResManPlayerMP.SPAIResource_Strike'
    begin object name=SPAIResource_Strike class=Class'LPAIResourceStrike'
        Red=0
    end object
    AIResourceStrike=SPAIResource_Strike
    // Reference: LPAIResourceStruggle'Default__LPAIResManPlayerMP.SPAIResource_Struggle'
    begin object name=SPAIResource_Struggle
    end object
    AIResourceStruggle=SPAIResource_Struggle
    // Reference: LPAITimerGlobalStruggle'Default__LPAIResManPlayerMP.LPAITimerStruggle'
    begin object name=LPAITimerStruggle
    end object
    AITimerStruggle=LPAITimerStruggle
    // Reference: LPAIResLeechStrikePlayer'Default__LPAIResManPlayerMP.LPAIResourceDensityControlledStrike_DO'
    begin object name=LPAIResourceDensityControlledStrike_DO
    end object
    AIResourceLeechStrike=LPAIResourceDensityControlledStrike_DO
    // Reference: LPAIResourceLeechAttackPlayer'Default__LPAIResManPlayerMP.LPAIResourceLeechAttack'
    begin object name=LPAIResourceLeechAttack
    end object
    AIResourceLeechAttack=LPAIResourceLeechAttack
    // Reference: LPAIResIceLeechStaticMeleeFormationPlayer'Default__LPAIResManPlayerMP.LPAIResIceLeechStaticMeleeFormationPlayer'
    begin object name=LPAIResIceLeechStaticMeleeFormationPlayer
    end object
    AIResIceLeechStaticMeleeFormation=LPAIResIceLeechStaticMeleeFormationPlayer
    // Reference: LPAITimerLeechStrikePlayer'Default__LPAIResManPlayerMP.LPAITimerLeechStrikePlayer'
    begin object name=LPAITimerLeechStrikePlayer
    end object
    AITimerLeechStrike=LPAITimerLeechStrikePlayer
    // Reference: LPAITimerLeechStruggleModePlayer'Default__LPAIResManPlayerMP.LPAITimerLeechStruggleModePlayer'
    begin object name=LPAITimerLeechStruggleModePlayer
    end object
    AITimerLeechStruggleMode=LPAITimerLeechStruggleModePlayer
    // Reference: LPAIResPackHunterSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResPackHunterSurroundFormation_Player'
    begin object name=LPAIResPackHunterSurroundFormation_Player class=Class'LPAIResPackHunterSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResPackHunterMelee=LPAIResPackHunterSurroundFormation_Player
    // Reference: LPAITimerPackHunterAttackPlayer'Default__LPAIResManPlayerMP.LPAITimerPackHunterAttackPlayer'
    begin object name=LPAITimerPackHunterAttackPlayer class=Class'LPAITimerPackHunterAttackPlayer'
        UniqueName="PackHunterAttackTimer"
    end object
    AITimerPackHunterAttack=LPAITimerPackHunterAttackPlayer
    // Reference: LPAITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'Default__LPAIResManPlayerMP.AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'
    begin object name=AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer class=Class'LPAITimerPackHunterTimeInPaternBeforeFirstAttackPlayer'
        UniqueName="PackHunterTimeInPaternBeforeFirstAttackTimer"
    end object
    AITimerPackHunterTimeInPaternBeforeFirstAttack=AITimerPackHunterTimeInPaternBeforeFirstAttackPlayer
    // Reference: LPAIResPackHunterCombatManagerPlayer'Default__LPAIResManPlayerMP.LPAIResPackHunterStaticEngagement_Player'
    begin object name=LPAIResPackHunterStaticEngagement_Player class=Class'LPAIResPackHunterCombatManagerPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResPackHunterCombatManager=LPAIResPackHunterStaticEngagement_Player
    // Reference: LPAIResIceCrabStaticMeleeFormationPlayer'Default__LPAIResManPlayerMP.LPAIResIceCrabStaticMeleeFormationPlayer'
    begin object name=LPAIResIceCrabStaticMeleeFormationPlayer class=Class'LPAIResIceCrabStaticMeleeFormationPlayer'
        Attributes=(OverlapPriority=30)
        AllowedRequesterClass=/* Array type was not detected. */
        Red=0
    end object
    AIResIceCrabStaticMeleeFormation=LPAIResIceCrabStaticMeleeFormationPlayer
    // Reference: LPAITimerCrabStrikePlayer'Default__LPAIResManPlayerMP.LPAITimerCrabStrikePlayer'
    begin object name=LPAITimerCrabStrikePlayer class=Class'LPAITimerCrabStrikePlayer'
        UniqueName="IceCrabStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabStrike=LPAITimerCrabStrikePlayer
    // Reference: LPAITimerCrabWithDrawAndChargePlayer'Default__LPAIResManPlayerMP.AITimerCrabWithDrawAndCharge'
    begin object name=AITimerCrabWithDrawAndCharge class=Class'LPAITimerCrabWithDrawAndChargePlayer'
        UniqueName="IceCrabWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabWithDrawAndCharge=AITimerCrabWithDrawAndCharge
    // Reference: LPAITimerCrabDismemberedWithDrawAndChargePlayer'Default__LPAIResManPlayerMP.AITimerCrabDismemberedWithDrawAndCharge'
    begin object name=AITimerCrabDismemberedWithDrawAndCharge class=Class'LPAITimerCrabDismemberedWithDrawAndChargePlayer'
        UniqueName="IceCrabDismemberedWithdrawChargeTimerPoF"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabDismemberedWithDrawAndCharge=AITimerCrabDismemberedWithDrawAndCharge
    // Reference: LPAITimerCrabTauntAttackPlayer'Default__LPAIResManPlayerMP.AITimerCrabTauntAttack'
    begin object name=AITimerCrabTauntAttack class=Class'LPAITimerCrabTauntAttackPlayer'
        UniqueName="IceCrabTauntAttackTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerCrabTauntAttack=AITimerCrabTauntAttack
    // Reference: LPAIResSepiaStrikePlayer'Default__LPAIResManPlayerMP.LPAIResourceSepiaDensityControlledStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledStrike_DO class=Class'LPAIResSepiaStrikePlayer'
        Red=0
    end object
    AIResourceSepiaStrike=LPAIResourceSepiaDensityControlledStrike_DO
    // Reference: LPAIResSepiaLobStrikePlayer'Default__LPAIResManPlayerMP.LPAIResourceSepiaDensityControlledLobStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledLobStrike_DO class=Class'LPAIResSepiaLobStrikePlayer'
        UniqueName="SepiaLobStrike"
        Red=0
    end object
    AIResourceSepiaLobStrike=LPAIResourceSepiaDensityControlledLobStrike_DO
    // Reference: LPAIResourceSepiaAttackPlayer'Default__LPAIResManPlayerMP.LPAIResourceSepiaAttack'
    begin object name=LPAIResourceSepiaAttack class=Class'LPAIResourceSepiaAttackPlayer'
        Attributes=(Radius=100.0000000,Height=100.0000000)
        Red=0
    end object
    AIResourceSepiaAttack=LPAIResourceSepiaAttack
    // Reference: LPAIResSepiaSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResSepiaSurroundFormationPlayerD0'
    begin object name=LPAIResSepiaSurroundFormationPlayerD0 class=Class'LPAIResSepiaSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResSepiaSurroundFormation=LPAIResSepiaSurroundFormationPlayerD0
    // Reference: LPAIResSepiaMassRetreatMgrPlayer'Default__LPAIResManPlayerMP.LPAIResSepiaMassRetreatMgrPlayer_D0'
    begin object name=LPAIResSepiaMassRetreatMgrPlayer_D0
    end object
    AIResSepiaMassRetreatMgr=LPAIResSepiaMassRetreatMgrPlayer_D0
    // Reference: LPAIResMedFlyerSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResMedFlyerSurroundFormation'
    begin object name=LPAIResMedFlyerSurroundFormation class=Class'LPAIResMedFlyerSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResMedFlyerSurroundOrbitFormation=LPAIResMedFlyerSurroundFormation
    // Reference: LPAIResFireWaspFromOrbitSlotEngagementPlayer'Default__LPAIResManPlayerMP.LPAIResFireWaspFromOrbitSlotEngagementPlayer'
    begin object name=LPAIResFireWaspFromOrbitSlotEngagementPlayer class=Class'LPAIResFireWaspFromOrbitSlotEngagementPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=20
    end object
    AIResFireWaspFromOrbitSlotEngagement=LPAIResFireWaspFromOrbitSlotEngagementPlayer
    // Reference: LPAIResDefenderSwarmFormationPlayer'Default__LPAIResManPlayerMP.LPAIResDefenderSwarmFormationPlayer'
    begin object name=LPAIResDefenderSwarmFormationPlayer
    end object
    AIResDefenderSwarmOrbitFormation=LPAIResDefenderSwarmFormationPlayer
    // Reference: LPAIResDefenderRogueFromOrbitSlotEngagementPlayer'Default__LPAIResManPlayerMP.LPAIResDefenderRogueFromOrbitSlotEngagementPlayer'
    begin object name=LPAIResDefenderRogueFromOrbitSlotEngagementPlayer
    end object
    AIResDefenderRogueFromOrbitSlotEngagement=LPAIResDefenderRogueFromOrbitSlotEngagementPlayer
    // Reference: LPAIResAdHocSquadMgrPlayer'Default__LPAIResManPlayerMP.LPAIResAdHocSquadMgrPlayer_D0'
    begin object name=LPAIResAdHocSquadMgrPlayer_D0
    end object
    AIResAdHocSquadMgr=LPAIResAdHocSquadMgrPlayer_D0
    // Reference: LPAIResHumanSoldierSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResHumanSoldierSurroungFormationPlayer'
    begin object name=LPAIResHumanSoldierSurroungFormationPlayer
    end object
    AIResourceHumanSoldierMeleeFormation=LPAIResHumanSoldierSurroungFormationPlayer
    // Reference: LPAIResHumanSoldierFirePlayer'Default__LPAIResManPlayerMP.LPAIResHumanSoldierFirePlayer'
    begin object name=LPAIResHumanSoldierFirePlayer
    end object
    AIResourceHumanSoldierPlayer=LPAIResHumanSoldierFirePlayer
    // Reference: LPAIResHumanSoldierStrike'Default__LPAIResManPlayerMP.LPAIResHumanSoldierStrike'
    begin object name=LPAIResHumanSoldierStrike
    end object
    AIResourceHumanSoldierStrike=LPAIResHumanSoldierStrike
    // Reference: LPAITimerHSStrike'Default__LPAIResManPlayerMP.LPAITimerHSMinStrikeTime'
    begin object name=LPAITimerHSMinStrikeTime
    end object
    AITimerHumanSoldierMinTimeNoMelee=LPAITimerHSMinStrikeTime
    // Reference: LPAIResDongoSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResDongoSurroundFormation_Player'
    begin object name=LPAIResDongoSurroundFormation_Player class=Class'LPAIResDongoSurroundFormationPlayer'
        AllowedRequesterClass=/* Array type was not detected. */
        Green=255
    end object
    AIResDongoSurroundFormation=LPAIResDongoSurroundFormation_Player
    // Reference: LPAITimerDongoStrikePlayer'Default__LPAIResManPlayerMP.LPAITimerDongoStrikePlayer'
    begin object name=LPAITimerDongoStrikePlayer class=Class'LPAITimerDongoStrikePlayer'
        UniqueName="DongoStrikeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoStrike=LPAITimerDongoStrikePlayer
    // Reference: LPAITimerDongoWithDrawAndChargePlayer'Default__LPAIResManPlayerMP.AITimerDongoWithDrawAndCharge'
    begin object name=AITimerDongoWithDrawAndCharge class=Class'LPAITimerDongoWithDrawAndChargePlayer'
        UniqueName="DongoWithdrawChargeTimer"
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoWithDrawAndCharge=AITimerDongoWithDrawAndCharge
    // Reference: LPAITimerDongoFrenzyAttack'Default__LPAIResManPlayerMP.LPAITimerDongoFrenzyAttack'
    begin object name=LPAITimerDongoFrenzyAttack class=Class'LPAITimerDongoFrenzyAttack'
        CountDownTimeMin=0.5000000
        CountDownTimeMax=1.0000000
    end object
    AITimerDongoFrenzyAttack=LPAITimerDongoFrenzyAttack
    // Reference: LPAIResCarrierLoiterFormationPlayer'Default__LPAIResManPlayerMP.LPAIResCarrierLoiterFormationPlayer'
    begin object name=LPAIResCarrierLoiterFormationPlayer
    end object
    AIResCarrierLoiterFormation=LPAIResCarrierLoiterFormationPlayer
    // Reference: LPAIResCarrierDefenderCombatManagerPlayer'Default__LPAIResManPlayerMP.LPAIResCarrierDefenderCombatManagerPlayer'
    begin object name=LPAIResCarrierDefenderCombatManagerPlayer
    end object
    AIResCarrierDefenderCombatManager=LPAIResCarrierDefenderCombatManagerPlayer
    // Reference: LPAIResDefenderCarrierSupportCombatManagerPlayer'Default__LPAIResManPlayerMP.LPAIResDefenderCarrierSupportCombatManagerPlayer'
    begin object name=LPAIResDefenderCarrierSupportCombatManagerPlayer
    end object
    AIResDefenderCarrierSupportCombatManager=LPAIResDefenderCarrierSupportCombatManagerPlayer
    // Reference: LPAIResourceDefenderStrike'Default__LPAIResManPlayerMP.LPAIResourceDefenderStrike'
    begin object name=LPAIResourceDefenderStrike
    end object
    AIResourceDefenderStrike=LPAIResourceDefenderStrike
    // Reference: LPAIResStalkerFirePlayer'Default__LPAIResManPlayerMP.LPAIResStalkerFirePlayer'
    begin object name=LPAIResStalkerFirePlayer class=Class'LPAIResStalkerFirePlayer'
    end object
    AIResourceStalkerFirePlayer=LPAIResStalkerFirePlayer
    // Reference: LPAIResStalkerStrike'Default__LPAIResManPlayerMP.LPAIResStalkerStrike'
    begin object name=LPAIResStalkerStrike class=Class'LPAIResStalkerStrike'
    end object
    AIResourceStalkerStrike=LPAIResStalkerStrike
    // Reference: LPAITimerStalkerStrike'Default__LPAIResManPlayerMP.LPAITimerStalkerMinStrikeTime'
    begin object name=LPAITimerStalkerMinStrikeTime class=Class'LPAITimerStalkerStrike'
        UniqueName="StalkerMinTimeNoAttack"
        CountDownTimeMin=3.0000000
        CountDownTimeMax=4.0000000
    end object
    AITimerStalkerMinTimeNoAttack=LPAITimerStalkerMinStrikeTime
    // Reference: LPAITimerStalkerStrike'Default__LPAIResManPlayerMP.LPAITimerStalkerMaxStrikeTime'
    begin object name=LPAITimerStalkerMaxStrikeTime class=Class'LPAITimerStalkerStrike'
        UniqueName="StalkerMaxTimeHaveToAttack"
        CountDownTimeMin=7.0000000
        CountDownTimeMax=10.0000000
    end object
    AITimerStalkerMaxTimeHaveToAttack=LPAITimerStalkerMaxStrikeTime
    // Reference: LPAIResSpitterRangedFormationPlayer'Default__LPAIResManPlayerMP.LPAIResSpitterRangedFormationPlayer'
    begin object name=LPAIResSpitterRangedFormationPlayer class=Class'LPAIResSpitterRangedFormationPlayer'
    end object
    AIResSpitterRangedFormationPlayer=LPAIResSpitterRangedFormationPlayer
    // Reference: LPAIResSpitterFire'Default__LPAIResManPlayerMP.LPAIResSpitterFire'
    begin object name=LPAIResSpitterFire class=Class'LPAIResSpitterFire'
    end object
    AIResourceSpitterFire=LPAIResSpitterFire
    AIResVsLarocheLoiterFormation=none
    AIResourceVSISSFormation=none
    AIResSentinelCombatManager=none
    AIResourceSentinelSearch=none
    AIResSentinelStealthStrike=none
    AIResBurrowerStaticMeleeFormation=none
    AIResBurrowerStrike=none
    AITimerBurrowerStrike=none
    AIResBurrowerCombatManager=none
    // Reference: LPAIResPhadyrSurroundFormationPlayer'Default__LPAIResManPlayerMP.LPAIResPhadyrSurroundFormationPlayerD0'
    begin object name=LPAIResPhadyrSurroundFormationPlayerD0
    end object
    AIResPhadyrSurroundFormation=LPAIResPhadyrSurroundFormationPlayerD0
    // Reference: LPAITimerPhadyrStrikePlayer'Default__LPAIResManPlayerMP.LPAITimerPhadyrStrikePlayer'
    begin object name=LPAITimerPhadyrStrikePlayer
    end object
    AITimerPhadyrStrike=LPAITimerPhadyrStrikePlayer
}