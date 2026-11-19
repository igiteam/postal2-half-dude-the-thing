class LPAICmdStatus_PhadyrAttack extends LPAICmdStatus_Objective
    editinlinenew;

enum ePhadyrAttack_Status
{
    PhadyrAttack_Status_None,       // 0
    PhadyrAttack_Status_StartedRunIn,// 1
    PhadyrAttack_Status_StartedStrike,// 2
    PhadyrAttack_Status_StruckTheTargetWithTail,// 3
    PhadyrAttack_Status_RammedTheTarget,// 4
    PhadyrAttack_Status_RammedTheTargetAndStruckTheTargetWithTail,// 5
    PhadyrAttack_Status_StruckPawnOtherThenTheTarget,// 6
    PhadyrAttack_Status_CoreHitKnockedMyOutOfStrike,// 7
    PhadyrAttack_Status_EndedStruckNothingOfNote,// 8
    PhadyrAttack_Status_MAX         // 9
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_PhadyrAttack_Status[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnTryingToHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStrikeFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingPreDashStrikeStartAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJumpingOff[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStinging[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLanding[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FollowThroughDestination[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_PhadyrAttack_Status = 0;
    bStrikeFinished = false;
    bPerformingPreDashStrikeStartAction = false;
    bJumpingOff = false;
    bStinging = false;
    bLanding = false;
    PawnTryingToHit = none;
    //return;    
}

function Clear()
{
    Cmd_PhadyrAttack_Status = 0;
    bStrikeFinished = false;
    bJumpingOff = false;
    bPerformingPreDashStrikeStartAction = false;
    PawnTryingToHit = none;
    //return;    
}

function StartingStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL StrikeTarget[8388609];

    PawnTryingToHit = StrikeTarget;
    Cmd_PhadyrAttack_Status = 2;
    //return;    
}

function KnockedOutOfStrikeByCoreHit()
{
    Cmd_PhadyrAttack_Status = 7;
    //return;    
}

function WasKnockedOutOfStrikeByCoreHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(Cmd_PhadyrAttack_Status) == int(7))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TargetWasSuccessfullyStruckWithTail()
{
    // End:0x43
    if(int(Cmd_PhadyrAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_PhadyrAttack_Status) == int(4))
        {
            Cmd_PhadyrAttack_Status = 5;            
        }
        else
        {
            Cmd_PhadyrAttack_Status = 3;
        }
    }
    //return;    
}

function TargetWasRammed()
{
    // End:0x43
    if(int(Cmd_PhadyrAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_PhadyrAttack_Status) == int(3))
        {
            Cmd_PhadyrAttack_Status = 5;            
        }
        else
        {
            Cmd_PhadyrAttack_Status = 4;
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
        if(!HasTargetBeenRammedOrStung())
        {
            Cmd_PhadyrAttack_Status = 6;
        }
    }
    return true;
    //return ReturnValue;    
}

function WasTargetSuccessfullyStruckWithTail()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if((int(Cmd_PhadyrAttack_Status) == int(3)) || int(Cmd_PhadyrAttack_Status) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasTargetBeenRammedOrStung()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(((int(Cmd_PhadyrAttack_Status) == int(3)) || int(Cmd_PhadyrAttack_Status) == int(4)) || int(Cmd_PhadyrAttack_Status) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
