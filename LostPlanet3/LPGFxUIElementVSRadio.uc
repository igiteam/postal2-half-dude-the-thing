class LPGFxUIElementVSRadio extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RadioMessageMC;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x60
    if(MoviePlayer != none)
    {
        RadioMessageMC = MoviePlayer.GetVariableObject("_root.radioMessage");
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
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x178
    if(RadioMessageMC != none)
    {
        // End:0xAF
        if(bShow)
        {
            DI = RadioMessageMC.GetDisplayInfo();
            DI.Visible = bShow;
            RadioMessageMC.SetDisplayInfo(DI);
            GoToIntro();
            ShouldDisplayOutro = true;            
        }
        else
        {
            // End:0xDA
            if(!bImmediate && ShouldDisplayOutro)
            {
                GoToOutro();                
            }
            else
            {
                DI = RadioMessageMC.GetDisplayInfo();
                DI.Visible = bShow;
                RadioMessageMC.SetDisplayInfo(DI);
                // End:0x16C
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

function GoToIntro()
{
    RadioMessageMC.ActionScriptVoid("GoToIntro");
    //return;    
}

function GoToOutro()
{
    RadioMessageMC.ActionScriptVoid("GoToOutro");
    //return;    
}

function RadioOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}
