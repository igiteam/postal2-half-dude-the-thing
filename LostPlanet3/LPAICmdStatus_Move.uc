class LPAICmdStatus_Move extends LPAICmdStatus
    editinlinenew;

enum LPAICmd_Move_Error
{
    Cmd_Move_Error_None,            // 0
    Cmd_Move_Error_InProgress,      // 1
    Cmd_Move_Error_ReachedDestination,// 2
    Cmd_Move_Error_Failed,          // 3
    Cmd_Move_Error_Failed_NoPath,   // 4
    Cmd_Move_Error_Aborted,         // 5
    Cmd_Move_Error_Aborted_TargetDead,// 6
    Cmd_Move_Error_MAX              // 7
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Move_Error[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool Cmd_Move_GoalIsOnAiMesh[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Move_Error = 0;
    Cmd_Move_GoalIsOnAiMesh = true;
    //return;    
}

defaultproperties
{
    Cmd_Move_GoalIsOnAiMesh=true
}