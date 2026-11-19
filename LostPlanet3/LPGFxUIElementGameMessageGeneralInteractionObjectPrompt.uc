class LPGFxUIElementGameMessageGeneralInteractionObjectPrompt extends LPGFxUIElementGameMessage;

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
    //return;    
}

function SetupInitial()
{
    SetRingPercent(0.0000000);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPC, InterObj;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x11E
    if(bShouldBeActive)
    {
        LPP = LPPlayerPawn(GetLPPC().Pawn);
        // End:0x9B
        if(!bUseStatusInitialized)
        {
            InitButtonPrompt();
            bUseStatusInitialized = true;
            // End:0x9B
            if(LPP != none)
            {
                SetupInitial();
            }
        }
        LPC = GetLPPC();
        // End:0x11E
        if(LPC != none)
        {
            InterObj = LPC.LastTouchedGeneralInteractionObject;
            // End:0x11E
            if(InterObj != none)
            {
                SetRingPercent(InterObj.GetCompletionRatio());
            }
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
    bUseStatusInitialized = false;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    useStatusModeFrameName="hold"
}