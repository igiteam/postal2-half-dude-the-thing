class LPGFxUIElementGameMessageTENGPostTransfer extends LPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStatusInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThermalPost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FannyPack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTransferAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialTransferAmount;

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
    local /*0x97E50000-0x00000000*/ private float CurPostCapacity, MaxPlayerCapacity, CurPlayerCapacity;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(GetLPPC().Pawn);
    ThermalPost = GetLPPC().GetPlayersThermalPost();
    FannyPack = LPThermalEnergyFannyPack(LPP.InvManager.FindInventoryType(Class'LPThermalEnergyFannyPack', true));
    CurPostCapacity = ((ThermalPost == none) ? 0.0000000 : ThermalPost.CurrentBatteryCapacity);
    // End:0x172
    if(int(LPP.WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x16F
        if(ThermalPost != none)
        {
            MaxPlayerCapacity = ThermalPost.CurrentBatteryCapacity;
            CurPlayerCapacity = 0.0000000;
        }        
    }
    else
    {
        MaxPlayerCapacity = FannyPack.GetMaxCapacity();
        CurPlayerCapacity = FannyPack.GetCurrentCapacity();
    }
    // End:0x207
    if(CurPostCapacity >= (MaxPlayerCapacity - CurPlayerCapacity))
    {
        MaxTransferAmount = MaxPlayerCapacity - CurPlayerCapacity;        
    }
    else
    {
        MaxTransferAmount = CurPostCapacity;
    }
    InitialTransferAmount = CurPlayerCapacity;
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float CurrentCapacity, TransferredSoFar;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x23A
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
        // End:0x23A
        if(LPP != none)
        {
            // End:0x125
            if((int(LPP.WorldInfo.NetMode) != int(NM_Standalone)) && FannyPack != none)
            {
                CurrentCapacity = FannyPack.GetCurrentCapacity();                
            }
            else
            {
                // End:0x1BC
                if((int(LPP.WorldInfo.NetMode) == int(NM_Standalone)) && ThermalPost != none)
                {
                    CurrentCapacity = ThermalPost.MaximumBatteryCapacity - ThermalPost.CurrentBatteryCapacity;
                }
            }
            TransferredSoFar = CurrentCapacity - InitialTransferAmount;
            TransferredSoFar /= ((MaxTransferAmount > 0.0000000) ? MaxTransferAmount : 1.0000000);
            TransferredSoFar = FClamp(TransferredSoFar, 0.0000000, 1.0000000);
            SetRingPercent(TransferredSoFar);
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
    ThermalPost = none;
    FannyPack = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    useStatusModeFrameName="hold"
}