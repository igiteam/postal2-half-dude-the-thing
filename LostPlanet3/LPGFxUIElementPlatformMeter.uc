class LPGFxUIElementPlatformMeter extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTEnergyLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastHealthPercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExtractPocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    Reset();
    //return;    
}

function ResetShowState()
{
    LastTEnergyLevel = -1.0000000;
    LastHealthPercent = -1.0000000;
    //return;    
}

function ShowPlatformMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL inExtractPocket[9437185], InVsPawn;

    ExtractPocket = inExtractPocket;
    vsPawn = InVsPawn;
    SetActive(bShow);
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    ActionScriptShow(bShow);
    //return;    
}

function ActionScriptShow()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    MoviePlayer.ActionScriptVoid("showPlatformMeter");
    //return;    
}

function Reset()
{
    ResetShowState();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x3F
    if(bShouldBeActive)
    {
        UpdateTENGMeter();
        UpdateHealthMeter();
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateHealthMeter()
{
    local /*0x97E50000-0x00000000*/ private float HealthPercent;

    // End:0x98
    if(vsPawn != none)
    {
        HealthPercent = float(vsPawn.Health) / float(vsPawn.HealthMax);
        // End:0x98
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

    MoviePlayer.ActionScriptVoid("setPlatformMeterHealthPercent");
    //return;    
}

function UpdateTENGMeter()
{
    local /*0x97E50000-0x00000000*/ private float tePercent;

    // End:0x95
    if(ExtractPocket != none)
    {
        tePercent = ExtractPocket.GetEnergyRemaining() / ExtractPocket.MaxEnergy;
        // End:0x95
        if(tePercent != LastTEnergyLevel)
        {
            setPlayerTENG(tePercent);
            LastTEnergyLevel = tePercent;
        }
    }
    //return;    
}

function setPlayerTENG()
{
    local /*0x97E50000-0x00000000*/ private float tePercent[8388609];

    MoviePlayer.ActionScriptVoid("setPlatformMeterTEPercent");
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    ExtractPocket = none;
    vsPawn = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}
