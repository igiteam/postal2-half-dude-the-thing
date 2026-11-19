class LPAICmd_PackHunterDashStrike extends LPAICmd_PackHunterStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepTimeInSecsDuringAttackUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAttackStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OldLineSweepTestFrequency[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OutValAmountOfDamageReceivedThisDash[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PassedInAmountOfDamageToCausePlowInThisDash[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FollowThroughMoveStatus[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RunningAttackCmdStatus[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTookGrenadeInMouth[536870913];

// Export ULPAICmd_PackHunterDashStrike::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    CurMoveToPositionCmd = none;
    bTookGrenadeInMouth = false;
    OldLineSweepTestFrequency = Outer.PHPawn.LineSweepHitTester.TestFrequency;
    Outer.PHPawn.LineSweepHitTester.TestFrequency = Outer.PHPawn.TuneDataPackHunter.DashStrikeLineSweepHitTestFrequency;
    RunningAttackCmdStatus = none;
    Outer.EnablePHDefaultHitReaction(false);
    //return;    
}

function Popped()
{
    // End:0xB7
    if(Outer.PHPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PackHunterDashClawStrikeStartRight') || Outer.PHPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PackHunterDashClawStrikeStartLeft'))
    {
        Outer.PHPawn.EndCurrentSpecialMove();
    }
    Outer.PHPawn.HandleNotifyPlayerDodgeWindow(10, 1, EnemyForStrike);
    Outer.MeleeFinished();
    // End:0x170
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.CurrentStrikeTargetToIgnoreBlockingBy = none;
    }
    Outer.PHPawn.LineSweepHitTester.TestFrequency = OldLineSweepTestFrequency;
    Outer.ResetRotationRate();
    Outer.EnablePHDefaultHitReaction(true);
    super.Popped();
    Outer.NotifyCombatManagerOfStrikeCompleted(16);
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super(LPAICmd_Strike).SetReturnCmdStatus(ReturnStatus);
    RunningAttackCmdStatus = LPAICmdStatus_PackHunterRunningAttack(ReturnStatus);
    // End:0x5D
    if(RunningAttackCmdStatus != none)
    {
        RunningAttackCmdStatus.SetDefaults();
    }
    //return;    
}

function SetPreCalcedDashToPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dash2Point[8388609];

    RunningAttackCmdStatus.PreCalcedDashToPoint = Dash2Point;
    //return;    
}

function SetForceDashStrikeToTheRightOfTheTarget()
{
    local /*0x97E50000-0x00000000*/ private bool bForceDashRight[8388609];

    RunningAttackCmdStatus.bForceDashStrikeToTheRightOfTheTarget = bForceDashRight;
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    // End:0x74
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.CurrentStrikeTargetToIgnoreBlockingBy = InEnemy;
    }
    //return;    
}

function SetOutValAmountOfDamageReceivedThisDash()
{
    local /*0x97E50000-0x00000000*/ private float ValAmountOfDamageReceivedThisDash[25165825];

    OutValAmountOfDamageReceivedThisDash = ValAmountOfDamageReceivedThisDash;
    //return;    
}

function SetAmountOfDamageToCausePlowInThisDash()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamageToCausePlowInThisDash[8388609];

    PassedInAmountOfDamageToCausePlowInThisDash = AmountOfDamageToCausePlowInThisDash;
    //return;    
}

event MeleeHitSomethingNewWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    MeleeHitSomethingNew(Info);
    return true;
    //return ReturnValue;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x1F5
    if(Info.SplineName == 'PackHunterFullBodyRamStrike')
    {
        // End:0x1F2
        if((EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
        {
            // End:0x1F2
            if(Info.Impact.HitActor == EnemyForStrike)
            {
                Outer.PHPawn.StopPawnChoreographyReplicated();
                Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.PHPawn.TuneDataPackHunter.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
                Outer.PHPawn.ScriptToCodeDebugHelper();
            }
        }        
    }
    else
    {
        // End:0x402
        if((!RunningAttackCmdStatus.WasTargetSuccessfullyStruckWithClaw() && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
        {
            // End:0x402
            if(Info.Impact.HitActor == EnemyForStrike)
            {
                RunningAttackCmdStatus.TargetWasSuccessfullyStruckWithClaw();
                Outer.PHPawn.StopPawnChoreographyReplicated();
                Outer.SetFocalPoint(Outer.PHPawn.Location + (Vector(Outer.PHPawn.Rotation) * Outer.PHPawn.TuneDataPackHunter.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
                Outer.PHPawn.ScriptToCodeDebugHelper();
            }
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x12C
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.StopPawnChoreography();
        Outer.SetFocalPoint(Outer.PHPawn.Location + (Vector(Outer.PHPawn.Rotation) * Outer.PHPawn.TuneDataPackHunter.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
    }
    //return;    
}

event @NULL TouchWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Touch(Other, OtherComp, HitLocation, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

event @NULL BumpWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Bump(Other, OtherComp, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x36
    if(Other.IsA('LPPlayerPawn'))
    {
        RanIntoActor(Other);
    }
    //return;    
}

function StartStrikePoF()
{
    Outer.Focus = none;
    Outer.bStruckTargetDuringDash = false;
    Outer.bStruckBlockingObjectDuringDash = false;
    RunningAttackCmdStatus.StartingStrike(EnemyForStrike);
    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
    RunningAttackCmdStatus.bHunterJumpingOff = true;
    RunningAttackCmdStatus.bHunterSwiping = false;
    RunningAttackCmdStatus.bHunterLanding = false;
    // End:0x1D9
    if(Class'SPEngine.SPUtil'.static.IsToRight(Outer.PHPawn, EnemyForStrike))
    {
        RunningAttackCmdStatus.bUsingRightClaw = true;
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeStartRight', true, true, Outer.,, EnemyForStrike);        
    }
    else
    {
        RunningAttackCmdStatus.bUsingRightClaw = false;
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeStartLeft', true, true, Outer.,, EnemyForStrike);
    }
    //return;    
}

function StartPreDashStrikeStartAction()
{
    Outer.Focus = none;
    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = true;
    RunningAttackCmdStatus.bHunterJumpingOff = false;
    RunningAttackCmdStatus.bHunterSwiping = false;
    RunningAttackCmdStatus.bHunterLanding = false;
    Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterPreDashStrikeStartAction', true, true, On_LPSM_PackHunterPreDashStrikeStartAction_Finished);
    //return;    
}

event NotifyOfSpecialMoveAnimtionComplete()
{
    local /*0x97E50000-0x00000000*/ private class SM_TypeAnimDoneFor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x3C
    if(ClassIsChildOf(SM_TypeAnimDoneFor, Class'LPSM_PackHunterDashClawStrikeStartRight') || ClassIsChildOf(SM_TypeAnimDoneFor, Class'LPSM_PackHunterDashClawStrikeStartLeft'))
    {
        On_LPSM_PackHunterDashStikePOFLaunch_Finished();
    }
    //return;    
}

function On_LPSM_PackHunterPreDashStrikeStartAction_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
    RunningAttackCmdStatus.bHunterJumpingOff = false;
    RunningAttackCmdStatus.bHunterSwiping = false;
    RunningAttackCmdStatus.bHunterLanding = false;
    //return;    
}

function On_LPSM_PackHunterDashStikePOFLaunch_Finished()
{
    // End:0x15F
    if(RunningAttackCmdStatus.WasKnockedOutOfStrikeByCoreHit())
    {
        RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
        RunningAttackCmdStatus.bHunterJumpingOff = false;
        RunningAttackCmdStatus.bHunterSwiping = false;
        RunningAttackCmdStatus.bHunterLanding = false;
        // End:0x15D
        if(Outer.PHPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PackHunterDashClawStrikeStartRight') || Outer.PHPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PackHunterDashClawStrikeStartLeft'))
        {
            Outer.PHPawn.EndCurrentSpecialMove();
        }
        return;
    }
    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
    RunningAttackCmdStatus.bHunterJumpingOff = false;
    RunningAttackCmdStatus.bHunterSwiping = true;
    RunningAttackCmdStatus.bHunterLanding = false;
    // End:0x261
    if(RunningAttackCmdStatus.bUsingRightClaw)
    {
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeRight', true, true, On_LPSM_PackHunterDashStikePOFSwipe_Finished, EnemyForStrike);        
    }
    else
    {
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeLeft', true, true, On_LPSM_PackHunterDashStikePOFSwipe_Finished, EnemyForStrike);
    }
    //return;    
}

function On_LPSM_PackHunterDashStikePOFSwipe_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0xA8
    if(RunningAttackCmdStatus.WasKnockedOutOfStrikeByCoreHit())
    {
        RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
        RunningAttackCmdStatus.bHunterJumpingOff = false;
        RunningAttackCmdStatus.bHunterSwiping = false;
        RunningAttackCmdStatus.bHunterLanding = false;
        return;
    }
    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
    RunningAttackCmdStatus.bHunterJumpingOff = false;
    RunningAttackCmdStatus.bHunterSwiping = false;
    RunningAttackCmdStatus.bHunterLanding = true;
    // End:0x1AA
    if(RunningAttackCmdStatus.bUsingRightClaw)
    {
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeLandRight', true, true, On_LPSM_PackHunterDashStikePOFLand_Finished, EnemyForStrike);        
    }
    else
    {
        Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeLandLeft', true, true, On_LPSM_PackHunterDashStikePOFLand_Finished, EnemyForStrike);
    }
    //return;    
}

function On_LPSM_PackHunterDashStikePOFLand_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction = false;
    RunningAttackCmdStatus.bHunterJumpingOff = false;
    RunningAttackCmdStatus.bHunterSwiping = false;
    RunningAttackCmdStatus.bHunterLanding = false;
    RunningAttackCmdStatus.bStrikeDashClawFinished = true;
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    //return;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DidHitSomethingThatEndedTheDash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.bStruckBlockingObjectDuringDash;
    //return ReturnValue;    
}

function IsThingRunningIntoCloseEnoughtToRam()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHit[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float distanceFromCenterLineOfPHunter;
    local /*0x97E50000-0x00000000*/ private @NULL forwardPoint, rearPoint;

    forwardPoint = Outer.PHPawn.Location + (Vector(Outer.PHPawn.Rotation) * Outer.MyKynapseRadius);
    rearPoint = Outer.PHPawn.Location + (Vector(Outer.PHPawn.Rotation) * -Outer.MyKynapseRadius);
    distanceFromCenterLineOfPHunter = Class'SPEngine.SPUtil'.static.SPDistanceToLine(forwardPoint, rearPoint, PawnHit.Location);
    // End:0x1DB
    if(distanceFromCenterLineOfPHunter < Outer.PHPawn.TuneDataPackHunter.DistanceAwayFromCenterLineToRegDashRam)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IHitMyTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    Outer.bStruckTargetDuringDash = true;
    // End:0x64
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    CleanUpEndOfStikeSpecialMove();
    RunningAttackCmdStatus.bStrikeDashClawFinished = false;
    StartChargingStrikeSucsussfulHit();
    //return;    
}

function StopHitOnDash()
{
    Outer.bStruckTargetDuringDash = false;
    Outer.bStruckBlockingObjectDuringDash = true;
    // End:0x85
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    CleanUpEndOfStikeSpecialMove();
    RunningAttackCmdStatus.bStrikeDashClawFinished = false;
    //return;    
}

function CalcDashStrikeToPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeTargetPoint, targetTempPoint, targetTempPointNorm, offsetPoint, offsetTempPoint, packHunLoc;

    local /*0x97E50000-0x00000000*/ private float distToTarget;
    local /*0x97E50000-0x00000000*/ private bool bGoingRight;

    packHunLoc = Outer.PHPawn.Location;
    offsetPoint = EnemyForStrike.Location - packHunLoc;
    distToTarget = VSize2D(packHunLoc - EnemyForStrike.Location);
    offsetTempPoint = Normal(offsetPoint);
    offsetPoint.X = offsetTempPoint.Y;
    offsetPoint.Y = -offsetTempPoint.X;
    offsetPoint.Z = offsetTempPoint.Z;
    bGoingRight = RandRange(0.0000000, 1.0000000) > 0.5000000;
    // End:0x1EF
    if(RunningAttackCmdStatus.PreCalcedDashToPoint != vect(0.0000000, 0.0000000, 0.0000000))
    {
        bGoingRight = RunningAttackCmdStatus.bForceDashStrikeToTheRightOfTheTarget;
    }
    // End:0x25C
    if(bGoingRight)
    {
        offsetPoint = offsetPoint * Outer.PHPawn.TuneDataPackHunter.DashStrikeDistanceToTheSideOfTargetToAimFor;        
    }
    else
    {
        offsetPoint = (offsetPoint * -1.0000000) * Outer.PHPawn.TuneDataPackHunter.DashStrikeDistanceToTheSideOfTargetToAimFor;
    }
    offsetTempPoint = offsetPoint + EnemyForStrike.Location;
    targetTempPoint = offsetTempPoint - Outer.PHPawn.Location;
    targetTempPointNorm = Normal(targetTempPoint);
    strikeTargetPoint = targetTempPointNorm * (distToTarget + Outer.PHPawn.TuneDataPackHunter.DashStrikeDistancePastTheTargetToAimFor);
    strikeTargetPoint = strikeTargetPoint + Outer.PHPawn.Location;
    strikeTargetPoint.Z = Outer.PHPawn.Location.Z;
    RunningAttackCmdStatus.OnTheRunCalcedDashToPoint = strikeTargetPoint;
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x118
    if(Outer.PHPawn != none)
    {
        // End:0x10D
        if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
        {
            OutValAmountOfDamageReceivedThisDash += AmountOfDamage;
            // End:0x10D
            if(Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 0)
            {
                // End:0x10D
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    bTookGrenadeInMouth = true;
                    OutValAmountOfDamageReceivedThisDash = PassedInAmountOfDamageToCausePlowInThisDash + 1.0000000;
                }
            }
        }
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange();
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    OutValAmountOfDamageReceivedThisDash += AmountOfDamage;
    return HandlePossibilityTookEnoughDamageToCauseBehaviorChange();
    //return ReturnValue;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x422
    if(OutValAmountOfDamageReceivedThisDash >= PassedInAmountOfDamageToCausePlowInThisDash)
    {
        Outer.PHPawn.GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing(Outer.PHPawn.LastMovementInteruptionEffectDirection, Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor, false);
        // End:0x422
        if((int(Outer.PHPawn.LastMovementInteruptionEffectDirection) == int(1)) && int(Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor) > int(1))
        {
            // End:0x18F
            if(RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction)
            {
                Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterPreDashStrikeStartAction');
            }
            // End:0x250
            if(RunningAttackCmdStatus.bHunterJumpingOff)
            {
                // End:0x213
                if(RunningAttackCmdStatus.bUsingRightClaw)
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeStartRight');                    
                }
                else
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeStartLeft');
                }
            }
            // End:0x311
            if(RunningAttackCmdStatus.bHunterSwiping)
            {
                // End:0x2D4
                if(RunningAttackCmdStatus.bUsingRightClaw)
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeRight');                    
                }
                else
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeLeft');
                }
            }
            // End:0x3D2
            if(RunningAttackCmdStatus.bHunterLanding)
            {
                // End:0x395
                if(RunningAttackCmdStatus.bUsingRightClaw)
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeLandRight');                    
                }
                else
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeLandLeft');
                }
            }
            RunningAttackCmdStatus.KnockedOutOfStrikeByCoreHit();
            // End:0x420
            if(bTookGrenadeInMouth)
            {
                Outer.PopCommand(self);
                return false;
            }
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        CleanUpEndOfStikeSpecialMove();
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        CleanUpEndOfStikeSpecialMove();
        super.EndState(NextStateName);
        //return;        
    }

    function IsPreDashStrikeStartActionFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x26
        if(!RunningAttackCmdStatus.bPerformingPreDashStrikeStartAction)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeAttackStarted;
        // End:0xC6
        if(durationOfAction > Outer.PHPawn.TuneDataPackHunter.MaxTimeForForEntireDashStrike)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function IsStrikeDashClawFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfStrike;

        // End:0x26
        if(!RunningAttackCmdStatus.bHunterSwiping)
        {
            return true;
        }
        durationOfStrike = Outer.WorldInfo.TimeSeconds - TimeAttackStarted;
        // End:0xC6
        if(durationOfStrike > Outer.PHPawn.TuneDataPackHunter.MaxTimeForForEntireDashStrike)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    CalcDashStrikeToPoint();
    // End:0x41
    if(RunningAttackCmdStatus == none)
    {
        RunningAttackCmdStatus = Outer.CmdStatus_PackHunterRunningAttack;
    }
    Outer.Focus = none;
    // End:0x165
    if(Outer.PHPawn.TuneDataPackHunter.bPerformPreDashStrikeStartAction)
    {
        TimeAttackStarted = Outer.WorldInfo.TimeSeconds;
        StartPreDashStrikeStartAction();
        J0xF4:

        // End:0x123 [Loop If]
        if(!IsPreDashStrikeStartActionFinished())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xF4;
        }
        // End:0x165
        if(RunningAttackCmdStatus.WasKnockedOutOfStrikeByCoreHit())
        {
            Outer.PopCommand(self);
        }
    }
    // End:0x1D0
    if(Outer.PHPawn.TuneDataPackHunter.bZeroHunterVelocityAtStartOfDashStrike)
    {
        Outer.PawnZeroVelocity();
    }
    // End:0x282
    if(Outer.PHPawn.TuneDataPackHunter.DashAttackPauseTimeWhileLaunchingIntoStrike > 0.0000000)
    {
        Outer.Sleep(Outer.PHPawn.TuneDataPackHunter.DashAttackPauseTimeWhileLaunchingIntoStrike);
    }
    Outer.PHPawn.HandleNotifyPlayerDodgeWindow(10, 0, EnemyForStrike);
    TimeAttackStarted = Outer.WorldInfo.TimeSeconds;
    StartStrikePoF();
    J0x30A:

    // End:0x34C [Loop If]
    if(RunningAttackCmdStatus.bHunterJumpingOff)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x30A;
    }
    J0x34C:

    // End:0x37B [Loop If]
    if(!IsStrikeDashClawFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x34C;
    }
    Outer.PHPawn.HandleNotifyPlayerDodgeWindow(10, 1, EnemyForStrike);
    // End:0x3FE
    if(RunningAttackCmdStatus.WasKnockedOutOfStrikeByCoreHit())
    {
        Outer.PopCommand(self);
    }
    // End:0x4C3
    if(RunningAttackCmdStatus.bHunterSwiping)
    {
        // End:0x482
        if(RunningAttackCmdStatus.bUsingRightClaw)
        {
            Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterDashClawStrikeRight');            
        }
        else
        {
            Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterDashClawStrikeLeft');
        }
    }
    J0x4C3:

    // End:0x564 [Loop If]
    if(RunningAttackCmdStatus.bHunterLanding && !RunningAttackCmdStatus.bStrikeDashClawFinished && Outer.PHPawn.IsDoingASpecialMove())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x4C3;
    }
    CleanUpEndOfStikeSpecialMove();
    Outer.Focus = none;
    Outer.ResetRotationRate();
    GotoState('DashStrikeFollowThrough');
    stop;                    
}

state DashStrikeFollowThrough
{
    function SetFollowThroghDestination()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float MaxFollowThroughDistance;
        local /*0x97E50000-0x00000000*/ private @NULL MyFacing;
        local /*0x97E50000-0x00000000*/ private int howManyTries, iter;

        MaxFollowThroughDistance = Outer.PHPawn.TuneDataPackHunter.DistanceAwayFromEnemyToMoveAfterCompletionOfDashStrike.GetValue();
        MaxFollowThroughDistance -= VSize2D(Outer.myAIPawn.Location - EnemyForStrike.Location);
        howManyTries = int(MaxFollowThroughDistance / Outer.PHPawn.TuneDataPackHunter.ReductionDistanceForEachSuccessiveDashStrikeRunOut);
        iter = 0;
        J0x13A:

        // End:0x36A [Loop If]
        if(iter < (howManyTries + 1))
        {
            // End:0x35A
            if(MaxFollowThroughDistance > float(0))
            {
                MyFacing = Vector(Outer.myAIPawn.Rotation);
                RunningAttackCmdStatus.FollowThroughDestination = Outer.myAIPawn.Location + (MyFacing * MaxFollowThroughDistance);
                // End:0x29C
                if(Outer.IsDestinationInsideAiMesh(RunningAttackCmdStatus.FollowThroughDestination) && !IsVitalSuitAtLocation(RunningAttackCmdStatus.FollowThroughDestination, Outer.MyKynapseRadius))
                {
                    return true;
                }
                MaxFollowThroughDistance -= Outer.PHPawn.TuneDataPackHunter.ReductionDistanceForEachSuccessiveDashStrikeRunOut;
                RunningAttackCmdStatus.FollowThroughDestination = Outer.myAIPawn.Location + (MyFacing * MaxFollowThroughDistance);                
            }
            else
            {
                return false;
            }
            iter++;
            // [Loop Continue]
            goto J0x13A;
        }
        return false;
        //return ReturnValue;        
    }

    function HasMoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return int(FollowThroughMoveStatus.Cmd_Move_Error) >= int(3);
        //return ReturnValue;        
    }

    function HasMoveSucceeded()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return int(FollowThroughMoveStatus.Cmd_Move_Error) == int(2);
        //return ReturnValue;        
    }

    function IsMoving()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return !HasMoveSucceeded() && !HasMoveFailed();
        //return ReturnValue;        
    }

    function STARTMOVE()
    {
        FollowThroughMoveStatus.SetDefaults();
        Outer.Focus = none;
        CurMoveToPositionCmd = Outer.CmdMoveToPosition(RunningAttackCmdStatus.FollowThroughDestination,, Outer.MyKynapseRadius, FollowThroughMoveStatus, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfStrikeFollowThrough);
        CurMoveToPositionCmd.SetMovementMonitorParameters(true, Outer.PHPawn.TuneDataPackHunter.DurationBetweenMovementDeltaDuringDashRunOut, Outer.PHPawn.TuneDataPackHunter.MinMovementDeltaDuringDashRunOut, Outer.PHPawn.TuneDataPackHunter.DelayAfterStartOfDashRunOutBeforeMonitorStarts, NotifyOfFailedMovementForDashRunOut);
        //return;        
    }

    function NotifyOfFailedMovementForDashRunOut()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x38
        if(CurMoveToPositionCmd != none)
        {
            Outer.AbortCommand(CurMoveToPositionCmd);
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    // End:0x36
    if(SetFollowThroghDestination())
    {
        STARTMOVE();
    }
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    SleepTimeInSecsDuringAttackUpdate=0.0100000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAICmd_PackHunterDashStrike.LPAICmdStatus_MoveToPosition_FollowThrough0'
    begin object name=LPAICmdStatus_MoveToPosition_FollowThrough0 class=Class'LPAICmdStatus_MoveToPosition'
    end object
    FollowThroughMoveStatus=LPAICmdStatus_MoveToPosition_FollowThrough0
}