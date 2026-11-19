class LPAICmdStatus_InteractWithSmartObject extends LPAICmdStatus_Objective
    editinlinenew;

enum LPAICmd_Interact_Error
{
    Cmd_Interact_Error_None,        // 0
    Cmd_Interact_Error_Failed,      // 1
    Cmd_Interact_Error_MAX          // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Interact_Error[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Interact_Error = 0;
    //return;    
}
