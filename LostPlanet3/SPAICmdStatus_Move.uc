class SPAICmdStatus_Move extends SPAICmdStatus
    editinlinenew;

enum SPAICmd_Move_Error
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

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Cmd_Move_Error[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool Cmd_Move_GoalIsOnAiMesh[536870913];

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