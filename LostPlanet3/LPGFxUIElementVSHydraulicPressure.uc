class LPGFxUIElementVSHydraulicPressure extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Root;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabOnMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PressureLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float pressureNoiseTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float pressureNoise;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPressureReadyForDepletion;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x53
    if(MoviePlayer != none)
    {
        Root = MoviePlayer.GetVariableObject("_root");
    }
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    super(SPGFxUIElement).SetActive(bSet, bImmediate);
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0xD1
    if(Root != none)
    {
        DI = Root.GetDisplayInfo();
        DI.Visible = bShow;
        Root.SetDisplayInfo(DI);
        // End:0xBB
        if(bShow)
        {
            bPressureReadyForDepletion = false;
            GoToIntro();
            ShouldDisplayOutro = true;            
        }
        else
        {
            GoToOutro();
            ShouldDisplayOutro = false;
        }
    }
    //return;    
}

function HydraulicPressureHidden()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

function GrabOnInstanced()
{
    local /*0x97E50000-0x00000000*/ private int startFrame[8388609], endFrame;

    // End:0x57
    if(MoviePlayer != none)
    {
        GrabOnMC = MoviePlayer.GetVariableObject("_root.hydraPressureIn.grabOn");
    }
    //return;    
}

function TextCountInstanced()
{
    //return;    
}

function ReadyForDepletion()
{
    bPressureReadyForDepletion = true;
    //return;    
}

function SetHydraulicPressureLevel()
{
    local /*0x97E50000-0x00000000*/ private float pressure[8388609], WorldTime;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;

    // End:0x11
    if(MoviePlayer == none)
    {
        return;
    }
    // End:0x22
    if(!bPressureReadyForDepletion)
    {
        return;
    }
    // End:0x83
    if(PressureLabel == none)
    {
        PressureLabel = MoviePlayer.GetVariableObject("_root.hydraPressureIn.grabOn.textCount");
    }
    // End:0xE3
    if(PressureLabel != none)
    {
        S = S $ string(int(pressure * float(100)));
        PressureLabel.SetText(S);
    }
    // End:0x1C4
    if(GrabOnMC != none)
    {
        WorldTime = GetLPPC().WorldInfo.TimeSeconds;
        // End:0x174
        if((WorldTime - pressureNoiseTime) > 0.2000000)
        {
            pressureNoise = FRand() * 0.1000000;
            pressureNoiseTime = WorldTime;
        }
        pressure = pressure + pressureNoise;
        pressure = FClamp(pressure, 0.0000000, 1.0000000);
        SetPressurePercent(pressure);
    }
    //return;    
}

function GoToIntro()
{
    // End:0x39
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("GoToIntro");
    }
    //return;    
}

function GoToOutro()
{
    //return;    
}

function SetPressurePercent()
{
    local /*0x97E50000-0x00000000*/ private float pressure[8388609];

    GrabOnMC.ActionScriptVoid("SetPressurePercent");
    //return;    
}
