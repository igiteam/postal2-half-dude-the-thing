class LPGFxUIElementGameMessageStruggle extends LPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStatusInitialized;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], containerObj, DI, ScreenPos, SPMPHUD;

    super(SPGFxUIElementGameMessage).Init(MP);
    SPMPHUD = SPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x191
    if(SPMPHUD != none)
    {
        containerObj = SPMPHUD.GetGameMessageUIElementContainerPanel();
        useStatusMC = containerObj.AttachMovie("useStatus", "useStatus");
        ScreenPos = GetScreenPosition(DefaultOffSetXScreenWidthPct, DefaultOffSetYScreenHeightPct);
        DI = useStatusMC.GetDisplayInfo();
        DI.X = ScreenPos.X;
        DI.Y = ScreenPos.Y;
        useStatusMC.SetDisplayInfo(DI);
    }
    SetRingPercent(0.0000000);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float ringPercent;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0xE6
    if(bShouldBeActive)
    {
        // End:0x50
        if(!bUseStatusInitialized)
        {
            InitButtonPrompt();
            bUseStatusInitialized = true;
        }
        LPPC = GetLPPC();
        // End:0xD7
        if((LPPC != none) && LPPC.PlayerReplicationInfo != none)
        {
            ringPercent = LPPC.StruggleButtonStrength;
            SetRingPercent(ringPercent);            
        }
        else
        {
            SetRingPercent(0.0000000);
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    useStatusMC.ActionScriptVoid("removeMovieClip");
    useStatusMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    useStatusModeFrameName="mashing"
}