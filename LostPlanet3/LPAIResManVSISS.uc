class LPAIResManVSISS extends LPAIResourceManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaLobStrike[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceSepiaAttack[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaMassRetreatMgr[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResSepiaSurroundFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResMedFlyerSurroundOrbitFormation[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResFireWaspFromOrbitSlotEngagement[537395201];

event Init()
{
    AddResource(AIResourceStrike);
    AddResourceGroup(AIResSepiaSurroundFormation);
    AddResource(AIResourceSepiaStrike);
    AddResource(AIResourceSepiaLobStrike);
    AddResource(AIResourceSepiaAttack);
    AddResource(AIResSepiaMassRetreatMgr);
    AddResourceGroup(AIResMedFlyerSurroundOrbitFormation);
    AddResource(AIResFireWaspFromOrbitSlotEngagement);
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

function EnableSepiaStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceSepiaStrike.AllowAccess(bEnable);
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
    // Reference: LPAIResourceStrike'Default__LPAIResManVSISS.SPAIResource_Strike'
    begin object name=SPAIResource_Strike class=Class'LPAIResourceStrike'
    end object
    AIResourceStrike=SPAIResource_Strike
    // Reference: LPAIResSepiaStrike'Default__LPAIResManVSISS.LPAIResourceSepiaDensityControlledStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledStrike_DO class=Class'LPAIResSepiaStrike'
    end object
    AIResourceSepiaStrike=LPAIResourceSepiaDensityControlledStrike_DO
    // Reference: LPAIResSepiaStrike'Default__LPAIResManVSISS.LPAIResourceSepiaDensityControlledLobStrike_DO'
    begin object name=LPAIResourceSepiaDensityControlledLobStrike_DO class=Class'LPAIResSepiaStrike'
        UniqueName="SepiaLobStrike"
    end object
    AIResourceSepiaLobStrike=LPAIResourceSepiaDensityControlledLobStrike_DO
    // Reference: LPAIResourceSepiaAttack'Default__LPAIResManVSISS.LPAIResourceSepiaAttack'
    begin object name=LPAIResourceSepiaAttack class=Class'LPAIResourceSepiaAttack'
        MaxAttackAttempters=6
        Attributes=(Radius=100.0000000,Height=100.0000000)
        MaxUsers=6
    end object
    AIResourceSepiaAttack=LPAIResourceSepiaAttack
    // Reference: LPAIResSepiaMassRetreatMgr'Default__LPAIResManVSISS.LPAIResSepiaMassRetreatMgrPlayer_D0'
    begin object name=LPAIResSepiaMassRetreatMgrPlayer_D0 class=Class'LPAIResSepiaMassRetreatMgr'
        NumOfDeathsToTriggerMassRetreat=100
    end object
    AIResSepiaMassRetreatMgr=LPAIResSepiaMassRetreatMgrPlayer_D0
    // Reference: LPAIResSepiaSurroundFormation'Default__LPAIResManVSISS.LPAIResSepiaSurroundFormationPlayerD0'
    begin object name=LPAIResSepiaSurroundFormationPlayerD0 class=Class'LPAIResSepiaSurroundFormation'
        MaxInFormation=10
        Attribute=(MinFormationRadius=200.0000000,FormationRadius=500.0000000,MaxFormationRadius=1000.0000000)
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResSepiaSurroundFormation=LPAIResSepiaSurroundFormationPlayerD0
    // Reference: LPAIResMedFlyerSurroundFormation'Default__LPAIResManVSISS.LPAIResMedFlyerSurroundFormation'
    begin object name=LPAIResMedFlyerSurroundFormation class=Class'LPAIResMedFlyerSurroundFormation'
        MovementBufferBeforeRequireReexploration=500.0000000
        MovementBufferBeforeRequireReexplorationSq=500.0000000
        Attributes=(HeightOfLoc=100.0000000,RadiusOfLoc=40.0000000,IdealRadius=1200.0000000,MinFormationRadius=500.0000000,MaxFormationRadius=2000.0000000,DistanceErrorBuffer=50.0000000,MinFormationHeightDelta=0.0000000,FormationIdealHeightDelta=100.0000000,MaxFormationHeightDelta=1000.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=1.0000000,IdealPitchInDegrees=10.0000000,CostOfPitchDeltaBelowIdealPerDegree=0.0000000,CostOfPitchDeltaAboveIdealPerDegree=0.0000000,MinRangeFromVsForFlyLocToBeValid=300.0000000)
        AllowedRequesterClass=/* Array type was not detected. */
    end object
    AIResMedFlyerSurroundOrbitFormation=LPAIResMedFlyerSurroundFormation
    // Reference: LPAIResFireWaspFromOrbitSlotEngagementVSISS'Default__LPAIResManVSISS.LPAIResFireWaspFromOrbitSlotEngagementPlayer'
    begin object name=LPAIResFireWaspFromOrbitSlotEngagementPlayer class=Class'LPAIResFireWaspFromOrbitSlotEngagementVSISS'
        AllowedRequesterClass=/* Array type was not detected. */
        MaxUsers=20
    end object
    AIResFireWaspFromOrbitSlotEngagement=LPAIResFireWaspFromOrbitSlotEngagementPlayer
}