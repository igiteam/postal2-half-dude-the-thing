class LPTuneDataUpgrade_GrappleHook extends LPTuneDataUpgradeBase
    hidecategories(Object,Object);

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL P;

    P = LPPlayerPawn(InController.Pawn);
    P.AddGrappleHook();
    //return;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataUpgrade_GrappleHook.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}