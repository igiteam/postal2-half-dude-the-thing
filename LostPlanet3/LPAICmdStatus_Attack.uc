class LPAICmdStatus_Attack extends LPAICmdStatus_Objective
    editinlinenew;

enum LPAICmd_Attack_Error
{
    Cmd_Attack_Error_None,          // 0
    Cmd_Attack_Error_Failed,        // 1
    Cmd_Attack_Error_UnsupportedEnemy,// 2
    Cmd_Attack_Error_UnreachableEnemy,// 3
    Cmd_Attack_Error_MAX            // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Attack_Error[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Attack_Error = 0;
    //return;    
}
