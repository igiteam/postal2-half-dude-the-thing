class LPGFxUIElementVSFutureHullIntegrity extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HullIntegrityBarMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HealthMeterGlow;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], DI;

    super(SPGFxUIElement).Init(MP);
    // End:0x127
    if(MoviePlayer != none)
    {
        HullIntegrityBarMC = MoviePlayer.GetVariableObject("_root.barHealth");
        HealthMeterGlow = MoviePlayer.GetVariableObject("_root.barHealth.healthMeterGlow");
        // End:0x127
        if(HealthMeterGlow != none)
        {
            DI = HealthMeterGlow.GetDisplayInfo();
            DI.Visible = false;
            HealthMeterGlow.SetDisplayInfo(DI);
        }
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
    local /*0x97E50000-0x00000000*/ private float HealthPercent;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0xEB
    if(bShouldBeActive && MoviePlayer != none)
    {
        vsPlayerPawn = LPBaseVSPlayerPawn(GetLPPC().Pawn);
        // End:0xEB
        if(HullIntegrityBarMC != none)
        {
            // End:0xEB
            if(vsPlayerPawn != none)
            {
                HealthPercent = float(vsPlayerPawn.Health) / float(vsPlayerPawn.HealthMax);
                SetHealthPercent(HealthPercent);
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function SetRepairing()
{
    local /*0x97E50000-0x00000000*/ private bool bRepairing[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x88
    if(HealthMeterGlow != none)
    {
        DI = HealthMeterGlow.GetDisplayInfo();
        DI.Visible = bRepairing;
        HealthMeterGlow.SetDisplayInfo(DI);
    }
    //return;    
}

function SetHealthPercent()
{
    local /*0x97E50000-0x00000000*/ private float AmmoPercent[8388609];

    HullIntegrityBarMC.ActionScriptVoid("SetHealthPercent");
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(HullIntegrityBarMC != none)
    {
        DI = HullIntegrityBarMC.GetDisplayInfo();
        DI.Visible = bShow;
        HullIntegrityBarMC.SetDisplayInfo(DI);
    }
    //return;    
}
