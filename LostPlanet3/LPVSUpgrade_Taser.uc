class LPVSUpgrade_Taser extends LPUpgradeBase
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSUpgrade_TaserTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnergyPercent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastChargeTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Source[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChargePercentPerUse[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountToGive[536870913];

function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];

    EnergyPercent = 1.0000000;
    LastChargeTime = 0.0000000;
    ChargePercentPerUse = VSUpgrade_TaserTuneData.ChargePerUse / VSUpgrade_TaserTuneData.ChargeMax;
    AmountToGive = VSUpgrade_TaserTuneData.RechargeRate / VSUpgrade_TaserTuneData.ChargeMax;
    //return;    
}

function HasEnergy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return EnergyPercent >= ChargePercentPerUse;
    //return ReturnValue;    
}

function UseCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSource[8388609];

    EnergyPercent -= ChargePercentPerUse;
    Source = inSource;
    // End:0x7C
    if(Source.IsTimerActive('HideTaserHUD', self))
    {
        Source.ClearTimer('HideTaserHUD', self);
    }
    Source.myLPHUD.ShowVSReticleShockMeter(true);
    Source.myLPHUD.SetVSReticleShockActive(true);
    Source.myLPHUD.SetVSReticleShockMeterLevel(EnergyPercent);
    Source.SetTimer(VSUpgrade_TaserTuneData.RechargeDelay, false, 'StartRecharging', self);
    Source.SetTimer(VSUpgrade_TaserTuneData.DischargeHUD_Duration, false, 'HideDischargingHUD', self);
    //return;    
}

function StartRecharging()
{
    // End:0x5F
    if(Source.IsTimerActive('HideDischargingHUD', self))
    {
        Source.ClearTimer('HideDischargingHUD', self);
        HideDischargingHUD();
    }
    Source.myLPHUD.ShowVSReticleShockMeter(true);
    Source.myLPHUD.SetVSReticleShockCharging(true);
    LastChargeTime = Source.WorldInfo.TimeSeconds;
    Source.SetTimer(0.1000000, true, 'DoRecharge', self);
    //return;    
}

function DoRecharge()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime;

    DeltaTime = Source.WorldInfo.TimeSeconds - LastChargeTime;
    LastChargeTime = Source.WorldInfo.TimeSeconds;
    EnergyPercent += (DeltaTime * AmountToGive);
    // End:0x1B0
    if(EnergyPercent >= 1.0000000)
    {
        EnergyPercent = 1.0000000;
        Source.myLPHUD.SetVSReticleShockCharging(false);
        Source.myLPHUD.SetVSReticleShockMeterLevel(EnergyPercent);
        Source.ClearTimer('DoRecharge', self);
        Source.SetTimer(VSUpgrade_TaserTuneData.DisplayCloseDelay, false, 'HideTaserHUD');
        Source = none;        
    }
    else
    {
        Source.myLPHUD.SetVSReticleShockCharging(true);
        Source.myLPHUD.SetVSReticleShockMeterLevel(EnergyPercent);
    }
    //return;    
}

function HideDischargingHUD()
{
    Source.myLPHUD.SetVSReticleShockActive(false);
    //return;    
}

defaultproperties
{
    EnergyPercent=1.0000000
}