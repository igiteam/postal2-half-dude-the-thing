class LPSM_PlayerVSDrillArmDrilling extends LPSM_PlayerVSRightArmActionBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HydraulicPressureLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxHydraulicPressure;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    BlendOutTime = 0.2000000;
    MaxHydraulicPressure = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressure.GetValue();
    HydraulicPressureLeft = MaxHydraulicPressure;
    LPPlayerController(MySPPawn.Controller).EnableHydraulicPressureDisplay(true);
    vsPawn.StartRightArmPartAction(0, 1, true, 1,,,, false,,,, 2);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    vsPawn.StopRightArmPartAction(0, (NextMove != none) || BlendOutTime == 0.0000000, BlendOutTime);
    LPPlayerController(MySPPawn.Controller).EnableHydraulicPressureDisplay(false);
    super(SPSpecialMove).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    HydraulicPressureLeft -= (DeltaTime * vsPawn.TuneDataVSPlayerPawn.DefaultDrillArmDepetionRate);
    LPPlayerController(MySPPawn.Controller).SetHydraulicPressureLevel(HydraulicPressureLeft / MaxHydraulicPressure);
    // End:0xE0
    if(HydraulicPressureLeft <= 0.0000000)
    {
        vsPawn.EndCurrentSpecialMove();
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x66
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
            BlendOutTime = 0.0000000;
            MySPPawn.EndCurrentSpecialMove(self);
            // End:0x69
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}
