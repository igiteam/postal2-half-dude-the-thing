class LPGFxUIElementVSInteractions extends LPGFxUIElement;

enum EVSInteractions_Mode
{
    EVSInteractions_Mode_DrillSwing,// 0
    EVSInteractions_Mode_DrillSpin, // 1
    EVSInteractions_Mode_MAX        // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ToolsInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSpinMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSwingMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentMode;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x5E
    if(MoviePlayer != none)
    {
        ToolsInstance = MoviePlayer.GetVariableObject("_root.toolsRight");
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

    // End:0x2E4
    if(ToolsInstance != none)
    {
        // End:0x165
        if(bShow)
        {
            DI = ToolsInstance.GetDisplayInfo();
            DI.Visible = bShow;
            ToolsInstance.SetDisplayInfo(DI);
            // End:0xF6
            if(int(CurrentMode) == int(1))
            {
                GoToToolDrillSpin();
                DrillSpinMC = ToolsInstance.GetObject("toolDrill");
                GoToDrillSpinOn();                
            }
            else
            {
                // End:0x156
                if(int(CurrentMode) == int(0))
                {
                    GoToToolDrillSwing();
                    DrillSwingMC = ToolsInstance.GetObject("toolSwingArm");
                    GoToDrillSwingOn();
                }
            }
            ShouldDisplayOutro = true;            
        }
        else
        {
            // End:0x246
            if(!bImmediate && ShouldDisplayOutro)
            {
                // End:0x1E3
                if(int(CurrentMode) == int(1))
                {
                    GoToToolDrillSpin();
                    DrillSpinMC = ToolsInstance.GetObject("toolDrill");
                    GoToDrillSpinOff();                    
                }
                else
                {
                    // End:0x243
                    if(int(CurrentMode) == int(0))
                    {
                        GoToToolDrillSwing();
                        DrillSwingMC = ToolsInstance.GetObject("toolSwingArm");
                        GoToDrillSwingOff();
                    }
                }                
            }
            else
            {
                DI = ToolsInstance.GetDisplayInfo();
                DI.Visible = bShow;
                ToolsInstance.SetDisplayInfo(DI);
                // End:0x2D8
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

function EnableDrillSpinDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    CurrentMode = 1;
    SetActive(bEnable);
    //return;    
}

function EnableDrillSwingDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    CurrentMode = 0;
    SetActive(bEnable);
    //return;    
}

function GoToToolDrillSpin()
{
    ToolsInstance.ActionScriptVoid("GoToToolDrillSpin");
    //return;    
}

function GoToToolDrillSwing()
{
    ToolsInstance.ActionScriptVoid("GoToToolDrillSwing");
    //return;    
}

function GoToDrillSpinOn()
{
    DrillSpinMC.ActionScriptVoid("GoToDrillSpinOn");
    //return;    
}

function GoToDrillSpinOff()
{
    DrillSpinMC.ActionScriptVoid("GoToDrillSpinOff");
    //return;    
}

function GoToDrillSwingOn()
{
    DrillSwingMC.ActionScriptVoid("GoToDrillSwingOn");
    //return;    
}

function GoToDrillSwingOff()
{
    DrillSwingMC.ActionScriptVoid("GoToDrillSwingOff");
    //return;    
}

function DrillIconHidden()
{
    //return;    
}

function DrillSpinOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

function DrillSwingOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}
