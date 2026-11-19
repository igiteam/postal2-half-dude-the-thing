class LPGFxUIElementGameMessageReviveIncapacitated extends LPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStatusInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialHealth;

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
    local /*0x97E50000-0x00000000*/ private @NULL IPP;

    IPP = GetLPPC().MyPlayerPawn.IncapacitatedRevivalTarget;
    // End:0x5E
    if(IPP == none)
    {
        InitialHealth = -100.0000000;
        return;
    }
    InitialHealth = float(IPP.Health);
    SetRingPercent(0.0000000);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float CurrentHealth, TransferredSoFar;
    local /*0x97E50000-0x00000000*/ private @NULL IPP;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x1AE
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
        IPP = GetLPPC().MyPlayerPawn.IncapacitatedRevivalTarget;
        // End:0x19F
        if(((LPP != none) && IPP != none) && InitialHealth < float(0))
        {
            CurrentHealth = float(IPP.Health);
            TransferredSoFar = CurrentHealth - InitialHealth;
            TransferredSoFar /= -InitialHealth;
            TransferredSoFar = FClamp(TransferredSoFar, 0.0000000, 1.0000000);
            SetRingPercent(TransferredSoFar);            
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
    bUseStatusInitialized = false;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    useStatusModeFrameName="hold"
}