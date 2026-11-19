class LPAIPawnCarrier extends LPAIPawnAkridLarge
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum ECarrierGrabPoints
{
    egpRightFrontHorn,              // 0
    egpLeftFrontHorn,               // 1
    egpTopHorn,                     // 2
    ECarrierGrabPoints_MAX          // 3
};

enum ECarrierWinchPoints
{
    ECWP_RightFrontHorn,            // 0
    ECWP_LeftFrontHorn,             // 1
    ECWP_MAX                        // 2
};

enum ECarrierSideType
{
    ECST_Right,                     // 0
    ECST_Left,                      // 1
    ECST_Both,                      // 2
    ECST_MAX                        // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataCarrier[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCarrierController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageFactorForNonPlayerInstigatedDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PoolOfDefenderLarva[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ListOfDefendersCurrentlyBusyAndNotValidForPoolYet[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array IntendedDefendersLaunched[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ArbitraryDefendersLaunched[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array IntendedDefendersWaitingToLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ArbitraryDefendersWaitingToLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentNumberOfLaunchedDefendersAlive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentNumberOfDefendersSpawned[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HiveCellStatusList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfCellsPerSideOfHive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesiredDeflateValue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeflateBlendTimeToGo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentDeflateValue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeflationStateLocked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsePostCellDestroyedAutoBleed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllHiveCellsDestroyed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoveBackToLoiterPositionFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name HighResDestroyedCellBleedEffectName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LowResDestroyedCellBleedEffectName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxUpdateDeltaToAllowLowResCellDestroyedBleed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HiveCellsMorphWeightNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MainHiveMorphTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array RecentMainHiveMorphWeights[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MainCoreSkelCtrlList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DefaultClassOfDefenderToSpawnAtLaunch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DefaultClassOfControllerToCommandDefendersAtLaunch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPhysMatPropTag_CarrierCoreId.eCarrierCore LastHiveCellToHaveGrenadeStuckToIt[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeBetweenCellDestroyedBleeds[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeToSpendInBackUpSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedMoveBackToLoiterPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL DefenderFactoryAI[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL DefenderFactoryData[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoDeflateDamageAmount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentDeflateDamageAmount[536870913];

// Export ULPAIPawnCarrier::execSpawnDefender(FFrame&, void* const)
native function SpawnDefender()
{
    local /*0x97E50000-0x00000000*/ private @NULL Factory[8388609];
    local /*0x97E50000-0x00000000*/ private class PawnClass2Spawn[8388609], ControllerClassOfSpawn;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLocation[8388609], SpawnRotation, ReturnValue;


}

// Export ULPAIPawnCarrier::execFindBleedEvent(FFrame&, void* const)
native function FindBleedEvent()
{
    local /*0x97E50000-0x00000000*/ private name BleedEventLookingFor[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetMouthCoreGlowFactor(FFrame&, void* const)
native final simulated function GetMouthCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetMouthCoreGlowOnOrOff(FFrame&, void* const)
native final simulated function GetMouthCoreGlowOnOrOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

final simulated function GetMouthCoreRampingFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

final simulated function GetMouthCoreRampingUpperFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

// Export ULPAIPawnCarrier::execGetMainCoreGlowOnOrOff(FFrame&, void* const)
native final simulated function GetMainCoreGlowOnOrOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetBodyDamageFactor(FFrame&, void* const)
native simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell1GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell1GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell2GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell2GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell3GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell3GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell4GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell4GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell5GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell5GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell6GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell6GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell7GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell7GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell8GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell8GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell9GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell9GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell10GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell10GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell11GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell11GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell12GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell12GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell13GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell13GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell14GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell14GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell15GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell15GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell16GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell16GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell17GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell17GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetLeftCell18GlowFactor(FFrame&, void* const)
native final simulated function GetLeftCell18GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnCarrier::execGetCoreDamageFactor(FFrame&, void* const)
native simulated function GetCoreDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    WaitTimeBetweenCellDestroyedBleeds = 1.0000000;
    SetHiveDeflation(1.0000000, 0.0000000);
    LastHiveCellToHaveGrenadeStuckToIt = 0;
    DamageFactorForNonPlayerInstigatedDamage = TuneDataCarrier.DamageFactorForNonPlayerInstigatedDamage.GetValue();
    AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce = int(TuneDataCarrier.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce.GetValue());
    CurrentNumberOfLaunchedDefendersAlive = 0;
    CurrentNumberOfDefendersSpawned = 0;
    EnableCoreById(1, false);
    NumOfCellsPerSideOfHive = TuneDataCarrier.HiveMaxNumOfCells / 2;
    MaxTimeToSpendInBackUpSpecialMove = TuneDataCarrier.MaxTimeToSpendInBackUpSpecialMove.GetValue();
    bMoveBackToLoiterPositionFinished = false;
    TimeStartedMoveBackToLoiterPosition = -1.0000000;
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIPawn).PossessedBy(C, bVehicleTransition);
    MyCarrierController = LPAIControllerCarrier(C);
    //return;    
}

function UnPossessed()
{
    super(LPAIPawn).UnPossessed();
    MyCarrierController = none;
    //return;    
}

function ArmCollisionOff()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    I = 0;
    J0x0B:

    // End:0x1DF [Loop If]
    if(I < Mesh.PhysicsAsset.BodySetup.Length)
    {
        // End:0x1D1
        if(Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_R_Elbow') || Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_L_Elbow'))
        {
            Body = Mesh.PhysicsAssetInstance.Bodies[I];
            Body.SetBlockRigidBody(false);
            Body.bBlockNonZeroExtent = false;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ArmCollisionOn()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    I = 0;
    J0x0B:

    // End:0x1DF [Loop If]
    if(I < Mesh.PhysicsAsset.BodySetup.Length)
    {
        // End:0x1D1
        if(Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_R_Elbow') || Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_L_Elbow'))
        {
            Body = Mesh.PhysicsAssetInstance.Bodies[I];
            Body.SetBlockRigidBody(true);
            Body.bBlockNonZeroExtent = true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function DestroyDefendersWaitingToLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender;

    // End:0x4D
    if(IntendedDefendersLaunched.Length != 0)
    {
        // End:0x40
        foreach IntendedDefendersLaunched(Defender)
        {
            Defender.Destroy();            
        }        
        IntendedDefendersLaunched.Length = 0;
    }
    // End:0x9A
    if(ArbitraryDefendersLaunched.Length != 0)
    {
        // End:0x8D
        foreach ArbitraryDefendersLaunched(Defender)
        {
            Defender.Destroy();            
        }        
        ArbitraryDefendersLaunched.Length = 0;
    }
    //return;    
}

simulated function DestroyDefendersInPoolOfDefenderLarva()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender;

    // End:0x78
    if(PoolOfDefenderLarva.Length != 0)
    {
        // End:0x6B
        foreach PoolOfDefenderLarva(Defender)
        {
            Defender.PawnThatLaunchedMe = none;
            Defender.Destroy();
            Defender = none;            
        }        
        PoolOfDefenderLarva.Length = 0;
    }
    //return;    
}

function DestroyDefendersWaitingForLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender;

    // End:0x78
    if(IntendedDefendersWaitingToLaunch.Length != 0)
    {
        // End:0x6B
        foreach IntendedDefendersWaitingToLaunch(Defender)
        {
            Defender.PawnThatLaunchedMe = none;
            Defender.Destroy();
            Defender = none;            
        }        
        IntendedDefendersWaitingToLaunch.Length = 0;
    }
    //return;    
}

simulated function DestroyDefendersInCurrentlyBusyAndNotValidForPoolYet()
{
    local /*0x97E50000-0x00000000*/ private @NULL Defender;

    // End:0x78
    if(ListOfDefendersCurrentlyBusyAndNotValidForPoolYet.Length != 0)
    {
        // End:0x6B
        foreach ListOfDefendersCurrentlyBusyAndNotValidForPoolYet(Defender)
        {
            Defender.PawnThatLaunchedMe = none;
            Defender.Destroy();
            Defender = none;            
        }        
        ListOfDefendersCurrentlyBusyAndNotValidForPoolYet.Length = 0;
    }
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    DestroyDefendersWaitingToLaunch();
    TellLaunchedPawnsLauncherIsDown();
    super.Destroyed();
    DestroyDefendersInPoolOfDefenderLarva();
    DestroyDefendersWaitingForLaunch();
    DestroyDefendersInCurrentlyBusyAndNotValidForPoolYet();
    iter = 0;
    J0x47:

    // End:0x82 [Loop If]
    if(iter < MainCoreSkelCtrlList.Length)
    {
        MainCoreSkelCtrlList[iter] = none;
        ++iter;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

simulated function EnableWinchPoints()
{
    local /*0x97E50000-0x00000000*/ private bool inEnable[8388609];

    WinchPoints[0].bEnabledForWinching = inEnable;
    WinchPoints[1].bEnabledForWinching = inEnable;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL NewStatus;

    TuneDataCarrier = LPTuneDataCarrier(TuneData);
    super(LPAIPawnAkrid).InitTuneData(TuneData);
    InitDamageTracking();
    // End:0x69
    if(DefenderFactoryData != none)
    {
        DefenderFactoryData.bCheckSpawnCollision = false;
    }
    Idx = 0;
    J0x74:

    // End:0xE4 [Loop If]
    if(Idx < TuneDataCarrier.HiveCellDataForDefenders.Length)
    {
        NewStatus.HiveCellState = 2;
        HiveCellStatusList.AddItem(NewStatus);        
        Idx++;
        // [Loop Continue]
        goto J0x74;
    }
    bUsePostCellDestroyedAutoBleed = TuneDataCarrier.bUsePostCellDestroyedAutoBleed.GetValue() != float(0);
    MaxUpdateDeltaToAllowLowResCellDestroyedBleed = TuneDataCarrier.MaxUpdateDeltaToAllowLowResCellDestroyedBleed.GetValue();
    WaitTimeBetweenCellDestroyedBleeds = TuneDataCarrier.WaitTimeBetweenCellDestroyedBleeds.GetValue();
    Idx = 0;
    J0x1AF:

    // End:0x261 [Loop If]
    if(Idx < TuneDataCarrier.SkelControlInfoForCoresToPresentWhenAllCellsDestroyed.Length)
    {
        MainCoreSkelCtrlList[Idx] = LPSkelControlSingleBoneBlendFromRefPose(Mesh.FindSkelControl(TuneDataCarrier.SkelControlInfoForCoresToPresentWhenAllCellsDestroyed[Idx].CoreToPresentSkelControlName));
        ++Idx;
        // [Loop Continue]
        goto J0x1AF;
    }
    PlayRateForTransitionComponent = TuneDataCarrier.NormalMaxSpeedScale_Tunable.GetValue();
    // End:0x2F0
    if(HiveCellsMorphWeightNode != none)
    {
        HiveCellsMorphWeightNode.AddMorphTarget(TuneDataCarrier.NameOfMorphTargetToSwellHive, 1.0000000);
    }
    SetHiveDeflation(1.0000000, 0.0000000);
    //return;    
}

simulated function InitGibs()
{
    super(SPPawn).InitGibs();
    bRequiredToCleanUpOwnGibsForGibPool = true;
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return AttackAnimTree;
    //return ReturnValue;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(SPPawn).PostInitAnimTree(SkelComp);
    // End:0x65
    if(SkelComp == Mesh)
    {
        HiveCellsMorphWeightNode = LPMorphNodeMultiPose(Mesh.FindMorphNode('CellOpenAndClose'));
    }
    //return;    
}

simulated function NotifyStartOfCarrierTauntRoar()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_SnowCrabStartTauntRoar, self);
    //return;    
}

simulated function NotifyStartOfCarrierLaunchRoar()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_SnowCrabStartTauntRoar, self);
    //return;    
}

function InitCarrierShield()
{
    //return;    
}

simulated function NotifyShieldAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    super(LPAIPawn).NotifyShieldAttached(Shield, AttachSocket, ShieldId);
    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];

    super(LPAIPawn).ShieldDestroyed(Shield);
    //return;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool hide[9437185];
    local /*0x97E50000-0x00000000*/ private int physMatCoreId, iter, maxCellCount, cellIdDestroyed, numOfCellsLeft, MinNumberOfCellsRequiredToKeepHiveClosed;

    false
    super(LPAIPawn).CoreDestroyed(CoreTag, CoreIndex, hide);
    physMatCoreId = CoreTag.GetCoreId();
    maxCellCount = HiveCellStatusList.Length;
    cellIdDestroyed = physMatCoreId - TuneDataCarrier.HiveCellCoreIdStartIdx;
    // End:0x2FD
    if(maxCellCount > cellIdDestroyed)
    {
        HiveCellStatusList[cellIdDestroyed].HiveCellState = 0;
        HiveCellStatusList[cellIdDestroyed].TimeCellWasDestroyed = WorldInfo.TimeSeconds;
        HiveCellStatusList[cellIdDestroyed].NumOfTicksSinceLastTimeHiveCellBleed = 0;
        HiveCellStatusList[cellIdDestroyed].TimeToMakeCellProtected = -1.0000000;
        // End:0x1B1
        if(HiveCellsMorphWeightNode != none)
        {
            HiveCellsMorphWeightNode.Weights[cellIdDestroyed] = 1.0000000;
        }
        numOfCellsLeft = 0;
        iter = 0;
        J0x1C7:

        // End:0x229 [Loop If]
        if(iter < HiveCellStatusList.Length)
        {
            // End:0x21B
            if(int(HiveCellStatusList[iter].HiveCellState) != int(0))
            {
                ++numOfCellsLeft;
            }
            ++iter;
            // [Loop Continue]
            goto J0x1C7;
        }
        MinNumberOfCellsRequiredToKeepHiveClosed = int(TuneDataCarrier.MinNumberOfCellsRequiredToKeepHiveClosed.GetValue());
        // End:0x2FD
        if((numOfCellsLeft <= MinNumberOfCellsRequiredToKeepHiveClosed) && !bAllHiveCellsDestroyed)
        {
            bAllHiveCellsDestroyed = true;
            DestroyAllHiveCells();
            // End:0x2FA
            if(MyCarrierController != none)
            {
                MyCarrierController.NotfiyAllCellsDestoryedAndNeedsToExplosePrimaryCore(LPPawn(TakeDamageParams.InstigatedByPawn));
            }            
        }
    }
    //return;    
}

simulated function FireStartedInCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609], CellIndex;

    CellIndex = CoreIndex - TuneDataCarrier.HiveCellCoreIdStartIdx;
    // End:0x138
    if(((CellIndex >= 0) && CellIndex < HiveCellStatusList.Length) && int(HiveCellStatusList[CellIndex].HiveCellState) == int(2))
    {
        HiveCellStatusList[CellIndex].bIsOnFire = true;
        MyCarrierController.StartArbitraryDefenderLaunch(1, LPPawn(DOTInfo.DamageCauser.Pawn), false, false, 0.0000000, -1.0000000, -1.0000000, -1.0000000, -1.0000000, CellIndex, true, false);
    }
    //return;    
}

function NotifyAllCellsDestroyedAndSwellTheHive()
{
    SetHiveDeflation(0.0000000);
    bDeflationStateLocked = true;
    //return;    
}

function PutMainCoreInVulnerablePosition()
{
    SetHiveDeflation(0.0000000,, TuneDataCarrier.DamageAmountForAutoDeflate);
    //return;    
}

function PutMainCoreInInvulnerablePosition()
{
    SetHiveDeflation(1.0000000);
    //return;    
}

function NotifyNeedToResetAllCellsToUnSwollenState()
{
    bDeflationStateLocked = false;
    SetHiveDeflation(1.0000000);
    bDeflationStateLocked = true;
    //return;    
}

function NotifyNeedToStartDeflatingTheHive()
{
    bDeflationStateLocked = false;
    SetHiveDeflation(1.0000000);
    bDeflationStateLocked = true;
    //return;    
}

function SetHiveDeflation()
{
    local /*0x97E50000-0x00000000*/ private float targetvalue[8388609], BlendTime, InAutoDeflateDamageAmount;
    local /*0x97E50000-0x00000000*/ private int Idx;

    1.0000000
    0.0000000
    // End:0x21
    if(bDeflationStateLocked)
    {
        return;
    }
    DesiredDeflateValue = targetvalue;
    DeflateBlendTimeToGo = BlendTime;
    // End:0x115
    if(DesiredDeflateValue == 1.0000000)
    {
        // End:0x83
        if(IsCoreEnabled(0))
        {
            AutoDeflateDamageAmount = 0.0000000;
            EnableCoreById(0, false);
        }
        Idx = 0;
        J0x8E:

        // End:0x112 [Loop If]
        if(Idx < TuneDataCarrier.CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed.Length)
        {
            Mesh.HideBoneByName(TuneDataCarrier.CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed[Idx], 2);
            ++Idx;
            // [Loop Continue]
            goto J0x8E;
        }        
    }
    else
    {
        // End:0x153
        if(!IsCoreEnabled(0))
        {
            AutoDeflateDamageAmount = InAutoDeflateDamageAmount;
            CurrentDeflateDamageAmount = 0.0000000;
            EnableCoreById(0, true);
        }
        Idx = 0;
        J0x15E:

        // End:0x1E0 [Loop If]
        if(Idx < TuneDataCarrier.CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed.Length)
        {
            Mesh.UnHideBoneByName(TuneDataCarrier.CoresToHideOnSpawnAndUnHideWhenAllCellsDestroyed[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x15E;
        }
    }
    // End:0x215
    if(BlendTime == 0.0000000)
    {
        CurrentDeflateValue = targetvalue;
        UpdateHiveDeflation(0.0000000);
    }
    //return;    
}

function UpdateHiveDeflation()
{
    local /*0x97E50000-0x00000000*/ private float TickDeltaTime[8388609], BlendDelta, StartValue;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool bCurrentValueChanged;

    bCurrentValueChanged = TickDeltaTime == 0.0000000;
    StartValue = CurrentDeflateValue;
    // End:0xF8
    if(DeflateBlendTimeToGo > 0.0000000)
    {
        // End:0xB7
        if(DeflateBlendTimeToGo > TickDeltaTime)
        {
            BlendDelta = DesiredDeflateValue - CurrentDeflateValue;
            CurrentDeflateValue += ((BlendDelta / DeflateBlendTimeToGo) * TickDeltaTime);
            DeflateBlendTimeToGo -= TickDeltaTime;            
        }
        else
        {
            CurrentDeflateValue = DesiredDeflateValue;
            DeflateBlendTimeToGo = 0.0000000;
        }
        bCurrentValueChanged = CurrentDeflateValue != StartValue;
    }
    // End:0x20B
    if(bCurrentValueChanged)
    {
        HiveCellsMorphWeightNode.UpdateMorphTarget(HiveCellsMorphWeightNode.Targets[HiveCellsMorphWeightNode.Targets.Length - 1], CurrentDeflateValue);
        Idx = 0;
        J0x179:

        // End:0x20B [Loop If]
        if(Idx < MainCoreSkelCtrlList.Length)
        {
            MainCoreSkelCtrlList[Idx].SetSkelControlStrength(1.0000000, 0.0000000);
            MainCoreSkelCtrlList[Idx].SetRefPoseStrength(1.0000000 - CurrentDeflateValue);
            ++Idx;
            // [Loop Continue]
            goto J0x179;
        }
    }
    //return;    
}

function SetCoreSkelControlStrengthByName()
{
    local /*0x97E50000-0x00000000*/ private name ControlName[8388609];
    local /*0x97E50000-0x00000000*/ private float InStrength[8388609], BlendTime;

    //return;    
}

simulated event DestroyAllHiveCells()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCoreDestroying;
    local /*0x97E50000-0x00000000*/ private int iter;

    curCoreDestroying = new Class'LPPhysMatPropTag_CarrierCoreId';
    iter = 0;
    J0x23:

    // End:0x11C [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        curCoreDestroying.CoreID = byte(iter + TuneDataCarrier.HiveCellCoreIdStartIdx);
        CoreDestroyed(curCoreDestroying, iter + TuneDataCarrier.HiveCellCoreIdStartIdx, true);
        MyCoreData[iter + TuneDataCarrier.HiveCellCoreIdStartIdx].Health = 0.0000000;
        ++iter;
        // [Loop Continue]
        goto J0x23;
    }
    curCoreDestroying = none;
    //return;    
}

simulated event MakeAllNonDestroyedHiveCellsVulnerableEx()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x4E [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        SetThisCellToVulnerableIfNotDestroyed(iter, -1.0000000, -1.0000000);
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated event MakeAllNonDestroyedHiveCellsProtectedEx()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x44 [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        SetThisCellToProtectedIfNotDestroyed(iter);
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function MakeAllNonDestroyedCellsNotClaimedForLaunchEx()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x44 [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        SetThisCellToNotClaimedForLaunch(iter);
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function ClaimAllNonDestroyedAndNonClaimedCellsForIntendedLaunch()
{
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeUnclaiming[8388609], MaxDelayBeforeUnclaiming;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, numOfCellsClaimed;

    iter = 0;
    J0x0B:

    // End:0x64 [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        // End:0x56
        if(SetThisCellToClaimedForLaunchIfNotDestroyedAndNotClaimed(iter, MinDelayBeforeUnclaiming, MaxDelayBeforeUnclaiming))
        {
            ++numOfCellsClaimed;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return numOfCellsClaimed;
    //return ReturnValue;    
}

final simulated function UpdateAllHiveCellStatuses()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x1DF [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        // End:0x77
        if(HiveCellStatusList[iter].NumOfTicksSinceLastTimeHiveCellBleed >= 0)
        {
            ++HiveCellStatusList[iter].NumOfTicksSinceLastTimeHiveCellBleed;
        }
        // End:0x103
        if((HiveCellStatusList[iter].TimeToMakeCellProtected > float(0)) && WorldInfo.TimeSeconds >= HiveCellStatusList[iter].TimeToMakeCellProtected)
        {
            SetThisCellToProtectedIfNotDestroyed(iter);
        }
        // End:0x18F
        if((HiveCellStatusList[iter].TimeToUnclaim > float(0)) && WorldInfo.TimeSeconds >= HiveCellStatusList[iter].TimeToUnclaim)
        {
            SetThisCellToNotClaimedForLaunch(iter);
        }
        // End:0x1D1
        if(bUsePostCellDestroyedAutoBleed && DeltaTime < MaxUpdateDeltaToAllowLowResCellDestroyedBleed)
        {
            HandleDestoryedCellBleedBleed(DeltaTime, iter);
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    UpdateHiveDeflation(DeltaTime);
    //return;    
}

final simulated function UpdateDefenderPool()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int totalNumOfDefenders;

    totalNumOfDefenders = PoolOfDefenderLarva.Length;
    totalNumOfDefenders += ListOfDefendersCurrentlyBusyAndNotValidForPoolYet.Length;
    totalNumOfDefenders += IntendedDefendersLaunched.Length;
    totalNumOfDefenders += ArbitraryDefendersLaunched.Length;
    totalNumOfDefenders += IntendedDefendersWaitingToLaunch.Length;
    totalNumOfDefenders += ArbitraryDefendersWaitingToLaunch.Length;
    // End:0xA2
    if(totalNumOfDefenders < (AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce + 2))
    {
        SpawnDefenderLarva();
    }
    //return;    
}

final simulated function SpawnDefenderLarva()
{
    local /*0x97E50000-0x00000000*/ private @NULL newDefender;

    newDefender = SpawnDefender(DefenderFactoryAI, DefaultClassOfDefenderToSpawnAtLaunch, DefaultClassOfControllerToCommandDefendersAtLaunch, vect(0.0000000, 0.0000000, 0.0000000), Rotation);
    // End:0x19D
    if(newDefender != none)
    {
        LPAIControllerDefender(newDefender.Controller).CleanUpForBeingPutBackIntoPoolOnDeath();
        PoolOfDefenderLarva.AddItem(newDefender);        
        ++CurrentNumberOfDefendersSpawned;
        newDefender.PawnThatLaunchedMe = self;
        newDefender.SetCollision(false, false);
        newDefender.SetHidden(true);
        newDefender.Mesh.SetHidden(true);
        newDefender.GotoState('WaitingToBePutInCell');
        newDefender.Controller.GotoState('WaitingToBePutInCell');
    }
    //return;    
}

final simulated function GetDefenderLarvaFromPoolForPuttingInCell()
{
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int CellToSpawnAt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], defenderForCell;

    // End:0xA9
    if(PoolOfDefenderLarva.Length > 0)
    {
        defenderForCell = PoolOfDefenderLarva[0];
        PoolOfDefenderLarva.Remove(0, 1);        
        // End:0x58
        if(bIntendedLaunch)
        {
            IntendedDefendersWaitingToLaunch.AddItem(defenderForCell);                        
        }
        else
        {
            ArbitraryDefendersWaitingToLaunch.AddItem(defenderForCell);            
        }
        ++CurrentNumberOfLaunchedDefendersAlive;
        HiveCellStatusList[CellToSpawnAt].DefenderSpawnedInThisCellWaitingForLaunch = defenderForCell;
    }
    return defenderForCell;
    //return ReturnValue;    
}

final simulated function TryAndPutDefenderLarvaBackIntoPool()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefenderForPool[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLaunched[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], indexOfArrayRemovedFrom;

    indexOfArrayRemovedFrom = -1;
    // End:0x166
    if(DefenderForPool != none)
    {
        // End:0xC2
        if(bLaunched)
        {
            // End:0x70
            if(DefenderForPool.bLaunchedIntentionally)
            {
                indexOfArrayRemovedFrom = IntendedDefendersLaunched.RemoveItem(DefenderForPool);                                
            }
            else
            {
                indexOfArrayRemovedFrom = ArbitraryDefendersLaunched.RemoveItem(DefenderForPool);                
            }
            // End:0xBF
            if(indexOfArrayRemovedFrom < 0)
            {
                indexOfArrayRemovedFrom = ListOfDefendersCurrentlyBusyAndNotValidForPoolYet.RemoveItem(DefenderForPool);                
            }            
        }
        else
        {
            // End:0xFD
            if(DefenderForPool.bLaunchedIntentionally)
            {
                IntendedDefendersWaitingToLaunch.RemoveItem(DefenderForPool);                                
            }
            else
            {
                ArbitraryDefendersWaitingToLaunch.RemoveItem(DefenderForPool);                
            }
        }
        // End:0x150
        if(DefenderForPool.Base == none)
        {
            PoolOfDefenderLarva.AddItem(DefenderForPool);                        
        }
        else
        {
            ListOfDefendersCurrentlyBusyAndNotValidForPoolYet.AddItem(DefenderForPool);            
        }
    }
    return indexOfArrayRemovedFrom;
    //return ReturnValue;    
}

final simulated function PutAllDefendersWaitingToLaunchBackIntoPool()
{
    local /*0x97E50000-0x00000000*/ private bool bIntentionalLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int iter, numToPutBackInPool;
    local /*0x97E50000-0x00000000*/ private @NULL DefenderForPool;

    // End:0x24
    if(bIntentionalLaunch)
    {
        numToPutBackInPool = IntendedDefendersWaitingToLaunch.Length;        
    }
    else
    {
        numToPutBackInPool = ArbitraryDefendersWaitingToLaunch.Length;
    }
    iter = 0;
    J0x43:

    // End:0xC6 [Loop If]
    if(iter < numToPutBackInPool)
    {
        // End:0x87
        if(bIntentionalLaunch)
        {
            DefenderForPool = IntendedDefendersWaitingToLaunch[iter];            
        }
        else
        {
            DefenderForPool = ArbitraryDefendersWaitingToLaunch[iter];
        }
        TryAndPutDefenderLarvaBackIntoPool(DefenderForPool, false);
        ++iter;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0xE2
    if(bIntentionalLaunch)
    {
        IntendedDefendersWaitingToLaunch.Length = 0;        
    }
    else
    {
        ArbitraryDefendersWaitingToLaunch.Length = 0;
    }
    return;
    //return;    
}

function GetHiveLaunchTypeToPerformForThisCell()
{
    local /*0x97E50000-0x00000000*/ private int CellToLaunchFrom[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LaunchingDefender[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}

final function LaunchDefenderFromCell()
{
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexOfDefenderToLaunch[8388609], CellToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtecting[8388609], MaxDelayBeforeProtecting;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL locToLaunchDefender, rotOfDefenderAtLaunch, launchingDef;

    // End:0x277
    if((bIntendedLaunch && IndexOfDefenderToLaunch < IntendedDefendersWaitingToLaunch.Length) || !bIntendedLaunch && IndexOfDefenderToLaunch < ArbitraryDefendersWaitingToLaunch.Length)
    {
        SetThisCellToVulnerableIfNotDestroyed(CellToLaunchFrom, MinDelayBeforeProtecting, MaxDelayBeforeProtecting);
        Mesh.GetSocketWorldLocationAndRotation(TuneDataCarrier.HiveCellDataForDefenders[CellToLaunchFrom].SocketNameForDefenderLaunch, locToLaunchDefender, rotOfDefenderAtLaunch);
        // End:0x113
        if(bIntendedLaunch)
        {
            launchingDef = IntendedDefendersWaitingToLaunch[IndexOfDefenderToLaunch];            
        }
        else
        {
            launchingDef = ArbitraryDefendersWaitingToLaunch[IndexOfDefenderToLaunch];
        }
        // End:0x277
        if(launchingDef != none)
        {
            // End:0x165
            if(bIntendedLaunch)
            {
                IntendedDefendersLaunched.AddItem(launchingDef);                                
            }
            else
            {
                ArbitraryDefendersLaunched.AddItem(launchingDef);                
            }
            launchingDef.NotifyGettingLaunched(locToLaunchDefender, rotOfDefenderAtLaunch, bIntendedLaunch, CellToLaunchFrom, self, PawnToLauchAt, GetHiveLaunchTypeToPerformForThisCell(CellToLaunchFrom, launchingDef));
            HiveCellStatusList[CellToLaunchFrom].DefenderSpawnedInThisCellWaitingForLaunch = none;
            HiveCellStatusList[CellToLaunchFrom].LastDefenderLaunchedFromThisCell = launchingDef;
            SetThisCellToNotClaimedForLaunch(CellToLaunchFrom);
            SetThisCellToVulnerableIfNotDestroyed(CellToLaunchFrom, MinDelayBeforeProtecting, MaxDelayBeforeProtecting);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function FreeGrabHorns()
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

simulated function IsThisCellStillValidForLaunchingDefenders()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int cell2Test;

    // End:0x3F
    if((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return false;
    }
    cell2Test = CellIdx;
    // End:0xD0
    if(HiveCellStatusList.Length > cell2Test)
    {
        // End:0xD0
        if((int(HiveCellStatusList[cell2Test].HiveCellState) == int(2)) || int(HiveCellStatusList[cell2Test].HiveCellState) == int(1))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function AreThereAnyCellsAvailableForLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x49 [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        // End:0x3B
        if(IsThisCellStillValidForLaunchingDefenders(iter))
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetThisCellToVulnerable()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtecting[8388609], MaxDelayBeforeProtecting;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float delayBeforeProtecting;

    // End:0x3F
    if((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return false;
    }
    // End:0x1B1
    if(HiveCellStatusList.Length > CellIdx)
    {
        // End:0x94
        if(HiveCellsMorphWeightNode != none)
        {
            HiveCellsMorphWeightNode.Weights[CellIdx] = 1.0000000;
        }
        delayBeforeProtecting = RandRange(MinDelayBeforeProtecting, MaxDelayBeforeProtecting);
        HiveCellStatusList[CellIdx].HiveCellState = 1;
        HiveCellStatusList[CellIdx].LastTimeCellWasMadeVulnerable = WorldInfo.TimeSeconds;
        HiveCellStatusList[CellIdx].TimeToMakeCellProtected = WorldInfo.TimeSeconds + delayBeforeProtecting;
        EnableCoreById(CellIdx + TuneDataCarrier.HiveCellCoreIdStartIdx, true);
        return true;        
    }
    return false;
    //return ReturnValue;    
}

simulated function SetThisCellToVulnerableIfNotDestroyed()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtecting[8388609], MaxDelayBeforeProtecting;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3F
    if((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return false;
    }
    // End:0xB4
    if(HiveCellStatusList.Length > CellIdx)
    {
        // End:0xB1
        if(int(HiveCellStatusList[CellIdx].HiveCellState) != int(0))
        {
            return SetThisCellToVulnerable(CellIdx, MinDelayBeforeProtecting, MaxDelayBeforeProtecting);            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function SetThisCellToProtectedIfNotDestroyed()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xB8
    if(((((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells) || CellIdx >= HiveCellStatusList.Length) || int(HiveCellStatusList[CellIdx].HiveCellState) == int(0)) || HiveCellStatusList[CellIdx].bIsOnFire)
    {
        return false;
    }
    // End:0xF5
    if(HiveCellsMorphWeightNode != none)
    {
        HiveCellsMorphWeightNode.Weights[CellIdx] = 0.0000000;
    }
    HiveCellStatusList[CellIdx].HiveCellState = 2;
    HiveCellStatusList[CellIdx].LastTimeCellWasMadeProtected = WorldInfo.TimeSeconds;
    HiveCellStatusList[CellIdx].TimeToMakeCellProtected = -1.0000000;
    EnableCoreById(CellIdx + TuneDataCarrier.HiveCellCoreIdStartIdx, false);
    return true;
    //return ReturnValue;    
}

simulated function SetThisCellToClaimedForLaunchIfNotDestroyedAndNotClaimed()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeUnclaiming[8388609], MaxDelayBeforeUnclaiming;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float delayBeforeUnclaiming;

    // End:0x3F
    if((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return false;
    }
    // End:0x1A2
    if(HiveCellStatusList.Length > CellIdx)
    {
        // End:0x19F
        if((int(HiveCellStatusList[CellIdx].HiveCellState) != int(0)) && !HiveCellStatusList[CellIdx].bCellClaimedForLaunchingDefender)
        {
            delayBeforeUnclaiming = RandRange(MinDelayBeforeUnclaiming, MaxDelayBeforeUnclaiming);
            HiveCellStatusList[CellIdx].bCellClaimedForLaunchingDefender = true;
            HiveCellStatusList[CellIdx].LastTimeClaimed = WorldInfo.TimeSeconds;
            HiveCellStatusList[CellIdx].TimeToUnclaim = WorldInfo.TimeSeconds + delayBeforeUnclaiming;
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function SetThisCellToNotClaimedForLaunch()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3F
    if((CellIdx < 0) || CellIdx > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return false;
    }
    // End:0xF3
    if(HiveCellStatusList.Length > CellIdx)
    {
        HiveCellStatusList[CellIdx].bCellClaimedForLaunchingDefender = false;
        HiveCellStatusList[CellIdx].LastTimeUnclaimed = WorldInfo.TimeSeconds;
        HiveCellStatusList[CellIdx].TimeToUnclaim = -1.0000000;
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function AreCellsOnSideDestroyed()
{
    local /*0x97E50000-0x00000000*/ private byte SideType[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, StartIdx, EndIdx;

    2
    // End:0x3E
    if(int(SideType) == int(1))
    {
        StartIdx = 0;
        EndIdx = NumOfCellsPerSideOfHive - 1;        
    }
    else
    {
        // End:0x7F
        if(int(SideType) == int(0))
        {
            StartIdx = NumOfCellsPerSideOfHive;
            EndIdx = HiveCellStatusList.Length - 1;            
        }
        else
        {
            StartIdx = 0;
            EndIdx = HiveCellStatusList.Length - 1;
        }
    }
    iter = StartIdx;
    J0xB4:

    // End:0x10C [Loop If]
    if(iter <= EndIdx)
    {
        // End:0xFE
        if(int(HiveCellStatusList[iter].HiveCellState) != int(0))
        {
            return false;
        }
        ++iter;
        // [Loop Continue]
        goto J0xB4;
    }
    return true;
    //return ReturnValue;    
}

simulated function DoesHaveVulnerableCellsOnSide()
{
    local /*0x97E50000-0x00000000*/ private byte SideType[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter, StartIdx, EndIdx;

    2
    // End:0x3E
    if(int(SideType) == int(1))
    {
        StartIdx = 0;
        EndIdx = NumOfCellsPerSideOfHive - 1;        
    }
    else
    {
        // End:0x7F
        if(int(SideType) == int(0))
        {
            StartIdx = NumOfCellsPerSideOfHive;
            EndIdx = HiveCellStatusList.Length - 1;            
        }
        else
        {
            StartIdx = 0;
            EndIdx = HiveCellStatusList.Length - 1;
        }
    }
    iter = StartIdx;
    J0xB4:

    // End:0x10C [Loop If]
    if(iter <= EndIdx)
    {
        // End:0xFE
        if(int(HiveCellStatusList[iter].HiveCellState) == int(1))
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0xB4;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ExtendVulnerableCellTime()
{
    local /*0x97E50000-0x00000000*/ private float DurationBoost[8388609];
    local /*0x97E50000-0x00000000*/ private byte SideType[9437185];
    local /*0x97E50000-0x00000000*/ private int iter, StartIdx, EndIdx;

    2
    // End:0x3E
    if(int(SideType) == int(1))
    {
        StartIdx = 0;
        EndIdx = NumOfCellsPerSideOfHive - 1;        
    }
    else
    {
        // End:0x7F
        if(int(SideType) == int(0))
        {
            StartIdx = NumOfCellsPerSideOfHive;
            EndIdx = HiveCellStatusList.Length - 1;            
        }
        else
        {
            StartIdx = 0;
            EndIdx = HiveCellStatusList.Length - 1;
        }
    }
    iter = StartIdx;
    J0xB4:

    // End:0x16B [Loop If]
    if(iter <= EndIdx)
    {
        // End:0x15D
        if((int(HiveCellStatusList[iter].HiveCellState) == int(1)) && HiveCellStatusList[iter].TimeToMakeCellProtected > float(0))
        {
            HiveCellStatusList[iter].TimeToMakeCellProtected += DurationBoost;
        }
        ++iter;
        // [Loop Continue]
        goto J0xB4;
    }
    //return;    
}

simulated function FindNextProtectedAndNotClaimedCellFromThisIndex()
{
    local /*0x97E50000-0x00000000*/ private int CellIdxToStartSearchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, cellIdToStopTestingAt, nextValidCell;

    // End:0x43
    if((CellIdxToStartSearchAt < 0) || CellIdxToStartSearchAt > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return -1;
    }
    // End:0x8F
    if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
    {
        cellIdToStopTestingAt = CellIdxToStartSearchAt - 1;
        // End:0x8C
        if(cellIdToStopTestingAt < 0)
        {
            cellIdToStopTestingAt = HiveCellStatusList.Length - 1;
        }        
    }
    else
    {
        cellIdToStopTestingAt = HiveCellStatusList.Length;
    }
    iter = CellIdxToStartSearchAt;
    J0xB6:

    // End:0x18E [Loop If]
    if(iter != cellIdToStopTestingAt)
    {
        // End:0x149
        if((int(HiveCellStatusList[iter].HiveCellState) == int(2)) && !HiveCellStatusList[iter].bCellClaimedForLaunchingDefender)
        {
            nextValidCell = iter;
            return nextValidCell;
        }
        // End:0x180
        if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
        {
            // End:0x180
            if(iter == (HiveCellStatusList.Length - 1))
            {
                iter = -1;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0xB6;
    }
    return -1;
    //return ReturnValue;    
}

simulated function FindNextProtectedCellWithoutSpawnedDefenderInItFromThisIndex()
{
    local /*0x97E50000-0x00000000*/ private int CellIdxToStartSearchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, cellIdToStopTestingAt, nextValidCell;

    // End:0x43
    if((CellIdxToStartSearchAt < 0) || CellIdxToStartSearchAt > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return -1;
    }
    // End:0x8F
    if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
    {
        cellIdToStopTestingAt = CellIdxToStartSearchAt - 1;
        // End:0x8C
        if(cellIdToStopTestingAt < 0)
        {
            cellIdToStopTestingAt = HiveCellStatusList.Length - 1;
        }        
    }
    else
    {
        cellIdToStopTestingAt = HiveCellStatusList.Length;
    }
    iter = CellIdxToStartSearchAt;
    J0xB6:

    // End:0x1BF [Loop If]
    if(iter != cellIdToStopTestingAt)
    {
        // End:0x17A
        if(HiveCellStatusList[iter].DefenderSpawnedInThisCellWaitingForLaunch == none)
        {
            // End:0x17A
            if((int(HiveCellStatusList[iter].HiveCellState) == int(2)) || int(HiveCellStatusList[iter].HiveCellState) == int(1))
            {
                nextValidCell = iter;
                return nextValidCell;
            }
        }
        // End:0x1B1
        if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
        {
            // End:0x1B1
            if(iter == (HiveCellStatusList.Length - 1))
            {
                iter = -1;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0xB6;
    }
    return -1;
    //return ReturnValue;    
}

simulated function FindNextValidForSpawnAndLaunchCellOnSideFromThisIndex()
{
    local /*0x97E50000-0x00000000*/ private bool bLookOnLeftSide[8388609];
    local /*0x97E50000-0x00000000*/ private int CellIdxToStartSearchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], iter, cell2Test, cellIdToStopTestingAt, nextValidCell, numOfCellsPerSide;

    // End:0x43
    if((CellIdxToStartSearchAt < 0) || CellIdxToStartSearchAt > TuneDataCarrier.HiveMaxNumOfCells)
    {
        return -1;
    }
    numOfCellsPerSide = TuneDataCarrier.HiveMaxNumOfCells / 2;
    // End:0x9F
    if(bLookOnLeftSide)
    {
        // End:0x9C
        if(CellIdxToStartSearchAt > (numOfCellsPerSide - 1))
        {
            return -1;
        }        
    }
    else
    {
        // End:0xBC
        if(CellIdxToStartSearchAt < numOfCellsPerSide)
        {
            return -1;
        }
    }
    // End:0x159
    if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
    {
        cellIdToStopTestingAt = CellIdxToStartSearchAt - 1;
        // End:0x114
        if(bLookOnLeftSide)
        {
            // End:0x111
            if(cellIdToStopTestingAt < 0)
            {
                cellIdToStopTestingAt = numOfCellsPerSide - 1;
            }            
        }
        else
        {
            // End:0x156
            if(cellIdToStopTestingAt < numOfCellsPerSide)
            {
                cellIdToStopTestingAt = TuneDataCarrier.HiveMaxNumOfCells - 1;
            }
        }        
    }
    else
    {
        // End:0x17F
        if(bLookOnLeftSide)
        {
            cellIdToStopTestingAt = numOfCellsPerSide - 1;            
        }
        else
        {
            cellIdToStopTestingAt = TuneDataCarrier.HiveMaxNumOfCells - 1;
        }
    }
    cell2Test = CellIdxToStartSearchAt;
    iter = cell2Test;
    J0x1D0:

    // End:0x2FC [Loop If]
    if(iter != cellIdToStopTestingAt)
    {
        // End:0x263
        if((int(HiveCellStatusList[iter].HiveCellState) == int(2)) && !HiveCellStatusList[iter].bCellClaimedForLaunchingDefender)
        {
            nextValidCell = iter;
            return nextValidCell;
        }
        // End:0x2EE
        if(bAllowedToStartBackAtTopAndWorkDownToStartOfSearchInedex)
        {
            // End:0x2A9
            if(bLookOnLeftSide)
            {
                // End:0x2A6
                if(iter == (numOfCellsPerSide - 1))
                {
                    iter = -1;
                }                
            }
            else
            {
                // End:0x2EE
                if(iter == (TuneDataCarrier.HiveMaxNumOfCells - 1))
                {
                    iter = numOfCellsPerSide - 1;
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x1D0;
    }
    return -1;
    //return ReturnValue;    
}

function IsCoreProtectedByShield()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(super(LPAIPawn).IsCoreProtectedByShield(CoreID))
    {
        return true;
    }
    // End:0xD4
    if((HiveCellStatusList.Length > (CoreID - TuneDataCarrier.HiveCellCoreIdStartIdx)) && (CoreID - TuneDataCarrier.HiveCellCoreIdStartIdx) > 0)
    {
        // End:0xD4
        if(int(HiveCellStatusList[CoreID - TuneDataCarrier.HiveCellCoreIdStartIdx].HiveCellState) == int(2))
        {
            return true;
        }
    }
    IsThisCoreNotVulnerableByBehavioralState(CoreID);
    return false;
    //return ReturnValue;    
}

function IsThisCoreNotVulnerableByBehavioralState()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x11
    if(CoreID == 1)
    {
        return true;
    }
    // End:0x84
    if(CoreID == 0)
    {
        iter = 0;
        J0x2B:

        // End:0x84 [Loop If]
        if(iter < HiveCellStatusList.Length)
        {
            // End:0x76
            if(int(HiveCellStatusList[iter].HiveCellState) != int(0))
            {
                return true;
            }
            ++iter;
            // [Loop Continue]
            goto J0x2B;
        }
    }
    return false;
    //return ReturnValue;    
}

function DrawCarrierHiveCellStatus()
{
    //return;    
}

function ShouldZeroOutDamageOnDisabledCore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetDamageAmountAndTypeFromSpline()
{
    local /*0x97E50000-0x00000000*/ private name SplineName[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageAmount[25165825];
    local /*0x97E50000-0x00000000*/ private class TheDamageType[25165825];
    local /*0x97E50000-0x00000000*/ private bool bPreventKnockdown;

    super(LPAIPawn).GetDamageAmountAndTypeFromSpline(SplineName, DamageAmount, TheDamageType);
    // End:0x127
    if(TheDamageType == Class'LPDamageTypeCarrierKnockdownSwipe')
    {
        // End:0xC2
        if((WorldInfo.TimeSeconds - MyCarrierController.LastTimeKnockedPlayerDown) < TuneDataCarrier.MinTimeBetweenWantingToTryAndKnockDownPof.GetValue())
        {
            bPreventKnockdown = true;            
        }
        else
        {
            // End:0x107
            if(RandRange(0.0000000, 100.0000000) < float(TuneDataCarrier.PercentChanceOfKnockingPlayerDownWithSweep))
            {
                bPreventKnockdown = true;
            }
        }
        // End:0x127
        if(bPreventKnockdown)
        {
            TheDamageType = Class'LPDamageTypeCarrierTalonStabPof';
        }
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    // End:0x3A
    if(LPPlayerController(InstigatedBy) == none)
    {
        InDamage = int(float(InDamage) * DamageFactorForNonPlayerInstigatedDamage);
    }
    // End:0xA7
    if(MyCarrierController != none)
    {
        MyCarrierController.HandleIncomingPotentialDamageForCombatStateChange(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    }
    super(LPAIPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

function HaveAccumulatedDamageForSwitchingFromPassiveToAgitatedState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float relativeDamageAmount;

    relativeDamageAmount = GetDamageFromDamageTracker(TuneDataCarrier.TimeIntervalToLookBackForTakingEnoughDamageToGoFromPassiveToAgitated.GetValue(), true);
    // End:0x9E
    if(relativeDamageAmount > float(0))
    {
        // End:0x9E
        if(relativeDamageAmount >= TuneDataCarrier.AmountDamageOverIntervalToGoFromPassiveToAgitated.GetValue())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function @NULL LaunchedPawnCreateParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ThePool, PSComp, partSysFromTuneData, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect;

    Mesh.GetSocketWorldLocationAndRotation(TuneDataCarrier.HiveCellDataForDefenders[CellIdx].EffectSocketNameForDefenderLaunch, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect);
    PSComp = none;
    partSysFromTuneData = TuneDataCarrier.EffectForDefenderLaunchOnCarrierAtCell;
    // End:0x189
    if(partSysFromTuneData != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        PSComp = ThePool.SPSpawnEmitter(partSysFromTuneData, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect, self, self);
        // End:0x159
        if(PSComp != none)
        {
            PSComp.ActivateSystem();
        }
        PSComp.__OnSystemFinished__Delegate = OnLaunchedPawnCreateParticleSystemFinished;
    }
    return;
    //return;    
}

private final simulated function @NULL OnLaunchedPawnCreateParticleSystemFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL FinishedComponent[8388609];

    // End:0x97
    if(FinishedComponent != none)
    {
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(FinishedComponent);
        FinishedComponent.DetachFromAny();
        FinishedComponent.SetActive(false);
        FinishedComponent = none;
    }
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x29
    if(WantsToPlayDieAnim(DamageType))
    {
        PlayDyingSpecialMove(Class'LPSM_CarrierDie');
    }
    //return;    
}

simulated event NotifySurfaceEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL SurfaceAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function TellLaunchedPawnsLauncherIsDown()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(iter < IntendedDefendersLaunched.Length)
    {
        IntendedDefendersLaunched[iter].NotifyLaunchedPawnLauncherIsDown();
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    IntendedDefendersLaunched.Length = 0;
    iter = 0;
    J0x71:

    // End:0xC0 [Loop If]
    if(iter < ArbitraryDefendersLaunched.Length)
    {
        ArbitraryDefendersLaunched[iter].NotifyLaunchedPawnLauncherIsDown();
        ++iter;
        // [Loop Continue]
        goto J0x71;
    }
    ArbitraryDefendersLaunched.Length = 0;
    //return;    
}

simulated function TellLaunchedPawnsYouAreFree()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(iter < IntendedDefendersLaunched.Length)
    {
        IntendedDefendersLaunched[iter].NotifyLaunchedPawnYouAreFree();
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    iter = 0;
    J0x65:

    // End:0xB4 [Loop If]
    if(iter < ArbitraryDefendersLaunched.Length)
    {
        ArbitraryDefendersLaunched[iter].NotifyLaunchedPawnYouAreFree();
        ++iter;
        // [Loop Continue]
        goto J0x65;
    }
    iter = 0;
    J0xBF:

    // End:0x10D [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        HiveCellStatusList[iter].LastDefenderLaunchedFromThisCell = none;
        ++iter;
        // [Loop Continue]
        goto J0xBF;
    }
    //return;    
}

simulated function NotifyLaunchedPawnDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefenderGoingDown[8388609];
    local /*0x97E50000-0x00000000*/ private int indexInListRemovedFrom;

    // End:0xD9
    if((DefenderGoingDown.CellIdLaunchedFrom >= 0) && DefenderGoingDown.CellIdLaunchedFrom < HiveCellStatusList.Length)
    {
        // End:0xD9
        if(HiveCellStatusList[DefenderGoingDown.CellIdLaunchedFrom].LastDefenderLaunchedFromThisCell == DefenderGoingDown)
        {
            HiveCellStatusList[DefenderGoingDown.CellIdLaunchedFrom].LastDefenderLaunchedFromThisCell = none;
        }
    }
    // End:0x11E
    if(DefenderGoingDown.PawnThatLaunchedMe == self)
    {
        indexInListRemovedFrom = TryAndPutDefenderLarvaBackIntoPool(DefenderGoingDown, true);        
    }
    else
    {
        // End:0x163
        if(DefenderGoingDown.bLaunchedIntentionally)
        {
            indexInListRemovedFrom = IntendedDefendersLaunched.RemoveItem(DefenderGoingDown);                        
        }
        else
        {
            indexInListRemovedFrom = ArbitraryDefendersLaunched.RemoveItem(DefenderGoingDown);            
        }
    }
    // End:0x1C6
    if(MyCarrierController != none)
    {
        MyCarrierController.NotifyLaunchedPawnDown(DefenderGoingDown, indexInListRemovedFrom >= 0);
    }
    //return;    
}

function NotifyAnimReadyToLaunchDefenders()
{
    // End:0x2E
    if(MyCarrierController != none)
    {
        MyCarrierController.NotifyAnimReadyToLaunchDefenders();
    }
    //return;    
}

simulated function ForceIntentionalAllPossibleDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];

    // End:0x37
    if(MyCarrierController != none)
    {
        MyCarrierController.ForceIntentionalAllPossibleDefendersLaunch(PawnToLauchAt);
    }
    //return;    
}

simulated function ForceRandomArbitraryDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];

    // End:0x37
    if(MyCarrierController != none)
    {
        MyCarrierController.ForceRandomArbitraryDefendersLaunch(PawnToLauchAt);
    }
    //return;    
}

simulated function KillAllDefendersLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn[8388609];

    // End:0x37
    if(MyCarrierController != none)
    {
        MyCarrierController.KillAllDefendersLaunched(KillerPawn);
    }
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAIPawn).AllowedToProcessTakeDamage())
    {
        return true;
    }
    // End:0x4F
    if(class<LPDamageType>(TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function HandleDestoryedCellBleedBleed()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexOfCellBleeding[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSince, avgFps;
    local /*0x97E50000-0x00000000*/ private @NULL bleedLoc, bleedRot;
    local /*0x97E50000-0x00000000*/ private name socketNameForEffect;
    local /*0x97E50000-0x00000000*/ private @NULL bleedFxEvent, baseOverRide;

    // End:0x3CA
    if(int(HiveCellStatusList[IndexOfCellBleeding].HiveCellState) == int(0))
    {
        TimeSince = WorldInfo.TimeSeconds - HiveCellStatusList[IndexOfCellBleeding].TimeCellWasDestroyed;
        // End:0x3CA
        if((TimeSince < TuneDataCarrier.DurationOfCellDestroyedBleeding.GetValue()) || TuneDataCarrier.DurationOfCellDestroyedBleeding.GetValue() < 0.0000000)
        {
            TimeSince = WorldInfo.TimeSeconds - HiveCellStatusList[IndexOfCellBleeding].TimeOfLastHiveCellBleed;
            // End:0x3CA
            if(TimeSince >= WaitTimeBetweenCellDestroyedBleeds)
            {
                HiveCellStatusList[IndexOfCellBleeding].TimeOfLastHiveCellBleed = WorldInfo.TimeSeconds;
                avgFps = TimeSince / float(HiveCellStatusList[IndexOfCellBleeding].NumOfTicksSinceLastTimeHiveCellBleed);
                HiveCellStatusList[IndexOfCellBleeding].NumOfTicksSinceLastTimeHiveCellBleed = 0;
                GetLocationRotationAndSocketNameForDestoryedEffectForThisCore(IndexOfCellBleeding + TuneDataCarrier.HiveCellCoreIdStartIdx, bleedLoc, bleedRot, socketNameForEffect);
                // End:0x308
                if((DeltaTime < TuneDataCarrier.MaxUpdateDeltaToAllowHighResCellDestroyedBleed.GetValue()) && avgFps < TuneDataCarrier.MaxUpdateDeltaToAllowHighResCellDestroyedBleed.GetValue())
                {
                    bleedFxEvent = FindBleedEvent(HighResDestroyedCellBleedEffectName);                    
                }
                else
                {
                    bleedFxEvent = FindBleedEvent(LowResDestroyedCellBleedEffectName);
                }
                // End:0x3CA
                if(bleedFxEvent != none)
                {
                    baseOverRide = none;
                    bleedFxEvent.EventFXSocketName = socketNameForEffect;
                    bleedFxEvent.PlayEventFXAtLoc(bleedLoc, bleedRot, self, Mesh, TuneDataPawnFXEventBindings.GetTuneDataEvents(), baseOverRide);
                }
            }
        }
    }
    //return;    
}

simulated function PlayGrenadeInInternalGrenadeExplosionEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenExplosionLoc, grenExplosionRot;

    // End:0x7A
    if(CurrentCoreGrenadeExplodingAttachedTo == 1)
    {
        TuneDataPawnFXEventBindings.PlayEventFX('GrenadeInMouthExplosion', self, Mesh, none);
        TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GrenadeExplosionInMouth', 'None', self, none, none);        
    }
    else
    {
        // End:0x133
        if((CurrentCoreGrenadeExplodingAttachedTo >= 2) && CurrentCoreGrenadeExplodingAttachedTo <= 19)
        {
            GetLocationAndRotationForExplosionForGrenadeStuckToThisCore(CurrentCoreGrenadeExplodingAttachedTo, grenExplosionLoc, grenExplosionRot);
            TuneDataPawnFXEventBindings.PlayEventFXAtLoc('GrenadeInHiveExplosion', grenExplosionLoc, grenExplosionRot, self, none, none);
            TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GrenadeInHiveExplosion', 'None', self, none, none);
        }
    }
    //return;    
}

simulated function ProcessInternalGrenadeExplosionForDamageOnThisCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CoreLocation[25296897];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage, minHealthThatInternalGrenadeExplosionCanNotTakeLessThen;
    local /*0x97E50000-0x00000000*/ private @NULL curCoreDestroying;
    local /*0x97E50000-0x00000000*/ private int numOfCellsToDestoryUp, numOfCellsToDestoryDown, iter;

    // End:0x39C
    if(GrenExploding != none)
    {
        // End:0x124
        if(CoreAttachedTo == 1)
        {
            AmountOfDamage = RandRange(TuneDataCarrier.MinDamageForInternalGrenadeExplosionInMouth.GetValue(), TuneDataCarrier.MaxDamageForInternalGrenadeExplosionInMouth.GetValue());
            minHealthThatInternalGrenadeExplosionCanNotTakeLessThen = TuneDataCarrier.minHealthThatInternalGrenadeExplosionCanNotTakeLessThen.GetValue();
            // End:0x121
            if((float(Health) - AmountOfDamage) > minHealthThatInternalGrenadeExplosionCanNotTakeLessThen)
            {
                Health = int(float(Health) - AmountOfDamage);                
            }            
        }
        else
        {
            // End:0x39C
            if((CoreAttachedTo >= 2) && CoreAttachedTo <= 19)
            {
                curCoreDestroying = new Class'LPPhysMatPropTag_CarrierCoreId';
                curCoreDestroying.CoreID = byte(CoreAttachedTo);
                CoreDestroyed(curCoreDestroying, CoreAttachedTo, true);
                numOfCellsToDestoryUp = int(TuneDataCarrier.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell.GetValue() / float(2));
                numOfCellsToDestoryDown = numOfCellsToDestoryUp;
                // End:0x24B
                if((TuneDataCarrier.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell.GetValue() % float(2)) != float(0))
                {
                    ++numOfCellsToDestoryDown;
                }
                iter = 0;
                J0x256:

                // End:0x2EE [Loop If]
                if(iter < numOfCellsToDestoryUp)
                {
                    // End:0x2E0
                    if(((CoreAttachedTo + iter) + 1) <= 19)
                    {
                        curCoreDestroying.CoreID = byte((CoreAttachedTo + iter) + 1);
                        CoreDestroyed(curCoreDestroying, CoreAttachedTo, true);
                    }
                    ++iter;
                    // [Loop Continue]
                    goto J0x256;
                }
                iter = 0;
                J0x2F9:

                // End:0x391 [Loop If]
                if(iter < numOfCellsToDestoryDown)
                {
                    // End:0x383
                    if(((CoreAttachedTo - iter) - 1) >= 2)
                    {
                        curCoreDestroying.CoreID = byte((CoreAttachedTo - iter) - 1);
                        CoreDestroyed(curCoreDestroying, CoreAttachedTo, true);
                    }
                    ++iter;
                    // [Loop Continue]
                    goto J0x2F9;
                }
                curCoreDestroying = none;
            }
        }
    }
    //return;    
}

simulated function HandleInternalGrenadeCoreExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    // End:0x29
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
    }
    //return;    
}

simulated function AttachedGrenadeJustExploded()
{
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    super(LPAIPawnAkrid).AttachedGrenadeJustExploded(CoreAttachedTo);
    //return;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawnAkrid).NotifyOfGrenadeGettingStuckTo(GrenGettingStuck, ComponentGrenOn, HitNormal, PhysMat);
    //return ReturnValue;    
}

simulated function GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMatToTest[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
    local /*0x97E50000-0x00000000*/ private int coreIdOn, iter;

    // End:0x140
    if(PhysMatToTest != none)
    {
        hitCoreTag = LPPhysMatPropTag_CoreId(PhysMatToTest.GetTag(Class'LPPhysMatPropTag_CoreId'));
        coreIdOn = hitCoreTag.GetCoreId();
        iter = 0;
        J0x7E:

        // End:0x140 [Loop If]
        if(iter < TuneDataCarrier.BoneAttachPointByCore.Length)
        {
            // End:0x132
            if(int(TuneDataCarrier.BoneAttachPointByCore[iter].CoreID) == coreIdOn)
            {
                return TuneDataCarrier.BoneAttachPointByCore[iter].BoneName;
            }
            ++iter;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    //return ReturnValue;    
}

simulated function IsThisCoreAStickGrenadeToCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x93 [Loop If]
    if(iter < TuneDataCarrier.BoneAttachPointByCore.Length)
    {
        // End:0x85
        if(int(TuneDataCarrier.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function GetLocationForExplosionForGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xED [Loop If]
    if(iter < TuneDataCarrier.BoneAttachPointByCore.Length)
    {
        // End:0xDF
        if(int(TuneDataCarrier.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            return Mesh.GetBoneLocation(TuneDataCarrier.BoneAttachPointByCore[iter].BoneName);
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return Location;
    //return ReturnValue;    
}

simulated function GetLocationAndRotationForExplosionForGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outExploLoc[25165825], outExploRot;
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x167 [Loop If]
    if(iter < TuneDataCarrier.BoneAttachPointByCore.Length)
    {
        // End:0x159
        if(int(TuneDataCarrier.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            outExploLoc = Mesh.GetBoneLocation(TuneDataCarrier.BoneAttachPointByCore[iter].BoneName);
            outExploRot = QuatToRotator(Mesh.GetBoneQuaternion(TuneDataCarrier.BoneAttachPointByCore[iter].BoneName));
            return;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function GetLocationAndRotationForDestoryedEffectForThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outExploLoc[25165825], outExploRot;
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x100 [Loop If]
    if(iter < TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore.Length)
    {
        // End:0xF2
        if(int(TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore[iter].CoreID) == CoreIdToTest)
        {
            Mesh.GetSocketWorldLocationAndRotation(TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore[iter].BoneName, outExploLoc, outExploRot);
            return;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function GetLocationRotationAndSocketNameForDestoryedEffectForThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outExploLoc[25165825], outExploRot;
    local /*0x97E50000-0x00000000*/ private name SocketNameToPlayAt[25165825];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x145 [Loop If]
    if(iter < TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore.Length)
    {
        // End:0x137
        if(int(TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore[iter].CoreID) == CoreIdToTest)
        {
            Mesh.GetSocketWorldLocationAndRotation(TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore[iter].BoneName, outExploLoc, outExploRot);
            SocketNameToPlayAt = TuneDataCarrier.CoreDestoryedEffectSocketToAttachByCore[iter].BoneName;
            return;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    UpdateAllHiveCellStatuses(DeltaTime);
    UpdateDefenderPool(DeltaTime);
    //return;    
}

function GetIKAssistSocketFromCoreID()
{
    local /*0x97E50000-0x00000000*/ private int InCoreID[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(InCoreID);
    // End:0x6A
    if(CoreIndex >= 0)
    {
        return TuneDataCarrier.CoreInfo[CoreIndex].IKDrillTargetSocket;
    }
    return 'None';
    //return ReturnValue;    
}

defaultproperties
{
    HighResDestroyedCellBleedEffectName="BleedFromDestroyedCellHighRes"
    LowResDestroyedCellBleedEffectName="BleedFromDestroyedCellLowRes"
    // Reference: LPActorFactoryAI'Default__LPAIPawnCarrier.DefaultActorFactory'
    begin object name=DefaultActorFactory class=Class'LPActorFactoryAI'
    end object
    DefenderFactoryAI=DefaultActorFactory
    // Reference: LPSeqAct_ActorFactory'Default__LPAIPawnCarrier.DefenderFactoryDataD0'
    begin object name=DefenderFactoryDataD0 class=Class'LPSeqAct_ActorFactory'
    end object
    DefenderFactoryData=DefenderFactoryDataD0
    HealthRegenInfo=(bHealthRegenEnabled=true)
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnCarrier.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bFlushSMLogEachLine=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnCarrier.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnCarrier.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnCarrier.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnCarrier.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnCarrier.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnCarrier.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnCarrier.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnCarrier.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnCarrier.FaceAudioComponent'
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
    Components[9]=FXActionManagerDefObj0
    // Reference: SPDamageStateComponent'Default__LPAIPawnCarrier.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    bCheckAIMeshWhenMoving=true
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnCarrier.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}