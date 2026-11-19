class LPTuneDataPerkMoreHealth extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x93D80000-0x00000400*/ private editfixedsize @NULL HealthModifier[589825];

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pawn;
    local /*0x97E50000-0x00000000*/ private float Health, MaxHealth;

    super.PurchasedBy(InController, Quantity);
    Pawn = SPPawn(InController.Pawn);
    // End:0x113
    if(Pawn != none)
    {
        Health = float(Pawn.Health);
        MaxHealth = Pawn.TuneDataBasePawn.GetHealth(Pawn);
        // End:0x113
        if(MaxHealth > float(0))
        {
            Pawn.SetHealthMax(int(Health), int(MaxHealth));
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkMoreHealth.MHParam'
    begin object name=MHParam class=Class'LPFloatUpgrade'
        baseValue=50.0000000
    end object
    HealthModifier=MHParam
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkMoreHealth.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkMoreHealth'
    // Reference: LPShopInterface'Default__LPTuneDataPerkMoreHealth.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}