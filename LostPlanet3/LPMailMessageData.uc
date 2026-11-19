class LPMailMessageData extends Object
    abstract
    editinlinenew
    hidecategories(Object);

enum EMessageLogType
{
    EMLT_CoronisLog,                // 0
    EMLT_ColonyLog,                 // 1
    EMLT_MAX                        // 2
};

var(0.25_Pct) /*0x80A30000-0x00000000*/ private editfixedsize string MessageSender;
var(0.25_Pct) /*0x80A30000-0x00000000*/ private editfixedsize string MessageSubject;
var(0.25_Pct) /*0x80A30000-0x00000000*/ private editfixedsize string MessageBody;
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Second[65537];
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Minute[65537];
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Hour[65537];
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Day[65537];
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Month[65537];
var(0.25_Pct) /*0x2BD50000-0x00000000*/ private int Year[65537];
var(0.25_Pct) /*0x80A30000-0x00000000*/ private byte logType[65537];

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    //return;    
}

function Stop()
{
    //return;    
}

function Play()
{
    //return;    
}

function Pause()
{
    //return;    
}

function Resume()
{
    //return;    
}

function CanPlayMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}
