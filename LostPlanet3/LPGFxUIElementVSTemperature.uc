class LPGFxUIElementVSTemperature extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TemperatureLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TemperatureRoot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDisplayedTemperature;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTemperatureTextInitialized;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0xAD
    if(MoviePlayer != none)
    {
        TemperatureLabel = MoviePlayer.GetVariableObject("_root.temperature.temperatureLabel");
        TemperatureRoot = MoviePlayer.GetVariableObject("_root.temperature");
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string tempString;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float CurrentTemperature;
    local /*0x97E50000-0x00000000*/ private @NULL CachedLPPC;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x193
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerVSHUD(MoviePlayer);
        CachedLPPC = GetLPPC();
        // End:0x193
        if((LPMPHUD != none) && CachedLPPC != none)
        {
            // End:0x193
            if(TemperatureLabel != none)
            {
                CurrentTemperature = CachedLPPC.myLPHUD.CurrentDisplayedTemperature;
                // End:0x193
                if(!bTemperatureTextInitialized || CurrentTemperature != LastDisplayedTemperature)
                {
                    tempString = LPMPHUD.GetFormattedTemperatureString(CachedLPPC.myLPHUD.CurrentDisplayedTemperature);
                    TemperatureLabel.SetText(tempString);
                    LastDisplayedTemperature = CurrentTemperature;
                    bTemperatureTextInitialized = true;
                }
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = TemperatureRoot.GetDisplayInfo();
    DI.Visible = bShow;
    TemperatureRoot.SetDisplayInfo(DI);
    //return;    
}

function SetTemperatureInstrumentDamage()
{
    GoToBeginInstrumentDamage();
    //return;    
}

function ClearTemperatureInstrumentDamage()
{
    GoToEndInstrumentDamage();
    //return;    
}

function GoToBeginInstrumentDamage()
{
    // End:0x49
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("GoToBeginInstrumentDamage");
    }
    //return;    
}

function GoToEndInstrumentDamage()
{
    // End:0x47
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("GoToEndInstrumentDamage");
    }
    //return;    
}
