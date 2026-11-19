class LPGFxUIElementHealthInfoCluster extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastShow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTEnergyLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastHealthPercent;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    Reset();
    //return;    
}

function ResetShowState()
{
    bLastShow = true;
    LastTEnergyLevel = -1.0000000;
    LastHealthPercent = -1.0000000;
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x95
    if(LPMPHUD != none)
    {
        HUD = LPHUD(LPMPHUD.myHUD);
        // End:0x95
        if(HUD != none)
        {
            ActionScriptSetMPMode(HUD.IsMPHUD());
        }
    }
    ActionScriptShow(bShow);
    //return;    
}

function ActionScriptSetMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    MoviePlayer.ActionScriptVoid("bMeterShouldAccountForDPad");
    //return;    
}

function ActionScriptShow()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    MoviePlayer.ActionScriptVoid("bShowInfoCluster");
    //return;    
}

function Reset()
{
    ResetShowState();
    //return;    
}

function PlayerDied()
{
    super(SPGFxUIElement).PlayerDied();
    Reset();
    //return;    
}

function RoundEnded()
{
    super(SPGFxUIElement).RoundEnded();
    Reset();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive, bShouldShow;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0xD7
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0xD7
        if(LPMPHUD != none)
        {
            bShouldShow = LPMPHUD.HealthClusterShouldDisplay();
            // End:0xC3
            if(bShouldShow != bLastShow)
            {
                Show(bShouldShow);
                bLastShow = bShouldShow;
            }
            UpdateTENGMeter();
            UpdateHealthMeter();
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateHealthMeter()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float HealthPercent;

    LPP = LPPlayerPawn(GetLPPC().Pawn);
    // End:0xCA
    if(LPP != none)
    {
        HealthPercent = float(LPP.Health) / float(LPP.HealthMax);
        // End:0xCA
        if(HealthPercent != LastHealthPercent)
        {
            setPlayerHealth(HealthPercent);
            LastHealthPercent = HealthPercent;
        }
    }
    //return;    
}

function setPlayerHealth()
{
    local /*0x97E50000-0x00000000*/ private float Health[8388609];

    MoviePlayer.ActionScriptVoid("setPlayerHealth");
    //return;    
}

function UpdateTENGMeter()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private int playerEnergyMax;
    local /*0x97E50000-0x00000000*/ private float DisplayedTENG;

    LPP = LPPlayerPawn(GetLPPC().Pawn);
    // End:0xE2
    if(LPP != none)
    {
        playerEnergyMax = int(LPP.GetMaxTEnergyCapacity());
        DisplayedTENG = LPP.TEnergyLevel * float(playerEnergyMax);
        // End:0xE2
        if(DisplayedTENG != LastTEnergyLevel)
        {
            setPlayerTENG(string(int(DisplayedTENG)));
            LastTEnergyLevel = DisplayedTENG;
        }
    }
    //return;    
}

function setPlayerTENG()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string strEng[8388609];

    MoviePlayer.ActionScriptVoid("setPlayerTENG");
    //return;    
}
