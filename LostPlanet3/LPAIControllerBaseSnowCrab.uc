class LPAIControllerBaseSnowCrab extends LPAIControllerAkridLarge
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum CrabCombatBehaviorType
{
    CrabCombatBehavior_None,        // 0
    CrabCombatBehavior_CloseQuatersBattle,// 1
    CrabCombatBehavior_BlitzAttack, // 2
    CrabCombatBehavior_WithdrawForMassiveAttack,// 3
    CrabCombatBehavior_TauntAttack, // 4
    CrabCombatBehavior_FrenzyAttack,// 5
    CrabCombatBehavior_GroundPound, // 6
    CrabCombatBehavior_SwipeAttack, // 7
    CrabCombatBehavior_RetreatToMeleePoint,// 8
    CrabCombatBehavior_MAX          // 9
};

enum eCrabTauntType
{
    eCrabTauntType_None,            // 0
    eCrabTauntType_LossOfLeftClaw,  // 1
    eCrabTauntType_LossOfRightClaw, // 2
    eCrabTauntType_LongTauntAttack, // 3
    eCrabTauntType_ShortTauntAttack,// 4
    eCrabTauntType_MAX              // 5
};

struct native PincerBashData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PincerBashACosHorizAngRange;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TauntPincerBashACosHorizAngRange;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextPincerBash;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextHastyPincerBash;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingPincerBash;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DyanmicPincherBashStretchRange;

    structdefaultproperties
    {
        PincerBashACosHorizAngRange=0.0000000
        TauntPincerBashACosHorizAngRange=0.0000000
        TimeForNextPincerBash=0.0000000
        TimeForNextHastyPincerBash=0.0000000
        bPerformingPincerBash=false
        DyanmicPincherBashStretchRange=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrabPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PincerBashInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_ChargeAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTauntState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastCombatBehaviorFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastCombatBehaviorAttempted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentCombatBehaviorAttempting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowVsDynamaicAvoidZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruckVsWithClawWhileVsWasBlocking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoOnlyForcedDirectAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepVsCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontVecAngleMinForFrontBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontVecAngleMaxForFrontBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontVecAngleMinForBackBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontVecAngleMaxForBackBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SideVecAngleMinForRightBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SideVecAngleMaxForRightBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SideVecAngleMinForLeftBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SideVecAngleMaxForLeftBumpHitCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GroundPoundACosHorizAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SwipeAttackACosHorizAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextPossibleGroundPoundAttackTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextPossibleSwipeAttackTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DongoChargeAttackACosHorizAngToLookForAdditionalEnemies[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfFirstAttackOnEnemy[536870913];

// Export ULPAIControllerBaseSnowCrab::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function SetAttackResourceNames()
{
    MeleeResourceName = 'IceCrabMelee';
    StrikeResourceName = 'strike';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    CrabPawn = LPAIPawnBaseSnowCrab(inPawn);
    SetTimeForNextHastyPincerBash();
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(CrabPawn.TuneDataIceCrab.PincerBashHorizAngRangeInDegrees.GetValue(), PincerBashInfo.PincerBashACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(CrabPawn.TuneDataIceCrab.TauntPincerBashHorizAngRangeInDegrees.GetValue(), PincerBashInfo.TauntPincerBashACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(CrabPawn.TuneDataIceCrab.AngleToSideStepVsDuringNormalMovement_Tunable.GetValue(), AngleToSideStepVsCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.FrontVecAngleMinForFrontBumpHitInDegrees_Tunable.GetValue(), FrontVecAngleMinForFrontBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.FrontVecAngleMaxForFrontBumpHitInDegrees_Tunable.GetValue(), FrontVecAngleMaxForFrontBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.FrontVecAngleMinForBackBumpHitInDegrees_Tunable.GetValue(), FrontVecAngleMinForBackBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.FrontVecAngleMaxForBackBumpHitInDegrees_Tunable.GetValue(), FrontVecAngleMaxForBackBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.SideVecAngleMinForRightBumpHitInDegrees_Tunable.GetValue(), SideVecAngleMinForRightBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.SideVecAngleMaxForRightBumpHitInDegrees_Tunable.GetValue(), SideVecAngleMaxForRightBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.SideVecAngleMinForLeftBumpHitInDegrees_Tunable.GetValue(), SideVecAngleMinForLeftBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.SideVecAngleMaxForLeftBumpHitInDegrees_Tunable.GetValue(), SideVecAngleMaxForLeftBumpHitCosAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.GroundPoundHorizAngRangeInDegrees.GetValue(), GroundPoundACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.SwipeAttackHorizAngRangeInDegrees.GetValue(), SwipeAttackACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetCosAngRange(CrabPawn.TuneDataIceCrab.DongoChargeAttackAngleToLookForAdditionalEnemies.GetValue(), DongoChargeAttackACosHorizAngToLookForAdditionalEnemies);
    bStruckVsWithClawWhileVsWasBlocking = false;
    LastCombatBehaviorFinished = 0;
    LastCombatBehaviorAttempted = 0;
    CurrentCombatBehaviorAttempting = 0;
    CmdStatus_ChargeAttack = new (self) Class'LPAICmdStatus_ChargeAttack';
    bNeedsToPerformGettingGrenadeInTheMouthAction = false;
    CmdStatus_ChargeAttack.SetDefaults();
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825], AttRecord;

    // End:0xC3
    if(CrabPawn.CapShell != none)
    {
        AttRecord.ClassName = PathName(CrabPawn.CapShell.Class);
        AttRecord.PathName = PathName(CrabPawn.CapShell);
    }
    Record.LPAICRecord.SPAIRecord.AttachmentArray.AddItem(AttRecord);    
    super(LPAIController).CreateCheckpointRecord(Record);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private class CapClass;
    local /*0x97E50000-0x00000000*/ private @NULL FoundCap;

    super(LPAIController).ApplyCheckpointRecord(Record);
    CrabPawn = LPAIPawnBaseSnowCrab(Pawn);
    I = 0;
    J0x3A:

    // End:0x2F8 [Loop If]
    if(I < Record.LPAICRecord.SPAIRecord.AttachmentArray.Length)
    {
        // End:0x176
        if(Record.LPAICRecord.SPAIRecord.AttachmentArray[I].ClassName != "")
        {
            CapClass = class<Pawn>(FindObject(Record.LPAICRecord.SPAIRecord.AttachmentArray[I].ClassName, Class'Core.Class'));
        }
        // End:0x188
        if(CapClass != none)
        {            
        }
        else
        {
            // End:0x2EA
            if(Record.LPAICRecord.SPAIRecord.AttachmentArray[I].PathName != "")
            {
                FoundCap = LPCrabShellCap(FindObject(Record.LPAICRecord.SPAIRecord.AttachmentArray[I].PathName, Class'LPCrabShellCap'));
                // End:0x2EA
                if(FoundCap != none)
                {
                    // End:0x2E7
                    if(FoundCap.AttachToPawn(CrabPawn, 'JO_iceShell', 'CapShell'))
                    {
                        CrabPawn.CapShell = FoundCap;
                    }
                    // [Explicit Break]
                    goto J0x2F8;
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x3A;
    }
    J0x2F8:

    //return;    
}

function SetTimeOfFirstAttackOnEnemy()
{
    // End:0x39
    if(TimeOfFirstAttackOnEnemy < float(0))
    {
        TimeOfFirstAttackOnEnemy = WorldInfo.TimeSeconds;
    }
    //return;    
}

function ResetTimeOfFirstAttackOnEnemy()
{
    TimeOfFirstAttackOnEnemy = -99999.0000000;
    //return;    
}

function HaveBeenAttackingForTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TimeNow, AttackingForTime;

    // End:0x16
    if(TimeOfFirstAttackOnEnemy < float(0))
    {
        return false;        
    }
    else
    {
        TimeNow = WorldInfo.TimeSeconds;
        AttackingForTime = TimeNow - TimeOfFirstAttackOnEnemy;
        return AttackingForTime >= inTime;
    }
    //return ReturnValue;    
}

function PawnDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    CmdStatus_ChargeAttack.CloseDodgeWindow();
    super(SPGFCoverAIController).PawnDied(inPawn);
    //return;    
}

function MeleePofInFinished()
{
    //return;    
}

function MeleePofHoldFinished()
{
    //return;    
}

function MeleePofEndFinished()
{
    //return;    
}

function MeleeVsFinished()
{
    //return;    
}

final simulated function EnableMouthGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(CrabPawn != none)
    {
        CrabPawn.super(LPAIControllerBaseSnowCrab).EnableMouthGlow(bEnable);
    }
    //return;    
}

function @NULL IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos[8388609], EnemyForCheck;
    local /*0x97E50000-0x00000000*/ private float MyEnemyRadius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;

    BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
    // End:0x1A4
    if((BotHandle != none) && !BotHandle.PathFinder_IsLocationInNavMesh(DesiredPos))
    {
        DesiredPos.Z = (EnemyForCheck.Location.Z - EnemyForCheck.CylinderComponent.CollisionHeight) + myAIPawn.CylinderComponent.CollisionHeight;
        ReachDistance = MyKynapseRadius + MyEnemyRadius;
        // End:0x1A4
        if(!BotHandle.PathFinder_CanReach(DesiredPos, ReachDistance, myAIPawn.MaxStepHeight, 1.0000000))
        {
            return true;            
        }
    }
    return false;
    //return ReturnValue;    
}

event DelegateCrabMovingToEngageEnemyAvoidance()
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

function @NULL TouchedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0xB9
    if(CrabPawn.TuneDataIceCrab.bAllowMovementHitOnTouch)
    {
        // End:0x8B
        if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller != none)
        {
            return;
        }
        RanIntoActorWhileMoving(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

function @NULL BumpedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0xBD
    if(CrabPawn.TuneDataIceCrab.bAllowMovementHitOnBump)
    {
        // End:0x8B
        if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller != none)
        {
            return;
        }
        RanIntoActorWhileMoving(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
    }
    //return;    
}

function GetDamageDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, pofPawn;

    vsPawn = LPBaseVSPlayerPawn(Other);
    // End:0x75
    if(vsPawn != none)
    {
        return CrabPawn.TuneDataIceCrab.DamageToVsFromMovementHit.GetValue();
    }
    pofPawn = LPPlayerPawn(Other);
    // End:0xEA
    if(pofPawn != none)
    {
        return CrabPawn.TuneDataIceCrab.DamageToHumanFromMovementHit.GetValue();
    }
    return CrabPawn.TuneDataIceCrab.DamageToOtherFromMovementHit.GetValue();
    //return ReturnValue;    
}

function HandlePossibleNeedToPushAwayPawnWhileNotMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsToTest;
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTarget;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;
    local /*0x97E50000-0x00000000*/ private @NULL sideVec, crabFacing;
    local /*0x97E50000-0x00000000*/ private float dotToTarget, rateToPlayAnim;

    // End:0x2B6
    foreach WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsToTest, CrabPawn.Location, CrabPawn.TuneDataIceCrab.ClawPushMaxRangeOnDamageConcern_Tunable.GetValue())
    {
        bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRightAndGetRightVec(CrabPawn, vsToTest, sideVec);
        // End:0x2B5
        if((bTargetOnRight && CrabPawn.IsClawRightAbleToBeUsedForSlapAside()) || !bTargetOnRight && CrabPawn.IsClawLeftAbleToBeUsedForSlapAside())
        {
            displacementToTarget = vsToTest.Location - CrabPawn.Location;
            DistanceToTarget = VSize2D(displacementToTarget);
            // End:0x2B5
            if(DistanceToTarget < (GetClawPushMaxRangeToTargetToAllowPush(bTargetOnRight)))
            {
                crabFacing = Vector(CrabPawn.Rotation);
                displacementToTarget = Normal(displacementToTarget);
                dotToTarget = crabFacing Dot displacementToTarget;
                // End:0x2B5
                if(dotToTarget > CrabPawn.TuneDataIceCrab.ClawPushBackAngleToBeOutsideForClawSlap_Tunable.GetValue())
                {
                    rateToPlayAnim = GetRateToPlaySmackVsAnim();
                    StartAdditiveClawSlapAnimation(bTargetOnRight, rateToPlayAnim);                    
                    return true;
                }
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

function @NULL HandleRunIntoAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTarget, crabFacing;
    local /*0x97E50000-0x00000000*/ private float dotToTarget, rateToPlayAnim;

    // End:0x297
    if(Other.IsA('LPBaseVSPlayerPawn'))
    {
        bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRight(CrabPawn, Other);
        // End:0x297
        if((bTargetOnRight && CrabPawn.IsClawRightAbleToBeUsedForSlapAside()) || !bTargetOnRight && CrabPawn.IsClawLeftAbleToBeUsedForSlapAside())
        {
            displacementToTarget = Other.Location - CrabPawn.Location;
            DistanceToTarget = VSize2D(displacementToTarget);
            // End:0x297
            if(DistanceToTarget < (GetClawPushMaxRangeToTargetToAllowPush(bTargetOnRight)))
            {
                // End:0x297
                if((bTargetOnRight && CrabPawn.IsClawRightAbleToBeUsedForSlapAside()) || !bTargetOnRight && CrabPawn.IsClawLeftAbleToBeUsedForSlapAside())
                {
                    crabFacing = Vector(CrabPawn.Rotation);
                    displacementToTarget = Normal(displacementToTarget);
                    dotToTarget = crabFacing Dot displacementToTarget;
                    // End:0x297
                    if(dotToTarget > CrabPawn.TuneDataIceCrab.ClawPushBackAngleToBeOutsideForClawSlap_Tunable.GetValue())
                    {
                        rateToPlayAnim = GetRateToPlaySmackVsAnim();
                        StartAdditiveClawSlapAnimation(bTargetOnRight, rateToPlayAnim);
                    }
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function GetRateToPlaySmackVsAnim()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x32
    if(VSize(CrabPawn.Velocity) > float(800))
    {
        return 2.0000000;
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function AdditiveClawSlapAnimationFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL animSeqTemplateToMatch;
    local /*0x97E50000-0x00000000*/ private bool bendingRightSlap;

    animSeqTemplateToMatch = CrabPawn.AnimTemplateLogic_ClawSlapRight.GetBestSequenceTemplate(self);
    bendingRightSlap = false;
    // End:0x98
    if(animSeqTemplateToMatch.AnimSeqName == Node.AnimSeqName)
    {
        bendingRightSlap = true;
    }
    // End:0x10D
    if(bendingRightSlap)
    {
        CrabPawn.ClawRightResetAfterSlapAside();
        // End:0x10A
        if(!CrabPawn.DoesClawLeftNeedLineSweepTesting())
        {
            CrabPawn.EnableLineSweepHitTester(false);
        }        
    }
    else
    {
        CrabPawn.ClawLeftResetAfterSlapAside();
        // End:0x172
        if(!CrabPawn.DoesClawRightNeedLineSweepTesting())
        {
            CrabPawn.EnableLineSweepHitTester(false);
        }
    }
    //return;    
}

simulated function StartAdditiveClawSlapAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bSmackOnRight[8388609];
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate, SeqNode;

    // End:0x6E
    if(bSmackOnRight)
    {
        CrabPawn.ClawRightSetToUsingForSlapAside();
        AnimSeqTemplate = CrabPawn.AnimTemplateLogic_ClawSlapRight.GetBestSequenceTemplate(self);        
    }
    else
    {
        CrabPawn.ClawLeftSetToUsingForSlapAside();
        AnimSeqTemplate = CrabPawn.AnimTemplateLogic_ClawSlapLeft.GetBestSequenceTemplate(self);
    }
    CrabPawn.EnableLineSweepHitTester(true);
    SeqNode = CrabPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, AdditiveClawSlapAnimationFinishedCB, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    // End:0x176
    if(SeqNode != none)
    {
        SeqNode.SetIssueAnimFinishedCallbackOnInterruption(true);
    }
    //return;    
}

simulated function StartAdditiveMouthBulletHitAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = CrabPawn.AnimTemplateLogic_BulletInMouthHitReaction.GetBestSequenceTemplate(self);
    CrabPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

function ApplyPushAwaySlapDamageToEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], hitPush, PawnToTest;
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private @NULL sideVec;

    PawnToTest = LPPawn(Info.Impact.HitActor);
    // End:0x39A
    if(PawnToTest != none)
    {
        // End:0x39A
        if(PawnToTest.IsA('LPBaseVSPlayerPawn'))
        {
            // End:0xAD
            if(Info.SplineName == 'CrabRightClawPush')
            {
                bTargetOnRight = true;                
            }
            else
            {
                // End:0xE3
                if(Info.SplineName == 'CrabLeftClawPush')
                {
                    bTargetOnRight = false;
                }
            }
            bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRightAndGetRightVec(CrabPawn, PawnToTest, sideVec);
            hitPush = ((bTargetOnRight) ? sideVec : -sideVec);
            // End:0x1F2
            if(bTargetOnRight)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabPushVsWithRightClaw', CrabPawn, CrabPawn.Mesh, none);
                CrabPawn.PlayVsClawPushBlurEffects('RightElbow');                
            }
            else
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabPushVsWithLeftClaw', CrabPawn, CrabPawn.Mesh, none);
                CrabPawn.PlayVsClawPushBlurEffects('LeftElbow');
            }
            hitPush.Z = 0.0000000;
            hitPush = (hitPush * (GetClawPushVelocityToPushTarget(bTargetOnRight, PawnToTest))) * myAIPawn.Mass;
            PawnToTest.TakeDamage(int(GetDamageDoneToRanIntoActor(PawnToTest)), self, PawnToTest.Location, hitPush, GetDamageTypeDoneToRanIntoActor(PawnToTest), Info.Impact.HitInfo, myAIPawn);
        }
    }
    //return;    
}

function AdjustHitPushForUnoccupiedVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609], hitPush, vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private @NULL sideVec;

    vsPawn = LPBaseVSPlayerPawn(PawnToTest);
    // End:0x137
    if((vsPawn != none) && vsPawn.Controller == none)
    {
        bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRightAndGetRightVec(CrabPawn, PawnToTest, sideVec);
        hitPush = ((bTargetOnRight) ? sideVec : -sideVec);
        hitPush.Z = 0.0000000;
        hitPush = (hitPush * (GetClawPushVelocityToPushTarget(bTargetOnRight, PawnToTest))) * myAIPawn.Mass;
    }
    //return;    
}

simulated function GetChargeStrikeHitDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x130
    if(vsPawn != none)
    {
        // End:0xE6
        if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return CrabPawn.TuneDataIceCrab.ChargeHitDamageVS.GetValue();            
        }
        else
        {
            return CrabPawn.TuneDataIceCrab.ChargeHitDamageShutdownVS.GetValue();
        }
    }
    return CrabPawn.TuneDataIceCrab.ChargeHitDamagePoF.GetValue();
    //return ReturnValue;    
}

function GetChargeBrushDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x130
    if(vsPawn != none)
    {
        // End:0xE6
        if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return CrabPawn.TuneDataIceCrab.ChargeBrushDamageVs.GetValue();            
        }
        else
        {
            return CrabPawn.TuneDataIceCrab.ChargeBrushDamageShutdownVs.GetValue();
        }
    }
    return CrabPawn.TuneDataIceCrab.ChargeBrushDamagePoF.GetValue();
    //return ReturnValue;    
}

simulated function PlayCorrectEffectsForChargeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTarget, sideVec, crabFacing;
    local /*0x97E50000-0x00000000*/ private float dotToTarget;
    local /*0x97E50000-0x00000000*/ private bool bhittingVs;

    bhittingVs = false;
    // End:0x30
    if(LPBaseVSPlayerPawn(PawnToTest) != none)
    {
        bhittingVs = true;
    }
    bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRightAndGetRightVec(CrabPawn, PawnToTest, sideVec);
    displacementToTarget = PawnToTest.Location - CrabPawn.Location;
    displacementToTarget = Normal(displacementToTarget);
    crabFacing = Vector(CrabPawn.Rotation);
    dotToTarget = crabFacing Dot displacementToTarget;
    // End:0x1CA
    if(dotToTarget > 0.9000000)
    {
        // End:0x19F
        if(bhittingVs)
        {
            CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabChargeHitVsFrontCenter', CrabPawn, CrabPawn.Mesh, none);
        }
        CrabPawn.PlayChargeClawHitBlurEffects('RightMiniArm');        
    }
    else
    {
        // End:0x274
        if(bTargetOnRight)
        {
            // End:0x249
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabChargeHitVsFrontRight', CrabPawn, CrabPawn.Mesh, none);
            }
            CrabPawn.PlayChargeClawHitBlurEffects('RightElbow');            
        }
        else
        {
            // End:0x2E6
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabChargeHitVsFrontLeft', CrabPawn, CrabPawn.Mesh, none);
            }
            CrabPawn.PlayChargeClawHitBlurEffects('LeftElbow');
        }
    }
    //return;    
}

simulated function PlayCorrectEffectsForMoveHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609], displacementToTarget, sideVec, crabFacing;
    local /*0x97E50000-0x00000000*/ private float fdotToTarget, sdotToTarget;
    local /*0x97E50000-0x00000000*/ private bool bhittingVs;

    // End:0x4AC
    if(CrabPawn.TuneDataIceCrab.bAllowMovementHitOnBumpEffects)
    {
        bhittingVs = false;
        // End:0x67
        if(LPBaseVSPlayerPawn(PawnToTest) != none)
        {
            bhittingVs = true;
        }
        sideVec = Class'SPEngine.SPUtil'.static.GetRightVector(CrabPawn);
        displacementToTarget = PawnToTest.Location - CrabPawn.Location;
        displacementToTarget = Normal(displacementToTarget);
        crabFacing = Vector(CrabPawn.Rotation);
        fdotToTarget = crabFacing Dot displacementToTarget;
        sdotToTarget = sideVec Dot displacementToTarget;
        // End:0x230
        if((((fdotToTarget < FrontVecAngleMinForFrontBumpHitCosAngRange) && fdotToTarget > FrontVecAngleMaxForFrontBumpHitCosAngRange) && sdotToTarget < SideVecAngleMinForRightBumpHitCosAngRange) && sdotToTarget > SideVecAngleMaxForRightBumpHitCosAngRange)
        {
            // End:0x230
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabBumpFrontRight', CrabPawn, CrabPawn.Mesh, none);
            }
        }
        // End:0x304
        if((((fdotToTarget < FrontVecAngleMinForFrontBumpHitCosAngRange) && fdotToTarget > FrontVecAngleMaxForFrontBumpHitCosAngRange) && sdotToTarget < SideVecAngleMinForLeftBumpHitCosAngRange) && sdotToTarget > SideVecAngleMaxForLeftBumpHitCosAngRange)
        {
            // End:0x304
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabBumpFrontLeft', CrabPawn, CrabPawn.Mesh, none);
            }
        }
        // End:0x3D8
        if((((fdotToTarget < FrontVecAngleMinForBackBumpHitCosAngRange) && fdotToTarget > FrontVecAngleMaxForBackBumpHitCosAngRange) && sdotToTarget < SideVecAngleMinForLeftBumpHitCosAngRange) && sdotToTarget > SideVecAngleMaxForLeftBumpHitCosAngRange)
        {
            // End:0x3D8
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabBumpBackLeft', CrabPawn, CrabPawn.Mesh, none);
            }
        }
        // End:0x4AC
        if((((fdotToTarget < FrontVecAngleMinForBackBumpHitCosAngRange) && fdotToTarget > FrontVecAngleMaxForBackBumpHitCosAngRange) && sdotToTarget < SideVecAngleMinForRightBumpHitCosAngRange) && sdotToTarget > SideVecAngleMaxForRightBumpHitCosAngRange)
        {
            // End:0x4AC
            if(bhittingVs)
            {
                CrabPawn.TuneDataPawnFXEventBindings.PlayEventFX('CrabBumpBackRight', CrabPawn, CrabPawn.Mesh, none);
            }
        }
    }
    //return;    
}

function GetClawPushMaxRangeToTargetToAllowPush()
{
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private bool bStillHasClaw;

    // End:0x3A
    if(bTargetOnRight)
    {
        bStillHasClaw = CrabPawn.IsClawRightAbleToAttack();        
    }
    else
    {
        bStillHasClaw = CrabPawn.IsClawLeftAbleToAttack();
    }
    // End:0xBB
    if(bStillHasClaw)
    {
        return CrabPawn.TuneDataIceCrab.ClawPushWithClawMaxRangeToTargetToThenPushTarget_Tunable.GetValue();
    }
    return CrabPawn.TuneDataIceCrab.ClawPushWithOutClawMaxRangeToTargetToThenPushTarget_Tunable.GetValue();
    //return ReturnValue;    
}

function GetClawPushVelocityToPushTarget()
{
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bStillHasClaw;

    // End:0x3C
    if(bTargetOnRight)
    {
        bStillHasClaw = !CrabPawn.IsClawRightDismembered();        
    }
    else
    {
        bStillHasClaw = !CrabPawn.IsClawLeftDismembered();
    }
    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x1EF
    if(bStillHasClaw)
    {
        // End:0x1A5
        if(vsPawn != none)
        {
            // End:0x15B
            if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
            {
                return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushVsWithClaw_Tunable.GetValue();                
            }
            else
            {
                return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushShutdownVsWithClaw_Tunable.GetValue();
            }
        }
        return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushTargetWithClaw_Tunable.GetValue();
    }
    // End:0x303
    if(vsPawn != none)
    {
        // End:0x2B9
        if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushVsWithOutClaw_Tunable.GetValue();            
        }
        else
        {
            return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushShutdownVsWithOutClaw_Tunable.GetValue();
        }
    }
    return CrabPawn.TuneDataIceCrab.ClawPushVelocityToPushTargetWithOutClaw_Tunable.GetValue();
    //return ReturnValue;    
}

function GetClawPushDamage()
{
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bStillHasClaw;

    // End:0x3A
    if(bTargetOnRight)
    {
        bStillHasClaw = CrabPawn.IsClawRightAbleToAttack();        
    }
    else
    {
        bStillHasClaw = CrabPawn.IsClawLeftAbleToAttack();
    }
    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x1EB
    if(bStillHasClaw)
    {
        // End:0x1A1
        if(vsPawn != none)
        {
            // End:0x157
            if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
            {
                return CrabPawn.TuneDataIceCrab.ClawPushDamageWithClawOnVs.GetValue();                
            }
            else
            {
                return CrabPawn.TuneDataIceCrab.ClawPushDamageWithClawOnShutdownVs.GetValue();
            }
        }
        return CrabPawn.TuneDataIceCrab.ClawPushDamageWithClaw.GetValue();
    }
    // End:0x2FF
    if(vsPawn != none)
    {
        // End:0x2B5
        if(float(vsPawn.Health) >= CrabPawn.TuneDataIceCrab.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return CrabPawn.TuneDataIceCrab.ClawPushDamageWithOutClawOnVs.GetValue();            
        }
        else
        {
            return CrabPawn.TuneDataIceCrab.ClawPushDamageWithOutClawOnShutdownVs.GetValue();
        }
    }
    return CrabPawn.TuneDataIceCrab.ClawPushDamageWithOutClaw.GetValue();
    //return ReturnValue;    
}

function GetDamageTypeDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return CrabPawn.DamageTypeChargeBrush;
    //return ReturnValue;    
}

event HandleAnimNotifyApplyMeleeDamage()
{
    local /*0x97E50000-0x00000000*/ private class DamageTypeToGive[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    // End:0x3F
    if(CrabPawn.DamageTypeChargeBrush == DamageTypeToGive)
    {
        ApplyPushAwaySlapDamageToEnemy(HitInfo);
    }
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    super(LPAIController).MeleeHitSomethingNew(Info);
    // End:0x7C
    if((Info.SplineName == 'CrabLeftClawPush') || Info.SplineName == 'CrabRightClawPush')
    {
        ApplyPushAwaySlapDamageToEnemy(Info);
    }
    //return;    
}

function HandleHastyPincerBashBehavior()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;

    // End:0xF6
    if(!PincerBashInfo.bPerformingPincerBash)
    {
        // End:0xF6
        if(IsTimeForNextHastyPincerBash())
        {
            iter = 0;
            J0x3A:

            // End:0xF6 [Loop If]
            if(iter < TargetList.Length)
            {
                EnemyCandidate = TargetList[iter].Actor;
                // End:0xE8
                if(((EnemyCandidate != none) && CanBeMyEnemy(EnemyCandidate)) && !EnemyCandidate.IsA('LPBaseVSPlayerPawn'))
                {
                    // End:0xE8
                    if(IfCanHitDoHastyBash(EnemyCandidate))
                    {
                        return;
                    }
                }
                ++iter;
                // [Loop Continue]
                goto J0x3A;
            }
        }
    }
    //return;    
}

function IfCanHitDoHastyBash()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], btestForOnGround;

    btestForOnGround = !EnemyCandidate.IsA('LPBaseVSPlayerPawn');
    // End:0xAD
    if(IsInBashZone(EnemyCandidate.Location, btestForOnGround))
    {
        CrabPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_SnowCrabStartHastyPincerBash, self);
        SetTimeForNextHastyPincerBash();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyCrabBothClawsAreDisabledForAttack()
{
    PincerBashInfo.DyanmicPincherBashStretchRange = PincerBashInfo.DyanmicPincherBashStretchRange + CrabPawn.TuneDataIceCrab.AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable.GetValue();
    //return;    
}

function NotifyCrabClawAttacksAreNotDisabled()
{
    PincerBashInfo.DyanmicPincherBashStretchRange = PincerBashInfo.DyanmicPincherBashStretchRange - CrabPawn.TuneDataIceCrab.AmountToIncreaseVsPincerBashReachWhenBothClawsDismembered_Tunable.GetValue();
    //return;    
}

function SetDyanmicPincherBashStretchRangeForStunned()
{
    PincerBashInfo.DyanmicPincherBashStretchRange = PincerBashInfo.DyanmicPincherBashStretchRange - CrabPawn.TuneDataIceCrab.AmountToDecreaseHastyPincerBashRangeWhenStunned.GetValue();
    //return;    
}

function SetDyanmicPincherBashStretchRangeForNotStunned()
{
    PincerBashInfo.DyanmicPincherBashStretchRange = PincerBashInfo.DyanmicPincherBashStretchRange + CrabPawn.TuneDataIceCrab.AmountToDecreaseHastyPincerBashRangeWhenStunned.GetValue();
    //return;    
}

function GetMinDistanceAwayToStartChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xEF
    if((TargetOfStrike != none) && TargetOfStrike.IsA('LPBaseVSPlayerPawn'))
    {
        // End:0xA5
        if(TargetOfStrike.Controller == none)
        {
            return CrabPawn.TuneDataIceCrab.MinDistanceAwayToStartChargingStrikeAgainstVsIfEmpty.GetValue();            
        }
        else
        {
            return CrabPawn.TuneDataIceCrab.MinDistanceAwayToStartChargingStrikeAgainstVs_Tunable.GetValue();
        }
    }
    return CrabPawn.TuneDataIceCrab.MinDistanceAwayToStartChargingStrike_Tunable.GetValue();
    //return ReturnValue;    
}

function DrawAttackArcs()
{
    //return;    
}

function DrawABashZone()
{
    local /*0x97E50000-0x00000000*/ private float HeightOfZone[8388609], ZoneRadius;

    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0x2A
    if(bShowVsDynamaicAvoidZone)
    {
        DrawVsDynamaicAvoidZone();
    }
    //return;    
}

function ShowVsDynamaicAvoidZone()
{
    // End:0x3B
    if(bShowVsDynamaicAvoidZone)
    {
        bShowVsDynamaicAvoidZone = false;
        CrabPawn.FlushPersistentDebugLines();        
    }
    else
    {
        bShowVsDynamaicAvoidZone = true;
    }
    //return;    
}

function DrawVsDynamaicAvoidZone()
{
    //return;    
}

function SetHavedPerformedTauntFlagsForCurrentClawStatus()
{
    // End:0x41
    if(CrabPawn.HasClawLeftJustBeenDismembered())
    {
        CrabPawn.ClawLeftSetDoneReactingToBeingDismemberd();
    }
    // End:0x82
    if(CrabPawn.HasClawRightJustBeenDismembered())
    {
        CrabPawn.ClawRightSetDoneReactingToBeingDismemberd();
    }
    //return;    
}

function DetermineWhichClawToAttackWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xAA
    if(CrabPawn.IsClawLeftAbleToAttack() && CrabPawn.IsClawRightAbleToAttack())
    {
        // End:0x86
        if(RandRange(0.0000000, 1.0000000) < 0.5000000)
        {
            CrabPawn.ClawRightSetToStrikingWith();            
        }
        else
        {
            CrabPawn.ClawLeftSetToStrikingWith();
        }
        return true;        
    }
    else
    {
        // End:0xF0
        if(CrabPawn.IsClawRightAbleToAttack())
        {
            CrabPawn.ClawRightSetToStrikingWith();
            return true;            
        }
        else
        {
            // End:0x133
            if(CrabPawn.IsClawLeftAbleToAttack())
            {
                CrabPawn.ClawLeftSetToStrikingWith();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function DesireNonDismemberedTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bcommandSaysItWillHandleThisCoreHit, bgrenadeActualHandled;

    // End:0x26
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        bgrenadeActualHandled = false;        
    }
    else
    {
        bgrenadeActualHandled = true;
    }
    bcommandSaysItWillHandleThisCoreHit = false;
    curCommand = LPAICommand(CommandList);
    J0x5A:

    // End:0x109 [Loop If]
    if(curCommand != none)
    {
        // End:0xD5
        if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
        {
            // End:0xC9
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                bgrenadeActualHandled = true;
            }
            bcommandSaysItWillHandleThisCoreHit = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x5A;
    }
    // End:0x20C
    if(!bcommandSaysItWillHandleThisCoreHit && TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        // End:0x20C
        if(CrabPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x20C
            if(CrabPawn.IsThisCoreAStickGrenadeToCore(CrabPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                bgrenadeActualHandled = true;
                ReactToGrenadeGettingStuckToThisCore(CrabPawn.MyCoreData[HitCoreIndex].CoreID);
            }
        }
    }
    // End:0x27A
    if(!bgrenadeActualHandled)
    {
        curCommand = LPAICommand(CommandList);
        J0x237:

        // End:0x27A [Loop If]
        if(curCommand != none)
        {
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x237;
        }
    }
    //return;    
}

function ReactToGrenadeGettingStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreGettingHit[8388609];

    CmdCrabTakeGrenadeInMouth(CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 0);
    //return;    
}

function NotifyJustReleasedFromGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL MoveEnding[8388609], GrapplerReleasingMe;
    local /*0x97E50000-0x00000000*/ private bool bGrabAbruptRelease[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TheVs, curCommand;
    local /*0x97E50000-0x00000000*/ private bool ballowedToUberStrike;

    TheVs = LPBaseVSPlayerPawn(GrapplerReleasingMe);
    // End:0x1E3
    if((TheVs != none) && TheVs.Controller == none)
    {
        // End:0x1E0
        if(CrabPawn.HasClawLeftJustBeenDismembered() || CrabPawn.HasClawRightJustBeenDismembered())
        {
            CmdPerformTaunt(TheVs, GetReactiveTauntTypeNeeded(), CrabPawn.TuneDataIceCrab.MinTauntLoopTime.GetValue(), CrabPawn.TuneDataIceCrab.MaxTauntLoopTime.GetValue(), CrabPawn.TuneDataIceCrab.DamageAmountToCauseEndOfTaunt.GetValue(), CrabPawn.TuneDataIceCrab.MinDistanceAwayForReactiveTaunt_Tunable.GetValue(),, 0);
            return;            
        }        
    }
    ballowedToUberStrike = true;
    curCommand = LPAICommand(CommandList);
    J0x20B:

    // End:0x272 [Loop If]
    if(curCommand != none)
    {
        // End:0x23E
        if(LPAICmd_CrabTakeGrenadeInMouth(curCommand) != none)
        {
            ballowedToUberStrike = false;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x20B;
    }
    // End:0x29D
    if(ballowedToUberStrike)
    {
        CmdCrabUberStrikeVs(LPPawn(GrapplerReleasingMe));
    }
    //return;    
}

function OnAIToggleIceCrabClaw()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], leftCore, rightCore;
    local /*0x97E50000-0x00000000*/ private int leftClawCoreId, rightClawCoreId;

    // End:0xC0
    if(inAction.bLeftClaw)
    {
        leftCore = CrabPawn.FindPhysMatPropTag_CoreIdFromCoreID(6);
        // End:0xC0
        if(leftCore != none)
        {
            leftClawCoreId = CrabPawn.GetCoreIndexFromTag(leftCore);
            CrabPawn.CoreDestroyed(leftCore, leftClawCoreId);
        }
    }
    // End:0x180
    if(inAction.bRightClaw)
    {
        rightCore = CrabPawn.FindPhysMatPropTag_CoreIdFromCoreID(5);
        // End:0x180
        if(rightCore != none)
        {
            rightClawCoreId = CrabPawn.GetCoreIndexFromTag(rightCore);
            CrabPawn.CoreDestroyed(rightCore, rightClawCoreId);
        }
    }
    //return;    
}

function CmdCrabClawStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CrabStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

function CmdCrabPincerStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabPincerStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CrabPincerStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

function CmdCrabClawStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

function CmdCrabPincerStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabPincerStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabPincerStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

function CmdCrabKnockOutStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabKnockOutStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabKnockOutStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

simulated function IsDoingKnockOut()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CommandList.Class == Class'LPAICmd_CrabKnockOutStrikeVs';
    //return ReturnValue;    
}

function CmdPerformChargingStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabChargingStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CrabChargingStrikePof(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargingStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabChargingStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabChargingStrikeVs(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabChargeAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_CrabChargeAttackPof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabChargeAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabChargeAttackVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBecomeCrabDefaultStunned()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoHastyPincerBash[9437185];
    local /*0x97E50000-0x00000000*/ private class SpecialMoveToUse[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsThisStunInterruptible[9437185];
    local /*0x97E50000-0x00000000*/ private class StunRecoveryToUse[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    false
    Class'LPSM_SnowCrabDefaultStandingStun'
    false    
    CmdStatus_Stunned
    1
    // End:0x53
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabStunned'.static.InitCommand(self);
    myCommand = LPAICmd_CrabStunned(GetActiveCommand());
    // End:0x191
    if(myCommand != none)
    {
        myCommand.SetAllowHastyPincerBash(bDoHastyPincerBash);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetStunnedDuration(StunnedDuration);
        myCommand.SetSunnedSpecialMove(SpecialMoveToUse);
        myCommand.SetStunInterruptible(bIsThisStunInterruptible);
        myCommand.SetRecoverySpecialMove(StunRecoveryToUse);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformTaunt()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Taunt[8388609];
    local /*0x97E50000-0x00000000*/ private byte TauntTypeToPerform[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[8388609], MaxTime, DamageToCauseEndOfTaunt, MinDistanceNeeded;
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
    Class'LPAICmd_CrabTaunt'.static.InitCommand(self);
    myCommand = LPAICmd_CrabTaunt(GetActiveCommand());
    // End:0x19F
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Taunt);
        myCommand.SetTauntTypePerforming(TauntTypeToPerform);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMinTauntLoopTime(MinTime);
        myCommand.SetMaxTauntLoopTime(MaxTime);
        myCommand.SetDamageAmountToCauseEndOfTaunt(DamageToCauseEndOfTaunt);
        myCommand.SetMinDistanceToBeAwayForThisTaunt(MinDistanceNeeded);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformGroundPound()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2GroundPound[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTauntTime[8388609], MaxTauntTime;
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
    Class'LPAICmd_CrabGroundPound'.static.InitCommand(self);
    myCommand = LPAICmd_CrabGroundPound(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2GroundPound);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMinTauntLoopTime(MinTauntTime);
        myCommand.SetMaxTauntLoopTime(MaxTauntTime);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformCrabClawSwipe()
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
    Class'LPAICmd_CrabClawSwipe'.static.InitCommand(self);
    myCommand = LPAICmd_CrabClawSwipe(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHitReactionToStun()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class StunSpecialMove[8388609], HitReactionSpecialMove, RecoverSpecialMove;
    local /*0x97E50000-0x00000000*/ private @NULL InPawnCausingStun[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    0
    // End:0x5D
    if(!bIgnoreStunCommands)
    {
        return super(LPAIController).CmdHitReactionToStun(StunnedDuration, StunSpecialMove, HitReactionSpecialMove, RecoverSpecialMove, InPawnCausingStun, CmdOption);
    }
    return none;
    //return ReturnValue;    
}

function CmdCrabHitReactionToStun()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class StunSpecialMove[8388609], HitReactionSpecialMove;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x14D
    if(!bIgnoreStunCommands && !bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        // End:0x14D
        if(!CrabPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_SnowCrabGrenadeReaction'))
        {
            // End:0x7C
            if(int(CmdOption) == int(0))
            {
                AbortCommand(CommandList);
            }
            Class'LPAICmd_CrabHitReactionToStun'.static.InitCommand(self);
            myCommand = LPAICmd_CrabHitReactionToStun(GetActiveCommand());
            // End:0x140
            if(myCommand != none)
            {
                myCommand.SetStunnedDuration(StunnedDuration);
                myCommand.SetSunnedSpecialMove(StunSpecialMove);
                myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
            }
            return myCommand;            
        }
    }
    return none;
    //return ReturnValue;    
}

function CmdHitReaction()
{
    local /*0x97E50000-0x00000000*/ private float PostReactionPauseTime[8388609];
    local /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    0
    // End:0x51
    if(!bIgnoreStunCommands && !bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        return super(LPAIController).CmdHitReaction(PostReactionPauseTime, HitReactionSpecialMove, CmdOption);
    }
    return none;
    //return ReturnValue;    
}

function CmdCrabTakeGrenadeInMouth()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class GrenInMouthSpecialMove[9437185], HitReactionSpecialMove, StunSpecialMove;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPSM_SnowCrabTauntSwallow'
    Class'LPSM_SnowCrabTauntGrenadeInMouthToStun'
    Class'LPSM_SnowCrabGrenadeInMouthStun'
    0
    // End:0x55
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabTakeGrenadeInMouth'.static.InitCommand(self);
    myCommand = LPAICmd_CrabTakeGrenadeInMouth(GetActiveCommand());
    // End:0x141
    if(myCommand != none)
    {
        myCommand.SetStunnedDuration(StunnedDuration);
        myCommand.SetGrenInMouthSpecialMove(GrenInMouthSpecialMove);
        myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
        myCommand.SetSunnedSpecialMove(StunSpecialMove);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCrabUberStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CrabUberStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CrabUberStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    //return;    
}

function SetTimeForNextPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool bAgainstVs[8388609];
    local /*0x97E50000-0x00000000*/ private float minWait, MaxWait;

    // End:0x24C
    if(CrabPawn.TuneDataIceCrab != none)
    {
        // End:0xDA
        if(bAgainstVs)
        {
            minWait = CrabPawn.TuneDataIceCrab.MinTimeBetweenVsPincerBashAttacks.GetValue();
            MaxWait = CrabPawn.TuneDataIceCrab.MaxTimeBetweenVsPincerBashAttacks.GetValue();            
        }
        else
        {
            minWait = CrabPawn.TuneDataIceCrab.MinTimeBetweenPincerBashAttacks.GetValue();
            MaxWait = CrabPawn.TuneDataIceCrab.MaxTimeBetweenPincerBashAttacks.GetValue();
        }
        // End:0x1F3
        if(minWait < MaxWait)
        {
            PincerBashInfo.TimeForNextPincerBash = WorldInfo.TimeSeconds + RandRange(minWait, MaxWait);            
        }
        else
        {
            PincerBashInfo.TimeForNextPincerBash = WorldInfo.TimeSeconds + RandRange(MaxWait, minWait);
        }
    }
    //return;    
}

function ResetTimeForNextPincerBash()
{
    PincerBashInfo.TimeForNextPincerBash = 0.0000000;
    PincerBashInfo.TimeForNextPincerBash = 0.0000000;
    //return;    
}

function SetTimeForNextHastyPincerBash()
{
    local /*0x97E50000-0x00000000*/ private float minWait, MaxWait;

    // End:0x196
    if(CrabPawn.TuneDataIceCrab != none)
    {
        minWait = CrabPawn.TuneDataIceCrab.MinTimeBetweenHastyPincerBashAttacks.GetValue();
        MaxWait = CrabPawn.TuneDataIceCrab.MaxTimeBetweenHastyPincerBashAttacks.GetValue();
        // End:0x13D
        if(minWait < MaxWait)
        {
            PincerBashInfo.TimeForNextHastyPincerBash = WorldInfo.TimeSeconds + RandRange(minWait, MaxWait);            
        }
        else
        {
            PincerBashInfo.TimeForNextHastyPincerBash = WorldInfo.TimeSeconds + RandRange(MaxWait, minWait);
        }
    }
    //return;    
}

function ResetTimeForNextHastyPincerBash()
{
    PincerBashInfo.TimeForNextHastyPincerBash = 0.0000000;
    PincerBashInfo.TimeForNextHastyPincerBash = 0.0000000;
    //return;    
}

function IsTimeForNextPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PincerBashInfo.TimeForNextPincerBash < WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function IsTimeForNextHastyPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PincerBashInfo.TimeForNextHastyPincerBash < WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function IsInBashZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToTestAgainst[25296897];
    local /*0x97E50000-0x00000000*/ private bool bEnemyOnFoot[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Displacement;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

    Displacement = PointToTestAgainst - CrabPawn.Location;
    DistanceToTarget = VSize2D(Displacement);
    // End:0x96
    if(bEnemyOnFoot)
    {
        // End:0x93
        if(DistanceToTarget < (GetCurrentPincerBashReachDistanceAgaintPof()))
        {
            // End:0x90
            if(IsInBashAngularRange(PointToTestAgainst))
            {
                return true;                
            }            
        }        
    }
    else
    {
        // End:0xCC
        if(DistanceToTarget < (GetCurrentPincerBashReachDistanceAgaintVs()))
        {
            // End:0xC9
            if(IsInBashAngularRange(PointToTestAgainst))
            {
                return true;                
            }            
        }
    }
    return false;
    //return ReturnValue;    
}

function IsInTauntAttackBashZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToTestAgainst[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

    Displacement = PointToTestAgainst - CrabPawn.Location;
    DistanceToTarget = VSize2D(Displacement);
    // End:0xBF
    if(DistanceToTarget < CrabPawn.TuneDataIceCrab.TauntPincerBashReachPofDistance.GetValue())
    {
        // End:0xBF
        if(IsInTauntAttackBashAngularRange(PointToTestAgainst))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;
    local /*0x97E50000-0x00000000*/ private bool bcommandResponded;

    bcommandResponded = false;
    myCommand = LPAICommand(GetActiveCommand());
    // End:0x74
    if(myCommand != none)
    {
        bcommandResponded = myCommand.HandleDismemberment(CoreTag, CoreIndex);
    }
    // End:0x1DB
    if(!bcommandResponded)
    {
        AbortCommand(myCommand);
        CmdPerformTaunt(MyLPEnemy, GetReactiveTauntTypeNeeded(), CrabPawn.TuneDataIceCrab.MinTauntLoopTime.GetValue(), CrabPawn.TuneDataIceCrab.MaxTauntLoopTime.GetValue(), CrabPawn.TuneDataIceCrab.DamageAmountToCauseEndOfTaunt.GetValue(), CrabPawn.TuneDataIceCrab.MinDistanceAwayForReactiveTaunt_Tunable.GetValue(),, 1);
    }
    return false;
    //return ReturnValue;    
}

function GetReactiveTauntTypeNeeded()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x28
    if(CrabPawn.HasClawLeftJustBeenDismembered())
    {
        return 1;        
    }
    else
    {
        // End:0x4D
        if(CrabPawn.HasClawRightJustBeenDismembered())
        {
            return 2;
        }
    }
    return 4;
    //return ReturnValue;    
}

function GetCurrentPincerBashReachDistanceAgaintPof()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CrabPawn.TuneDataIceCrab.PincerBashReachPofDistance.GetValue() + PincerBashInfo.DyanmicPincherBashStretchRange;
    //return ReturnValue;    
}

function GetCurrentPincerBashReachDistanceAgaintVs()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CrabPawn.TuneDataIceCrab.PincerBashReachVsDistance.GetValue() + PincerBashInfo.DyanmicPincherBashStretchRange;
    //return ReturnValue;    
}

function GetCurrentPincerSmashReachDistanceAgaintPof()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CrabPawn.TuneDataIceCrab.TauntPincerBashReachPofDistance.GetValue();
    //return ReturnValue;    
}

function IsInBashAngularRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToTestAgainst[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement, Horiz, Forward;

    Displacement = PointToTestAgainst - CrabPawn.Location;
    Horiz = Displacement;
    Horiz.Z = 0.0000000;
    Horiz = Normal(Horiz);
    Forward = Vector(CrabPawn.Rotation);
    // End:0xDE
    if((Horiz Dot Forward) > PincerBashInfo.PincerBashACosHorizAngRange)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsInTauntAttackBashAngularRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToTestAgainst[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement, Horiz, Forward;

    Displacement = PointToTestAgainst - CrabPawn.Location;
    Horiz = Displacement;
    Horiz.Z = 0.0000000;
    Horiz = Normal(Horiz);
    Forward = Vector(CrabPawn.Rotation);
    // End:0xDE
    if((Horiz Dot Forward) > PincerBashInfo.TauntPincerBashACosHorizAngRange)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasGroundPoundWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(WorldInfo.TimeSeconds >= NextPossibleGroundPoundAttackTime)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasSwipeAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(WorldInfo.TimeSeconds >= NextPossibleSwipeAttackTime)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ResetSwipeAttackWaitTimer()
{
    NextPossibleSwipeAttackTime = WorldInfo.TimeSeconds + RandRange(CrabPawn.TuneDataIceCrab.MinTimeBetweenSwipeAttacks.GetValue(), CrabPawn.TuneDataIceCrab.MaxTimeBetweenSwipeAttacks.GetValue());
    //return;    
}

function ResetGroundPoundWaitTimer()
{
    NextPossibleGroundPoundAttackTime = WorldInfo.TimeSeconds + RandRange(CrabPawn.TuneDataIceCrab.MinTimeBetweenGroundPounds.GetValue(), CrabPawn.TuneDataIceCrab.MaxTimeBetweenGroundPounds.GetValue());
    //return;    
}

function IsKingCrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsDongo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    TimeOfFirstAttackOnEnemy=-1.0000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerBaseSnowCrab.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerBaseSnowCrab.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerBaseSnowCrab.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerBaseSnowCrab.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerBaseSnowCrab.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bStrikeCanBeRevoked=true
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerBaseSnowCrab.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    HitReactionCmdClass=Class'LPAICmd_CrabHitReaction'
    // Reference: SPAIReactionManager'Default__LPAIControllerBaseSnowCrab.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerBaseSnowCrab.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}