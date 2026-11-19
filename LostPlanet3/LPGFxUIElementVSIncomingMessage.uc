class LPGFxUIElementVSIncomingMessage extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IncomingMessageMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IncomingMessageSound;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x63
    if(MoviePlayer != none)
    {
        IncomingMessageMC = MoviePlayer.GetVariableObject("_root.incomingMessage");
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
    local /*0x97E50000-0x00000000*/ private @NULL P, DI;

    // End:0x12
    if(MoviePlayer == none)
    {
        return;
    }
    P = GetLPPC().Pawn;
    // End:0x1FF
    if(IncomingMessageMC != none)
    {
        // End:0x136
        if(bShow)
        {
            DI = IncomingMessageMC.GetDisplayInfo();
            DI.Visible = bShow;
            IncomingMessageMC.SetDisplayInfo(DI);
            // End:0x11D
            if((P != none) && IncomingMessageSound != none)
            {
                P.PlaySound(IncomingMessageSound);
            }
            GoToIntro();
            ShouldDisplayOutro = true;            
        }
        else
        {
            // End:0x161
            if(!bImmediate && ShouldDisplayOutro)
            {
                GoToOutro();                
            }
            else
            {
                DI = IncomingMessageMC.GetDisplayInfo();
                DI.Visible = bShow;
                IncomingMessageMC.SetDisplayInfo(DI);
                // End:0x1F3
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
            }
            ShouldDisplayOutro = false;
        }
    }
    //return;    
}

function ClickIncomingMessage()
{
    GoToSelected();
    //return;    
}

function GoToIntro()
{
    IncomingMessageMC.ActionScriptVoid("GoToIntro");
    //return;    
}

function GoToOutro()
{
    IncomingMessageMC.ActionScriptVoid("GoToOutro");
    //return;    
}

function GoToSelected()
{
    IncomingMessageMC.ActionScriptVoid("GoToSelected");
    //return;    
}

function IncomingMessageHidden()
{
    //return;    
}

function IncomingMessageOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}
