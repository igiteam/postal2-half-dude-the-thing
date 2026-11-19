class LPAICmdStatus_PackHunterRunningAttack extends LPAICmdStatus_Objective
    editinlinenew;

enum eRunningAttack_Status
{
    RunningAttack_Status_None,      // 0
    RunningAttack_Status_StartedRunIn,// 1
    RunningAttack_Status_StartedStrike,// 2
    RunningAttack_Status_StruckTheTargetWithClaw,// 3
    RunningAttack_Status_RammedTheTarget,// 4
    RunningAttack_Status_RammedTheTargetAndStruckTheTargetWithClaw,// 5
    RunningAttack_Status_StruckPawnOtherThenTheTarget,// 6
    RunningAttack_Status_CoreHitKnockedMyOutOfStrike,// 7
    RunningAttack_Status_EndedStruckNothingOfNote,// 8
    RunningAttack_Status_MAX        // 9
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_RunningAttack_Status[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnTryingToHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingRightClaw[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStrikeDashClawFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingPreDashStrikeStartAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHunterJumpingOff[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHunterSwiping[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHunterLanding[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OnTheRunCalcedDashToPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreCalcedDashToPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FollowThroughDestination[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_RunningAttack_Status = 0;
    bUsingRightClaw = false;
    bStrikeDashClawFinished = false;
    bForceDashStrikeToTheRightOfTheTarget = false;
    bPerformingPreDashStrikeStartAction = false;
    bHunterJumpingOff = false;
    bHunterSwiping = false;
    bHunterLanding = false;
    PawnTryingToHit = none;
    OnTheRunCalcedDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
    PreCalcedDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
    FollowThroughDestination = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function Clear()
{
    Cmd_RunningAttack_Status = 0;
    bUsingRightClaw = false;
    bStrikeDashClawFinished = false;
    bForceDashStrikeToTheRightOfTheTarget = false;
    bHunterJumpingOff = false;
    bPerformingPreDashStrikeStartAction = false;
    PawnTryingToHit = none;
    OnTheRunCalcedDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
    PreCalcedDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
    FollowThroughDestination = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function StartingStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL StrikeTarget[8388609];

    PawnTryingToHit = StrikeTarget;
    Cmd_RunningAttack_Status = 2;
    //return;    
}

function KnockedOutOfStrikeByCoreHit()
{
    Cmd_RunningAttack_Status = 7;
    //return;    
}

function WasKnockedOutOfStrikeByCoreHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(Cmd_RunningAttack_Status) == int(7))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TargetWasSuccessfullyStruckWithClaw()
{
    // End:0x43
    if(int(Cmd_RunningAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_RunningAttack_Status) == int(4))
        {
            Cmd_RunningAttack_Status = 5;            
        }
        else
        {
            Cmd_RunningAttack_Status = 3;
        }
    }
    //return;    
}

function TargetWasRammed()
{
    // End:0x43
    if(int(Cmd_RunningAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_RunningAttack_Status) == int(3))
        {
            Cmd_RunningAttack_Status = 5;            
        }
        else
        {
            Cmd_RunningAttack_Status = 4;
        }
    }
    //return;    
}

function NotifyStruckPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHit[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(PawnHit == PawnTryingToHit)
    {
        TargetWasRammed();        
    }
    else
    {
        // End:0x3F
        if(!HasTargetBeenRammedOrClawed())
        {
            Cmd_RunningAttack_Status = 6;
        }
    }
    return true;
    //return ReturnValue;    
}

function WasTargetSuccessfullyStruckWithClaw()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if((int(Cmd_RunningAttack_Status) == int(3)) || int(Cmd_RunningAttack_Status) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasTargetBeenRammedOrClawed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(((int(Cmd_RunningAttack_Status) == int(3)) || int(Cmd_RunningAttack_Status) == int(4)) || int(Cmd_RunningAttack_Status) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
