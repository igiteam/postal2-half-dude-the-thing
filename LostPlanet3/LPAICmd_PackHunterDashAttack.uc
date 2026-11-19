class LPAICmd_PackHunterDashAttack extends LPAICmd_PackHunterAttack within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PawnsRunDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreCalcedDashToPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoingRunInBeforeLaunchOfStrike[536870913];

// Export ULPAICmd_PackHunterDashAttack::execShouldKynapseDynamicallyAvoid(FFrame&, void* const)
native event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Pushed()
{
    super.Pushed();
    PawnsRunDown.Remove(0, PawnsRunDown.Length);    
    PreCalcedDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
    bForceDashStrikeToTheRightOfTheTarget = false;
    bDoingRunInBeforeLaunchOfStrike = false;
    //return;    
}

function Popped()
{
    // End:0x59
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.CurrentStrikeTargetToIgnoreBlockingBy = none;
    }
    super.Popped();
    Outer.NotifyCombatManagerOfAttackCompleted(16, false, false, false);
    //return;    
}

function SetPreCalcedDashToPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dash2Point[8388609];

    PreCalcedDashToPoint = Dash2Point;
    //return;    
}

function SetForceDashStrikeToTheRightOfTheTarget()
{
    local /*0x97E50000-0x00000000*/ private bool bForceDashRight[8388609];

    bForceDashStrikeToTheRightOfTheTarget = bForceDashRight;
    //return;    
}

function HasThisPawnBeenRunIntoYetThisCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunningInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x54 [Loop If]
    if(iter < PawnsRunDown.Length)
    {
        // End:0x46
        if(PawnsRunDown[iter] == PawnRunningInto)
        {
            return true;
        }
        iter++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function GetChargeBrushDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x31
    if(vsPawn != none)
    {
        return 1000.0000000;
    }
    return 1000.0000000;
    //return ReturnValue;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.DashClawStrikeStartDistance;
    //return ReturnValue;    
}

function GetSeperationToMoveToBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.DashClawStrikeStartDistance;
    //return ReturnValue;    
}

function DoesHunterStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetStopTypeForEndOfMoveToStrike()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.StopTypeForEndOfMoveToDashStrike;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    bDoingRunInBeforeLaunchOfStrike = false;
    Outer.Focus = none;
    CurStrikeCmd = Outer.CmdPackHunterDashStrikePof(EnemyForAttack, AmountOfDamageReceivedSoFarThisAttack, AmountOfDamageToStopTheAttackThisAttack, Outer.CmdStatus_PackHunterRunningAttack, PreCalcedDashToPoint, bForceDashStrikeToTheRightOfTheTarget, 1);
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}
