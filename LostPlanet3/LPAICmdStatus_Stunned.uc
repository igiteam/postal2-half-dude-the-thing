class LPAICmdStatus_Stunned extends LPAICmdStatus_Objective
    editinlinenew;

enum LPAICmd_Stunned_Status
{
    LPAICmd_Stunned_None,           // 0
    LPAICmd_Stunned_Started,        // 1
    LPAICmd_Stunned_Finshed,        // 2
    LPAICmd_Stunned_Failed,         // 3
    LPAICmd_Stunned_MAX             // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Stunned_Status[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Stunned_Status = 0;
    //return;    
}
