class LPGFxUIElementVSEnvironmentalMessage extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnvironmentalMsg;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentOpenSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NormalSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WarningSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DangerSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CloseSound;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x62
    if(MoviePlayer != none)
    {
        EnvironmentalMsg = MoviePlayer.GetVariableObject("_root.environmentMsg");
    }
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x4A
    if(bSet || bImmediate)
    {
        bPendingInactive = false;
        super(SPGFxUIElement).SetActive(bSet, bImmediate);        
    }
    else
    {
        bPendingInactive = true;
        Show(bSet, bImmediate);
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x12
    if(MoviePlayer == none)
    {
        return;
    }
    P = GetLPPC().Pawn;
    // End:0xC6
    if(bShow)
    {
        // End:0xB7
        if(EnvironmentalMsg != none)
        {
            GoToIntro(EnvironmentalMsg);
            // End:0xB7
            if((P != none) && CurrentOpenSound != none)
            {
                P.PlaySound(CurrentOpenSound);
            }
        }
        ShouldDisplayOutro = true;        
    }
    else
    {
        // End:0x156
        if(!bImmediate && ShouldDisplayOutro)
        {
            // End:0x153
            if(EnvironmentalMsg != none)
            {
                GoToOutro(EnvironmentalMsg);
                // End:0x153
                if((P != none) && CloseSound != none)
                {
                    P.PlaySound(CloseSound);
                }
            }            
        }
        else
        {
            // End:0x19C
            if(EnvironmentalMsg != none)
            {
                GoToStart(EnvironmentalMsg);
                MoviePlayer.Advance(0.1000000);
            }
            // End:0x1B5
            if(bPendingInactive)
            {
                SetActive(false, true);
            }
        }
        ShouldDisplayOutro = false;
    }
    //return;    
}

function OpenVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private byte MessageType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageText[8388609], SecondaryMessageText;

    switch(MessageType)
    {
        // End:0x40
        case 0:
            CurrentOpenSound = NormalSound;
            SetVSEnvironmentMessageContainer("normal");
            // End:0x9C
            break;
        // End:0x6C
        case 1:
            CurrentOpenSound = WarningSound;
            SetVSEnvironmentMessageContainer("alert");
            // End:0x9C
            break;
        // End:0x99
        case 2:
            CurrentOpenSound = DangerSound;
            SetVSEnvironmentMessageContainer("danger");
            // End:0x9C
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetVSEnvironmentMessage(MoviePlayer.GetLocalizedString(MessageText), MoviePlayer.GetLocalizedString(SecondaryMessageText));
    SetActive(true);
    //return;    
}

function SetVSEnvironmentMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Header[8388609], Body;

    // End:0x47
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSEnvironmentMessage");
    }
    //return;    
}

function SetVSEnvironmentMessageContainer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609];

    // End:0x50
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSEnvironmentMessageContainer");
    }
    //return;    
}

function CloseVSEnvironmentalMessage()
{
    SetActive(false);
    //return;    
}

function AbortVSEnvironmentalMessage()
{
    SetActive(false, true);
    //return;    
}

function IsVSEnvironmentalMessageDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsActive();
    //return ReturnValue;    
}

function GoToIntro()
{
    local /*0x97E50000-0x00000000*/ private @NULL Message[8388609];

    Message.ActionScriptVoid("GoToIntro");
    //return;    
}

function GoToOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL Message[8388609];

    Message.ActionScriptVoid("GoToOutro");
    //return;    
}

function GoToStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL Message[8388609];

    Message.ActionScriptVoid("GoToStart");
    //return;    
}

function VSMessageHidden()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}
