class LPGFxUIElementGameMessageTapIn extends LPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStatusInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentButtonBoost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ButtonBoostValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UseStatusYOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myHUD;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], containerObj, DI, ScreenPos, SPMPHUD;

    super(SPGFxUIElementGameMessage).Init(MP);
    SPMPHUD = SPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x19C
    if(SPMPHUD != none)
    {
        containerObj = SPMPHUD.GetGameMessageUIElementContainerPanel();
        useStatusMC = containerObj.AttachMovie("useStatus", "useStatus");
        ScreenPos = GetScreenPosition(DefaultOffSetXScreenWidthPct, DefaultOffSetYScreenHeightPct);
        DI = useStatusMC.GetDisplayInfo();
        DI.X = ScreenPos.X;
        DI.Y = ScreenPos.Y + UseStatusYOffset;
        useStatusMC.SetDisplayInfo(DI);
    }
    myHUD = MP;
    //return;    
}

function SetupInitial()
{
    local /*0x97E50000-0x00000000*/ private @NULL IPP;

    IPP = GetLPPC().MyPlayerPawn;
    // End:0x49
    if(IPP == none)
    {
        InitialHealth = 0.0000000;
        return;
    }
    InitialHealth = float(IPP.Health);
    HealthRange = Abs(float(IPP.GetAbsoluteMinimumHealthThreshold()) - InitialHealth);
    SetRingPercent(1.0000000);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float Progress, MaxBoost;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x1A4
    if(bShouldBeActive)
    {
        LPP = GetLPPC().MyPlayerPawn;
        // End:0x92
        if(!bUseStatusInitialized)
        {
            InitButtonPrompt();
            bUseStatusInitialized = true;
            // End:0x92
            if(LPP != none)
            {
                SetupInitial();
            }
        }
        // End:0x195
        if(LPP != none)
        {
            Progress = 1.0000000 - Abs((float(LPP.Health) - InitialHealth) / HealthRange);
            MaxBoost = Progress * 0.2000000;
            CurrentButtonBoost -= ((CurrentButtonBoost * DeltaTime) * float(4));
            CurrentButtonBoost = FClamp(CurrentButtonBoost, 0.0000000, MaxBoost);
            Progress += CurrentButtonBoost;
            Progress = FClamp(Progress, 0.0000000, 1.0000000);
            SetRingPercent(Progress);            
        }
        else
        {
            SetRingPercent(1.0000000);
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

simulated function OnPressed()
{
    CurrentButtonBoost += ButtonBoostValue;
    CurrentButtonBoost = FClamp(CurrentButtonBoost, 0.0000000, 1.0000000);
    //return;    
}

defaultproperties
{
    ButtonBoostValue=0.1000000
    UseStatusYOffset=-20.0000000
    useStatusModeFrameName="mashing"
}