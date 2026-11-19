class LPAIControllerVsLaroche extends LPAIControllerMech
    config(AI)
    hidecategories(AnimDependency,Navigation);

const VSWEAPONSNUM = 2;

enum eLaRocheStrikeTypes
{
    eLaRocheStrikeTypes_None,       // 0
    eLaRocheStrikeTypes_LeftJab,    // 1
    eLaRocheStrikeTypes_RightJab,   // 2
    eLaRocheStrikeTypes_LeftHook,   // 3
    eLaRocheStrikeTypes_RightHook,  // 4
    eLaRocheStrikeTypes_SuperSawStrike,// 5
    eLaRocheStrikeTypes_SuperTaserStrike,// 6
    eLaRocheStrikeTypes_Combo1,     // 7
    eLaRocheStrikeTypes_Combo2,     // 8
    eLaRocheStrikeTypes_Combo3,     // 9
    eLaRocheStrikeTypes_SawSideCombo1,// 10
    eLaRocheStrikeTypes_SawSideCombo2,// 11
    eLaRocheStrikeTypes_SawSideCombo3,// 12
    eLaRocheStrikeTypes_SawSideComboStart,// 13
    eLaRocheStrikeTypes_SawSideComboFinisher,// 14
    eLaRocheStrikeTypes_TaserSideCombo1,// 15
    eLaRocheStrikeTypes_TaserSideCombo2,// 16
    eLaRocheStrikeTypes_TaserSideCombo3,// 17
    eLaRocheStrikeTypes_TaserSideComboStart,// 18
    eLaRocheStrikeTypes_TaserSideComboFinisher,// 19
    eLaRocheStrikeTypes_HulkSmashCombo1,// 20
    eLaRocheStrikeTypes_HulkSmashCombo2,// 21
    eLaRocheStrikeTypes_HulkSmashCombo3,// 22
    eLaRocheStrikeTypes_StrightSawToCockpit,// 23
    eLaRocheStrikeTypes_OneMoveSawArmSwing,// 24
    eLaRocheStrikeTypes_ThreeMoveSawArmSwing,// 25
    eLaRocheStrikeTypes_ShoulderCharge,// 26
    eLaRocheStrikeTypes_DoubleArmSmash,// 27
    eLaRocheStrikeTypes_EmpPulseProjLaunchStrike,// 28
    eLaRocheStrikeTypes_GrabbingUrToStartStruggleMode,// 29
    eLaRocheStrikeTypes_StruggleModeAgainstUR,// 30
    eLaRocheStrikeTypes_MAX         // 31
};

enum eLaRocheStruggleModeTypes
{
    eLaRocheStruggleModeTypes_None, // 0
    eLaRocheStruggleModeTypes_Emp,  // 1
    eLaRocheStruggleModeTypes_Taser,// 2
    eLaRocheStruggleModeTypes_KnockOut,// 3
    eLaRocheStruggleModeTypes_DrillKill,// 4
    eLaRocheStruggleModeTypes_SawTheCock,// 5
    eLaRocheStruggleModeTypes_MAX   // 6
};

struct native AiPlayerMoveInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightArmPrimaryActionPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightArmAltActionPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSShieldBlockPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSShieldBlockPressedThisTick;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillArmSwingCombo1MinPercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillArmSwingCombo1MaxPercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillArmSwingCombo2MinPercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillArmSwingCombo2MaxPercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class NextSpecialMoveClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RightArmActionPressedTimeStamp;

    structdefaultproperties
    {
        bRightArmPrimaryActionPressed=false
        bRightArmAltActionPressed=false
        bVSShieldBlockPressed=false
        bVSShieldBlockPressedThisTick=false
        DrillArmSwingCombo1MinPercent=0.0000000
        DrillArmSwingCombo1MaxPercent=0.0000000
        DrillArmSwingCombo2MinPercent=0.0000000
        DrillArmSwingCombo2MaxPercent=0.0000000
        NextSpecialMoveClass=none
        RightArmActionPressedTimeStamp=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AiPlayerMoveInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentLarocheMacroCombatState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastLarocheMacroCombatState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentLaRocheStrikeAttempting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentLaRocheStruggleModeAttempting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTauntState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WantsToFireVS[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WaitingToNextOpportunityToHandleThisBossPhaseEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepVsCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidLastStrikeOfLastComboLand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceNotAllowedToPerformActiveDefense[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoiterFormationPointMoved[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFightFlagStartOfFightDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPostFirstLaRocheAttackDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifyLaRocheUsingEmpAttackTheFirstTimeDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifyLeftShoulderShieldNotDestroyedYet1DialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTimeForNextNotifyLeftShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifyCommUnitNotDestroyedYet1DialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifyRightShoulderShieldNotDestroyedYet1DialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTimeForNextNotifyRightShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifySawGeneratorNotDestroyedYet1DialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifyLeftHipShieldNotDestroyedYet1DialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJims1stGrabOnLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJims2ndGrabOnLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJims3rdGrabOnLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJims4thGrabOnLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJims5thGrabOnLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimPrisonRapingLaRocheDialogPlayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasJimTaseredLarocheYet[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedTheYouHaveReallyFckedUpHisRigMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedLeftArm[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedLeftShoulder[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedRightShoulder[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedRightBicep[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedCockpitCrossBar[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedCockpitCrossBarForShield[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedRightInnerShoulder[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJimsGrabbedCockpitFinal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ActiveDefenseSuccesses[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SawCentricLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SawNoTaserLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL TaserCentricLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL BackupSawLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL HipsLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL BerserkLaRocheCombatPhaseStatInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VSFirePausedRefCount[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoiterFormationAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LoiterFormationResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextNotifyCommUnitNotDestroyedYetEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextNotifySawGeneratorNotDestroyedYetEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfCoresDestroyed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeJimTriedToMeleeOrGrabMe[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFiredYourJustBellyBumpingMeDialog[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    CurrentLarocheMacroCombatState = 0;
    LastLarocheMacroCombatState = 0;
    WaitingToNextOpportunityToHandleThisBossPhaseEvent = 41;
    CurrentTauntState = 0;
    super.Possess(inPawn, bVehicleTransition);
    VsLarochePawn = LPAIPawnVsLaroche(inPawn);
    SetMyAiPawn(VsLarochePawn);
    CurrentLaRocheStrikeAttempting = 0;
    CurrentLaRocheStruggleModeAttempting = 0;
    bForceNotAllowedToPerformActiveDefense = true;
    NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode = 0;
    bDidLastStrikeOfLastComboLand = false;
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(VsLarochePawn.TuneDataVsLaroche.AngleToSideStepVsDuringNormalMovement.GetValue(), AngleToSideStepVsCosAngRange);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.SawCentricLaRocheCombatPhaseStatInfo, SawCentricLaRocheCombatPhaseStatInfo, self);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.SawNoTaserLaRocheCombatPhaseStatInfo, SawNoTaserLaRocheCombatPhaseStatInfo, self);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.TaserCentricLaRocheCombatPhaseStatInfo, TaserCentricLaRocheCombatPhaseStatInfo, self);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.BackupSawLaRocheCombatPhaseStatInfo, BackupSawLaRocheCombatPhaseStatInfo, self);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.HipsLaRocheCombatPhaseStatInfo, HipsLaRocheCombatPhaseStatInfo, self);
    Class'LPLaRocheCombatPhaseStatData'.static.SetPhaseDataFromTuneData(VsLarochePawn.TuneDataVsLaroche.BerserkLaRocheCombatPhaseStatInfo, BerserkLaRocheCombatPhaseStatInfo, self);
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.StartDefaultRigLightValues);
    bFightFlagStartOfFightDialogPlayed = false;
    bPostFirstLaRocheAttackDialogPlayed = false;
    bNotifyLaRocheUsingEmpAttackTheFirstTimeDialogPlayed = false;
    TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent = -1.0000000;
    bNotifyLeftShoulderShieldNotDestroyedYet1DialogPlayed = false;
    bTimeForNextNotifyLeftShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;
    TimeForNextNotifyCommUnitNotDestroyedYetEvent = -1.0000000;
    bNotifyCommUnitNotDestroyedYet1DialogPlayed = false;
    TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent = -1.0000000;
    bNotifyRightShoulderShieldNotDestroyedYet1DialogPlayed = false;
    bTimeForNextNotifyRightShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;
    TimeForNextNotifySawGeneratorNotDestroyedYetEvent = -1.0000000;
    bNotifySawGeneratorNotDestroyedYet1DialogPlayed = false;
    TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent = -1.0000000;
    bNotifyLeftHipShieldNotDestroyedYet1DialogPlayed = false;
    bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;
    bJims1stGrabOnLaRocheDialogPlayed = false;
    bJims2ndGrabOnLaRocheDialogPlayed = false;
    bJims3rdGrabOnLaRocheDialogPlayed = false;
    bJims4thGrabOnLaRocheDialogPlayed = false;
    bJims5thGrabOnLaRocheDialogPlayed = false;
    bJimPrisonRapingLaRocheDialogPlayed = false;
    bHasJimTaseredLarocheYet = false;
    NumOfCoresDestroyed = 0;
    bPlayedTheYouHaveReallyFckedUpHisRigMessage = false;
    bJimsGrabbedLeftArm = false;
    bJimsGrabbedLeftShoulder = false;
    bJimsGrabbedRightShoulder = false;
    bJimsGrabbedRightBicep = false;
    bJimsGrabbedCockpitCrossBar = false;
    bJimsGrabbedCockpitCrossBarForShield = false;
    bJimsGrabbedRightInnerShoulder = false;
    LastTimeJimTriedToMeleeOrGrabMe = -1.0000000;
    LastTimeFiredYourJustBellyBumpingMeDialog = -1.0000000;
    VsLarochePawn.TuneDataVsLaroche.StationaryToMovingTransitionData[0] = VsLarochePawn.TuneDataVsLaroche.StationaryToMovingTransitionData[1];
    VsLarochePawn.TuneDataVsLaroche.MovingToMovingTransitionData[0] = VsLarochePawn.TuneDataVsLaroche.MovingToMovingTransitionData[1];
    VsLarochePawn.TuneDataVsLaroche.MovingToStationaryTransitionData[0] = VsLarochePawn.TuneDataVsLaroche.MovingToStationaryTransitionData[1];
    VsLarochePawn.TuneDataVsLaroche.TurnInPlaceTransitionData = VsLarochePawn.TuneDataVsLaroche.BaseTurnInPlaceTransitionData;
    //return;    
}

function SetMyAiPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    AiPlayerMoveInfo.bVSShieldBlockPressed = false;
    AiPlayerMoveInfo.bRightArmAltActionPressed = false;
    AiPlayerMoveInfo.bRightArmPrimaryActionPressed = false;
    AiPlayerMoveInfo.bVSShieldBlockPressedThisTick = false;
    //return;    
}

event UnPossess()
{
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    super(LPAIController).Destroyed();
    //return;    
}

function SetAttackResourceNames()
{
    LoiterFormationResourceName = 'VsLarocheLoiter';
    //return;    
}

function ReleaseAllAttackAccess()
{
    super(LPAIController).ReleaseAllAttackAccess();
    ReleaseLoiterFormationAccess();
    //return;    
}

function ReleaseLoiterFormationAccess()
{
    // End:0x39
    if(LoiterFormationAccess != none)
    {
        LoiterFormationAccess.Destroy();
        LoiterFormationAccess = none;
    }
    //return;    
}

function ShouldUseLoiterFormationResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LoiterFormationResourceName != 'None';
    //return ReturnValue;    
}

function HaveLoiterFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseLoiterFormationResource() || (IsValidResourceAccessForEnemy(LoiterFormationAccess)) && !bLoiterFormationPointMoved;
    //return ReturnValue;    
}

function GetLoiterFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x101
    if((ShouldUseLoiterFormationResource()) && !HaveLoiterFormationAccess())
    {
        // End:0x101
        if(((TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.IsUsable(LoiterFormationResourceName, myAIPawn))
        {
            LoiterFormationAccess = TheEnemy.AIResourceManager.GetAccess(LoiterFormationResourceName, myAIPawn, RevokeTolerance);
        }
    }
    bLoiterFormationPointMoved = false;
    //return;    
}

event DelegateLarocheMovingToEngageEnemyAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest;

    bAvoid = true;
    PawnToTest = Pawn(Obstacle);
    // End:0x4E
    if(PawnToTest == MyLPEnemy)
    {
        bAvoid = false;        
    }
    else
    {
        // End:0x86
        if(IsThisActorTheVsAndInGivenAvoidanceZone(PawnToTest, AngleToSideStepVsCosAngRange, MyLPEnemy))
        {
            bAvoid = true;            
        }
        else
        {
            // End:0xAA
            if(LPBaseVSPlayerPawn(Obstacle) != none)
            {
                bAvoid = false;
            }
        }
    }
    return bAvoid;
    //return ReturnValue;    
}

function HandleIncomingPotentialDamageForCombatStateChange()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    VsLarochePawn.AddToDamageTracking(float(InDamage), true);
    // End:0x58
    if(VsLarochePawn.HaveAccumulatedDamageForSwitchingFromPassiveToAgitatedState())
    {
        NotifyOfDangerousAmountOfDamage();
    }
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];

    super(LPAIController).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    //return;    
}

function IsInTightStalkOrLoiterArea()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetNumberOfVirginPointGrabs()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numOfGrabs;

    numOfGrabs = 0;
    // End:0x23
    if(bJimsGrabbedLeftArm)
    {
        ++numOfGrabs;
    }
    // End:0x3B
    if(bJimsGrabbedLeftShoulder)
    {
        ++numOfGrabs;
    }
    // End:0x53
    if(bJimsGrabbedRightShoulder)
    {
        ++numOfGrabs;
    }
    // End:0x6B
    if(bJimsGrabbedRightBicep)
    {
        ++numOfGrabs;
    }
    // End:0x83
    if(bJimsGrabbedCockpitCrossBar)
    {
        ++numOfGrabs;
    }
    // End:0x9B
    if(bJimsGrabbedCockpitCrossBarForShield)
    {
        ++numOfGrabs;
    }
    // End:0xB3
    if(bJimsGrabbedRightInnerShoulder)
    {
        ++numOfGrabs;
    }
    return numOfGrabs;
    //return ReturnValue;    
}

function NotifyGrabInterationJustStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];
    local /*0x97E50000-0x00000000*/ private int PointIndexGrab[8388609];

    // End:0x46
    if((PointIndexGrab == 6) || PointIndexGrab == 13)
    {
        // End:0x46
        if(PawnGrabbingMe != none)
        {
            HandleBossFightPhaseEventMessage(PawnGrabbingMe, 35);
        }
    }
    //return;    
}

function ProcessForVirginGrabDialogNeeds()
{
    local /*0x97E50000-0x00000000*/ private int numOfVirginGrabs;

    numOfVirginGrabs = GetNumberOfVirginPointGrabs();
    // End:0x58
    if((numOfVirginGrabs == 1) && !bJims1stGrabOnLaRocheDialogPlayed)
    {
        HandleBossFightPhaseEventMessage(MyLPEnemy, 7);
        bJims1stGrabOnLaRocheDialogPlayed = true;        
    }
    else
    {
        // End:0x9D
        if((numOfVirginGrabs == 2) && !bJims2ndGrabOnLaRocheDialogPlayed)
        {
            HandleBossFightPhaseEventMessage(MyLPEnemy, 14);
            bJims2ndGrabOnLaRocheDialogPlayed = true;            
        }
        else
        {
            // End:0xE2
            if((numOfVirginGrabs == 3) && !bJims3rdGrabOnLaRocheDialogPlayed)
            {
                HandleBossFightPhaseEventMessage(MyLPEnemy, 20);
                bJims3rdGrabOnLaRocheDialogPlayed = true;                
            }
            else
            {
                // End:0x127
                if((numOfVirginGrabs == 4) && !bJims4thGrabOnLaRocheDialogPlayed)
                {
                    HandleBossFightPhaseEventMessage(MyLPEnemy, 29);
                    bJims4thGrabOnLaRocheDialogPlayed = true;                    
                }
                else
                {
                    // End:0x169
                    if((numOfVirginGrabs == 5) && !bJims5thGrabOnLaRocheDialogPlayed)
                    {
                        HandleBossFightPhaseEventMessage(MyLPEnemy, 32);
                        bJims5thGrabOnLaRocheDialogPlayed = true;
                    }
                }
            }
        }
    }
    //return;    
}

function DoesStateAllow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DoesStateAllow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CanUseCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(VsLarochePawn == none)
    {
        return false;
    }
    // End:0x22
    if(!DoesStateAllow_ActiveDefense())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function TryCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return VsLarochePawn.TryCombatWindow_ActiveDefense();
    //return ReturnValue;    
}

function CanUseCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(VsLarochePawn == none)
    {
        return false;
    }
    // End:0x22
    if(!DoesStateAllow_ForkArm())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function TryCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return VsLarochePawn.TryCombatWindow_ForkArm();
    //return ReturnValue;    
}

exec function NextVSWeapon()
{
    // End:0x26
    if(WorldInfo.Pauser != none)
    {
        return;
    }
    // End:0x8A
    if(Pawn.InvManager != none)
    {
        // End:0x8A
        if(LPVSPlayerPawn(Pawn) != none)
        {
            LPVSPlayerPawn(Pawn).NextVSWeapon();
        }
    }
    //return;    
}

function StartVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    WantsToFireVS[int(WeaponID)] = FireModeNum;
    // End:0x74
    if(VSFirePausedRefCount[int(WeaponID)] < 1)
    {
        LPVSFuturePlayerPawn(Pawn).StartVSFire(WeaponID, FireModeNum);
    }
    //return;    
}

function StopVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    WantsToFireVS[int(WeaponID)] = 255;
    LPVSFuturePlayerPawn(Pawn).StopVSFire(WeaponID, FireModeNum);
    //return;    
}

function PauseVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];

    VSFirePausedRefCount[int(WeaponID)]++;
    // End:0x7D
    if(int(WantsToFireVS[int(WeaponID)]) < int(255))
    {
        LPVSFuturePlayerPawn(Pawn).StopVSFire(WeaponID, WantsToFireVS[int(WeaponID)]);
    }
    //return;    
}

function UnPauseVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];

    VSFirePausedRefCount[int(WeaponID)]--;
    // End:0x91
    if(VSFirePausedRefCount[int(WeaponID)] < 1)
    {
        // End:0x7A
        if(int(WantsToFireVS[int(WeaponID)]) < int(255))
        {
            StartVSFire(WeaponID, WantsToFireVS[int(WeaponID)]);
        }
        VSFirePausedRefCount[int(WeaponID)] = 0;
    }
    //return;    
}

function UnPauseAllVSFire()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x3F [Loop If]
    if(I < 2)
    {
        WantsToFireVS[I] = 255;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0x4A:

    // End:0x7D [Loop If]
    if(I < 2)
    {
        VSFirePausedRefCount[I] = 0;
        I++;
        // [Loop Continue]
        goto J0x4A;
    }
    //return;    
}

simulated function IsVSFiring()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if((int(WeaponID) == int(1)) && AiPlayerMoveInfo.bRightArmPrimaryActionPressed)
    {
        return true;
    }
    // End:0x5A
    if(int(WantsToFireVS[int(WeaponID)]) < int(255))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanDoFreeStandingForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((DoesStateAllow_ForkArm()) && VsLarochePawn.CanDoSpecialMove(Class'LPSM_ForkArmGrabMiss')) && VsLarochePawn.GetSpecialMoveInstance(Class'LPSM_ForkArmGrab_Grab') != none;
    //return ReturnValue;    
}

function StartFreeStandingForkArmGrab()
{
    VsLarochePawn.StartForkArmGrab();
    //return;    
}

function RightArmButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, MyFutureVSPawn;
    local /*0x97E50000-0x00000000*/ private bool bWorked;

    MyVSPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0x118
    if(MyVSPawn != none)
    {
        MyFutureVSPawn = LPVSFuturePlayerPawn(MyVSPawn);
        // End:0x67
        if(MyFutureVSPawn != none)
        {
            StartVSFire(0, 0);            
        }
        else
        {
            bWorked = LPVSPlayerPawn(MyVSPawn).RightArmPart.BroadcastSMMStart();
            // End:0x118
            if(!bWorked)
            {
                AiPlayerMoveInfo.bRightArmPrimaryActionPressed = true;
                AiPlayerMoveInfo.RightArmActionPressedTimeStamp = WorldInfo.TimeSeconds;
            }
        }
    }
    //return;    
}

function RightArmStopButtonPress()
{
    AiPlayerMoveInfo.bRightArmPrimaryActionPressed = false;
    //return;    
}

function GetForkArmGrabRange()
{
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;

    // End:0x8C
    if(VsLarochePawn != none)
    {
        OutRadius = VsLarochePawn.TuneDataVsLaroche.ForkArmGrabRange2D;
        OutHeight = VsLarochePawn.TuneDataVsLaroche.ForkArmGrabRangeZ;        
    }
    else
    {
        OutRadius = 0.0000000;
        OutHeight = 0.0000000;
    }
    //return;    
}

function CanDoRightArmPrimaryAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(IsDoingASpecialMove() && !IsDoingSpecialMove(Class'LPSM_PlayerVSHitReaction'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartRightArmTransitionIn()
{
    VsLarochePawn.RightArmPart.InitializeAction(self, 0);
    //return;    
}

function StartRightArmTransitionOut()
{
    // End:0x25
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSRightArmActionBase'))
    {
        DoSpecialMove(none, true);
    }
    //return;    
}

function CanDoRightArmAltAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(IsDoingASpecialMove() && !IsDoingSpecialMove(Class'LPSM_PlayerVSHitReaction'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ProcessRightArmAltAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrCmd, InteractionActor;

    CurrCmd = GetActiveCommand();
    // End:0x72
    if(ClassIsChildOf(CurrCmd.Class, Class'LPAICmd_Strike'))
    {
        InteractionActor = LPAICmd_Strike(CurrCmd).EnemyForStrike;
    }
    DoSpecialMove(Class'LPSM_VsLarocheSawArmSwing1Start', true, true,, InteractionActor);
    //return;    
}

function DoCheckForActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDistance[8388609], MinDistance;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand, dirToPlayer, vecToPlayer, larocheDir, playerDir;

    local /*0x97E50000-0x00000000*/ private float val, dotReq, MaxDistanceSq, MinDistanceSq, chanceReductionPerSuccess, randChance,
	    currentPhaseChance;

    // End:0x0F
    if(bForceNotAllowedToPerformActiveDefense)
    {
        return false;
    }
    curCommand = LPAICommand(CommandList);
    J0x2B:

    // End:0x9D [Loop If]
    if(curCommand != none)
    {
        // End:0x69
        if(!curCommand.CanActiveDefense(InVsPawn))
        {
            return false;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x2B;
    }
    // End:0xE9
    if(VsLarochePawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_CanActiveDefense, InVsPawn))
    {
        return false;
    }
    vecToPlayer = InVsPawn.Location - VsLarochePawn.Location;
    val = VSizeSq2D(vecToPlayer);
    // End:0x196
    if(MaxDistance > float(0))
    {
        MaxDistanceSq = MaxDistance * MaxDistance;
        // End:0x196
        if(val > MaxDistanceSq)
        {
            return false;
        }
    }
    // End:0x1DE
    if(MinDistance > float(0))
    {
        MinDistanceSq = MinDistance * MinDistance;
        // End:0x1DE
        if(val < MinDistanceSq)
        {
            return false;
        }
    }
    dirToPlayer = Normal(vecToPlayer);
    larocheDir = Normal(Vector(VsLarochePawn.Rotation));
    val = dirToPlayer Dot larocheDir;
    dotReq = Cos((VsLarochePawn.TuneDataVsLaroche.BlockAngularCoverage * 0.5000000) * 0.0174533);
    // End:0x2A3
    if(val < dotReq)
    {
        return false;
    }
    playerDir = Normal(Vector(InVsPawn.Rotation));
    val = larocheDir Dot playerDir;
    // End:0x308
    if(val > -dotReq)
    {
        return false;
    }
    val = 0.5000000;
    currentPhaseChance = GetActiveDefenceChanceForCurrentCombatStageForStrikes(chanceReductionPerSuccess);
    val = currentPhaseChance - (float(ActiveDefenseSuccesses) * chanceReductionPerSuccess);
    // End:0x372
    if(val < float(0))
    {
        return false;
    }
    // End:0x3A8
    if(val <= float(1))
    {
        randChance = FRand();
        // End:0x3A8
        if(randChance > val)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function GetActiveDefenceChanceForCurrentCombatStageForStrikes()
{
    local /*0x97E50000-0x00000000*/ private float outChanceReductionPerSuccess[25165825], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL curData;

    curData = GetCurrentLaRocheCombatPhaseStatData();
    outChanceReductionPerSuccess = curData.NormalStrikeActiveDefenceChanceReductionPerSuccess;
    return curData.NormalStrikeActiveDefenceInitialChance;
    //return ReturnValue;    
}

function GetActiveDefenceChanceForCurrentCombatStageForGrabs()
{
    local /*0x97E50000-0x00000000*/ private float outChanceReductionPerSuccess[25165825], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL curData;

    curData = GetCurrentLaRocheCombatPhaseStatData();
    outChanceReductionPerSuccess = curData.GrabsForStruggleModeActiveDefenceChanceReductionPerSuccess;
    return curData.GrabsForStruggleModeActiveDefenceInitialChance;
    //return ReturnValue;    
}

function CheckForActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDistance[8388609], MinDistance;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4D
    if(DoCheckForActiveDefense(InVsPawn, MaxDistance, MinDistance))
    {
        ++ActiveDefenseSuccesses;
        HandleBossFightPhaseEventMessage(InVsPawn, 9);
        return true;        
    }
    else
    {
        ActiveDefenseSuccesses = 0;
        return false;
    }
    //return ReturnValue;    
}

event NotifyGettingGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bActiveDefended, bSuperRet;

    // End:0x21
    if(int(GetCurrentLarocheMacroCombatState()) == int(0))
    {
        ChangeCurrentLarocheMacroCombatState(1);
    }
    // End:0xAF
    if(CheckForActiveDefense(InVsPawn, VsLarochePawn.TuneDataVsLaroche.ActiveDefenseMaximumDistance, -1.0000000))
    {
        InVsPawn.DoSpecialMove(Class'LPSM_ActiveDefendedGrabByLarocheVS', true, true,, VsLarochePawn);
        bActiveDefended = true;
    }
    LastTimeJimTriedToMeleeOrGrabMe = WorldInfo.TimeSeconds;
    bSuperRet = super(LPAIController).NotifyGettingGrabbed(InVsPawn);
    return bSuperRet || bActiveDefended;
    //return ReturnValue;    
}

event NotifyWinchProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], WinchProj;

    // End:0x21
    if(int(GetCurrentLarocheMacroCombatState()) == int(0))
    {
        ChangeCurrentLarocheMacroCombatState(1);
    }
    // End:0xA3
    if(CheckForActiveDefense(InVsPawn, -1.0000000, VsLarochePawn.TuneDataVsLaroche.ShieldBlockProjectileMinimumDistance))
    {
        VsLarochePawn.DoSpecialMove(Class'LPSM_VSLarocheShieldBlock', true, true,, InVsPawn);
    }
    super(LPAIController).NotifyWinchProjectileFire(InVsPawn, WinchProj);
    //return;    
}

event NotifyWinchProjectileRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];

    // End:0x72
    if(VsLarochePawn.IsDoingSpecialMove_OF_Class(Class'LPSM_VSLarocheShieldBlock'))
    {
        VsLarochePawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSShieldBlockReleased, InVsPawn);
    }
    super(LPAIController).NotifyWinchProjectileRetracting(InVsPawn);
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(LPAIController).Touch(Other, OtherComp, HitLocation, HitNormal);
    ProcessForUselessBellyBumpingDialogEvent(Other);
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super(LPAIController).Bump(Other, OtherComp, HitNormal);
    ProcessForUselessBellyBumpingDialogEvent(Other);
    //return;    
}

function ProcessForUselessBellyBumpingDialogEvent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private float deltaFromLastMelee, deltaFromLastDiaLogEvent;

    // End:0x119
    if(Other == MyLPEnemy)
    {
        // End:0x50
        if(LastTimeJimTriedToMeleeOrGrabMe < float(0))
        {
            LastTimeJimTriedToMeleeOrGrabMe = WorldInfo.TimeSeconds;
        }
        deltaFromLastMelee = WorldInfo.TimeSeconds - LastTimeJimTriedToMeleeOrGrabMe;
        // End:0x119
        if(deltaFromLastMelee > 10.0000000)
        {
            deltaFromLastDiaLogEvent = WorldInfo.TimeSeconds - LastTimeFiredYourJustBellyBumpingMeDialog;
            // End:0x119
            if(deltaFromLastDiaLogEvent > 10.0000000)
            {
                LastTimeFiredYourJustBellyBumpingMeDialog = WorldInfo.TimeSeconds;
                HandleBossFightPhaseEventMessage(MyLPEnemy, 10);
            }
        }
    }
    //return;    
}

event NotifyVsMeleeSwingStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];

    // End:0x21
    if(int(GetCurrentLarocheMacroCombatState()) == int(0))
    {
        ChangeCurrentLarocheMacroCombatState(1);
    }
    // End:0xA3
    if(CheckForActiveDefense(InVsPawn, VsLarochePawn.TuneDataVsLaroche.ActiveDefenseMaximumDistance, -1.0000000))
    {
        InVsPawn.DoSpecialMove(Class'LPSM_ActiveDefendedByLarocheVS', true, true,, VsLarochePawn);
    }
    LastTimeJimTriedToMeleeOrGrabMe = WorldInfo.TimeSeconds;
    super(LPAIController).NotifyVsMeleeSwingStart(InVsPawn);
    //return;    
}

simulated function IsValidActiveCombatWindowForThisTypeOfStrike()
{
    local /*0x97E50000-0x00000000*/ private byte LaRocheStrikeAttempting[8388609], LaRocheStruggleModeAttempting;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x28
    if(VsLarochePawn.LastTimeSuccessfullyGrabOtherPawn < float(0))
    {
        return false;
    }
    // End:0x71
    if((int(CurrentLaRocheStrikeAttempting) == int(29)) && int(LaRocheStrikeAttempting) == int(29))
    {
        // End:0x6F
        if(int(CurrentLaRocheStruggleModeAttempting) == int(LaRocheStruggleModeAttempting))
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsLeftArmGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsLeftShoulderGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsRightShoulderGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsRightBicepGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsCockpitCrossBarGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsCockpitCrossBarGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICmd_VsLarocheLoiter(CommandList);
    // End:0x54
    if(curCommand != none)
    {
        // End:0x52
        if(curCommand.IsRightInnerShoulderGrabPointAbleToBeGrabed())
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function VsLarocheEnableGrabForCommKill()
{
    DestroyLeftShoulderShield();
    //return;    
}

function VsLarocheEnableGrabForSawGenKill()
{
    DestroyRightShoulder();
    //return;    
}

function VsLarocheEnableGrabForMobilityKill()
{
    DestroyHipShield();
    //return;    
}

function VsLarocheEnableGrabForRigKill()
{
    DestroyLeftShoulderShield();
    DestroyLeftShoulderComm();
    DestroyRightShoulder();
    DestroySawGenerator();
    DestroyHipShield();
    DestroyHip();
    //return;    
}

function VsLarocheDestroyLeftSide()
{
    DestroyLeftShoulderShield();
    DestroyLeftShoulderComm();
    //return;    
}

function VsLarocheDestroyRightSide()
{
    DestroyRightShoulder();
    DestroySawGenerator();
    //return;    
}

function VsLarocheDestroyHip()
{
    DestroyHipShield();
    DestroyHip();
    //return;    
}

function DestroyLeftShoulderShield()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;
    local /*0x97E50000-0x00000000*/ private float CoreHealth;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[9];
    VsLarochePawn.DamageReactionManagerAI.HitCoreIndex = myAIPawn.GetCoreIndexFromTag(coreDestroying);
    CoreHealth = VsLarochePawn.GetCoreHealth(9);
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.5000000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.5000000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.bCoreDestroyed_ServerOnly = true;
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    //return;    
}

function DestroyLeftShoulderComm()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[3];
    ForceDestoryCore(coreDestroying);
    //return;    
}

function DestroyRightShoulder()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;
    local /*0x97E50000-0x00000000*/ private float CoreHealth;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[11];
    VsLarochePawn.DamageReactionManagerAI.HitCoreIndex = myAIPawn.GetCoreIndexFromTag(coreDestroying);
    CoreHealth = VsLarochePawn.GetCoreHealth(11);
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.3300000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.3300000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.3300000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.bCoreDestroyed_ServerOnly = true;
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    //return;    
}

function DestroyRightShoulderLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;
    local /*0x97E50000-0x00000000*/ private float CoreHealth;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[27];
    VsLarochePawn.DamageReactionManagerAI.HitCoreIndex = myAIPawn.GetCoreIndexFromTag(coreDestroying);
    CoreHealth = VsLarochePawn.GetCoreHealth(27);
    VsLarochePawn.TakeDamageParams.Damage = int(CoreHealth + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.bCoreDestroyed_ServerOnly = true;
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    //return;    
}

function DestroySawGenerator()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[5];
    ForceDestoryCore(coreDestroying);
    //return;    
}

function DestroyHipShield()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;
    local /*0x97E50000-0x00000000*/ private float CoreHealth;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[13];
    VsLarochePawn.DamageReactionManagerAI.HitCoreIndex = myAIPawn.GetCoreIndexFromTag(coreDestroying);
    CoreHealth = VsLarochePawn.GetCoreHealth(13);
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.5000000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    VsLarochePawn.TakeDamageParams.Damage = int((CoreHealth * 0.5000000) + float(2));
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.bCoreDestroyed_ServerOnly = true;
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    //return;    
}

function DestroyHip()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[7];
    ForceDestoryCore(coreDestroying);
    //return;    
}

function DestroyCockPitShield()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying;

    coreDestroying = VsLarochePawn.TuneDataVsLaroche.PhysMatsForDebugByCoreId[17];
    ForceDestoryCore(coreDestroying);
    //return;    
}

function ForceDestoryCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL coreDestroying[8388609];

    VsLarochePawn.DamageReactionManagerAI.HitCoreIndex = myAIPawn.GetCoreIndexFromTag(coreDestroying);
    VsLarochePawn.TakeDamageParams.Damage = 1000000;
    VsLarochePawn.DamageReactionManagerAI.hitCoreTag = coreDestroying;
    VsLarochePawn.DamageReactionManagerAI.CoreTakeDamage(coreDestroying, 1);
    VsLarochePawn.DamageReactionManagerAI.bCoreDestroyed_ServerOnly = true;
    VsLarochePawn.DamageReactionManagerAI.ExecuteDamageReaction();
    //return;    
}

event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pawnThatDestroyedMyLittleCore, lpPlayCtrl;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    // End:0x75
    if(myAIPawn.TakeDamageParams.InstigatedByPawn != none)
    {
        pawnThatDestroyedMyLittleCore = myAIPawn.TakeDamageParams.InstigatedByPawn;        
    }
    else
    {
        // End:0xD5
        foreach WorldInfo.AllControllers(Class'LPPlayerController', lpPlayCtrl)
        {
            pawnThatDestroyedMyLittleCore = lpPlayCtrl.MyBasePlayerPawn;
            // End:0xD5
            break;            
        }        
    }
    ++NumOfCoresDestroyed;
    // End:0x154
    if(!bPlayedTheYouHaveReallyFckedUpHisRigMessage && NumOfCoresDestroyed > VsLarochePawn.TuneDataVsLaroche.NumOfCoresToDestoryBeforePlayingRumageSellDialogMessageFromGale)
    {
        bPlayedTheYouHaveReallyFckedUpHisRigMessage = true;
        HandleBossFightPhaseEventMessage(pawnThatDestroyedMyLittleCore, 34);
    }
    CoreID = CoreTag.GetCoreId();
    // End:0x1F9
    if(CoreID == 11)
    {
        // End:0x1F6
        if((myAIPawn.GetCoreHealth(5) > float(0)) && myAIPawn.GetCoreHealth(9) > float(0))
        {
            HandleBossFightPhaseEventMessage(MyLPEnemy, 8);
        }        
    }
    else
    {
        // End:0x367
        if(CoreID == 5)
        {
            TimeForNextNotifySawGeneratorNotDestroyedYetEvent = -1.0000000;
            bNotifySawGeneratorNotDestroyedYet1DialogPlayed = false;
            VsLarochePawn.StopSawRunning();
            // End:0x2CB
            if(myAIPawn.GetCoreHealth(3) <= float(0))
            {
                // End:0x2A4
                if(VsLarochePawn.GetCoreHealth(13) <= float(0))
                {
                    ChangeCurrentLarocheMacroCombatState(5);                    
                }
                else
                {
                    bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = true;
                    ChangeCurrentLarocheMacroCombatState(4);
                }
                WaitingToNextOpportunityToHandleThisBossPhaseEvent = 37;                
            }
            else
            {
                // End:0x340
                if(VsLarochePawn.GetCoreHealth(9) <= float(0))
                {
                    TimeForNextNotifyCommUnitNotDestroyedYetEvent = WorldInfo.TimeSeconds + VsLarochePawn.GetTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent();                    
                }
                else
                {
                    bTimeForNextNotifyLeftShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = true;
                }
                ChangeCurrentLarocheMacroCombatState(3);
                WaitingToNextOpportunityToHandleThisBossPhaseEvent = 36;
            }            
        }
        else
        {
            // End:0x44A
            if(CoreID == 3)
            {
                TimeForNextNotifyCommUnitNotDestroyedYetEvent = -1.0000000;
                bNotifyCommUnitNotDestroyedYet1DialogPlayed = false;
                // End:0x42F
                if(VsLarochePawn.GetCoreHealth(5) <= float(0))
                {
                    HandleBossFightPhaseEventMessage(MyLPEnemy, 15);
                    // End:0x408
                    if(myAIPawn.GetCoreHealth(13) <= float(0))
                    {
                        ChangeCurrentLarocheMacroCombatState(5);                        
                    }
                    else
                    {
                        bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = true;
                        ChangeCurrentLarocheMacroCombatState(4);
                    }
                    WaitingToNextOpportunityToHandleThisBossPhaseEvent = 38;                    
                }
                else
                {
                    ChangeCurrentLarocheMacroCombatState(2);
                    WaitingToNextOpportunityToHandleThisBossPhaseEvent = 39;
                }                
            }
            else
            {
                // End:0x508
                if(CoreID == 9)
                {
                    // End:0x4E4
                    if(myAIPawn.GetCoreHealth(5) <= float(0))
                    {
                        HandleBossFightPhaseEventMessage(MyLPEnemy, 11);
                        TimeForNextNotifyCommUnitNotDestroyedYetEvent = WorldInfo.TimeSeconds + VsLarochePawn.GetTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent();                        
                    }
                    else
                    {
                        HandleBossFightPhaseEventMessage(MyLPEnemy, 6);
                    }
                    bNotifyCommUnitNotDestroyedYet1DialogPlayed = false;                    
                }
                else
                {
                    // End:0x590
                    if(CoreID == 13)
                    {
                        // End:0x58D
                        if((myAIPawn.GetCoreHealth(5) <= float(0)) && myAIPawn.GetCoreHealth(3) <= float(0))
                        {
                            ChangeCurrentLarocheMacroCombatState(5);
                            HandleBossFightPhaseEventMessage(pawnThatDestroyedMyLittleCore, 30);
                        }                        
                    }
                    else
                    {
                        // End:0x5B8
                        if(CoreID == 7)
                        {
                            ChangeCurrentLarocheMacroCombatState(6);
                            WaitingToNextOpportunityToHandleThisBossPhaseEvent = 40;
                        }
                    }
                }
            }
        }
    }
    super(LPAIController).CoreDestroyed(CoreTag, CoreIndex);
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte coreInQ;

    coreInQ = byte(CoreTag.GetCoreId());
    // End:0x54
    if(!TestCurrentCombatStateForAbleToDamageThisCore(coreInQ, 3, true, Class'LPSM_ForkArmGrab_HoldVsLarocheLeftShoulderAfterStruggle'))
    {
        return false;        
    }
    else
    {
        // End:0x7D
        if(!TestCurrentCombatStateForAbleToDamageThisCore(coreInQ, 5, true, Class'LPSM_ForkArmGrab_HoldVsLarocheRightShoulderAfterStruggle'))
        {
            return false;            
        }
        else
        {
            // End:0xA3
            if(!TestCurrentCombatStateForAbleToDamageThisCore(coreInQ, 7, true, Class'LPSM_ForkArmGrab_HoldVsLarocheCockPitBaseForHipAfterStruggle'))
            {
                return false;
            }
        }
    }
    return super(LPAIController).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function HandleBossFightPhaseEventMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOriginator[8388609];
    local /*0x97E50000-0x00000000*/ private byte inLaRocheBossFightPhaseEvent[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx, Priority;
    local /*0x97E50000-0x00000000*/ private @NULL MessageEvent;

    Priority = 10;
    Idx = 0;
    J0x17:

    // End:0x126 [Loop If]
    if(Idx < VsLarochePawn.TuneDataVsLaroche.LaRocheBossFightPhaseEventPriorities.Length)
    {
        // End:0x118
        if(int(VsLarochePawn.TuneDataVsLaroche.LaRocheBossFightPhaseEventPriorities[Idx].PhaseEvent) == int(inLaRocheBossFightPhaseEvent))
        {
            Priority = VsLarochePawn.TuneDataVsLaroche.LaRocheBossFightPhaseEventPriorities[Idx].Priority;
            // [Explicit Break]
            goto J0x126;
        }
        Idx++;
        // [Loop Continue]
        goto J0x17;
    }
    J0x126:

    Idx = 0;
    J0x131:

    // End:0x1F9 [Loop If]
    if(Idx < InOriginator.GeneratedEvents.Length)
    {
        MessageEvent = LPSeqEvent_VitalSuitLaRocheFightPhaseChange(InOriginator.GeneratedEvents[Idx]);
        // End:0x1EB
        if(MessageEvent != none)
        {
            MessageEvent.HandleMessage(InOriginator, VsLarochePawn, inLaRocheBossFightPhaseEvent, Priority);
        }
        Idx++;
        // [Loop Continue]
        goto J0x131;
    }
    //return;    
}

function TestCurrentCombatStateForAbleToDamageThisCore()
{
    local /*0x97E50000-0x00000000*/ private byte coreInQ[8388609], Core2TestAgainst;
    local /*0x97E50000-0x00000000*/ private bool bHasToBeInStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class CurSmRequired[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA7
    if(int(coreInQ) == int(Core2TestAgainst))
    {
        // End:0x50
        if(bHasToBeInStruggleMode && !VsLarochePawn.InStruggleMode)
        {
            return false;
        }
        // End:0xA7
        if(!ClassIsChildOf(MyLPEnemy.SpecialMoveState.CurSMInfo.SpecialMoveClass, CurSmRequired))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function NotifyEmpShutdownInstigatorShutdownOver()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRecovering[8388609];

    ChangeCurrentLarocheMacroCombatState(GetLastLarocheMacroCombatState());
    //return;    
}

simulated function NotifyWonStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM, vsEnemyPawn;

    vsEnemyPawn = LPBaseVSPlayerPawn(EnemyPawn);
    // End:0x92
    if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_PlayerVSWinchedVsLaRoche'))
    {
        ChangeCurrentLarocheMacroCombatState(7);
        vsEnemyPawn.HandleLaRocheEMP(Class'LPDamageTypeEMPGrenade', VsLarochePawn, 'VSLaRocheEMPInto');        
    }
    else
    {
        // End:0x138
        if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike'))
        {
            // End:0xEF
            if(!bNotifyLaRocheUsingEmpAttackTheFirstTimeDialogPlayed)
            {
                bNotifyLaRocheUsingEmpAttackTheFirstTimeDialogPlayed = true;
                HandleBossFightPhaseEventMessage(EnemyPawn, 13);
            }
            ChangeCurrentLarocheMacroCombatState(7);
            vsEnemyPawn.HandleLaRocheEMP(Class'LPDamageTypeEMPGrenade', VsLarochePawn, 'VSLaRocheEMPAnimInto');            
        }
        else
        {
            // End:0x1AB
            if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_VsPlayerVsLarocheStruggleVsShuttingDownUrWithTaser'))
            {
                ChangeCurrentLarocheMacroCombatState(7);
                vsEnemyPawn.HandleLaRocheEMP(Class'LPDamageTypeEMPGrenade', VsLarochePawn, 'VSLaRocheEMPAnimInto');
            }
        }
    }
    //return;    
}

simulated function NotifyLostStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    // End:0x51
    if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_VsPlayerVsLarocheStruggleVsDisableToRipOpenTheCockpit'))
    {
        VsLarochePawn.bHasCockpitGrabBeenEnabled = true;        
    }
    else
    {
        // End:0xA6
        if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit'))
        {
            HandleBossFightPhaseEventMessage(EnemyPawn, 0);
            NeedToShutdown(EnemyPawn);
        }
    }
    //return;    
}

simulated function NeedToShutdown()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnShutingMeDown[8388609];

    HandleBossFightPhaseEventMessage(VsLarochePawn.TakeDamageParams.InstigatedByPawn, 0);
    //return;    
}

event ChangeCurrentLarocheMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private byte NewDesiredState[8388609];

    // End:0x1D
    if(int(NewDesiredState) == int(CurrentLarocheMacroCombatState))
    {
        return;
    }
    // End:0x70
    if(((int(NewDesiredState) != int(8)) && int(CurrentLarocheMacroCombatState) != int(7)) && int(CurrentLarocheMacroCombatState) != int(8))
    {
        LastLarocheMacroCombatState = CurrentLarocheMacroCombatState;
    }
    CurrentLarocheMacroCombatState = NewDesiredState;
    UpdateVsLightsOnCombatStateChange(CurrentLarocheMacroCombatState);
    //return;    
}

function OnSetVsLaRocheMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x54
    if(int(Action.NewLaRocheMacroCombatState) != int(0))
    {
        ChangeCurrentLarocheMacroCombatState(Action.NewLaRocheMacroCombatState);        
    }
    //return;    
}

function UpdateVsLightsOnCombatStateChange()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    switch(NewState)
    {
        // End:0x58
        case 1:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToSawCentricRigLightValues);
            // End:0x1B4
            break;
        // End:0x9D
        case 2:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToSawNoTaserRigLightValues);
            // End:0x1B4
            break;
        // End:0xE2
        case 3:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToTaserCentricRigLightValues);
            // End:0x1B4
            break;
        // End:0x127
        case 4:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToBackupSawRigLightValues);
            // End:0x1B4
            break;
        // End:0x16C
        case 5:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToHipsRigLightValues);
            // End:0x1B4
            break;
        // End:0x1B1
        case 6:
            UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToBerserkRigLightValues);
            // End:0x1B4
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ResetLightsByStage()
{
    local /*0x97E50000-0x00000000*/ private byte CurrentState;

    CurrentState = GetCurrentLarocheMacroCombatState();
    switch(CurrentState)
    {
        // End:0x3B
        case 1:
            UpdateVsLightsOnCombatStateChange(1);
            // End:0x126
            break;
        // End:0x5B
        case 2:
            UpdateVsLightsOnCombatStateChange(1);
            UpdateVsLightsOnCombatStateChange(2);
            // End:0x126
            break;
        // End:0x7B
        case 3:
            UpdateVsLightsOnCombatStateChange(1);
            UpdateVsLightsOnCombatStateChange(3);
            // End:0x126
            break;
        // End:0xA7
        case 4:
            UpdateVsLightsOnCombatStateChange(1);
            UpdateVsLightsOnCombatStateChange(3);
            UpdateVsLightsOnCombatStateChange(4);
            // End:0x126
            break;
        // End:0xDF
        case 5:
            UpdateVsLightsOnCombatStateChange(1);
            UpdateVsLightsOnCombatStateChange(3);
            UpdateVsLightsOnCombatStateChange(4);
            UpdateVsLightsOnCombatStateChange(5);
            // End:0x126
            break;
        // End:0x123
        case 6:
            UpdateVsLightsOnCombatStateChange(1);
            UpdateVsLightsOnCombatStateChange(3);
            UpdateVsLightsOnCombatStateChange(4);
            UpdateVsLightsOnCombatStateChange(5);
            UpdateVsLightsOnCombatStateChange(6);
            // End:0x126
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function UpdateVsPulseLightsOnCombatStateChangeToTheseVal()
{
    local /*0x97E50000-0x00000000*/ private @NULL ValsToChange[25165825], NewVals;

    // End:0x59
    if(NewVals.bChangeRigPulseTypeOnCombatPhaseChange)
    {
        ValsToChange.RigPulseType = NewVals.RigPulseType;
    }
    // End:0xB6
    if(NewVals.PulseFrequency >= float(0))
    {
        ValsToChange.PulseFrequency = NewVals.PulseFrequency;
    }
    // End:0x113
    if(NewVals.PulseReductionFactor >= float(0))
    {
        ValsToChange.PulseReductionFactor = NewVals.PulseReductionFactor;
    }
    // End:0x170
    if(NewVals.PulseMaxOutput >= float(0))
    {
        ValsToChange.PulseMaxOutput = NewVals.PulseMaxOutput;
    }
    // End:0x1CD
    if(NewVals.PulseMinOutput >= float(0))
    {
        ValsToChange.PulseMinOutput = NewVals.PulseMinOutput;
    }
    // End:0x22A
    if(NewVals.PulseRate >= float(0))
    {
        ValsToChange.PulseRate = NewVals.PulseRate;
    }
    //return;    
}

function UpdateVsLightsOnCombatStateChangeToTheseVal()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewVals[25296897];

    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.SawGenPulseLightsFactor, NewVals.SawGenPulseLightsFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.CockPitCameraEyeLightsFactor, NewVals.CockPitCameraEyeLightsFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.CockPitPulseLightsFactor, NewVals.CockPitPulseLightsFactor);
    // End:0x12B
    if(NewVals.EmpFacePlateLightsFactor >= float(0))
    {
        VsLarochePawn.EmpFacePlateLightsFactor = NewVals.EmpFacePlateLightsFactor;
    }
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.LeftShoulderShieldRailPulseLightFactor, NewVals.LeftShoulderShieldRailPulseLightFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.RightShoulderShieldRailPulseLightFactor, NewVals.RightShoulderShieldRailPulseLightFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.LeftShoulderSpotPulseLightFactor, NewVals.LeftShoulderSpotPulseLightFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.RightShoulderSpotPulseLightFactor, NewVals.RightShoulderSpotPulseLightFactor);
    // End:0x29A
    if(NewVals.LeftShoulderJointLightFactor >= float(0))
    {
        VsLarochePawn.LeftShoulderJointLightFactor = NewVals.LeftShoulderJointLightFactor;
    }
    // End:0x2F9
    if(NewVals.RightShoulderJointLightFactor >= float(0))
    {
        VsLarochePawn.RightShoulderJointLightFactor = NewVals.RightShoulderJointLightFactor;
    }
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.LeftHipShieldRailPulseLightFactor, NewVals.LeftHipShieldRailPulseLightFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.LeftHipCriticalEquipmentLightFactor, NewVals.LeftHipCriticalEquipmentLightFactor);
    UpdateVsPulseLightsOnCombatStateChangeToTheseVal(VsLarochePawn.RightHipShieldRailPulseLightFactor, NewVals.RightHipShieldRailPulseLightFactor);
    // End:0x424
    if(NewVals.EmpChargeStateFactor >= float(0))
    {
        VsLarochePawn.EmpChargeStateFactor = NewVals.EmpChargeStateFactor;
    }
    // End:0x483
    if(NewVals.EmpLightFactor >= float(0))
    {
        VsLarochePawn.EmpLightFactor = NewVals.EmpLightFactor;
    }
    //return;    
}

function UpdateVsLightsOnStunStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToFullStunRigLightValues);
    //return;    
}

function UpdateVsLightsOnStunRecoveryStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.RecoveryFromFullStunRigLightValues);
    //return;    
}

function UpdateVsLightsRightShoulderStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToRightShoulderShieldStruggleLightValues);
    //return;    
}

function UpdateVsLightsSawGenStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToSawGenStruggleLightValues);
    //return;    
}

function UpdateVsLightsLeftShoulderShieldStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToLeftShoulderShieldStruggleLightValues);
    //return;    
}

function UpdateVsLightsCommUnitStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToCommUnitStruggleLightValues);
    //return;    
}

function UpdateVsLightsHipShieldStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToHipsShieldStruggleLightValues);
    //return;    
}

function UpdateVsLightsHipStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToHipsStruggleLightValues);
    //return;    
}

function UpdateVsLightsRippingOpenCockStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToRippingOpenCockStruggleLightValues);
    //return;    
}

function UpdateVsLightsKoStruggleStart()
{
    UpdateVsLightsOnCombatStateChangeToTheseVal(VsLarochePawn.TuneDataVsLaroche.ChangeToKoStruggleLightValues);
    VsLarochePawn.LeftClavLightFactor = VsLarochePawn.TuneDataVsLaroche.ChangeToKoStruggleLeftClavLightValues;
    //return;    
}

function NotifyJustReleasedFromGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL MoveEnding[8388609], GrapplerReleasingMe;
    local /*0x97E50000-0x00000000*/ private bool bGrabAbruptRelease[8388609];

    // End:0x19
    if(!bGrabAbruptRelease)
    {
        ResetLightsByStage();
    }
    //return;    
}

function GetMinSeperationAgainstVsToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x740
    if(VsLarochePawn != none)
    {
        // End:0xAF
        if(((int(CurrentLaRocheStrikeAttempting) == int(10)) || int(CurrentLaRocheStrikeAttempting) == int(11)) || int(CurrentLaRocheStrikeAttempting) == int(12))
        {
            return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSuperSawStrikeVs.GetValue(), TheEnemy);            
        }
        else
        {
            // End:0x14F
            if(((int(CurrentLaRocheStrikeAttempting) == int(15)) || int(CurrentLaRocheStrikeAttempting) == int(16)) || int(CurrentLaRocheStrikeAttempting) == int(17))
            {
                return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSuperTaserStrikeVs.GetValue(), TheEnemy);                
            }
            else
            {
                // End:0x1EF
                if(((int(CurrentLaRocheStrikeAttempting) == int(20)) || int(CurrentLaRocheStrikeAttempting) == int(21)) || int(CurrentLaRocheStrikeAttempting) == int(22))
                {
                    return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartHulkSmashStrikeVs.GetValue(), TheEnemy);                    
                }
                else
                {
                    // End:0x263
                    if(int(CurrentLaRocheStrikeAttempting) == int(29))
                    {
                        return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartGrabingUR.GetValue(), TheEnemy);                        
                    }
                    else
                    {
                        // End:0x2ED
                        if((int(CurrentLaRocheStrikeAttempting) == int(1)) || int(CurrentLaRocheStrikeAttempting) == int(2))
                        {
                            return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartJabStrikeVs.GetValue(), TheEnemy);                            
                        }
                        else
                        {
                            // End:0x377
                            if((int(CurrentLaRocheStrikeAttempting) == int(3)) || int(CurrentLaRocheStrikeAttempting) == int(4))
                            {
                                return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartHookStrikeVs.GetValue(), TheEnemy);                                
                            }
                            else
                            {
                                // End:0x417
                                if(((int(CurrentLaRocheStrikeAttempting) == int(7)) || int(CurrentLaRocheStrikeAttempting) == int(8)) || int(CurrentLaRocheStrikeAttempting) == int(9))
                                {
                                    return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartJabStrikeVs.GetValue(), TheEnemy);                                    
                                }
                                else
                                {
                                    // End:0x48B
                                    if(int(CurrentLaRocheStrikeAttempting) == int(28))
                                    {
                                        return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartEmpPulseProjLaunchStrikeVs.GetValue(), TheEnemy);                                        
                                    }
                                    else
                                    {
                                        // End:0x4FF
                                        if(int(CurrentLaRocheStrikeAttempting) == int(23))
                                        {
                                            return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVs.GetValue(), TheEnemy);                                            
                                        }
                                        else
                                        {
                                            // End:0x573
                                            if(int(CurrentLaRocheStrikeAttempting) == int(23))
                                            {
                                                return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVs.GetValue(), TheEnemy);                                                
                                            }
                                            else
                                            {
                                                // End:0x5E7
                                                if(int(CurrentLaRocheStrikeAttempting) == int(23))
                                                {
                                                    return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVs.GetValue(), TheEnemy);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x65B
                                                    if(int(CurrentLaRocheStrikeAttempting) == int(24))
                                                    {
                                                        return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsVs.GetValue(), TheEnemy);                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x6CF
                                                        if(int(CurrentLaRocheStrikeAttempting) == int(25))
                                                        {
                                                            return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsVs.GetValue(), TheEnemy);                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x740
                                                            if(int(CurrentLaRocheStrikeAttempting) == int(30))
                                                            {
                                                                return ConvertRangeToSeperation2D(VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartGrabingUR.GetValue(), TheEnemy);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return 200.0000000;
    //return ReturnValue;    
}

event GetCurrentLarocheMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return CurrentLarocheMacroCombatState;
    //return ReturnValue;    
}

event GetLastLarocheMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return LastLarocheMacroCombatState;
    //return ReturnValue;    
}

final function GetCurrentLaRocheCombatPhaseStatData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    switch(GetCurrentLarocheMacroCombatState())
    {
        // End:0x23
        case 1:
            return SawCentricLaRocheCombatPhaseStatInfo;
        // End:0x28
        case 2:
        // End:0x37
        case 3:
            return TaserCentricLaRocheCombatPhaseStatInfo;
        // End:0x46
        case 4:
            return BackupSawLaRocheCombatPhaseStatInfo;
        // End:0x4B
        case 5:
        // End:0x5A
        case 6:
            return BerserkLaRocheCombatPhaseStatInfo;
        // End:0xFFFF
        default:
            return BerserkLaRocheCombatPhaseStatInfo;
            break;
    }
    //return ReturnValue;    
}

function TurnOffRightPartOfEnergyShield()
{
    // End:0x2E
    if(VsLarochePawn != none)
    {
        VsLarochePawn.TurnOffRightBonesOfEnergyShield();
    }
    //return;    
}

function TurnOffLeftPartOfEnergyShield()
{
    // End:0x2E
    if(VsLarochePawn != none)
    {
        VsLarochePawn.TurnOffLeftBonesOfEnergyShield();
    }
    //return;    
}

function TurnOffTheEnergyShield()
{
    // End:0x2E
    if(VsLarochePawn != none)
    {
        VsLarochePawn.TurnOffTheEnergyShield();
    }
    //return;    
}

function NotifyCurrentTakeDamageWillShutdownVsOpponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsGoingToShutdown[8388609];
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x5C
    if(myCommand != none)
    {
        myCommand.NotifyCurrentTakeDamageWillShutdownVsOpponent(VsGoingToShutdown, NewDamage);
    }
    //return;    
}

simulated function NotifyShouldCheckForComboStrikeContinuation()
{
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D, minSeperationToEnemyRequiredForStrike;

    seperationToEnemy2D = SeperationToPawn2D(MyLPEnemy);
    minSeperationToEnemyRequiredForStrike = GetMinSeperationAgainstVsToRequireMoveBeforeStrike(MyLPEnemy);
    // End:0x64
    if((MyLPEnemy != none) && seperationToEnemy2D > minSeperationToEnemyRequiredForStrike)
    {
        return;
    }
    VsLarochePawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmAltActionPressed, self);
    return;
    //return;    
}

function ChooseBestNonGrabOrStruggleStrikeBasedOnTheseCombatConditions()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentLaRocheCombatPhaseStatInfo[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float randChance, hookChance, armSwingChance, threeArmSwingChance, combo1Chance, combo2Chance,
	    combo3Chance, sawCombo1Chance, sawCombo2Chance, sawCombo3Chance, taserCombo1Chance,
	    taserCombo2Chance, taserCombo3Chance, hulkSmashCombo1Chance, hulkSmashCombo2Chance, hulkSmashCombo3Chance,
	    strightArmSawChance, shoulderChargeChance, doubleArmSmashChance;

    // End:0x3A
    if(ShouldTryEmpPulseProjLaunchStrike(CurrentLaRocheCombatPhaseStatInfo))
    {
        VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
        return 28;
    }
    hookChance = CurrentLaRocheCombatPhaseStatInfo.JabChance + CurrentLaRocheCombatPhaseStatInfo.hookChance;
    armSwingChance = hookChance + CurrentLaRocheCombatPhaseStatInfo.armSwingChance;
    threeArmSwingChance = armSwingChance + CurrentLaRocheCombatPhaseStatInfo.threeArmSwingChance;
    combo1Chance = threeArmSwingChance + CurrentLaRocheCombatPhaseStatInfo.combo1Chance;
    combo2Chance = combo1Chance + CurrentLaRocheCombatPhaseStatInfo.combo2Chance;
    combo3Chance = combo2Chance + CurrentLaRocheCombatPhaseStatInfo.combo3Chance;
    sawCombo1Chance = combo3Chance + CurrentLaRocheCombatPhaseStatInfo.SawSideCombo1Chance;
    sawCombo2Chance = sawCombo1Chance + CurrentLaRocheCombatPhaseStatInfo.SawSideCombo2Chance;
    sawCombo3Chance = sawCombo2Chance + CurrentLaRocheCombatPhaseStatInfo.SawSideCombo3Chance;
    taserCombo1Chance = sawCombo3Chance + CurrentLaRocheCombatPhaseStatInfo.TaserSideCombo1Chance;
    taserCombo2Chance = taserCombo1Chance + CurrentLaRocheCombatPhaseStatInfo.TaserSideCombo2Chance;
    taserCombo3Chance = taserCombo2Chance + CurrentLaRocheCombatPhaseStatInfo.TaserSideCombo3Chance;
    hulkSmashCombo1Chance = sawCombo3Chance + CurrentLaRocheCombatPhaseStatInfo.hulkSmashCombo1Chance;
    hulkSmashCombo2Chance = hulkSmashCombo1Chance + CurrentLaRocheCombatPhaseStatInfo.hulkSmashCombo2Chance;
    hulkSmashCombo3Chance = hulkSmashCombo2Chance + CurrentLaRocheCombatPhaseStatInfo.hulkSmashCombo3Chance;
    strightArmSawChance = hulkSmashCombo3Chance + CurrentLaRocheCombatPhaseStatInfo.StrightSawChance;
    shoulderChargeChance = strightArmSawChance + CurrentLaRocheCombatPhaseStatInfo.shoulderChargeChance;
    doubleArmSmashChance = shoulderChargeChance + CurrentLaRocheCombatPhaseStatInfo.doubleArmSmashChance;
    randChance = RandRange(0.0000000, 1.0000000);
    // End:0x489
    if(randChance < CurrentLaRocheCombatPhaseStatInfo.JabChance)
    {
        // End:0x462
        if(FRand() > 0.5000000)
        {
            VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
            return 1;            
        }
        else
        {
            VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
            return 2;
        }        
    }
    else
    {
        // End:0x4FA
        if(randChance < hookChance)
        {
            // End:0x4D3
            if(FRand() > 0.5000000)
            {
                VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
                return 3;                
            }
            else
            {
                VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
                return 4;
            }            
        }
        else
        {
            // End:0x538
            if(randChance < armSwingChance)
            {
                VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
                return 24;                
            }
            else
            {
                // End:0x576
                if(randChance < threeArmSwingChance)
                {
                    VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                    return 25;                    
                }
                else
                {
                    // End:0x5B4
                    if(randChance < combo1Chance)
                    {
                        VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                        return 7;                        
                    }
                    else
                    {
                        // End:0x5F2
                        if(randChance < combo2Chance)
                        {
                            VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                            return 8;                            
                        }
                        else
                        {
                            // End:0x630
                            if(randChance < combo3Chance)
                            {
                                VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                return 9;                                
                            }
                            else
                            {
                                // End:0x66E
                                if(randChance < sawCombo1Chance)
                                {
                                    VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                    return 10;                                    
                                }
                                else
                                {
                                    // End:0x6AC
                                    if(randChance < sawCombo2Chance)
                                    {
                                        VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                        return 11;                                        
                                    }
                                    else
                                    {
                                        // End:0x6EA
                                        if(randChance < sawCombo3Chance)
                                        {
                                            VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                            return 12;                                            
                                        }
                                        else
                                        {
                                            // End:0x728
                                            if(randChance < taserCombo1Chance)
                                            {
                                                VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                return 15;                                                
                                            }
                                            else
                                            {
                                                // End:0x766
                                                if(randChance < taserCombo2Chance)
                                                {
                                                    VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                    return 16;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x7A4
                                                    if(randChance < taserCombo3Chance)
                                                    {
                                                        VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                        return 17;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x7E2
                                                        if(randChance < hulkSmashCombo1Chance)
                                                        {
                                                            VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                            return 20;                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x820
                                                            if(randChance < hulkSmashCombo2Chance)
                                                            {
                                                                VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                                return 21;                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x85E
                                                                if(randChance < hulkSmashCombo3Chance)
                                                                {
                                                                    VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                                    return 22;                                                                    
                                                                }
                                                                else
                                                                {
                                                                    // End:0x89C
                                                                    if(randChance < strightArmSawChance)
                                                                    {
                                                                        VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                                        return 23;                                                                        
                                                                    }
                                                                    else
                                                                    {
                                                                        // End:0x8DA
                                                                        if(randChance < shoulderChargeChance)
                                                                        {
                                                                            VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                                            return 26;                                                                            
                                                                        }
                                                                        else
                                                                        {
                                                                            // End:0x915
                                                                            if(randChance < doubleArmSmashChance)
                                                                            {
                                                                                VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                                                return 27;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

function ChooseBestGrabOrStruggleStrikeBasedOnTheseCombatConditions()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentLaRocheCombatPhaseStatInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float randChance;
    local /*0x97E50000-0x00000000*/ private bool bEMPDestroyed;
    local /*0x97E50000-0x00000000*/ private float empChance, taserChance, koChance, drillKillChance, cockKillChance, timeDeltaSinceLastGrab;

    // End:0x39
    if(LPBasePlayerPawn(MyLPEnemy).bIncapacitated)
    {
        CurrentLaRocheStruggleModeAttempting = 0;
        return false;
    }
    // End:0xB5
    if((!VsLarochePawn.TuneDataVsLaroche.bForceGrabsOnlyNoFreeAttacks && !bDidLastStrikeOfLastComboLand) && CurrentLaRocheCombatPhaseStatInfo.bLastStrikeOfComboRequiredToLandBeforeStruggleAttempt)
    {
        CurrentLaRocheStruggleModeAttempting = 0;
        return false;
    }
    // End:0xFA
    if(VsLarochePawn.TuneDataVsLaroche.bForceNotAllowedToGrabOnlyFreeAttacks)
    {
        CurrentLaRocheStruggleModeAttempting = 0;
        return false;
    }
    // End:0x177
    if(int(VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode) != int(0))
    {
        CurrentLaRocheStruggleModeAttempting = VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode;
        return true;
    }
    timeDeltaSinceLastGrab = WorldInfo.TimeSeconds - VsLarochePawn.LastTimeAttemptedToGrabOtherPawn;
    // End:0x1ED
    if(timeDeltaSinceLastGrab < CurrentLaRocheCombatPhaseStatInfo.MinDelayRequiredBetweenAttemptedGrabsForStruggle)
    {
        return false;
    }
    // End:0x24D
    if(VsLarochePawn.GetCoreHealth(17) > float(0))
    {
        bEMPDestroyed = false;
        empChance = CurrentLaRocheCombatPhaseStatInfo.BaseEmpStruggleChance;        
    }
    else
    {
        bEMPDestroyed = true;
        empChance = 0.0000000;
    }
    taserChance = empChance + CurrentLaRocheCombatPhaseStatInfo.TaserStruggleChance;
    // End:0x305
    if(bEMPDestroyed)
    {
        koChance = (taserChance + CurrentLaRocheCombatPhaseStatInfo.KnockOutStruggleChance) + (CurrentLaRocheCombatPhaseStatInfo.BaseEmpStruggleChance * 0.5000000);        
    }
    else
    {
        koChance = taserChance + CurrentLaRocheCombatPhaseStatInfo.KnockOutStruggleChance;
    }
    drillKillChance = koChance + CurrentLaRocheCombatPhaseStatInfo.DrillKillStruggleChance;
    cockKillChance = drillKillChance + CurrentLaRocheCombatPhaseStatInfo.CockKillStruggleChance;
    // End:0x408
    if(bEMPDestroyed)
    {
        cockKillChance = (drillKillChance + CurrentLaRocheCombatPhaseStatInfo.CockKillStruggleChance) + (CurrentLaRocheCombatPhaseStatInfo.BaseEmpStruggleChance * 0.5000000);        
    }
    else
    {
        cockKillChance = drillKillChance + CurrentLaRocheCombatPhaseStatInfo.CockKillStruggleChance;
    }
    randChance = RandRange(0.0000000, 1.0000000);
    // End:0x481
    if(randChance < empChance)
    {
        CurrentLaRocheStruggleModeAttempting = 1;
        return true;        
    }
    else
    {
        // End:0x4A9
        if(randChance < taserChance)
        {
            CurrentLaRocheStruggleModeAttempting = 2;
            return true;            
        }
        else
        {
            // End:0x4D1
            if(randChance < koChance)
            {
                CurrentLaRocheStruggleModeAttempting = 3;
                return true;                
            }
            else
            {
                // End:0x4F9
                if(randChance < drillKillChance)
                {
                    CurrentLaRocheStruggleModeAttempting = 4;
                    return true;                    
                }
                else
                {
                    // End:0x51E
                    if(randChance < cockKillChance)
                    {
                        CurrentLaRocheStruggleModeAttempting = 5;
                        return true;
                    }
                }
            }
        }
    }
    CurrentLaRocheStruggleModeAttempting = 0;
    return false;
    //return ReturnValue;    
}

function ShouldTryEmpPulseProjLaunchStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentLaRocheCombatPhaseStatInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceLastEmpPulseProjStrike, rangeToEnemy;

    // End:0x142
    if(CurrentLaRocheCombatPhaseStatInfo.bAllowedToLaunchEmpPulseStrike)
    {
        // End:0x4F
        if(LPBasePlayerPawn(MyLPEnemy).bIncapacitated)
        {
            return false;
        }
        timeSinceLastEmpPulseProjStrike = WorldInfo.TimeSeconds - VsLarochePawn.LastTimeSuccessfullyLaunchedEmpPulseProj;
        // End:0x13F
        if(timeSinceLastEmpPulseProjStrike >= CurrentLaRocheCombatPhaseStatInfo.MinTimeBetweenEmpPulseStrikes)
        {
            rangeToEnemy = RangeToPawn(MyLPEnemy);
            // End:0x13C
            if(rangeToEnemy > VsLarochePawn.TuneDataVsLaroche.MinDistanceAwayFromTargetToAllowEmpPulseFireStrike.GetValue())
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function GetRandomWaitTimeBetweenStrikesBasedOnLastStrikeForThisCombatPhase()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentLaRocheCombatPhaseStatInfo[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], randWait;

    // End:0x7D
    if((int(CurrentLaRocheStrikeAttempting) == int(1)) || int(CurrentLaRocheStrikeAttempting) == int(2))
    {
        randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterJabWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterJabWaitTime);        
    }
    else
    {
        // End:0xFA
        if((int(CurrentLaRocheStrikeAttempting) == int(3)) || int(CurrentLaRocheStrikeAttempting) == int(4))
        {
            randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterHookWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterHookWaitTime);            
        }
        else
        {
            // End:0x161
            if(int(CurrentLaRocheStrikeAttempting) == int(7))
            {
                randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterCombo1WaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterCombo1WaitTime);                
            }
            else
            {
                // End:0x1C8
                if(int(CurrentLaRocheStrikeAttempting) == int(8))
                {
                    randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterCombo2WaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterCombo2WaitTime);                    
                }
                else
                {
                    // End:0x22F
                    if(int(CurrentLaRocheStrikeAttempting) == int(9))
                    {
                        randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterCombo3WaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterCombo3WaitTime);                        
                    }
                    else
                    {
                        // End:0x296
                        if(int(CurrentLaRocheStrikeAttempting) == int(23))
                        {
                            randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterStrightSawWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterStrightSawWaitTime);                            
                        }
                        else
                        {
                            // End:0x2FD
                            if(int(CurrentLaRocheStrikeAttempting) == int(24))
                            {
                                randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterArmSwingWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterArmSwingWaitTime);                                
                            }
                            else
                            {
                                // End:0x364
                                if(int(CurrentLaRocheStrikeAttempting) == int(25))
                                {
                                    randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterThreeArmSwingWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterThreeArmSwingWaitTime);                                    
                                }
                                else
                                {
                                    // End:0x3CB
                                    if(int(CurrentLaRocheStrikeAttempting) == int(26))
                                    {
                                        randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterShoulderChargeWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterShoulderChargeWaitTime);                                        
                                    }
                                    else
                                    {
                                        // End:0x432
                                        if(int(CurrentLaRocheStrikeAttempting) == int(27))
                                        {
                                            randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterDoubleArmSmashWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterDoubleArmSmashWaitTime);                                            
                                        }
                                        else
                                        {
                                            // End:0x499
                                            if(int(CurrentLaRocheStrikeAttempting) == int(29))
                                            {
                                                randWait = RandRange(CurrentLaRocheCombatPhaseStatInfo.MinAfterGrabForStruggleWaitTime, CurrentLaRocheCombatPhaseStatInfo.MaxAfterGrabForStruggleWaitTime);                                                
                                            }
                                            else
                                            {
                                                randWait = RandRange(myAIPawn.TuneDataAIPawn.MinDelayBetweenStrikeAttempts.GetValue(), myAIPawn.TuneDataAIPawn.MaxDelayBetweenStrikeAttempts.GetValue());
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return randWait;
    //return ReturnValue;    
}

function CheckToDisplayEndOfPhaseMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayerWon[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPc[8388609];

    // End:0x11
    if(CurrentPc == none)
    {
        return;
    }
    //return;    
}

function CmdHitReactionToStun()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class StunSpecialMove[8388609], HitReactionSpecialMove, RecoverFromStunSpecialMove;
    local /*0x97E50000-0x00000000*/ private @NULL InPawnCausingStun[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x35
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheHitReactionToStun'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheHitReactionToStun(GetActiveCommand());
    // End:0x121
    if(myCommand != none)
    {
        myCommand.SetStunnedDuration(StunnedDuration);
        myCommand.SetSunnedSpecialMove(StunSpecialMove);
        myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
        myCommand.SetRecoverSpecialMove(RecoverFromStunSpecialMove);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheDamageAssessment(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffForDramaticDialogOpportunity()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffAfterTaseringOrEmpingJimsUR()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackoffAfterTaseringJimsUR'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackoffAfterTaseringJimsUR(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToShowOffSaw()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToShowOffSaw'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToShowOffSaw(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToSawGenDestroyedAndTaserStartUp()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InSetEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToSawGenDestroyedAndTaserStartUp'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToSawGenDestroyedAndTaserStartUp(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InSetEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToSawGenDestroyedAndEnergyShield()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InSetEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToSawGenDestroyedAndEnergyShield'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToSawGenDestroyedAndEnergyShield(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InSetEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToTaserGenDestroyedAndEnergyShield()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InSetEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToTaserGenDestroyedAndEnergyShield'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToTaserGenDestroyedAndEnergyShield(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InSetEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToJustTaserGenDestroyed()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InSetEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToJustTaserGenDestroyed'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToJustTaserGenDestroyed(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InSetEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackOffToHipDestroyedAndStartBackUpSawGen()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InSetEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToHipDestroyedAndStartBackUpSawGen'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToHipDestroyedAndStartBackUpSawGen(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InSetEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBackoffToStartBackUpGen()
{
    local /*0x97E50000-0x00000000*/ private float InMaxTimeOfThisDialog[8388609];
    local /*0x97E50000-0x00000000*/ private byte InEventToFireAtStartOfOpportunity[8388609];
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBackOffToStartBackUpGen'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBackOffToStartBackUpGen(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMaxDurationOfOpportunity(InMaxTimeOfThisDialog);
        myCommand.SetEventToFireAtStartOfOpportunity(InEventToFireAtStartOfOpportunity);
        myCommand.SetDelayAfterOpportunityCleanUpBeforeEndingCommand(InDelayAfterOpportunityCleanUpBeforeEndingCommand);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSeperateAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2SeperateFrom[8388609];
    local /*0x97E50000-0x00000000*/ private float InMaxDurationOfSeperationOpportunity[8388609], InMinSeperationToBeAwayAfterStrikes;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSeperateAfterStrikes'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSeperateAfterStrikes(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2SeperateFrom);
        myCommand.SetMaxDurationOfSeperationOpportunity(InMaxDurationOfSeperationOpportunity);
        myCommand.SetMinSeperationToBeAwayAfterStrikes(InMinSeperationToBeAwayAfterStrikes);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheDirectAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheDirectAttackPof(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheDirectAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheDirectAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheDirectAttackVs(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheBerserkAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBerserkAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBerserkAttackPof(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheBerserkAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheBerserkAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheBerserkAttackVs(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheArmSweepStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheArmSweepStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheArmSweepStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheArmSweepStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheArmSweepStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheArmSweepStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheStrightSawingStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrightSawingStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrightSawingStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheStrightSawingStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrightSawingStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrightSawingStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheLeftJabStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheLeftJabStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheLeftJabStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheRightJabStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheRightJabStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheRightJabStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheLeftHookStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheLeftHookStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheLeftHookStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheRightHookStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheRightHookStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheRightHookStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheSuperSawStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSuperSawStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSuperSawStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheSuperTaserStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSuperTaserStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSuperTaserStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheCombo1Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheCombo1Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheCombo1Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheCombo2Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheCombo2Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheCombo2Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheCombo3Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheCombo3Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheCombo3Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheSawSideCombo1Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSawSideCombo1Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSawSideCombo1Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheSawSideCombo2Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSawSideCombo2Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSawSideCombo2Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheSawSideCombo3Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheSawSideCombo3Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheSawSideCombo3Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheTaserSideCombo1Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheTaserSideCombo1Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheTaserSideCombo1Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheTaserSideCombo2Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheTaserSideCombo2Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheTaserSideCombo2Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheTaserSideCombo3Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheTaserSideCombo3Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheTaserSideCombo3Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheHulkSmashCombo1Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheHulkSmashCombo1Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheHulkSmashCombo1Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheHulkSmashCombo2Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheHulkSmashCombo2Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheHulkSmashCombo2Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheHulkSmashCombo3Strike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheHulkSmashCombo3Strike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheHulkSmashCombo3Strike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheDoubleArmSmashStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheDoubleArmSmashStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheDoubleArmSmashStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheShoulderChargeStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheShoulderChargeStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheShoulderChargeStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightArm()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightArm'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightArm(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightElbow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightElbow'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightElbow(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightForeArm()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightForeArm'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightForeArm(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightArmToCutOffTool()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightArmToCutOffTool'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightArmToCutOffTool(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightHip()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightHip'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightHip(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheGrabStrikeVsRightWrist()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheGrabStrikeVsRightWrist'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheGrabStrikeVsRightWrist(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsShutDownVsWithEmpPulseStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStruggleVsShutDownVsWithEmpPulseStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStruggleVsShutDownVsWithEmpPulseStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsShutDownVsWithTaserStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStruggleVsShutDownVsWithTaserStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStruggleVsShutDownVsWithTaserStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsKnockOutHitsOnUrStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStruggleVsKnockOutHitsOnUrStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStruggleVsKnockOutHitsOnUrStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsCuttingOffRightToolStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStruggleVsCuttingOffRightToolStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStruggleVsCuttingOffRightToolStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsSawingCockpitStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStruggleVsSawingCockpitStrike'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStruggleVsSawingCockpitStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerDrillingCommShieldResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerDrillingCommShieldResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerDrillingCommShieldResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerDrillingCommArrayResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerDrillingCommArrayResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerDrillingCommArrayResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerDrillingMainSawGenResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerDrillingMainSawGenResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerDrillingMainSawGenResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerCauseByDrillMobilityKillResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerCauseByDrillMobilityKillResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerCauseByDrillMobilityKillResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerDrillingHipShieldResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerDrillingHipShieldResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerDrillingHipShieldResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerTorchingHipShieldResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerTorchingHipShieldResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerTorchingHipShieldResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerDisableToRipOpenTheCockpitResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerDisableToRipOpenTheCockpitResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerDisableToRipOpenTheCockpitResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerRippingOpenTheCockpitResponse()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerRippingOpenTheCockpitResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerRippingOpenTheCockpitResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStruggleVsPlayerTorchingMainSawGenOnRightShoulderGrab()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheStrugglePlayerTorchingMainSawGenResponse'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheStrugglePlayerTorchingMainSawGenResponse(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdWaitBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private float InHowLong[9437185];
    local /*0x97E50000-0x00000000*/ private bool InFaceEnemy[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1.0000000
    false
    1
    // End:0x3C
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLaRocheWaitBetweenStrikes'.static.InitCommand(self);
    myCommand = LPAICmd_VsLaRocheWaitBetweenStrikes(GetActiveCommand());
    // End:0x101
    if(myCommand != none)
    {
        myCommand.SetWaitingSpecialMove(InSpecialMoveClass);
        myCommand.SetHowLongToWait(InHowLong);
        myCommand.SetFaceEnemyDuringWait(InFaceEnemy);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdVsLarocheEmpProjStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VsLarocheEmpProjStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_VsLarocheEmpProjStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

state ForkArmGrab
{    stop;    
}

defaultproperties
{
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.SawCentricLaRocheCombatPhaseStatInfoD0'
    begin object name=SawCentricLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    SawCentricLaRocheCombatPhaseStatInfo=SawCentricLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.SawNoTaserLaRocheCombatPhaseStatInfoD0'
    begin object name=SawNoTaserLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    SawNoTaserLaRocheCombatPhaseStatInfo=SawNoTaserLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.TaserCentricLaRocheCombatPhaseStatInfoD0'
    begin object name=TaserCentricLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    TaserCentricLaRocheCombatPhaseStatInfo=TaserCentricLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.BackupSawLaRocheCombatPhaseStatInfoD0'
    begin object name=BackupSawLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    BackupSawLaRocheCombatPhaseStatInfo=BackupSawLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.HipsLaRocheCombatPhaseStatInfoD0'
    begin object name=HipsLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    HipsLaRocheCombatPhaseStatInfo=HipsLaRocheCombatPhaseStatInfoD0
    // Reference: LPLaRocheCombatPhaseStatData'Default__LPAIControllerVsLaroche.BerserkLaRocheCombatPhaseStatInfoD0'
    begin object name=BerserkLaRocheCombatPhaseStatInfoD0 class=Class'LPLaRocheCombatPhaseStatData'
    end object
    BerserkLaRocheCombatPhaseStatInfo=BerserkLaRocheCombatPhaseStatInfoD0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerVsLaroche.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerVsLaroche.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerVsLaroche.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerVsLaroche.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerVsLaroche.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerVsLaroche.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerVsLaroche.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerVsLaroche.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}