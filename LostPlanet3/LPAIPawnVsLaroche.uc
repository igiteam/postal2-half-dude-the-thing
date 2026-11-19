class LPAIPawnVsLaroche extends LPAIPawnMech
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataVsLaroche[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsLarocheController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerShutDownVsWithEmpPulseStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerShuttingDownUrWithTaser;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerKnockOutHitsOnUr;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCuttingOffRightTool;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingMainSawGen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingMainSawGen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingToExposeCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingToExposeCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingToDestroyCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingToDestroyCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingHipShield;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingHipShield;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCauseByDrillMobilityKill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCauseByTorchMobilityKill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDisableToRipOpenTheCockpit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerRippingOpenTheCockpit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftArmPart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CCDControl_LeftArm;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel class LeftArmPartClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingLeftArm;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingRightArm;
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private bool bSawRunning[65537];
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private bool bSawUseBackupGenerator[65537];
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private bool bSawingTheCockpit[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private bool bEnergyShieldAllowedToHaveRandomMovement[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformComboMeleeMoveThisStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingMultiMoveMeleeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify[536870913];
var(0.25_Pct) /*0x50560000-0x00000000*/ private bool bRightClavLightOn[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private bool bNotifiedToTurnRightShieldLightOn[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private bool bNotifiedToTurnLeftShieldLightOn[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private bool bNotifiedToTurnTaserGenLightOn[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private bool bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting[536936449];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasCockpitGrabBeenEnabled;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserParticleLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DistortFieldForShield[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmPart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RightArmPartClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RightArmPartInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ForkArmSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForkArmSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OutsideSawBladeSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OutsideSawBladeSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name InsideSawBladesSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InsideSawBladesSkelControl;
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private float SawBladesSpinRateInUUsPerSecond[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentPawnToApplyStruggleModeDamageTo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeDamageEnemysCockWithSawStruggle;
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private float DelayBetweenDamageEventsWhenSawingTheCockpit[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfSocketToStartTraceForSawingTheCockputDamageAt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfSocketToEndTraceForSawingTheCockputDamageAt;
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private float AmountOfDamagePerSawingTheCockpitEvent[65537];
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private class TypeOfDamageToApplyWhenSawingTheCockpit[65537];
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private float LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private @NULL EnergyShieldDriftVelocity[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldMaxAllowedRandomMovementDeltaZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMaxMovementDeltaPerSecZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldAllowedMinMovementDeltaPerSecZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MinTimeInSecBetweenChangesInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float MaxTimeInSecBetweenChangesInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftX[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftY[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float TimeForNextChangeInEngeryShieldDriftZ[65537];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private @NULL EnergyShieldOffsetForLeftSideGrabbed[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name EnergyShieldSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnergyShieldSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SawStartSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SawLoopingSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SawLoopingSoundComponentAsAC[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SawEndSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SawStartSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SawLoopingSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SawEndSound[536870913];
var(0.25_Pct) /*0xAF2D0000-0x00000000*/ private float NewSawSoundIntensityUnderBackUpGen[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserStartSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserLoopingSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserEndSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TaserStartSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TaserLoopingSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TaserEndSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmSawAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReplicatedForkArmGrabInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReplicatedForkArmGrabCurTweenValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForkArmGrabAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeSuccessfullyGrabOtherPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeAttemptedToGrabOtherPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RangedDirectFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeSuccessfullyLaunchedEmpPulseProj;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefaultRemoteInventoryParts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartsInvManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayedSuccessfulStrugglePhaseActionDamageAmount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DelayedSuccessfulStrugglePhaseActionDamageLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DelayedSuccessfulStrugglePhaseActionDamageType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DelayedSuccessfulStrugglePhaseActionPawnToDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WinchCable[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeadZoneForCombatWindowInputChoice[536870913];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL SawGenPulseLightsFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL CockPitCameraEyeLightsFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL CockPitPulseLightsFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float EmpFacePlateLightsFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL LeftShoulderShieldRailPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL RightShoulderShieldRailPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL LeftShoulderSpotPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL RightShoulderSpotPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float LeftShoulderJointLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float RightShoulderJointLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL LeftHipShieldRailPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL LeftHipCriticalEquipmentLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private @NULL RightHipShieldRailPulseLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float EmpChargeStateFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float EmpLightFactor[536936449];
var(0.25_Pct) /*0x50560000-0x00000000*/ private float LeftClavLightFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldPowerLightLeftFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldPowerLightRightFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldHexsLeftFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldHexsRightFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldProjectorLeftFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldProjectorRightFactor[536936449];
var(0.25_Pct) /*0x520B0000-0x00000000*/ private float EnergyShieldTraceLinesFactor[536936449];

// Export ULPAIPawnVsLaroche::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    bSawRunning = false;
    bSawUseBackupGenerator = false;
    AddDefaultInventory();
    AddDefaultRemoteInventoryParts();
    // End:0x69
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        NextVSWeapon();
    }
    CCDControl_LeftArm = LPSkelControl_CCD_IK(Mesh.FindSkelControl('CCDControl_ForkArm'));
    CCDControl_LeftArm.SetSkelControlActive(false);
    bPerformComboMeleeMoveThisStrike = false;
    bPerformingMultiMoveMeleeStrike = false;
    LastTimeSuccessfullyGrabOtherPawn = -1.0000000;
    LastTimeAttemptedToGrabOtherPawn = -1.0000000;
    LastTimeSuccessfullyLaunchedEmpPulseProj = -1.0000000;
    SawGenPulseLightsFactor.LastPulseTime = WorldInfo.TimeSeconds;
    CockPitCameraEyeLightsFactor.LastPulseTime = WorldInfo.TimeSeconds;
    LeftShoulderShieldRailPulseLightFactor.LastPulseTime = WorldInfo.TimeSeconds;
    RightShoulderShieldRailPulseLightFactor.LastPulseTime = WorldInfo.TimeSeconds;
    LeftHipShieldRailPulseLightFactor.LastPulseTime = WorldInfo.TimeSeconds;
    LeftHipCriticalEquipmentLightFactor.LastPulseTime = WorldInfo.TimeSeconds;
    RightHipShieldRailPulseLightFactor.LastPulseTime = WorldInfo.TimeSeconds;
    bHasCockpitGrabBeenEnabled = false;
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    MyVsLarocheController = LPAIControllerVsLaroche(C);
    //return;    
}

function UnPossessed()
{
    super.UnPossessed();
    MyVsLarocheController = none;
    //return;    
}

simulated event Destroyed()
{
    StopTaser();
    TurnOffLaRocheRigShieldDistort();
    // End:0x4D
    if(SawLoopingSoundComponent != none)
    {
        SawLoopingSoundComponent.DetachFromAny();
        SawLoopingSoundComponent = none;
    }
    // End:0x86
    if(SawStartSoundComponent != none)
    {
        SawStartSoundComponent.DetachFromAny();
        SawStartSoundComponent = none;
    }
    // End:0xBF
    if(SawEndSoundComponent != none)
    {
        SawEndSoundComponent.DetachFromAny();
        SawEndSoundComponent = none;
    }
    // End:0xF8
    if(TaserLoopingSoundComponent != none)
    {
        TaserLoopingSoundComponent.DetachFromAny();
        TaserLoopingSoundComponent = none;
    }
    // End:0x131
    if(TaserStartSoundComponent != none)
    {
        TaserStartSoundComponent.DetachFromAny();
        TaserStartSoundComponent = none;
    }
    // End:0x16A
    if(TaserEndSoundComponent != none)
    {
        TaserEndSoundComponent.DetachFromAny();
        TaserEndSoundComponent = none;
    }
    super.Destroyed();
    // End:0x1C9
    if(WinchCable != none)
    {
        DetachComponent(WinchCable);
        Class'Engine.SPObject'.static.MarkObjectAsPendingKill(WinchCable);
        WinchCable = none;
    }
    //return;    
}

simulated function NextVSWeapon()
{
    PartsInvManager.NextVSWeapon();
    //return;    
}

simulated function RemoveVSInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x4D
    foreach PartsInvManager.InventoryActors(Class'LPVSInventoryParts', W)
    {
        W.Destroy();        
    }    
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    super.InitTuneData(TuneData);
    TuneDataVsLaroche = LPTuneDataVsLaroche(TuneData);
    InitDamageTracking();
    // End:0xD7
    if(TuneDataVsLaroche != none)
    {
        iter = 0;
        J0x53:

        // End:0xD7 [Loop If]
        if(iter < TuneDataVsLaroche.BoneNamesToHideOnSpawn.Length)
        {
            Mesh.HideBoneByName(TuneDataVsLaroche.BoneNamesToHideOnSpawn[iter], 2);
            ++iter;
            // [Loop Continue]
            goto J0x53;
        }
    }
    SawBladesSpinRateInUUsPerSecond = TuneDataVsLaroche.SawBladesSpinRateInUUsPerSecond * 182.0444000;
    NewSawSoundIntensityUnderBackUpGen = TuneDataVsLaroche.NewSawSoundIntensityUnderBackUpGen;
    DeadZoneForCombatWindowInputChoice = TuneDataVsLaroche.DeadZoneForCombatWindowInputChoice.GetValue();
    TurnOffLeftBonesOfEnergyShield();
    TurnOffRightBonesOfEnergyShield();
    TurnOffTheEnergyShield();
    bRightClavLightOn = false;
    bNotifiedToTurnRightShieldLightOn = false;
    bNotifiedToTurnLeftShieldLightOn = false;
    bNotifiedToTurnTaserGenLightOn = false;
    bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting = false;
    DelayBetweenDamageEventsWhenSawingTheCockpit = TuneDataVsLaroche.DelayBetweenDamageEventsWhenSawingTheCockpit.GetValue();
    NameOfSocketToStartTraceForSawingTheCockputDamageAt = TuneDataVsLaroche.NameOfSocketToStartTraceForSawingTheCockputDamageAt;
    NameOfSocketToEndTraceForSawingTheCockputDamageAt = TuneDataVsLaroche.NameOfSocketToEndTraceForSawingTheCockputDamageAt;
    AmountOfDamagePerSawingTheCockpitEvent = TuneDataVsLaroche.AmountOfDamagePerSawingTheCockpitEvent.GetValue();
    TypeOfDamageToApplyWhenSawingTheCockpit = TuneDataVsLaroche.TypeOfDamageToApplyWhenSawingTheCockpit;
    LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit = TuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit.GetValue();
    //return;    
}

simulated function SetUpEnergyShieldDataFromTuneData()
{
    EnergyShieldMaxAllowedRandomMovementDeltaX = TuneDataVsLaroche.EnergyShieldMaxAllowedRandomMovementDeltaX;
    EnergyShieldMaxAllowedRandomMovementDeltaY = TuneDataVsLaroche.EnergyShieldMaxAllowedRandomMovementDeltaY;
    EnergyShieldMaxAllowedRandomMovementDeltaZ = TuneDataVsLaroche.EnergyShieldMaxAllowedRandomMovementDeltaZ;
    EnergyShieldAllowedMaxMovementDeltaPerSecX = TuneDataVsLaroche.EnergyShieldAllowedMaxMovementDeltaPerSecX;
    EnergyShieldAllowedMinMovementDeltaPerSecX = TuneDataVsLaroche.EnergyShieldAllowedMinMovementDeltaPerSecX;
    EnergyShieldAllowedMaxMovementDeltaPerSecY = TuneDataVsLaroche.EnergyShieldAllowedMaxMovementDeltaPerSecY;
    EnergyShieldAllowedMinMovementDeltaPerSecY = TuneDataVsLaroche.EnergyShieldAllowedMinMovementDeltaPerSecY;
    EnergyShieldAllowedMaxMovementDeltaPerSecZ = TuneDataVsLaroche.EnergyShieldAllowedMaxMovementDeltaPerSecZ;
    EnergyShieldAllowedMinMovementDeltaPerSecZ = TuneDataVsLaroche.EnergyShieldAllowedMinMovementDeltaPerSecZ;
    MinTimeInSecBetweenChangesInEngeryShieldDriftX = TuneDataVsLaroche.MinTimeInSecBetweenChangesInEngeryShieldDriftX;
    MaxTimeInSecBetweenChangesInEngeryShieldDriftX = TuneDataVsLaroche.MaxTimeInSecBetweenChangesInEngeryShieldDriftX;
    MinTimeInSecBetweenChangesInEngeryShieldDriftY = TuneDataVsLaroche.MinTimeInSecBetweenChangesInEngeryShieldDriftY;
    MaxTimeInSecBetweenChangesInEngeryShieldDriftY = TuneDataVsLaroche.MaxTimeInSecBetweenChangesInEngeryShieldDriftY;
    MinTimeInSecBetweenChangesInEngeryShieldDriftZ = TuneDataVsLaroche.MinTimeInSecBetweenChangesInEngeryShieldDriftZ;
    MaxTimeInSecBetweenChangesInEngeryShieldDriftZ = TuneDataVsLaroche.MaxTimeInSecBetweenChangesInEngeryShieldDriftZ;
    EnergyShieldOffsetForLeftSideGrabbed = TuneDataVsLaroche.EnergyShieldOffsetForLeftSideGrabbed;
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PerformPostInitAnimTreeActions(SkelComp);
    RightArmAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightArmAnimInfo.AnimNodeSlotName));
    RightArmSawAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightArmSawAnimInfo.AnimNodeSlotName));
    // End:0x127
    if(ForkArmSkelControlName != 'None')
    {
        ForkArmSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(ForkArmSkelControlName));
    }
    // End:0x179
    if(OutsideSawBladeSkelControlName != 'None')
    {
        OutsideSawBladeSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(OutsideSawBladeSkelControlName));
    }
    // End:0x1CB
    if(InsideSawBladesSkelControlName != 'None')
    {
        InsideSawBladesSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(InsideSawBladesSkelControlName));
    }
    // End:0x21D
    if(EnergyShieldSkelControlName != 'None')
    {
        EnergyShieldSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(EnergyShieldSkelControlName));
    }
    //return;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_cabin_shield';
    //return ReturnValue;    
}

simulated function PublishCombatWindowsFromAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], Subscriber;

    // End:0x30
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_ActiveDefenseFollower') || IsDoingSpecialMove_OF_Class(Class'LPSM_DirectionalHitReactionVsLaRocheVs'))
    {
        return;
    }
    super(LPPawn).PublishCombatWindowsFromAnimation(SeqNode, Subscriber);
    //return;    
}

simulated function SwitchToNewInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewPart[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OldPart;

    switch(PartSlot)
    {
        // End:0xCA
        case 1:
            // End:0xC7
            if(NewPart != RightArmPart)
            {
                OldPart = RightArmPart;
                RightArmPart = NewPart;
                RightArmPartClass = NewPartClass;
                // End:0x99
                if(NewPartClass == Class'LPWeaponVSDrill')
                {
                    TriggerEventClass(Class'LPSeqEvent_VS_EquippedDrill', self);                    
                }
                else
                {
                    // End:0xC7
                    if(NewPartClass == Class'LPWeaponVSWelder')
                    {
                        TriggerEventClass(Class'LPSeqEvent_VS_EquippedTorch', self);
                    }
                }
            }
            // End:0x127
            break;
        // End:0x122
        case 2:
            // End:0x11F
            if(NewPart != LeftArmPart)
            {
                OldPart = LeftArmPart;
                LeftArmPart = NewPart;
                LeftArmPartClass = NewPartClass;
            }
            // End:0x127
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    // End:0x155
    if(OldPart != none)
    {
        OldPart.PartUnequipped();
    }
    // End:0x18C
    if(NewPart != none)
    {
        NewPart.PartEquipped(PartSlot);
    }
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_NewVSRightArmPartEquipped, self);
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super.GetAnimTemplateTreeForSpecialMove(SpecialMove);
    return MyAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    super.InitAnimTemplates();
    //return;    
}

simulated function StartSawRunning()
{
    bSawRunning = true;
    StartSawRunningSound();
    PlaySawRunningLoopSound();
    //return;    
}

simulated function StopSawRunning()
{
    EndSawRunningLoopSound();
    bSawRunning = false;
    //return;    
}

function StartSawRunningSound()
{
    // End:0x31
    if(SawLoopingSoundComponent != none)
    {
        SawLoopingSoundComponent.Play();        
    }
    else
    {
        SawLoopingSoundComponent = TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(SawLoopingSound, 'None', self, Mesh, none);
        SetupSoundComponent(SawLoopingSoundComponent);
    }
    AddThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses(SawLoopingSoundComponent);
    //return;    
}

function StartTaserRunningSound()
{
    TaserLoopingSoundComponent = TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(TaserLoopingSound, 'None', self, Mesh, none);
    SetupSoundComponent(TaserLoopingSoundComponent);
    AddThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses(TaserLoopingSoundComponent);
    //return;    
}

function PlaySawRunningLoopSound()
{
    // End:0x2E
    if(SawLoopingSoundComponent != none)
    {
        SawLoopingSoundComponent.Play();
    }
    //return;    
}

function PlayTaserRunningLoopSound()
{
    // End:0x2E
    if(TaserLoopingSoundComponent != none)
    {
        TaserLoopingSoundComponent.Play();
    }
    //return;    
}

simulated function EndSawRunningLoopSound()
{
    // End:0x41
    if(SawLoopingSoundComponent != none)
    {
        SawLoopingSoundComponent.Stop();
        RemoveThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses(SawLoopingSoundComponent);
    }
    //return;    
}

simulated function EndTaserRunningLoopSound()
{
    // End:0x41
    if(TaserLoopingSoundComponent != none)
    {
        TaserLoopingSoundComponent.Stop();
        RemoveThisAudioComponentToTheToNotStopOnFollowerAtStartOfActiveDefenses(TaserLoopingSoundComponent);
    }
    //return;    
}

function @NULL SetupSoundComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL mySound[8388609], myAk;

    myAk = AkComponent(mySound);
    // End:0x41
    if(myAk != none)
    {
        SetupAkComponent(myAk);        
    }
    else
    {
        SetupAudioComponent(AudioComponent(mySound));
    }
    //return;    
}

function @NULL SetupAkComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL myAkComponent[8388609];

    // End:0x70
    if(myAkComponent != none)
    {
        myAkComponent.bAutoDestroy = false;
        myAkComponent.bUseLocation = false;
        myAkComponent.Stop();
    }
    //return;    
}

function @NULL SetupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL myAudioComponent[8388609];

    // End:0x4F
    if(myAudioComponent != none)
    {
        myAudioComponent.bAutoDestroy = false;
        myAudioComponent.Stop();
    }
    //return;    
}

simulated function StartTaser()
{
    // End:0x4C
    if(TaserParticleLoop == none)
    {
        TaserParticleLoop = TuneDataPawnFXEventBindings.PlayEventFX('LaRocheVsLoopTaserActive', self, Mesh, none);
    }
    // End:0xEE
    if(TaserParticleLoop != none)
    {
        TaserParticleLoop.SetTickGroup(3);
        TaserParticleLoop.__OnSystemFinished__Delegate = None;
        TaserParticleLoop.bAutoActivate = false;
        TaserParticleLoop.SetActive(true);
    }
    StartTaserRunningSound();
    PlayTaserRunningLoopSound();
    //return;    
}

simulated function StopTaser()
{
    // End:0x97
    if(TaserParticleLoop != none)
    {
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(TaserParticleLoop);
        TaserParticleLoop.DetachFromAny();
        TaserParticleLoop.SetActive(false);
        TaserParticleLoop = none;
    }
    EndTaserRunningLoopSound();
    //return;    
}

simulated function TurnOnLaRocheRigShieldDistort()
{
    // End:0x4C
    if(DistortFieldForShield == none)
    {
        DistortFieldForShield = TuneDataPawnFXEventBindings.PlayEventFX('LaRocheVsDistortForShield', self, Mesh, none);
    }
    // End:0xEE
    if(DistortFieldForShield != none)
    {
        DistortFieldForShield.SetTickGroup(3);
        DistortFieldForShield.__OnSystemFinished__Delegate = None;
        DistortFieldForShield.bAutoActivate = false;
        DistortFieldForShield.SetActive(true);
    }
    //return;    
}

simulated function TurnOffLaRocheRigShieldDistort()
{
    // End:0x97
    if(DistortFieldForShield != none)
    {
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(DistortFieldForShield);
        DistortFieldForShield.DetachFromAny();
        DistortFieldForShield.SetActive(false);
        DistortFieldForShield = none;
    }
    //return;    
}

simulated function TurnOnRightBonesOfEnergyShield()
{
    Mesh.UnHideBoneByName('JO_cabin_shield_TR');
    Mesh.UnHideBoneByName('JO_cabin_shield_BR');
    //return;    
}

simulated function TurnOffRightBonesOfEnergyShield()
{
    local /*0x97E50000-0x00000000*/ private float commCoreHealth;

    Mesh.HideBoneByName('JO_cabin_shield_TR', 2);
    Mesh.HideBoneByName('JO_cabin_shield_BR', 2);
    commCoreHealth = GetCoreHealth(3);
    // End:0x85
    if(commCoreHealth <= float(0))
    {
        TurnOffTheEnergyShield();
    }
    //return;    
}

simulated function TurnOnLeftBonesOfEnergyShield()
{
    Mesh.UnHideBoneByName('JO_cabin_shield_TL');
    Mesh.UnHideBoneByName('JO_cabin_shield_BL');
    //return;    
}

simulated function TurnOffLeftBonesOfEnergyShield()
{
    local /*0x97E50000-0x00000000*/ private float sawGenHealth;

    Mesh.HideBoneByName('JO_cabin_shield_TL', 2);
    Mesh.HideBoneByName('JO_cabin_shield_BL', 2);
    sawGenHealth = GetCoreHealth(5);
    // End:0x85
    if(sawGenHealth <= float(0))
    {
        TurnOffTheEnergyShield();
    }
    //return;    
}

function TurnOffTheEnergyShield()
{
    Mesh.HideBoneByName('JO_cabin_shield_main', 2);
    TurnOffLaRocheRigShieldDistort();
    //return;    
}

function TurnOnTheEnergyShield()
{
    Mesh.UnHideBoneByName('JO_cabin_shield_main');
    //return;    
}

function TurnOffLeftClavLight()
{
    LeftClavLightFactor = 0.0000000;
    //return;    
}

function TurnOnLeftClavLight()
{
    LeftClavLightFactor = TuneDataVsLaroche.LeftClavLightFactorWhenOn;
    //return;    
}

function TurnOffRightClavLight()
{
    bRightClavLightOn = false;
    //return;    
}

function TurnOnRightClavLight()
{
    bRightClavLightOn = true;
    //return;    
}

function NotifyTurnRightShieldLightOn()
{
    bNotifiedToTurnRightShieldLightOn = true;
    //return;    
}

function NotifyTurnLeftShieldLightOn()
{
    bNotifiedToTurnLeftShieldLightOn = true;
    //return;    
}

function ResetNotifyForTurningLeftShieldLightOn()
{
    bNotifiedToTurnLeftShieldLightOn = false;
    //return;    
}

function NotifyTurnTaserGenLightOn()
{
    bNotifiedToTurnTaserGenLightOn = true;
    //return;    
}

function NotifyDoneWithStartUpSeqAndCanUseCombatLighting()
{
    bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting = true;
    //return;    
}

function NotifyStartingAnotherStartUpSeqAndCanNotUseCombatLighting()
{
    bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting = false;
    //return;    
}

function TurnOffEnergyShieldPowerLightLeft()
{
    EnergyShieldPowerLightLeftFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldPowerLightLeft()
{
    EnergyShieldPowerLightLeftFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldPowerLightRight()
{
    EnergyShieldPowerLightRightFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldPowerLightRight()
{
    EnergyShieldPowerLightRightFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldHexsLeft()
{
    EnergyShieldHexsLeftFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldHexsLeft()
{
    EnergyShieldHexsLeftFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldHexsRight()
{
    EnergyShieldHexsRightFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldHexsRight()
{
    EnergyShieldHexsRightFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldProjectorLeft()
{
    EnergyShieldProjectorLeftFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldProjectorLeft()
{
    EnergyShieldProjectorLeftFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldProjectorRight()
{
    EnergyShieldProjectorRightFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldProjectorRight()
{
    EnergyShieldProjectorRightFactor = 1.0000000;
    //return;    
}

function TurnOffEnergyShieldTraceLinesFactor()
{
    EnergyShieldTraceLinesFactor = 0.0000000;
    //return;    
}

function TurnOnEnergyShieldTraceLinesFactor()
{
    EnergyShieldTraceLinesFactor = 1.0000000;
    //return;    
}

simulated function GetCoreNameForThisCoreId()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], coreNameStr;
    local /*0x97E50000-0x00000000*/ private byte coreEnum;

    coreEnum = byte(CoreID);
    coreNameStr = string(coreEnum);
    return coreNameStr;
    //return ReturnValue;    
}

simulated function GetGrabPointNameForThisGrabPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int PointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], grabPointNameStr;
    local /*0x97E50000-0x00000000*/ private byte grabEnum;

    grabEnum = byte(PointIndex);
    grabPointNameStr = string(grabEnum);
    return grabPointNameStr;
    //return ReturnValue;    
}

simulated function IsValidActiveCombatWindowForThisTypeOfStrike()
{
    local /*0x97E50000-0x00000000*/ private byte LaRocheStrikeAttempting[8388609], LaRocheStruggleModeAttempting;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x41
    if(MyVsLarocheController != none)
    {
        return MyVsLarocheController.IsValidActiveCombatWindowForThisTypeOfStrike(LaRocheStrikeAttempting, LaRocheStruggleModeAttempting);
    }
    return false;
    //return ReturnValue;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ShieldHealth;

    ShieldHealth = GetCoreHealth(9);
    // End:0x4B
    if(ShieldHealth > float(0))
    {
        // End:0x4B
        if(MyVsLarocheController.IsLeftArmGrabPointAbleToBeGrabed())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ShieldHealth, primaryCoreHealth;

    ShieldHealth = GetCoreHealth(9);
    // End:0x74
    if(ShieldHealth <= float(0))
    {
        primaryCoreHealth = GetCoreHealth(3);
        // End:0x74
        if((primaryCoreHealth > float(0)) && MyVsLarocheController.IsLeftShoulderGrabPointAbleToBeGrabed())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float primaryCoreHealth;

    primaryCoreHealth = GetCoreHealth(5);
    // End:0x4D
    if((primaryCoreHealth > float(0)) && MyVsLarocheController.IsRightShoulderGrabPointAbleToBeGrabed())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ShieldHealth, sawGenHealth, commHealth;

    sawGenHealth = GetCoreHealth(5);
    commHealth = GetCoreHealth(3);
    // End:0x9B
    if((sawGenHealth <= float(0)) && commHealth <= float(0))
    {
        ShieldHealth = GetCoreHealth(13);
        // End:0x9B
        if(ShieldHealth > float(0))
        {
            // End:0x9B
            if(MyVsLarocheController.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed())
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ShieldHealth, primaryCoreHealth, sawGenHealth, commHealth;

    sawGenHealth = GetCoreHealth(5);
    commHealth = GetCoreHealth(3);
    // End:0xC4
    if((sawGenHealth <= float(0)) && commHealth <= float(0))
    {
        ShieldHealth = GetCoreHealth(13);
        // End:0xC4
        if(ShieldHealth <= float(0))
        {
            primaryCoreHealth = GetCoreHealth(7);
            // End:0xC4
            if((primaryCoreHealth > float(0)) && MyVsLarocheController.IsCockpitCrossBarGrabPointAbleToBeGrabed())
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float hipCoreHealth, mainCoreHealth;

    hipCoreHealth = GetCoreHealth(7);
    // End:0x73
    if(hipCoreHealth <= float(0))
    {
        mainCoreHealth = GetCoreHealth(1);
        // End:0x73
        if((mainCoreHealth > float(0)) && MyVsLarocheController.IsRightInnerShoulderGrabPointAbleToBeGrabed())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated event IsStunned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsStunned;

    bIsStunned = IsDoingSpecialMove_OF_Class(Class'LPSM_VsLarocheDefaultStandingStun');
    return bIsStunned;
    //return ReturnValue;    
}

simulated function GetWinchPointNameForThisWinchPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int PointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(PointIndex);
    //return ReturnValue;    
}

simulated function GetTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.MinTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent, TuneDataVsLaroche.MaxTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent);
    //return ReturnValue;    
}

simulated function GetTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.MinTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent, TuneDataVsLaroche.MaxTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent);
    //return ReturnValue;    
}

simulated function GetTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.MinTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent, TuneDataVsLaroche.MaxTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent);
    //return ReturnValue;    
}

simulated function GetTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.MinTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent, TuneDataVsLaroche.MaxTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent);
    //return ReturnValue;    
}

simulated function GetTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.MinTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent, TuneDataVsLaroche.MaxTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent);
    //return ReturnValue;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(TuneDataVsLaroche.bAllowNonCoreDamageForDebug)
    {
        return true;
    }
    return ((inDamageType == Class'LPDamageTypeForced') || inDamageType == Class'LPDamageTypeVSDrillSuperSweetSpot') || inDamageType == Class'LPDamageTypeVsLarocheSawingCockpitStruggle';
    //return ReturnValue;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private class DamageTypeToPassToMommy;
    local /*0x97E50000-0x00000000*/ private @NULL currentSpecialMoveInstance;

    // End:0x1AC
    if((DamageType == Class'LPDamageTypeVSDrill') && InStruggleMode)
    {
        currentSpecialMoveInstance = GetCurrentSpecialMoveInstance();
        // End:0x6A
        if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingCommArray(currentSpecialMoveInstance) != none)
        {
            DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';            
        }
        else
        {
            // End:0x98
            if(LPSM_ForkArmGrabVictim_Hold(currentSpecialMoveInstance) != none)
            {
                DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';                
            }
            else
            {
                // End:0xC6
                if(LPSM_VsLarocheVsPlayerStruggleVsExposingCommArray(currentSpecialMoveInstance) != none)
                {
                    DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';                    
                }
                else
                {
                    // End:0xF4
                    if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingRightShoulderShield(currentSpecialMoveInstance) != none)
                    {
                        DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';                        
                    }
                    else
                    {
                        // End:0x122
                        if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingMainSawGen(currentSpecialMoveInstance) != none)
                        {
                            DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';                            
                        }
                        else
                        {
                            // End:0x150
                            if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingRightShoulderShield(currentSpecialMoveInstance) != none)
                            {
                                DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingDrillingCommArrayStruggle';                                
                            }
                            else
                            {
                                // End:0x17E
                                if(LPSM_VsLarocheVsPlayerStruggleVsDrillingHipShield(currentSpecialMoveInstance) != none)
                                {
                                    DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerCauseByDrillMobilityKill';                                    
                                }
                                else
                                {
                                    // End:0x1A9
                                    if(LPSM_VsLarocheVsPlayerStruggleVsCauseMobilityKill(currentSpecialMoveInstance) != none)
                                    {
                                        DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerCauseByDrillMobilityKill';
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x328
        if((DamageType == Class'LPDamageTypeVSWelder') && InStruggleMode)
        {
            currentSpecialMoveInstance = GetCurrentSpecialMoveInstance();
            // End:0x214
            if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingCommArray(currentSpecialMoveInstance) != none)
            {
                DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingTorchingCommArrayStruggle';                
            }
            else
            {
                // End:0x242
                if(LPSM_ForkArmGrabVictim_Hold(currentSpecialMoveInstance) != none)
                {
                    DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingTorchingCommArrayStruggle';                    
                }
                else
                {
                    // End:0x270
                    if(LPSM_VsLarocheVsPlayerStruggleVsExposingCommArray(currentSpecialMoveInstance) != none)
                    {
                        DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingTorchingCommArrayStruggle';                        
                    }
                    else
                    {
                        // End:0x29E
                        if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingRightShoulderShield(currentSpecialMoveInstance) != none)
                        {
                            DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingTorchingCommArrayStruggle';                            
                        }
                        else
                        {
                            // End:0x2CC
                            if(LPSM_VsLarocheVsPlayerStruggleVsDestroyingMainSawGen(currentSpecialMoveInstance) != none)
                            {
                                DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerDestroyingTorchingCommArrayStruggle';                                
                            }
                            else
                            {
                                // End:0x2FA
                                if(LPSM_VsLarocheVsPlayerStruggleVsTorchingHipShield(currentSpecialMoveInstance) != none)
                                {
                                    DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerCauseByTorchMobilityKill';                                    
                                }
                                else
                                {
                                    // End:0x325
                                    if(LPSM_VsLarocheVsPlayerStruggleVsCauseMobilityKill(currentSpecialMoveInstance) != none)
                                    {
                                        DamageTypeToPassToMommy = Class'LPDamageTypeVsPlayerCauseByTorchMobilityKill';
                                    }
                                }
                            }
                        }
                    }
                }
            }            
        }
        else
        {
            DamageTypeToPassToMommy = DamageType;
        }
    }
    super(LPAIPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageTypeToPassToMommy, HitInfo, DamageCauser);
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    // End:0x6D
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.HandleIncomingPotentialDamageForCombatStateChange(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    }
    super(LPAIPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

function HaveAccumulatedDamageForSwitchingFromPassiveToAgitatedState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float relativeDamageAmount;

    relativeDamageAmount = GetDamageFromDamageTracker(TuneDataVsLaroche.TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated.GetValue(), true);
    // End:0x9E
    if(relativeDamageAmount > float(0))
    {
        // End:0x9E
        if(relativeDamageAmount >= TuneDataVsLaroche.AmountDamageOverIntervalToGoFromPassiveToAgitated.GetValue())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function GetAimStartTraceLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], SocketRotation, SocketLocation;

    Mesh.GetSocketWorldLocationAndRotation(TuneDataVsLaroche.AimStartTraceSocketName, SocketLocation, SocketRotation);
    return SocketLocation;
    //return ReturnValue;    
}

simulated function FreeGrabPoints()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x82 [Loop If]
    if(iter < GrabPoints.Length)
    {
        GrabPoints[iter].bEnabledForFreeGrab = !GrabPoints[iter].bEnabledForFreeGrab;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function GetSawGenLightsFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xF4
    if(GetCoreHealth(5) > float(0))
    {
        // End:0xBB
        if(TuneDataVsLaroche.bRightClavLightTurnOnBasedOnAnimNotifyNotCoreHealth)
        {
            // End:0x7C
            if(bRightClavLightOn)
            {
                ProcessPulsingLight(SawGenPulseLightsFactor, 'SawGeneratorDebugDisplayLoc');
                return SawGenPulseLightsFactor.PulseGlowFactor;
            }
            SawGenPulseLightsFactor.PulseGlowFactor = 0.0000000;
            return SawGenPulseLightsFactor.PulseGlowFactor;
        }
        ProcessPulsingLight(SawGenPulseLightsFactor, 'SawGeneratorDebugDisplayLoc');
        return SawGenPulseLightsFactor.PulseGlowFactor;
    }
    // End:0x15C
    if(TuneDataVsLaroche.bRightClavLightTurnOffBasedOnAnimNotifyNotCoreHealth)
    {
        // End:0x15C
        if(bRightClavLightOn)
        {
            ProcessPulsingLight(SawGenPulseLightsFactor, 'SawGeneratorDebugDisplayLoc');
            return SawGenPulseLightsFactor.PulseGlowFactor;
        }
    }
    SawGenPulseLightsFactor.PulseGlowFactor = 0.0000000;
    return SawGenPulseLightsFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetCockPitCameraEyeLightsFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    ProcessPulsingLight(CockPitCameraEyeLightsFactor, 'CockPitCameraEyeDebugDisplayLoc');
    return CockPitCameraEyeLightsFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetCockPitLightsTotal()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    ProcessPulsingLight(CockPitPulseLightsFactor, 'CockPitPulseLightsDebugDisplayLoc');
    return CockPitPulseLightsFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetEmpFacePlateLightsFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EmpFacePlateLightsFactor;
    //return ReturnValue;    
}

simulated function GetLeftShoulderShieldRailLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xB7
    if(GetCoreHealth(3) > float(0))
    {
        // End:0x98
        if(TuneDataVsLaroche.bLeftShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth && !bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting)
        {
            // End:0x73
            if(bNotifiedToTurnLeftShieldLightOn)
            {
                ProcessPulsingLight(LeftShoulderShieldRailPulseLightFactor, 'LeftShoulderShieldDebugDisplayLoc');                
            }
            else
            {
                LeftShoulderShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
            }            
        }
        else
        {
            ProcessPulsingLight(LeftShoulderShieldRailPulseLightFactor, 'LeftShoulderShieldDebugDisplayLoc');
        }        
    }
    else
    {
        LeftShoulderShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
    }
    return LeftShoulderShieldRailPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetLeftShoulderSpotLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x33
    if(GetCoreHealth(25) > float(0))
    {
        ProcessPulsingLight(LeftShoulderSpotPulseLightFactor, 'LeftShoulderSpotPulseLightDebugDisplayLoc');        
    }
    else
    {
        LeftShoulderSpotPulseLightFactor.PulseGlowFactor = 0.0000000;
    }
    return LeftShoulderSpotPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetLeftShoulderJointLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return LeftShoulderJointLightFactor;
    //return ReturnValue;    
}

simulated function GetLeftClavLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x85
    if(GetCoreHealth(3) > float(0))
    {
        // End:0x40
        if(TuneDataVsLaroche.bLeftClavLightTurnOnBasedOnAnimNotifyNotCoreHealth)
        {
            return LeftClavLightFactor;
        }
        // End:0x7B
        if(LeftClavLightFactor < 0.0010000)
        {
            LeftClavLightFactor = TuneDataVsLaroche.LeftClavLightFactorWhenOn;
        }
        return LeftClavLightFactor;
    }
    // End:0xB1
    if(TuneDataVsLaroche.bLeftClavLightTurnOffBasedOnAnimNotifyNotCoreHealth)
    {
        return LeftClavLightFactor;
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetRightShoulderShieldRailLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x105
    if(GetCoreHealth(11) > float(0))
    {
        // End:0xCC
        if(TuneDataVsLaroche.bRightShieldLightTurnOnBasedOnAnimNotifyNotCoreHealth && !bNotifiedDoneWithStartUpSeqAndCanUseCombatLighting)
        {
            // End:0x8D
            if(bNotifiedToTurnRightShieldLightOn)
            {
                ProcessPulsingLight(RightShoulderShieldRailPulseLightFactor, 'RightShoulderShieldDebugDisplayLoc');
                return RightShoulderShieldRailPulseLightFactor.PulseGlowFactor;
            }
            RightShoulderShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
            return RightShoulderShieldRailPulseLightFactor.PulseGlowFactor;
        }
        ProcessPulsingLight(RightShoulderShieldRailPulseLightFactor, 'RightShoulderShieldDebugDisplayLoc');
        return RightShoulderShieldRailPulseLightFactor.PulseGlowFactor;
    }
    RightShoulderShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
    return RightShoulderShieldRailPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetRightShoulderSpotLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x33
    if(GetCoreHealth(27) > float(0))
    {
        ProcessPulsingLight(RightShoulderSpotPulseLightFactor, 'RightShoulderSpotPulseLightDebugDisplayLoc');        
    }
    else
    {
        RightShoulderSpotPulseLightFactor.PulseGlowFactor = 0.0000000;
    }
    return RightShoulderSpotPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetRightShoulderJointLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RightShoulderJointLightFactor;
    //return ReturnValue;    
}

simulated function GetLeftHipShieldRailLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x33
    if(GetCoreHealth(13) > float(0))
    {
        ProcessPulsingLight(LeftHipShieldRailPulseLightFactor, 'LeftHipShieldDebugDisplayLoc');        
    }
    else
    {
        LeftHipShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
    }
    return LeftHipShieldRailPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetLeftHipCriticalEquipmentLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x33
    if(GetCoreHealth(7) > float(0))
    {
        ProcessPulsingLight(LeftHipCriticalEquipmentLightFactor, 'LeftHipCriticalEquipmentDebugDisplayLoc');        
    }
    else
    {
        LeftHipCriticalEquipmentLightFactor.PulseGlowFactor = 0.0000000;
    }
    return LeftHipCriticalEquipmentLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetRightHipShieldRailLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x33
    if(GetCoreHealth(41) > float(0))
    {
        ProcessPulsingLight(RightHipShieldRailPulseLightFactor, 'RightHipShieldDebugDisplayLoc');        
    }
    else
    {
        RightHipShieldRailPulseLightFactor.PulseGlowFactor = 0.0000000;
    }
    return RightHipShieldRailPulseLightFactor.PulseGlowFactor;
    //return ReturnValue;    
}

simulated function GetEmpChargeStateFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EmpChargeStateFactor;
    //return ReturnValue;    
}

simulated function GetEmpLightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EmpLightFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldPowerLightLeftFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldPowerLightLeftFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldPowerLightRightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldPowerLightRightFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldHexsLeftFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldHexsLeftFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldHexsRightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldHexsRightFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldProjectorLeftFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldProjectorLeftFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldProjectorRightFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldProjectorRightFactor;
    //return ReturnValue;    
}

simulated function GetEnergyShieldTraceLinesFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return EnergyShieldTraceLinesFactor;
    //return ReturnValue;    
}

function ProcessPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];

    // End:0x48
    if(int(CurPulser.RigPulseType) == int(1))
    {
        ProcessATanPulsingLight(CurPulser, SocketNameToDisplayOn);
        return;        
    }
    else
    {
        // End:0x90
        if(int(CurPulser.RigPulseType) == int(2))
        {
            ProcessACotPulsingLight(CurPulser, SocketNameToDisplayOn);
            return;            
        }
        else
        {
            // End:0xD8
            if(int(CurPulser.RigPulseType) == int(3))
            {
                ProcessSinPulsingLight(CurPulser, SocketNameToDisplayOn);
                return;                
            }
            else
            {
                // End:0x120
                if(int(CurPulser.RigPulseType) == int(4))
                {
                    ProcessASinPulsingLight(CurPulser, SocketNameToDisplayOn);
                    return;                    
                }
                else
                {
                    // End:0x168
                    if(int(CurPulser.RigPulseType) == int(5))
                    {
                        ProcessACosPulsingLight(CurPulser, SocketNameToDisplayOn);
                        return;                        
                    }
                    else
                    {
                        // End:0x1B0
                        if(int(CurPulser.RigPulseType) == int(6))
                        {
                            ProcessFlareUpPulsingLight(CurPulser, SocketNameToDisplayOn);
                            return;                            
                        }
                        else
                        {
                            // End:0x1F5
                            if(int(CurPulser.RigPulseType) == int(7))
                            {
                                ProcessRandNoisePulsingLight(CurPulser, SocketNameToDisplayOn);
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
    CurPulser.PulseGlowFactor = CurPulser.PulseMaxOutput;
    return;
    //return;    
}

function ProcessATanPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, tanPerStart, tanPerEnd, tanResultRangeMin, tanResultOutRangeMax;

    local /*0x97E50000-0x00000000*/ private @NULL SocketRotation, SocketLocation;

    tanPerStart = -1.0000000;
    tanPerEnd = 1.0000000;
    tanResultRangeMin = -1.0000000;
    tanResultOutRangeMax = 1.0000000;
    Mesh.GetSocketWorldLocationAndRotation(SocketNameToDisplayOn, SocketLocation, SocketRotation);
    // End:0xC7
    if(CurPulser.PulseIndicatorValue < tanPerStart)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    NewValue = Atan(CurPulser.PulseFrequency * CurPulser.PulseIndicatorValue) * CurPulser.PulseReductionFactor;
    NewValue = FClamp(NewValue, tanResultRangeMin, tanResultOutRangeMax);
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(tanResultRangeMin, tanResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x30A
    if(CurPulser.PulseIndicatorValue >= tanPerEnd)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    return;
    //return;    
}

function ProcessACotPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, tanPerStart, tanPerEnd, tanResultRangeMin, tanResultOutRangeMax;

    local /*0x97E50000-0x00000000*/ private @NULL SocketRotation, SocketLocation;

    tanPerStart = -1.0000000;
    tanPerEnd = 1.0000000;
    tanResultRangeMin = -1.0000000;
    tanResultOutRangeMax = 1.0000000;
    Mesh.GetSocketWorldLocationAndRotation(SocketNameToDisplayOn, SocketLocation, SocketRotation);
    // End:0xC7
    if(CurPulser.PulseIndicatorValue < tanPerStart)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    NewValue = (1.0000000 / Atan(CurPulser.PulseFrequency * CurPulser.PulseIndicatorValue)) * CurPulser.PulseReductionFactor;
    NewValue = FClamp(NewValue, tanResultRangeMin, tanResultOutRangeMax);
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(tanResultRangeMin, tanResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x311
    if(CurPulser.PulseIndicatorValue >= tanPerEnd)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    return;
    //return;    
}

function ProcessSinPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, tanPerStart, tanPerEnd, tanResultRangeMin, tanResultOutRangeMax;

    tanPerStart = -1.0000000;
    tanPerEnd = 1.0000000;
    tanResultRangeMin = -1.0000000;
    tanResultOutRangeMax = 1.0000000;
    // End:0x8C
    if(CurPulser.PulseIndicatorValue < tanPerStart)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    NewValue = Sin(CurPulser.PulseFrequency * CurPulser.PulseIndicatorValue) * CurPulser.PulseReductionFactor;
    NewValue = FClamp(NewValue, tanResultRangeMin, tanResultOutRangeMax);
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(tanResultRangeMin, tanResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x2CF
    if(CurPulser.PulseIndicatorValue >= tanPerEnd)
    {
        CurPulser.PulseIndicatorValue = tanPerStart;
    }
    return;
    //return;    
}

function ProcessACosPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, acosPerStart, acosPerEnd, acosResultRangeMin, acosResultOutRangeMax;

    acosPerStart = -1.0000000;
    acosPerEnd = 1.0000000;
    acosResultRangeMin = 0.0000000;
    acosResultOutRangeMax = 3.1415930;
    // End:0x8C
    if(CurPulser.PulseIndicatorValue < acosPerStart)
    {
        CurPulser.PulseIndicatorValue = acosPerStart;
    }
    NewValue = Acos(CurPulser.PulseFrequency * CurPulser.PulseIndicatorValue) * CurPulser.PulseReductionFactor;
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(acosResultRangeMin, acosResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x2B0
    if(CurPulser.PulseIndicatorValue >= acosPerEnd)
    {
        CurPulser.PulseIndicatorValue = acosPerStart;
    }
    return;
    //return;    
}

function ProcessASinPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, acosPerStart, acosPerEnd, acosResultRangeMin, acosResultOutRangeMax;

    acosPerStart = -1.0000000;
    acosPerEnd = 1.0000000;
    acosResultRangeMin = 0.0000000;
    acosResultOutRangeMax = 3.1415930;
    // End:0x8C
    if(CurPulser.PulseIndicatorValue < acosPerStart)
    {
        CurPulser.PulseIndicatorValue = acosPerStart;
    }
    NewValue = Asin(CurPulser.PulseFrequency * CurPulser.PulseIndicatorValue) * CurPulser.PulseReductionFactor;
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(acosResultRangeMin, acosResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x2B0
    if(CurPulser.PulseIndicatorValue >= acosPerEnd)
    {
        CurPulser.PulseIndicatorValue = acosPerStart;
    }
    return;
    //return;    
}

function ProcessFlareUpPulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue, TimeDelta, flarePerStart, flarePerEnd, flareResultRangeMin, flareResultOutRangeMax;

    flarePerStart = 0.0000000;
    flarePerEnd = 1.0000000;
    flareResultRangeMin = 0.0000000;
    flareResultOutRangeMax = CurPulser.PulseReductionFactor;
    // End:0xA3
    if(CurPulser.PulseIndicatorValue < flarePerStart)
    {
        CurPulser.PulseIndicatorValue = flarePerStart;
    }
    NewValue = (CurPulser.PulseIndicatorValue * CurPulser.PulseIndicatorValue) * CurPulser.PulseReductionFactor;
    NewValue = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(flareResultRangeMin, flareResultOutRangeMax, CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput, NewValue);
    CurPulser.PulseGlowFactor = NewValue;
    TimeDelta = WorldInfo.TimeSeconds - CurPulser.LastPulseTime;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    CurPulser.PulseIndicatorValue += (CurPulser.PulseRate * TimeDelta);
    // End:0x2BD
    if(CurPulser.PulseIndicatorValue >= flarePerEnd)
    {
        CurPulser.PulseIndicatorValue = flarePerEnd;
    }
    return;
    //return;    
}

function ProcessRandNoisePulsingLight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPulser[25165825];
    local /*0x97E50000-0x00000000*/ private name SocketNameToDisplayOn[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue;

    NewValue = RandRange(CurPulser.PulseMinOutput, CurPulser.PulseMaxOutput);
    CurPulser.PulseGlowFactor = NewValue;
    CurPulser.LastPulseTime = WorldInfo.TimeSeconds;
    return;
    //return;    
}

function ShowPulseDebugMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SocketLocation[25296897];
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000000*/ private byte Red[9437185], Green, Blue;

    //return;    
}

simulated function EnableWinchPoints()
{
    local /*0x97E50000-0x00000000*/ private bool inEnable[8388609];

    SetWinchPointEnabledByIndex(1, inEnable);
    //return;    
}

function VsLarocheEnableGrabForCommKill()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheEnableGrabForCommKill();
    }
    //return;    
}

function VsLarocheEnableGrabForSawGenKill()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheEnableGrabForSawGenKill();
    }
    //return;    
}

function VsLarocheEnableGrabForMobilityKill()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheEnableGrabForMobilityKill();
    }
    //return;    
}

function VsLarocheEnableGrabForRigKill()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheEnableGrabForRigKill();
    }
    //return;    
}

function VsLarocheDestroyLeftSide()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheDestroyLeftSide();
    }
    //return;    
}

function VsLarocheDestroyRightSide()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheDestroyRightSide();
    }
    //return;    
}

function VsLarocheDestroyHip()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.VsLarocheDestroyHip();
    }
    //return;    
}

function AddDefaultInventory()
{
    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return;
    }
    super(SPInventoryPawn).AddDefaultInventory();
    //return;    
}

simulated function AddDefaultRemoteInventoryParts()
{
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    // End:0x8F
    if(PartsInvManager == none)
    {
        PartsInvManager = LPInventoryManager(Spawn(InventoryManagerClass, self));
        // End:0x4E
        if(PartsInvManager == none)
        {            
        }
        else
        {
            PartsInvManager.RemoteRole = ROLE_None;
            PartsInvManager.SetupFor(self);
        }
    }
    // End:0x116
    foreach DefaultRemoteInventoryParts(InvClass)
    {
        Inv = FindInventoryType(InvClass);
        // End:0x106
        if(Inv == none)
        {
            Inv = PartsInvManager.CreateInventory(InvClass, false);
        }
        // End:0x115
        if(Inv == none)
        {
        }        
    }    
    //return;    
}

function LocalSwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartID[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];

    // End:0x54
    if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
    {
        ServerSwitchToInventoryPart(PartID, NewPartClass);
    }
    SwitchToInventoryPart(PartID, NewPartClass);
    //return;    
}

reliable server function ServerSwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartID[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];

    SwitchToInventoryPart(PartID, NewPartClass);
    //return;    
}

event CreateInventory()
{
    local /*0x97E50000-0x00000000*/ private class NewInvClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(ClassIsChildOf(NewInvClass, Class'LPVSInventoryParts'))
    {
        // End:0x5B
        if(PartsInvManager != none)
        {
            return PartsInvManager.CreateInventory(NewInvClass, bDoNotActivate);
        }        
    }
    else
    {
        return super(Pawn).CreateInventory(NewInvClass, bDoNotActivate);
    }
    //return ReturnValue;    
}

simulated function FindInventoryType()
{
    local /*0x97E50000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowSubclass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x61
    if(ClassIsChildOf(DesiredClass, Class'LPVSInventoryParts'))
    {
        return ((PartsInvManager != none) ? PartsInvManager.FindInventoryType(DesiredClass, bAllowSubclass) : none);        
    }
    else
    {
        return super(Pawn).FindInventoryType(DesiredClass, bAllowSubclass);
    }
    //return ReturnValue;    
}

simulated function SwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewPart;

    NewPart = LPVSInventoryParts(FindInventoryType(NewPartClass, true));
    SwitchToNewInventoryPart(PartSlot, NewPart, NewPartClass);
    //return;    
}

function SetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    // End:0xAC
    if(IsLocallyControlled() || (int(WorldInfo.NetMode) != int(NM_Client)) && Controller == none)
    {
        // End:0x8F
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetInventoryPartInUse(PartSlot, bInUse);
        }
        InternalSetInventoryPartInUse(PartSlot, bInUse);
    }
    //return;    
}

reliable server function ServerSetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    InternalSetInventoryPartInUse(PartSlot, bInUse);
    // End:0x5A
    if(int(PartSlot) == int(1))
    {
        RightArmPart.NewControllerState(bInUse);
    }
    //return;    
}

private final function InternalSetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    switch(PartSlot)
    {
        // End:0x30
        case 1:
            bUsingRightArm = bInUse;
            // End:0x50
            break;
        // End:0x4D
        case 2:
            bUsingLeftArm = bInUse;
            // End:0x50
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function IsInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(PartSlot)
    {
        // End:0x23
        case 1:
            return bUsingRightArm;
        // End:0x33
        case 2:
            return bUsingLeftArm;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

reliable server function ServerDoTraceDamageOnShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFractureDamageInfo[8388609], BasePawn;

    BasePawn = LPPawn(ShieldFractureDamageInfo.Base);
    // End:0x66
    if(BasePawn != none)
    {
        BasePawn.DoTraceDamageOnShieldFracture(ShieldFractureDamageInfo);
    }
    //return;    
}

simulated function PlayAnimationSequenceOnBodyPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params[25296897], ReturnValue;

    switch(BodyPart)
    {
        // End:0x2C
        case 0:
            return PlayFullBodyAnimationFromParams(Params);
        // End:0x45
        case 1:
            return PlayUpperBodyAnimationFromParams(Params);
        // End:0x5E
        case 2:
            return PlayRightArmAnimationFromParams(Params);
        // End:0x63
        case 3:
        // End:0xFFFF
        default:
            ScriptTrace();
            return none;
            break;
    }
    //return ReturnValue;    
}

simulated function StopAnimationSequenceOnPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.2500000
    switch(BodyPart)
    {
        // End:0x37
        case 0:
            StopFullBodyAnim(BlendOutTime);
            // End:0x7F
            break;
        // End:0x52
        case 1:
            StopUpperBodyAnim(BlendOutTime);
            // End:0x7F
            break;
        // End:0x6D
        case 2:
            StopRightArmAnimation(BlendOutTime);
            // End:0x7F
            break;
        // End:0x72
        case 3:
        // End:0xFFFF
        default:
            ScriptTrace();
            break;
    }
    //return;    
}

simulated function PlayRightArmAnimationFromParams()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params[25296897], ReturnValue;

    return PlayAnimationFromParams(RightArmAnimInfo.AnimNodeSlot, Params);
    //return ReturnValue;    
}

simulated function StopRightArmAnimation()
{
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.2500000
    //return;    
}

function NotifyArmQuickGrab()
{
    //return;    
}

simulated function IsWeaponSwitchLocked()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(IsInventoryPartInUse(PartSlot))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private @NULL SMGrab;
    local /*0x97E50000-0x00000000*/ private class GrabClass;

    GrabClass = Class'LPSM_ForkArmGrab_Grab';
    SMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GrabClass));
    // End:0x126
    if(CanDoSpecialMoveInstance(SMGrab, true))
    {
        // End:0xF2
        if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
        {
            DoSpecialMove(GrabClass, true, false, None, SMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
        }
        ServerStartForkArmGrab(GrabClass, SMGrab.ForkArmGrabInfo);        
    }
    else
    {
        // End:0x16E
        if(CanDoSpecialMoveInstance(GetSpecialMoveInstance(Class'LPSM_ForkArmGrab_GrabObject'), true))
        {
            // End:0x16B
            if(IsLocallyControlled())
            {
                DoSpecialMove(Class'LPSM_ForkArmGrab_GrabObject', true, false);
            }            
        }
        else
        {
            // End:0x19C
            if(CanDoSpecialMove(Class'LPSM_ForkArmGrabMiss'))
            {
                LocalDoSpecialMove(Class'LPSM_ForkArmGrabMiss', true);
            }
        }
    }
    //return;    
}

function StartForkArmGrabFromCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class GrabClass;
    local /*0x97E50000-0x00000000*/ private @NULL SMGrab;

    GrabClass = Class'LPSM_ForkArmGrab_CombatWindow';
    SMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GrabClass));
    ReplicatedCombatWindowInfo.Count++;
    ReplicatedCombatWindowInfo.Window = Window;
    // End:0x170
    if(CanDoSpecialMoveInstance(SMGrab, true))
    {
        // End:0x136
        if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
        {
            DoSpecialMove(GrabClass, true, false, None, SMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
        }
        ServerStartForkArmGrabFromCombatWindow(GrabClass, SMGrab.ForkArmGrabInfo, Window);
    }
    //return;    
}

reliable server function ServerStartForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private class GrabClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[8388609], SMGrab;

    SMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GrabClass));
    SMGrab.ForkArmGrabInfo = InForkArmGrabInfo;
    // End:0x82
    if(!IsLocallyControlled())
    {
        // End:0x82
        if(!CanDoSpecialMoveInstance(SMGrab, true))
        {
            ClientCancelForkArmGrab();
            return;
        }
    }
    DoSpecialMove(GrabClass, true, false, None, SMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
    ReplicatedForkArmGrabInfo.GrabPointInfo = InForkArmGrabInfo.GrabPoint;
    ReplicatedForkArmGrabInfo.GrabClass = GrabClass;
    //return;    
}

reliable server function ServerStartForkArmGrabFromCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private class GrabClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[8388609], Window;

    ReplicatedCombatWindowInfo.Count++;
    ReplicatedCombatWindowInfo.Window = Window;
    ServerStartForkArmGrab(GrabClass, InForkArmGrabInfo);
    //return;    
}

unreliable server function ServerForkArmGrabUpdateTween()
{
    local /*0x97E50000-0x00000000*/ private float TweenValue[8388609];

    ReplicatedForkArmGrabCurTweenValue = TweenValue;
    //return;    
}

reliable client simulated function ClientCancelForkArmGrab()
{
    EndSpecialMove(Class'LPSM_ForkArmGrab_Base');
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    DoSpecialMove(Class'LPSM_VsLarocheDie', true);
    return false;
    //return ReturnValue;    
}

simulated function GetSMForCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ActiveDefenseLeaderVS';
    //return ReturnValue;    
}

function TryCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Window;

    // End:0x29
    if(IsDoingASpecialMove() && !IsDoingSpecialMove_OF_Class(Class'LPSM_ActiveDefenseLeader'))
    {
        return false;
    }
    // End:0x4D
    if(!FindValidActiveCombatWindow(Class'LPCombatWindow_ForkArm', Window))
    {
        return false;
    }
    StartForkArmGrabFromCombatWindow(Window);
    return true;
    //return ReturnValue;    
}

simulated function NotifyAIOfMeleeSwingStart()
{
    //return;    
}

simulated function NotifyAIOfMeleeSwingEnd()
{
    //return;    
}

simulated function NotifyShouldCheckForComboStrikeContinuation()
{
    MyVsLarocheController.NotifyShouldCheckForComboStrikeContinuation();
    //return;    
}

simulated event StartRightArmPartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[9437185], SlotType;
    local /*0x97E50000-0x00000000*/ private bool bAllowDamage[9437185];
    local /*0x97E50000-0x00000000*/ private byte IKType[9437185];
    local /*0x97E50000-0x00000000*/ private bool bUseAnimation[9437185], bUseDamageMinigame, bApplyDamageAtCrosshair, bForceRestart;

    0
    1
    true
    0
    true
    false
    false
    false
    // End:0x51
    if(bForceRestart)
    {
        StopRightArmPartAction(ActionMode, true, 0.0000000);
    }
    RightArmPartInfo.SlotType = SlotType;
    RightArmPartInfo.bTipDamageEnabled = bAllowDamage;
    RightArmPartInfo.IKType = IKType;
    RightArmPartInfo.bUseAnimation = bUseAnimation;
    RightArmPartInfo.bUseDamageMinigame = bUseDamageMinigame && RightArmPart.bHasDamageMinigame;
    RightArmPartInfo.bApplyDamageAtCrosshair = bApplyDamageAtCrosshair;
    RightArmPart.StartRightArmAction(ActionMode, bForceRestart);
    //return;    
}

simulated event StopRightArmPartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAbrupt[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    false
    0.2500000
    // End:0x1F
    if(RightArmPart == none)
    {
        return;
    }
    // End:0x88
    if(bAbrupt)
    {
        RightArmPart.StopAction(ActionMode);
        StopAnimationSequenceOnPart(RightArmPartInfo.SlotType, BlendOutTime);        
    }
    else
    {
        // End:0xCB
        if(RightArmPart.NeedsGracefulStop())
        {
            RightArmPart.StartPartState(3);
        }
    }
    RightArmPart.NotifyPartStopped();
    //return;    
}

simulated function SetRightArmPartIKType()
{
    local /*0x97E50000-0x00000000*/ private byte InType[8388609];

    RightArmPartInfo.IKType = InType;
    //return;    
}

simulated function SetRightArmPartIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name IKTargetDepthSocket[8388609];

    RightArmPartInfo.IKTargetDepthSocket = IKTargetDepthSocket;
    //return;    
}

simulated function StopRightArmPartAltAction()
{
    RightArmPartInfo.bTipDamageEnabled = false;
    RightArmPartInfo.IKType = 0;
    RightArmPart.StopAction(1);
    //return;    
}

simulated function NotifyCurrentTakeDamageWillShutdownVsOpponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsGoingToShutdown[8388609];
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];

    // End:0x40
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NotifyCurrentTakeDamageWillShutdownVsOpponent(VsGoingToShutdown, NewDamage);
    }
    //return;    
}

simulated function NotifyEmpShutdownInstigatorShutdownOver()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRecovering[8388609];

    // End:0x37
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NotifyEmpShutdownInstigatorShutdownOver(PawnRecovering);
    }
    //return;    
}

simulated function NotifyWonStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    // End:0x40
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NotifyWonStruggleMode(EnemyPawn, StruggleModeSM);
    }
    //return;    
}

simulated function NotifyLostStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    // End:0x40
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NotifyLostStruggleMode(EnemyPawn, StruggleModeSM);
    }
    //return;    
}

simulated function CheckToSeeIfShouldApplyPhaseAction()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curSM, curFSM, tuneDataToUse;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float weaponOnTime, AmountOfDamage, enemiesHealthPercentageNotAllowedToGoUnder, enemiesHealthNotAllowedToGoUnder, enemiesHealthPercentageAfterDamage;

    curSM = GetCurrentSpecialMoveInstance();
    // End:0x6E8
    if(curSM != none)
    {
        curFSM = LPSM_FollowerVsStruggleMode(curSM);
        // End:0x6E8
        if((curFSM != none) && curFSM.TuneData != none)
        {
            tuneDataToUse = LPTuneDataStruggleVsPlayerBase(curFSM.TuneData);
            // End:0x6E8
            if(tuneDataToUse != none)
            {
                iter = 0;
                J0xBF:

                // End:0x6E8 [Loop If]
                if(iter < tuneDataToUse.SuccessfulStrugglePhaseActionInfoList.Length)
                {
                    // End:0x6DA
                    if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].NameOfPhaseToActivateOn == PhaseNameEnding)
                    {
                        // End:0x1D1
                        if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage != none)
                        {
                            AmountOfDamage = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage.GetValue();
                        }
                        // End:0x2EE
                        if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].bStartWeapon)
                        {
                            StartRightArmPartAction(0, 1, true,,, false);
                            // End:0x2AF
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeTurningOffWeapon > float(0))
                            {
                                weaponOnTime = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeTurningOffWeapon;                                
                            }
                            else
                            {
                                weaponOnTime = tuneDataToUse.MaxTimeToLeaveWeaponOn;
                            }
                            SetTimer(weaponOnTime, false, 'ShutdownRightArmWeaponDown', self);
                        }
                        // End:0x6DA
                        if(AmountOfDamage > float(0))
                        {
                            // End:0x512
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].HealthPercentageNotAllowedToTakeUnder != none)
                            {
                                enemiesHealthPercentageNotAllowedToGoUnder = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].HealthPercentageNotAllowedToTakeUnder.GetValue();
                                // End:0x458
                                if(curFSM.LeaderPawn.HealthMax != 0)
                                {
                                    enemiesHealthPercentageAfterDamage = (float(curFSM.LeaderPawn.Health) - AmountOfDamage) / float(curFSM.LeaderPawn.HealthMax);                                    
                                }
                                else
                                {
                                    enemiesHealthPercentageAfterDamage = 1.0000000;
                                }
                                // End:0x512
                                if(enemiesHealthPercentageAfterDamage < enemiesHealthPercentageNotAllowedToGoUnder)
                                {
                                    enemiesHealthNotAllowedToGoUnder = enemiesHealthPercentageNotAllowedToGoUnder * float(curFSM.LeaderPawn.HealthMax);
                                    AmountOfDamage = float(curFSM.LeaderPawn.Health) - enemiesHealthNotAllowedToGoUnder;
                                }
                            }
                            // End:0x63F
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeGivingDamage > 0.0000000)
                            {
                                DelayedSuccessfulStrugglePhaseActionDamageAmount = AmountOfDamage;
                                DelayedSuccessfulStrugglePhaseActionDamageLocation = Location;
                                DelayedSuccessfulStrugglePhaseActionDamageType = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].TypeOfDamage;
                                DelayedSuccessfulStrugglePhaseActionPawnToDamage = LPPawn(curFSM.LeaderPawn);
                                SetTimer(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeGivingDamage, false, 'ApplyDelayedSuccessfulStrugglePhaseActionDamage');                                
                            }
                            else
                            {
                                curFSM.LeaderPawn.TakeDamage(int(AmountOfDamage), Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].TypeOfDamage);
                            }
                        }
                    }
                    ++iter;
                    // [Loop Continue]
                    goto J0xBF;
                }
            }
        }
    }
    //return;    
}

simulated function CheckToSeeIfPhaseActionWillResultInLeaderFailingMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curSM, curFSM, tuneDataToUse;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage, enemiesHealthPercentageNotAllowedToGoUnder, enemiesHealthPercentageAfterDamage;

    curSM = GetCurrentSpecialMoveInstance();
    // End:0x371
    if(curSM != none)
    {
        curFSM = LPSM_FollowerVsStruggleMode(curSM);
        // End:0x371
        if((curFSM != none) && curFSM.TuneData != none)
        {
            tuneDataToUse = LPTuneDataStruggleVsPlayerBase(curFSM.TuneData);
            // End:0x371
            if(tuneDataToUse != none)
            {
                iter = 0;
                J0xBF:

                // End:0x371 [Loop If]
                if(iter < tuneDataToUse.SuccessfulStrugglePhaseActionInfoList.Length)
                {
                    // End:0x363
                    if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].NameOfPhaseToActivateOn == PhaseNameEnding)
                    {
                        // End:0x1D1
                        if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage != none)
                        {
                            AmountOfDamage = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage.GetValue();
                        }
                        // End:0x363
                        if(AmountOfDamage > float(0))
                        {
                            // End:0x363
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].HealthPercentageNotAllowedToTakeUnder != none)
                            {
                                enemiesHealthPercentageNotAllowedToGoUnder = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].HealthPercentageNotAllowedToTakeUnder.GetValue();
                                // End:0x33B
                                if(curFSM.LeaderPawn.HealthMax != 0)
                                {
                                    enemiesHealthPercentageAfterDamage = (float(curFSM.LeaderPawn.Health) - AmountOfDamage) / float(curFSM.LeaderPawn.HealthMax);                                    
                                }
                                else
                                {
                                    enemiesHealthPercentageAfterDamage = 1.0000000;
                                }
                                // End:0x363
                                if(enemiesHealthPercentageAfterDamage < enemiesHealthPercentageNotAllowedToGoUnder)
                                {
                                    return true;
                                }
                            }
                        }
                    }
                    ++iter;
                    // [Loop Continue]
                    goto J0xBF;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function ApplyDelayedSuccessfulStrugglePhaseActionDamage()
{
    // End:0x63
    if(DelayedSuccessfulStrugglePhaseActionPawnToDamage != none)
    {
        DelayedSuccessfulStrugglePhaseActionPawnToDamage.TakeDamage(int(DelayedSuccessfulStrugglePhaseActionDamageAmount), Controller, DelayedSuccessfulStrugglePhaseActionDamageLocation, vect(0.0000000, 0.0000000, 0.0000000), DelayedSuccessfulStrugglePhaseActionDamageType);
    }
    //return;    
}

simulated function NotifySucceedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    // End:0xAE
    if(((MyVsLarocheController != none) && !MyVsLarocheController.bJimPrisonRapingLaRocheDialogPlayed) && PhaseNameEnding == 'BendOverStruggleButton')
    {
        MyVsLarocheController.bJimPrisonRapingLaRocheDialogPlayed = true;
        MyVsLarocheController.HandleBossFightPhaseEventMessage(MyVsLarocheController.MyLPEnemy, 23);
    }
    //return;    
}

simulated function NotifySucceedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifySucceedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyEnddedStruggleDefaultMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyGrabInterationJustStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];
    local /*0x97E50000-0x00000000*/ private int PointIndexGrab[8388609];

    // End:0x40
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NotifyGrabInterationJustStarted(PawnGrabbingMe, PointIndexGrab);
    }
    //return;    
}

simulated function NotifyStartedSawingTheCockpit()
{
    bSawingTheCockpit = true;
    LastTimeDamageEnemysCockWithSawStruggle = -1.0000000;
    //return;    
}

simulated function NotifyStoppedSawingTheCockpit()
{
    bSawingTheCockpit = false;
    LastTimeDamageEnemysCockWithSawStruggle = -1.0000000;
    //return;    
}

simulated function NotifyStartRangedDirectFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSPlayer;

    // End:0xAB
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_VsLarocheWinched'))
    {
        VSPlayer = LPVSPlayerPawn(SpecialMoveState.CurSMInfo.InteractionPawn);
        LPSM_PlayerVSWinchedVsLaRoche(VSPlayer.SpecialMoveState.CurSMInstance).GotShocked();        
    }
    else
    {
        StartOfRangedDirectFire(false);
    }
    //return;    
}

function StartOfRangedDirectFire()
{
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL projDir, projDirWithError, projRot, projRotWithError, SpawnedProjectile, aimPositionForThisStrike,
	    fireVel;

    local /*0x97E50000-0x00000000*/ private float projectileSpeed, travelDist;
    local /*0x97E50000-0x00000000*/ private @NULL TargetVel, projLoc, EnemyPawn;

    false
    EnableWinchPoints(false);
    GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
    projectileSpeed = GetEmpPulseFireVelocity();
    // End:0x14E
    if(TuneDataVsLaroche.bUseTargetsCurrentLocAtLobRelease)
    {
        aimPositionForThisStrike = AimTargetActorForDirectFireStrike.Location;
        EnemyPawn = LPPawn(AimTargetActorForDirectFireStrike);
        // End:0x10F
        if((EnemyPawn != none) && EnemyPawn.IsInCover())
        {
            aimPositionForThisStrike = EnemyPawn.GetProjectileTargetPosition(self);            
        }
        else
        {
            aimPositionForThisStrike.Z += TuneDataVsLaroche.HieghtOffTargetPointForEmpPulseFire;
        }        
    }
    else
    {
        aimPositionForThisStrike = AimTargetPositionForDirectFireStrike;
    }
    // End:0x243
    if(bUseDeadReckoning && AimTargetActorForDirectFireStrike != none)
    {
        // End:0x243
        if(VSize(AimTargetActorForDirectFireStrike.Velocity) > float(1))
        {
            travelDist = VSize2D(aimPositionForThisStrike - projLoc);
            TargetVel = AimTargetActorForDirectFireStrike.Velocity;
            TargetVel.Z = 0.0000000;
            aimPositionForThisStrike += ((travelDist / projectileSpeed) * TargetVel);
        }
    }
    projDir = aimPositionForThisStrike - projLoc;
    projDir = Normal(projDir);
    projRot = Rotator(projDir);
    projRotWithError = GetEmpPulseFireStartRoationWithError(projRot);
    projDirWithError = Vector(projRotWithError);
    fireVel = projDirWithError * projectileSpeed;
    SpawnedProjectile = Spawn(RangedDirectFireProjtileClass, self,, projLoc, projRotWithError);
    // End:0x3E4
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        LastTimeSuccessfullyLaunchedEmpPulseProj = WorldInfo.TimeSeconds;
        SpawnedProjectile.Init(projDirWithError);
        SpawnedProjectile.Velocity = fireVel;
        DirectFireProjStartLocation = SpawnedProjectile.Location;
    }
    //return;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Mesh.GetSocketWorldLocationAndRotation('EmpPulseStartProj', out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function GetEmpPulseFireVelocity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataVsLaroche.EmpPulseFireLaunchVelocityMin.GetValue(), TuneDataVsLaroche.EmpPulseFireLaunchVelocityMax.GetValue());
    //return ReturnValue;    
}

simulated function GetEmpPulseFireStartRoationWithError()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentProjRot[25296897], ReturnValue, AimRot;
    local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread;

    AimRot = CurrentProjRot;
    horizontalSpread = float(((FRand() < 0.5000000) ? HorizontalDirectFireSpread : -HorizontalDirectFireSpread));
    verticalSpread = float(((FRand() < 0.5000000) ? VerticalDirectFireSpread : -VerticalDirectFireSpread));
    AimRot.Yaw += int(horizontalSpread * FRand());
    AimRot.Pitch += int(verticalSpread * FRand());
    return AimRot;
    //return ReturnValue;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool HideClaw[9437185];

    false
    // End:0x2E
    if(CoreTag.GetCoreId() == 9)
    {        
    }
    else
    {
        // End:0x57
        if(CoreTag.GetCoreId() == 3)
        {            
        }
        else
        {
            // End:0x80
            if(CoreTag.GetCoreId() == 11)
            {                
            }
            else
            {
                // End:0xA9
                if(CoreTag.GetCoreId() == 5)
                {                    
                }
                else
                {
                    // End:0xD2
                    if(CoreTag.GetCoreId() == 13)
                    {                        
                    }
                    else
                    {
                        // End:0xFB
                        if(CoreTag.GetCoreId() == 7)
                        {                            
                        }
                        else
                        {
                            // End:0x121
                            if(CoreTag.GetCoreId() == 17)
                            {
                            }
                        }
                    }
                }
            }
        }
    }
    super(LPAIPawn).CoreDestroyed(CoreTag, CoreIndex);
    //return;    
}

simulated function DestroyCockPitShield()
{
    // End:0x2E
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.DestroyCockPitShield();
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    ProcessSaw(DeltaTime);
    ProcessEnergyShieldDrift(DeltaTime);
    //return;    
}

simulated function ProcessSaw()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x138
    if(bSawRunning)
    {
        // End:0x99
        if(OutsideSawBladeSkelControl != none)
        {
            OutsideSawBladeSkelControl.BoneRotation.Yaw = int(float(OutsideSawBladeSkelControl.BoneRotation.Yaw) + (SawBladesSpinRateInUUsPerSecond * DeltaTime));
        }
        // End:0x125
        if(InsideSawBladesSkelControl != none)
        {
            InsideSawBladesSkelControl.BoneRotation.Yaw = int(float(InsideSawBladesSkelControl.BoneRotation.Yaw) + (SawBladesSpinRateInUUsPerSecond * DeltaTime));
        }
        ProcessSawingTheCockpit(DeltaTime);
    }
    //return;    
}

simulated function ProcessSawingTheCockpit()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], timeSinceLastDamageEvent;
    local /*0x97E50000-0x00000000*/ private @NULL locOnEnemyToLaydownTheCockpitDamage, hitNormalOnEnemyToLaydownTheCockpitDamage, locOnEnemyToStartTrace, locOnEnemyToStopTrace, rotOflocOnEnemyToLaydownTheCockpitDamage, HitInfo,
	    PC;

    local /*0x97E50000-0x00000000*/ private float currentEnemiesPctOfHealth;

    // End:0x300
    if((bSawRunning && bSawingTheCockpit) && CurrentPawnToApplyStruggleModeDamageTo != none)
    {
        timeSinceLastDamageEvent = WorldInfo.TimeSeconds - LastTimeDamageEnemysCockWithSawStruggle;
        // End:0x300
        if(timeSinceLastDamageEvent > DelayBetweenDamageEventsWhenSawingTheCockpit)
        {
            LastTimeDamageEnemysCockWithSawStruggle = WorldInfo.TimeSeconds;
            // End:0x112
            if(CurrentPawnToApplyStruggleModeDamageTo.HealthMax > 0)
            {
                currentEnemiesPctOfHealth = float(CurrentPawnToApplyStruggleModeDamageTo.Health) / float(CurrentPawnToApplyStruggleModeDamageTo.HealthMax);                
            }
            else
            {
                currentEnemiesPctOfHealth = 0.5000000;
            }
            // End:0x267
            if(currentEnemiesPctOfHealth >= LowestPctgAllowedToTakeEnemiesHealthWhileSawingTheCockpit)
            {
                CurrentPawnToApplyStruggleModeDamageTo.Mesh.GetSocketWorldLocationAndRotation(NameOfSocketToStartTraceForSawingTheCockputDamageAt, locOnEnemyToStartTrace, rotOflocOnEnemyToLaydownTheCockpitDamage);
                CurrentPawnToApplyStruggleModeDamageTo.Mesh.GetSocketWorldLocationAndRotation(NameOfSocketToEndTraceForSawingTheCockputDamageAt, locOnEnemyToStopTrace, rotOflocOnEnemyToLaydownTheCockpitDamage);
                Trace(locOnEnemyToLaydownTheCockpitDamage, hitNormalOnEnemyToLaydownTheCockpitDamage, locOnEnemyToStopTrace, locOnEnemyToStartTrace, true,, HitInfo, 1);
                CurrentPawnToApplyStruggleModeDamageTo.TakeDamage(int(AmountOfDamagePerSawingTheCockpitEvent), Controller, locOnEnemyToLaydownTheCockpitDamage, vect(0.0000000, 0.0000000, 0.0000000), TypeOfDamageToApplyWhenSawingTheCockpit, HitInfo, self);
            }
            PC = CurrentPawnToApplyStruggleModeDamageTo.GetPC();
            // End:0x300
            if((PC != none) && PC.IsLocalPlayerController())
            {
                PC.ClientSpawnCameraLensEffect(TuneDataVsLaroche.OnSawingTheCockpitCameraEffect);
            }
        }
    }
    //return;    
}

simulated function NotifyApplyTaserStruggleModeFailedDamage()
{
    ApplyDirectStruggleModeFailedDamage(TuneDataVsLaroche.AmountOfDamageForTaserStruggleModeEndingEvent.GetValue(), TuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthAtTaserStruggleModeEnding.GetValue(), TuneDataVsLaroche.TypeOfDamageToApplyForTaserStruggleModeEnding, TuneDataVsLaroche.NameOfSocketToStartTraceForTaserStruggleModeEndingDamageAt, TuneDataVsLaroche.NameOfSocketToEndTraceForTaserStruggleModeEndingDamageAt, TuneDataVsLaroche.TaserStruggleModeEndingCameraEffect);
    //return;    
}

simulated function NotifyApplyEMP_StruggleModeFailedDamage()
{
    ApplyDirectStruggleModeFailedDamage(TuneDataVsLaroche.AmountOfDamageForEmpStruggleModeEndingEvent.GetValue(), TuneDataVsLaroche.LowestPctgAllowedToTakeEnemiesHealthAtEmpStruggleModeEnding.GetValue(), TuneDataVsLaroche.TypeOfDamageToApplyForEmpStruggleModeEnding, TuneDataVsLaroche.NameOfSocketToStartTraceForEmpStruggleModeEndingDamageAt, TuneDataVsLaroche.NameOfSocketToEndTraceForEmpStruggleModeEndingDamageAt, TuneDataVsLaroche.EmpStruggleModeEndingCameraEffect);
    //return;    
}

simulated function ApplyDirectStruggleModeFailedDamage()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamageToApply[8388609], LowestPctgAllowedToTakeEnemiesHealth;
    local /*0x97E50000-0x00000000*/ private class TypeOfDamageToApply[8388609];
    local /*0x97E50000-0x00000000*/ private name NameOfSocketToStartTraceAt[8388609], NameOfSocketToEndTraceAt;
    local /*0x97E50000-0x00000000*/ private class EmitCameraEffectToApply[8388609];
    local /*0x97E50000-0x00000000*/ private float damageToDoPlayersVs, enemiesHealthPercentageAfterDamage, enemiesHealthNotAllowedToGoUnder;
    local /*0x97E50000-0x00000000*/ private @NULL locOnEnemyToLaydownTheCockpitDamage, hitNormalOnEnemyToLaydownTheCockpitDamage, locOnEnemyToStartTrace, locOnEnemyToStopTrace, rotOflocOnEnemyToLaydownTheCockpitDamage, HitInfo,
	    PC;

    // End:0x2F6
    if(AmountOfDamageToApply > float(0))
    {
        damageToDoPlayersVs = AmountOfDamageToApply;
        // End:0xA2
        if(CurrentPawnToApplyStruggleModeDamageTo.HealthMax != 0)
        {
            enemiesHealthPercentageAfterDamage = float(CurrentPawnToApplyStruggleModeDamageTo.Health) - (damageToDoPlayersVs / float(CurrentPawnToApplyStruggleModeDamageTo.HealthMax));            
        }
        else
        {
            enemiesHealthPercentageAfterDamage = 1.0000000;
        }
        // End:0x132
        if(enemiesHealthPercentageAfterDamage < LowestPctgAllowedToTakeEnemiesHealth)
        {
            enemiesHealthNotAllowedToGoUnder = LowestPctgAllowedToTakeEnemiesHealth * float(CurrentPawnToApplyStruggleModeDamageTo.HealthMax);
            damageToDoPlayersVs = float(CurrentPawnToApplyStruggleModeDamageTo.Health) - enemiesHealthNotAllowedToGoUnder;
        }
        CurrentPawnToApplyStruggleModeDamageTo.Mesh.GetSocketWorldLocationAndRotation(NameOfSocketToStartTraceAt, locOnEnemyToStartTrace, rotOflocOnEnemyToLaydownTheCockpitDamage);
        CurrentPawnToApplyStruggleModeDamageTo.Mesh.GetSocketWorldLocationAndRotation(NameOfSocketToEndTraceAt, locOnEnemyToStopTrace, rotOflocOnEnemyToLaydownTheCockpitDamage);
        Trace(locOnEnemyToLaydownTheCockpitDamage, hitNormalOnEnemyToLaydownTheCockpitDamage, locOnEnemyToStopTrace, locOnEnemyToStartTrace, true,, HitInfo, 1);
        CurrentPawnToApplyStruggleModeDamageTo.TakeDamage(int(damageToDoPlayersVs), MyVsLarocheController, locOnEnemyToLaydownTheCockpitDamage, vect(0.0000000, 0.0000000, 0.0000000), TypeOfDamageToApply, HitInfo, self);
        PC = CurrentPawnToApplyStruggleModeDamageTo.GetPC();
        // End:0x2F6
        if(((PC != none) && PC.IsLocalPlayerController()) && EmitCameraEffectToApply != none)
        {
            PC.ClientSpawnCameraLensEffect(EmitCameraEffectToApply);
        }
    }
    //return;    
}

simulated function StartUpBackUpSawGen()
{
    StartSawRunning();
    SawBladesSpinRateInUUsPerSecond = TuneDataVsLaroche.SawBladesSpinRateWithBackUpGenInUUsPerSecond * 182.0444000;
    bSawUseBackupGenerator = true;
    //return;    
}

simulated function ProcessEnergyShieldDrift()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x1C3
    if(EnergyShieldSkelControl != none)
    {
        // End:0x1C3
        if(bEnergyShieldAllowedToHaveRandomMovement)
        {
            ProcessEnergyShieldDriftAxis(EnergyShieldDriftVelocity.X, EnergyShieldSkelControl.BoneTranslation.X, TimeForNextChangeInEngeryShieldDriftX, EnergyShieldAllowedMinMovementDeltaPerSecX, EnergyShieldAllowedMaxMovementDeltaPerSecX, MinTimeInSecBetweenChangesInEngeryShieldDriftX, MaxTimeInSecBetweenChangesInEngeryShieldDriftX, EnergyShieldMaxAllowedRandomMovementDeltaX);
            ProcessEnergyShieldDriftAxis(EnergyShieldDriftVelocity.Y, EnergyShieldSkelControl.BoneTranslation.Y, TimeForNextChangeInEngeryShieldDriftY, EnergyShieldAllowedMinMovementDeltaPerSecY, EnergyShieldAllowedMaxMovementDeltaPerSecY, MinTimeInSecBetweenChangesInEngeryShieldDriftY, MaxTimeInSecBetweenChangesInEngeryShieldDriftY, EnergyShieldMaxAllowedRandomMovementDeltaY);
            ProcessEnergyShieldDriftAxis(EnergyShieldDriftVelocity.Z, EnergyShieldSkelControl.BoneTranslation.Z, TimeForNextChangeInEngeryShieldDriftZ, EnergyShieldAllowedMinMovementDeltaPerSecZ, EnergyShieldAllowedMaxMovementDeltaPerSecZ, MinTimeInSecBetweenChangesInEngeryShieldDriftZ, MaxTimeInSecBetweenChangesInEngeryShieldDriftZ, EnergyShieldMaxAllowedRandomMovementDeltaZ);
        }
    }
    //return;    
}

simulated function ProcessEnergyShieldDriftAxis()
{
    local /*0x97E50000-0x00000000*/ private float AxisToChange[25165825], SkelCtrlAxis, TimeForNextChangeInEngeryShieldDrift, EnergyShieldAllowedMinMovementDeltaPerSec, EnergyShieldAllowedMaxMovementDeltaPerSec, MinTimeInSecBetweenChangesInEngeryShieldDrift,
	    MaxTimeInSecBetweenChangesInEngeryShieldDrift, EnergyShieldMaxAllowedRandomMovementDelta, changeInVel;

    // End:0x177
    if(bEnergyShieldAllowedToHaveRandomMovement)
    {
        // End:0xDE
        if(WorldInfo.TimeSeconds > TimeForNextChangeInEngeryShieldDrift)
        {
            TimeForNextChangeInEngeryShieldDrift = WorldInfo.TimeSeconds + RandRange(MinTimeInSecBetweenChangesInEngeryShieldDrift, MaxTimeInSecBetweenChangesInEngeryShieldDrift);
            changeInVel = RandRange(EnergyShieldAllowedMinMovementDeltaPerSec, EnergyShieldAllowedMaxMovementDeltaPerSec);
            // End:0xCB
            if(AxisToChange > float(0))
            {
                changeInVel = -changeInVel;
            }
            AxisToChange = changeInVel;
        }
        SkelCtrlAxis += AxisToChange;
        // End:0x134
        if(SkelCtrlAxis > EnergyShieldMaxAllowedRandomMovementDelta)
        {
            AxisToChange = -AxisToChange;
            SkelCtrlAxis = EnergyShieldMaxAllowedRandomMovementDelta;            
        }
        else
        {
            // End:0x177
            if(SkelCtrlAxis < -EnergyShieldMaxAllowedRandomMovementDelta)
            {
                AxisToChange = -AxisToChange;
                SkelCtrlAxis = -EnergyShieldMaxAllowedRandomMovementDelta;
            }
        }
    }
    //return;    
}

simulated function NotifyStartShiftingEnergyShieldOutOfWayOfLeftSideGrab()
{
    ShiftEnergyShieldOutOfWayOfLeftSideGrab();
    //return;    
}

simulated function NotifyStartShiftingEnergyShieldBackToOrginAfterLeftSideGrab()
{
    ShiftEnergyShieldBackToOrginAfterLeftSideGrab();
    //return;    
}

simulated function ShiftEnergyShieldOutOfWayOfLeftSideGrab()
{
    bEnergyShieldAllowedToHaveRandomMovement = false;
    // End:0x43
    if(EnergyShieldSkelControl != none)
    {
        EnergyShieldSkelControl.BoneTranslation = EnergyShieldOffsetForLeftSideGrabbed;
    }
    //return;    
}

simulated function ShiftEnergyShieldBackToOrginAfterLeftSideGrab()
{
    // End:0x3B
    if(EnergyShieldSkelControl != none)
    {
        EnergyShieldSkelControl.BoneTranslation = vect(0.0000000, 0.0000000, 0.0000000);
    }
    bEnergyShieldAllowedToHaveRandomMovement = true;
    //return;    
}

final simulated function ShutdownRightArmWeaponDown()
{
    StopRightArmPartAction(0, false);
    //return;    
}

simulated function NeedToShutdown()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnShutingMeDown[8388609];

    // End:0x37
    if(MyVsLarocheController != none)
    {
        MyVsLarocheController.NeedToShutdown(PawnShutingMeDown);
    }
    //return;    
}

simulated function StartShutdown()
{
    DoSpecialMove(Class'LPSM_PlayerVSDeath', true);
    //return;    
}

simulated state VSShutdown
{
    ignores PlayHitReactionAnimation;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x17
        if(NextStateName == 'Dead')
        {
        }
        // End:0x26
        if(Health <= 0)
        {
        }
        //return;        
    }

    event HealDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Amount[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x45
        if(Health < HealthMax)
        {
            Health = Min(HealthMax, Health + Amount);
            return true;            
        }
        else
        {
            return false;
        }
        //return ReturnValue;        
    }

    function TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

        // End:0x27
        if((int(Role) < int(ROLE_Authority)) || InGodMode())
        {
            return;
        }
        Momentum = Momentum / Mass;
        // End:0x73
        if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
        {
            HitLocation = Location;
        }
        TakeDamage_SetParams(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo,, DamageCauser, ServerShouldPlayHitReactAnimGlobalMasterSwitch(DamageType), ServerShouldPlayHitEffectsGlobalMasterSwitch(DamageType));
        // End:0xF4
        if(!AllowedToProcessTakeDamage())
        {
            return;
        }
        Damage = TakeDamageParams.Damage;
        Momentum = TakeDamageParams.Momentum;
        DamageType = TakeDamageParams.DamageType;
        // End:0x1E6
        if(ClassIsChildOf(DamageType, Class'LPDamageTypeCrabMelee'))
        {
            // End:0x197
            if(int(Physics) == int(0))
            {
                SetPhysics(1);
            }
            Mesh.RootMotionMode = 2;
            HandleMomentum(Momentum, HitLocation, DamageType, HitInfo);
        }
        ReplicateTakeDamageEffects();
        PlayTakeDamageEffects();
        MakeNoise(1.0000000);
        //return;        
    }

    simulated function PlayTakeDamageEffects()
    {
        // End:0x91
        if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeCrabMelee'))
        {
            TuneDataPawnFXEventBindings.PlayEventFX('VS_ShutdownPushedSlideLeftFoot', self, Mesh, none);
            TuneDataPawnFXEventBindings.PlayEventFX('VS_ShutdownPushedSlideRightFoot', self, Mesh, none);
        }
        super(LPAIPawnMech).PlayTakeDamageEffects();
        //return;        
    }
Begin:

    stop;                
}

defaultproperties
{
    bEnergyShieldAllowedToHaveRandomMovement=true
    // Reference: LPVsPartInfo'Default__LPAIPawnVsLaroche.RightArmPartInfoD0'
    begin object name=RightArmPartInfoD0 class=Class'LPVsPartInfo'
    end object
    RightArmPartInfo=RightArmPartInfoD0
    LastTimeDamageEnemysCockWithSawStruggle=-1.0000000
    DelayBetweenDamageEventsWhenSawingTheCockpit=1.0000000
    NameOfSocketToStartTraceForSawingTheCockputDamageAt="StartTraceForSawingTheCockputDamage"
    NameOfSocketToEndTraceForSawingTheCockputDamageAt="EndTraceForSawingTheCockputDamage"
    AmountOfDamagePerSawingTheCockpitEvent=100.0000000
    TypeOfDamageToApplyWhenSawingTheCockpit=Class'LPDamageTypeVsLarocheSawingCockpitStruggle'
    EnergyShieldMaxAllowedRandomMovementDeltaX=30.0000000
    EnergyShieldMaxAllowedRandomMovementDeltaY=30.0000000
    EnergyShieldMaxAllowedRandomMovementDeltaZ=30.0000000
    EnergyShieldAllowedMaxMovementDeltaPerSecX=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecX=0.5000000
    EnergyShieldAllowedMaxMovementDeltaPerSecY=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecY=0.5000000
    EnergyShieldAllowedMaxMovementDeltaPerSecZ=0.5000000
    EnergyShieldAllowedMinMovementDeltaPerSecZ=0.5000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftX=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftX=1.0000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftY=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftY=1.0000000
    MinTimeInSecBetweenChangesInEngeryShieldDriftZ=1.0000000
    MaxTimeInSecBetweenChangesInEngeryShieldDriftZ=1.0000000
    EnergyShieldOffsetForLeftSideGrabbed=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
    RightArmAnimInfo=(AnimNodeSlotName="RightArmSlotNode",AnimNodeSlot=none)
    RightArmSawAnimInfo=(AnimNodeSlotName="RightArmSawSlotNode",AnimNodeSlot=none)
    // Reference: LPWinchCable'Default__LPAIPawnVsLaroche.WinchCableObject'
    begin object name=WinchCableObject class=Class'LPWinchCable'
    end object
    WinchCable=WinchCableObject
    SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=50.0000000,PulseMinOutput=10.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=50.0000000,PulseMinOutput=10.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_None,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=10.0000000,PulseMinOutput=10.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    EmpFacePlateLightsFactor=1.0000000
    LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=50.0000000,PulseMinOutput=10.0000000,PulseRate=2.5000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=50.0000000,PulseMinOutput=10.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_None,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=10.0000000,PulseMinOutput=10.0000000,PulseRate=2.5000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_None,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=10.0000000,PulseMinOutput=10.0000000,PulseRate=2.5000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    LeftShoulderJointLightFactor=1.0000000
    RightShoulderJointLightFactor=1.0000000
    LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=100.0000000,PulseMinOutput=50.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=100.0000000,PulseMinOutput=50.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_ASin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=100.0000000,PulseMinOutput=50.0000000,PulseRate=5.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
    EmpChargeStateFactor=1.0000000
    EmpLightFactor=1.0000000
    HealthRegenInfo=(bHealthRegenEnabled=true)
    // Reference: LPAimControlVsLaroche'Default__LPAIPawnVsLaroche.AimControl'
    begin object name=AimControl class=Class'LPAimControlVsLaroche'
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnVsLaroche.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnVsLaroche.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnVsLaroche.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnVsLaroche.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnVsLaroche.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnVsLaroche.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnVsLaroche.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnVsLaroche.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnVsLaroche.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    // Reference: SPDamageStateComponent'Default__LPAIPawnVsLaroche.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[9]=DamageStateComponentDefObj
    bUseMultipleExtent=true
    bCheckAIMeshWhenMoving=true
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnVsLaroche.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}