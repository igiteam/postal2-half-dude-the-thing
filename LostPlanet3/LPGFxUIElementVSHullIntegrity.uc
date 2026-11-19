class LPGFxUIElementVSHullIntegrity extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HullIntegrityBarMC;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x5E
    if(MoviePlayer != none)
    {
        HullIntegrityBarMC = MoviePlayer.GetVariableObject("_root.hullStatus");
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
                SetVSHullStatus(HealthPercent);
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function SetVSHullStatus()
{
    local /*0x97E50000-0x00000000*/ private float Health[8388609];

    // End:0x3F
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetVSHullStatus");
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x178
    if(HullIntegrityBarMC != none)
    {
        // End:0xAF
        if(bShow)
        {
            DI = HullIntegrityBarMC.GetDisplayInfo();
            DI.Visible = bShow;
            HullIntegrityBarMC.SetDisplayInfo(DI);
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
                DI = HullIntegrityBarMC.GetDisplayInfo();
                DI.Visible = bShow;
                HullIntegrityBarMC.SetDisplayInfo(DI);
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
    ShowVSHullStatus(true);
    //return;    
}

function GoToOutro()
{
    ShowVSHullStatus(false);
    //return;    
}

function ShowVSHullStatus()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x40
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("ShowVSHullStatus");
    }
    //return;    
}

function VSHullStatusOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}
