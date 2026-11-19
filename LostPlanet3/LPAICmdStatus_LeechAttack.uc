class LPAICmdStatus_LeechAttack extends LPAICmdStatus_Objective
    editinlinenew;

enum eLeechAttack_Status
{
    LeechAttack_Status_None,        // 0
    LeechAttack_Status_StartedRunIn,// 1
    LeechAttack_Status_StartedStrike,// 2
    LeechAttack_Status_StruckTheTargetWithTail,// 3
    LeechAttack_Status_RammedTheTarget,// 4
    LeechAttack_Status_RammedTheTargetAndStruckTheTargetWithTail,// 5
    LeechAttack_Status_StruckPawnOtherThenTheTarget,// 6
    LeechAttack_Status_CoreHitKnockedMyOutOfStrike,// 7
    LeechAttack_Status_EndedStruckNothingOfNote,// 8
    LeechAttack_Status_MAX          // 9
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_LeechAttack_Status[536870913];
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
    Cmd_LeechAttack_Status = 0;
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
    Cmd_LeechAttack_Status = 0;
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
    Cmd_LeechAttack_Status = 2;
    //return;    
}

function KnockedOutOfStrikeByCoreHit()
{
    Cmd_LeechAttack_Status = 7;
    //return;    
}

function WasKnockedOutOfStrikeByCoreHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(Cmd_LeechAttack_Status) == int(7))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TargetWasSuccessfullyStruckWithTail()
{
    // End:0x43
    if(int(Cmd_LeechAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_LeechAttack_Status) == int(4))
        {
            Cmd_LeechAttack_Status = 5;            
        }
        else
        {
            Cmd_LeechAttack_Status = 3;
        }
    }
    //return;    
}

function TargetWasRammed()
{
    // End:0x43
    if(int(Cmd_LeechAttack_Status) != int(5))
    {
        // End:0x37
        if(int(Cmd_LeechAttack_Status) == int(3))
        {
            Cmd_LeechAttack_Status = 5;            
        }
        else
        {
            Cmd_LeechAttack_Status = 4;
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
            Cmd_LeechAttack_Status = 6;
        }
    }
    return true;
    //return ReturnValue;    
}

function WasTargetSuccessfullyStruckWithTail()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if((int(Cmd_LeechAttack_Status) == int(3)) || int(Cmd_LeechAttack_Status) == int(5))
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
    if(((int(Cmd_LeechAttack_Status) == int(3)) || int(Cmd_LeechAttack_Status) == int(4)) || int(Cmd_LeechAttack_Status) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
