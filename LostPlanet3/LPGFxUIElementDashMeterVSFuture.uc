class LPGFxUIElementDashMeterVSFuture extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowRight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DashLeftMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DashRightMC;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0xB1
    if(MoviePlayer != none)
    {
        // End:0x69
        if(bShowLeft)
        {
            DashLeftMC = MoviePlayer.GetVariableObject("_root.dashLeft");
        }
        // End:0xB1
        if(bShowRight)
        {
            DashRightMC = MoviePlayer.GetVariableObject("_root.dashRight");
        }
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPP;
    local /*0x97E50000-0x00000000*/ private float Pct;

    LPPC = GetLPPC();
    // End:0x356
    if(LPPC.bIsInVitalSuit)
    {
        LPP = LPVSFuturePlayerPawn(LPPC.Pawn);
        // End:0x356
        if(LPP != none)
        {
            // End:0x258
            if((LPPC.LastVSDashTime > float(0)) && (LPPC.WorldInfo.TimeSeconds - LPPC.LastVSDashTime) < LPTuneDataVSFuturePlayerPawn(LPP.TuneDataBasePawn).DashCooldownTime.GetValue())
            {
                Pct = (LPPC.WorldInfo.TimeSeconds - LPPC.LastVSDashTime) / LPTuneDataVSFuturePlayerPawn(LPP.TuneDataBasePawn).DashCooldownTime.GetValue();
                SetLeftDashPercent(Pct);
                SetRightDashPercent(Pct);
                SetLeftDashText(int(Pct * float(100)));
                SetRightDashText(int(Pct * float(100)));                
            }
            else
            {
                // End:0x356
                if(LPPC.DashAcceleration > float(0))
                {
                    Pct = LPPC.DashAcceleration / LPTuneDataVSFuturePlayerPawn(LPP.TuneDataBasePawn).DashSpeed.GetValue();
                    SetLeftDashPercent(Pct);
                    SetRightDashPercent(Pct);
                    SetLeftDashText(int(Pct * float(100)));
                    SetRightDashText(int(Pct * float(100)));
                }
            }
        }
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function SetLeftDashPercent()
{
    local /*0x97E50000-0x00000000*/ private float dashPercent[8388609];

    // End:0x3E
    if(DashLeftMC != none)
    {
        DashLeftMC.ActionScriptVoid("SetDashPercent");
    }
    //return;    
}

function SetRightDashPercent()
{
    local /*0x97E50000-0x00000000*/ private float dashPercent[8388609];

    // End:0x3E
    if(DashRightMC != none)
    {
        DashRightMC.ActionScriptVoid("SetDashPercent");
    }
    //return;    
}

function SetLeftDashText()
{
    local /*0x97E50000-0x00000000*/ private int numDash[8388609];

    // End:0x3B
    if(DashLeftMC != none)
    {
        DashLeftMC.ActionScriptVoid("SetDashText");
    }
    //return;    
}

function SetRightDashText()
{
    local /*0x97E50000-0x00000000*/ private int numDash[8388609];

    // End:0x3B
    if(DashRightMC != none)
    {
        DashRightMC.ActionScriptVoid("SetDashText");
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(DashLeftMC != none)
    {
        DI = DashLeftMC.GetDisplayInfo();
        DI.Visible = bShow;
        DashLeftMC.SetDisplayInfo(DI);
    }
    // End:0x111
    if(DashRightMC != none)
    {
        DI = DashRightMC.GetDisplayInfo();
        DI.Visible = bShow;
        DashRightMC.SetDisplayInfo(DI);
    }
    //return;    
}

defaultproperties
{
    bShowLeft=true
    bShowRight=true
}