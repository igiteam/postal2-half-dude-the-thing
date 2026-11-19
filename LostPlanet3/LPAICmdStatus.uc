class LPAICmdStatus extends Object
    editinlinenew;

enum LPAICmd_Error
{
    Cmd_Error_None,                 // 0
    Cmd_Error_Failed,               // 1
    Cmd_Error_MAX                   // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Error;

function SetDefaults()
{
    Cmd_Error = 0;
    //return;    
}

function GetError()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Cmd_Error;
    //return ReturnValue;    
}
