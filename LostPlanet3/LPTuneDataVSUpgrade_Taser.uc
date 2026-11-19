class LPTuneDataVSUpgrade_Taser extends LPTuneDataUpgradeBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A690000-0x00000000*/ private float ChargeMax[65537];
var(0.25_Pct) /*0x8A690000-0x00000000*/ private float ChargePerUse[65537];
var(0.25_Pct) /*0x8A690000-0x00000000*/ private float RechargeDelay[65537];
var(0.25_Pct) /*0x8A690000-0x00000000*/ private float RechargeRate[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private float DischargeHUD_Duration[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private float DisplayCloseDelay[65537];

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    // End:0x4E
    foreach InController.DynamicActors(Class'LPVSPlayerPawn', VS)
    {
        VS.AddTaser();        
    }    
    //return;    
}

defaultproperties
{
    ChargeMax=100.0000000
    ChargePerUse=100.0000000
    RechargeDelay=2.0000000
    RechargeRate=10.0000000
    DischargeHUD_Duration=1.0000000
    DisplayCloseDelay=5.0000000
    // Reference: LPShopInterface'Default__LPTuneDataVSUpgrade_Taser.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}