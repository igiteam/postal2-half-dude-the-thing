class LPGFxUIElementVSTEnergyMeter extends LPGFxUIElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TEnergyMeterMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyTotal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyTargetTotal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyFillSpeed[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FillingTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FillingMaxTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstTimeFill;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x5D
    if(MoviePlayer != none)
    {
        TEnergyMeterMC = MoviePlayer.GetVariableObject("_root.TEngMeter");
    }
    TEnergyTotal = -1.0000000;
    bFirstTimeFill = true;
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(TEnergyMeterMC != none)
    {
        DI = TEnergyMeterMC.GetDisplayInfo();
        DI.Visible = bShow;
        TEnergyMeterMC.SetDisplayInfo(DI);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
    local /*0x97E50000-0x00000000*/ private float NewTEnergyTotal;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL CachedLPPC;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x289
    if(bShouldBeActive && MoviePlayer != none)
    {
        CachedLPPC = GetLPPC();
        // End:0x90
        if(CachedLPPC != none)
        {
            vsPlayerPawn = LPBaseVSPlayerPawn(CachedLPPC.Pawn);
        }
        // End:0x289
        if(TEnergyMeterMC != none)
        {
            // End:0x289
            if(vsPlayerPawn != none)
            {
                NewTEnergyTotal = vsPlayerPawn.GetEnergyCount();
                // End:0x141
                if(NewTEnergyTotal != TEnergyTargetTotal)
                {
                    // End:0x12E
                    if(bFirstTimeFill == false)
                    {
                        // End:0x123
                        if(NewTEnergyTotal > TEnergyTargetTotal)
                        {
                            SetVSTengFilling(true);                            
                        }
                        else
                        {
                            SetVSTengEmptying(true);
                        }
                    }
                    TEnergyTargetTotal = NewTEnergyTotal;
                }
                // End:0x289
                if(TEnergyTotal != TEnergyTargetTotal)
                {
                    // End:0x19D
                    if(bFirstTimeFill)
                    {
                        TEnergyTotal = TEnergyTargetTotal;
                        SetVSTengFilling(false);
                        SetVSTengEmptying(false);
                        bFirstTimeFill = false;                        
                    }
                    else
                    {
                        // End:0x20B
                        if(TEnergyTotal < TEnergyTargetTotal)
                        {
                            TEnergyTotal += TEnergyFillSpeed;
                            // End:0x208
                            if(TEnergyTotal > TEnergyTargetTotal)
                            {
                                TEnergyTotal = TEnergyTargetTotal;
                                SetVSTengFilling(false);
                                SetVSTengEmptying(false);
                            }                            
                        }
                        else
                        {
                            // End:0x276
                            if(TEnergyTotal > TEnergyTargetTotal)
                            {
                                TEnergyTotal -= TEnergyFillSpeed;
                                // End:0x276
                                if(TEnergyTotal < TEnergyTargetTotal)
                                {
                                    TEnergyTotal = TEnergyTargetTotal;
                                    SetVSTengFilling(false);
                                    SetVSTengEmptying(false);
                                }
                            }
                        }
                    }
                    SetTengMeter(TEnergyTotal);
                }
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function SetTengMeter()
{
    local /*0x97E50000-0x00000000*/ private float tengTotal[8388609];

    // End:0x3C
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setTengMeter");
    }
    //return;    
}

function SetVSTengFilling()
{
    local /*0x97E50000-0x00000000*/ private bool bFilling[8388609];

    // End:0x40
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSTengFilling");
    }
    //return;    
}

function SetVSTengEmptying()
{
    local /*0x97E50000-0x00000000*/ private bool bEmptying[8388609];

    // End:0x41
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSTengEmptying");
    }
    //return;    
}

defaultproperties
{
    TEnergyFillSpeed=3.0000000
    FillingMaxTime=2.0000000
}