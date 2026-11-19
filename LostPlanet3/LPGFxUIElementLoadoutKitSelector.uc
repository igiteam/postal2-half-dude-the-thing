class LPGFxUIElementLoadoutKitSelector extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasIntro;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasOutro;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IntroComplete__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OutroComplete__Delegate;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    SetOnIntroComplete(IntroComplete);
    SetOnOutroComplete(OutroComplete);
    SetActive(false, true);
    //return;    
}

function NotifyMPHUDLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609];

    MPHUD = InMPHUD_Container;
    // End:0xCC
    if(MPHUD != none)
    {
        LoadoutMC = LPGFxLoadoutKitSelector(MoviePlayer.GetVariableObject("stagePanel.panel_kitSelection", Class'LPGFxLoadoutKitSelector'));
        LoadoutMC.MoviePlayer = MoviePlayer;
        LoadoutMC.Init(MPHUD);
    }
    SetActive(false, true);
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    Show(bSet, bImmediate);
    // End:0x68
    if(bSet || bImmediate)
    {
        bPendingInactive = false;
        super(SPGFxUIElement).SetActive(bSet, bImmediate);        
    }
    else
    {
        bPendingInactive = true;
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    // End:0x93
    if(bShow)
    {
        // End:0x2A
        if(!bImmediate)
        {
            GoToIntro();            
        }
        else
        {
            // End:0x84
            if(LoadoutMC != none)
            {
                LoadoutMC.InitKitSelector();
                ShowKitSelection(true);
                LoadoutMC.SetSelectedKit();
            }
        }
        ShouldDisplayOutro = true;        
    }
    else
    {
        // End:0xBE
        if(!bImmediate && ShouldDisplayOutro)
        {
            GoToOutro();            
        }
        else
        {
            // End:0xDA
            if(bPendingInactive)
            {
                SetActive(false, true);                
            }
            else
            {
                // End:0xF4
                if(LoadoutMC != none)
                {
                    ShowKitSelection(false);
                }
            }
        }
        ShouldDisplayOutro = false;
    }
    //return;    
}

function SelectNextKit()
{
    LoadoutMC.SelectNextKit();
    //return;    
}

function SelectPrevKit()
{
    LoadoutMC.SelectPrevKit();
    //return;    
}

function ShowKitSelection()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    LoadoutMC.ShowKitSelection(bShow);
    //return;    
}

delegate IntroComplete()
{
    SetActive(true, true);
    //return;    
}

delegate OutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

function SetOnIntroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x4C
    if(bHasIntro)
    {
        MPHUD.ActionScriptSetFunction("KitSelector_IntroCompleteEvent");
    }
    //return;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x4C
    if(bHasOutro)
    {
        MPHUD.ActionScriptSetFunction("KitSelector_OutroCompleteEvent");
    }
    //return;    
}

function GoToIntro()
{
    // End:0x25
    if(!bHasIntro)
    {
        IntroComplete();        
    }
    else
    {
        // End:0x6E
        if(ShouldDisplayOutro == false)
        {
            MPHUD.ActionScriptVoid("KitSelector_GoToIntro");            
        }
        else
        {
            MPHUD.ActionScriptVoid("KitSelector_ReInitialize");
        }
    }
    //return;    
}

function GoToOutro()
{
    // End:0x25
    if(!bHasOutro)
    {
        OutroComplete();        
    }
    else
    {
        MPHUD.ActionScriptVoid("KitSelector_GoToOutro");
    }
    //return;    
}
